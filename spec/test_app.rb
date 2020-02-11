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

  get '/thatthisthatthis' do
    <<-HTML
    #{that}
    <div class='outer-div'>
      #{this}
      <div class='inner-div'>
      #{that + this}
      </div>
    </div>
    HTML
  end

  get '/options' do
    <<-HTML
    <select>
      <option>ability</option>
      <option>option</option>
    </select>
    HTML
  end

  get '/description-list' do
    <<-HTML
    <dl>
      <dt>First name:</dt>
      <dd>Andrea</dt>
      <dt>Last name:</dt>
      <dd>Robbinovich</dt>
    </dl>
    HTML
  end
end
