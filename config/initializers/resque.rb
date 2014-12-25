ENV["REDISTOGO_URL"] ||= "redis://localhost:6379/"

Resque.redis = Redis.new(url: ENV["REDISTOGO_URL"])
#Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)
