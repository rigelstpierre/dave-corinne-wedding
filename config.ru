require 'rubygems' 
require 'bundler'

Bundler.require 

require './app'
run Sinatra::Application

map "/js" do
    run Rack::Directory.new("./app/js")
end

map "/css" do
    run Rack::Directory.new("./app/css")
end

map "/images" do
    run Rack::Directory.new("./app/images")
end
