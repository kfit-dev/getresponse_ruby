module GetResponse
  class Contacts < Base

    ACTION = '/v3/contacts'

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
