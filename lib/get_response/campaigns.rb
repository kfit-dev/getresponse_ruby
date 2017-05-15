module GetResponse
  class Campaigns < Base

    ACTION = '/v3/campaigns'

    def post(params)
      response = post_call(ACTION, params)
      Response.new(response)
    end

    def get(params)
      response = get_call(ACTION, params)
      Response.new(response)
    end
  end
end
