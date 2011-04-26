module Qindio
  module Persister
    class Person < ActiveResource::Base
      self.site = "http://127.0.0.1:9292/"
      Person.format = :json
    end
  end
end
