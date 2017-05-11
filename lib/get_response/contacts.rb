module GetResponse
  class Contacts < Base

    ACTION = '/contacts'

    def post(params)
      post_call(ACTION, params, headers)
    end

    def get(params)
      get_call(ACTION, params, headers)
    end
  end
end
