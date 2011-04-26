module Qindio
  module Config
    LOCALES               = ["i18n/en.yml", "i18n/es.yml", "i18n/pt.yml"]
    DB_URL                = URI.parse(
                              ENV["QINDIO_DB_URL"] || ENV["DATABASE_URL"]
                            )
    DB                    = {
                              adapter:  "postgresql",
                              host:     DB_URL.host,
                              database: DB_URL.path[1..-1],
                              username: DB_URL.user,
                              password: DB_URL.password,
                              encoding: "unicode",
                              pool:     30
                            }
  end
end
