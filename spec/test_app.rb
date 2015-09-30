require 'sinatra/base'
require 'rack'

class TestApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :static, true

  this = "<p>One piece of content</p>"
  that = "<p>Another piece of content</p>"

  get '/thisthenthat' do
    this + that
  end

  get '/thatthenthis' do
    that + this
  end

  get '/thatnothis' do
    that
  end

  get '/thisnothat' do
    this
  end

  get '/thisthatthis' do
    "#{this} <div class='within-block'> #{that + this} </div>"
  end
end
