# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/quakes').to(QuakeAction)
end
