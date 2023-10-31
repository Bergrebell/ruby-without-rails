require 'rack'
require_relative './app'

use Rack::Reloader, 0

# Serve all requests beginning with /public  from the "public" folder
use Rack::Static, urls: ['/public', "/favicon.ico"]

# 'run' method is provided by rack. takes a ruby object as an argument and calls 'call' method on it.
run App.new
