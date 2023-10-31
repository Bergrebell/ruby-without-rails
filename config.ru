require 'rack'
require_relative './app'

# 'run' method is provided by rack. takes a ruby object as an argument and calls 'call' method on it.
run App.new
