require "redditaccessor/version"
require "httparty"

module Reddit_Accessor
  attr_writer :oath
  def initialize(key, id, username, password, useragent)
    @key = key
    @id = id
    @username = username
    @password = password
    @user_agent = useragent
    @oath = get_oath_token
  end

  def get_oath_token
    auth = {:username => @id,
           :password => @key}
    token_info = HTTParty.post("https://www.reddit.com/api/v1/access_token",
      :basic_auth  => auth,
      :headers => {'user-agent' => @user_agent },
      :body => { :grant_type => 'password',
                :username =>  @username,
                :password => @password,
                }
                   )
    token_info
    @token = token_info["access_token"]

    def access_api_get(url, params)
      HTTParty.get(url, 
                  :headers => {"Authorization" => "bearer #{@token}",
                                    'user-agent' => @user_agent },
                  "query" => params
                  )
    end

    def access_api_post(url, params)
      HTTParty.post(url, 
                  :headers => {"Authorization" => "bearer #{@token}",
                                    'user-agent' => @user_agent },
                  "query" => params
                  )
    end

    def access_api_delete(url, params)
      HTTParty.delete(url, 
                  :headers => {"Authorization" => "bearer #{@token}",
                                    'user-agent' => @user_agent },
                  "query" => params
                  )
    end

    def access_api_put(url, params)
      HTTParty.put(url, 
                  :headers => {"Authorization" => "bearer #{@token}",
                                    'user-agent' => @user_agent },
                  "query" => params
                  )
    end
  end
end
