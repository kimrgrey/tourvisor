require 'net/http'

module Tourvisor
  class UnexpectedResponseError < StandardError; end

  class Request
    SEARCH_PATH = 'search.php'.freeze
    RESULT_PATH = 'result.php'.freeze

    attr_accessor :request_id

    def search(**params)
      self.request_id = nil

      get(Tourvisor::Request::SEARCH_PATH, params) do |parsed_body|
        request_id = parsed_body.dig(:result, :requestid)

        if request_id.nil?
          raise UnexpectedResponseError, "Unexpected error: #{parsed_body}"
        end

        self.request_id = request_id
      end
    end

    def result(**params)
      get(Tourvisor::Request::RESULT_PATH, params.merge(type: 'result'))
    end

    def status
      return @last_status if @last_status && @last_status[:state] == 'finished'
      get(Tourvisor::Request::RESULT_PATH, type: 'status') do |parsed_body|
        extract_status!(parsed_body)
      end
    end

    def finished?
      status[:state] == 'finished'
    end

    def config
      Tourvisor.config
    end

    private def extract_status!(parsed_body)
      @last_status = parsed_body.dig(:data, :status)
    end

    private def get(path, params)
      uri = URI(config.build_path(path))

      q = config.params.merge(params)
      q[:requestid] = request_id unless request_id.nil?

      uri.query = URI.encode_www_form(q)

      response = Net::HTTP.get_response(uri)

      unless response.is_a?(Net::HTTPSuccess)
        raise UnexpectedResponseError, "Unexpected error: #{response}"
      end

      parsed_body = config.parse(response.body)
      block_given? ? yield(parsed_body) : parsed_body
    end
  end
end
