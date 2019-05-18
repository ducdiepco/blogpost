module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def response_status
      response.status
    end
  end
end
