require 'rack'

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    res['Content-Type'] = 'text/html'
    # res.path = '/i/love/app/academy'
    res.write("#{req.path}")
    # if req.path == '/i/love/app/academy'
    # else
    #     res.write('Hello World, Goodbye World')
    # end
    res.finish
end

Rack::Server.start({
    app: app,
    Port: 3000
})
