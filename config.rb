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
    S3_ACCESS_KEY_ID      = "1993XXSMV6W101BCWA02"
    S3_SECRET_ACCESS_KEY  = "dhR7gfVQzcAKUZv25/GfjVMP57/z58mfkjOEtVG2"
    S3_BUCKET             = "qindio"
    S3_ACCESS_POLICY      = :private 
    MOUNT_POINTS          = %w{
                              assets audits checklists companies consequences
                              controls courses documents families improvements 
                              incidents people problems projects roles scopes
                              scores services statements threats users
                              vulnerabilities 
                            }
  end
end
