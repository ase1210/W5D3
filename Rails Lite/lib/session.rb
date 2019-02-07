require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  attr_reader :cookie
  
  def initialize(req)
    @cookie = req.cookies['_rails_lite_app'] ? JSON.parse(req.cookies['_rails_lite_app']) : {}
  end

  def [](key)
    self.cookie[key]
  end

  def []=(key, val)
    self.cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    sess_cookie = cookie.to_json
    res.set_cookie("_rails_lite_app", { path: "/", value: "#{sess_cookie}" })
  end
end
