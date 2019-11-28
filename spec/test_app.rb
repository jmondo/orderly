require 'sinatra/base'
require 'rack'

class TestApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :static, true

  this     = "<p>One piece of content</p>"
  that     = "<p>Another piece of content</p>"
  option_1 = "<option>ability</option>"
  option_2 = "<option>option</option>"

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
    "#{that}
    <div class='outer-div'>
      #{this}
      <div class='inner-div'>
      #{that + this}
      </div>
    </div>"
  end

  get '/options' do
    option_1 + option_2
  end

  get '/content-across-DOM' do
    first_name_dt = "First name:"
    first_name_dd = "Andrea"

    last_name_dt = "Last name:"
    last_name_dd = "Robbinovich"

    "<dl>
      <dt>#{first_name_dt}</dt>
      <dd>#{first_name_dd}</dt>
      <dt>#{last_name_dt}</dt>
      <dd>#{last_name_dd}</dt>
    </dl>"
  end
end
