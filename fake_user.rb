module Qindio
  module Persister
    class User < ActiveResource::Base
      self.site = "http://127.0.0.1:9292/"
      User.format = :json
    end
  end
end
