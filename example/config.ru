require_relative "../lib/rack/bunto"

# Middleware
use Rack::ShowExceptions  # Nice looking errors

run Rack::Bunto.new
