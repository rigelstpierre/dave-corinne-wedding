get '/' do
  erb :index
end

get '/thanks' do
  erb :thanks
end

post '/contact' do 
  Pony.mail({
    :to => ENV['EMAIL'],
    :subject => params[:name] + " has RSVP'd",
    :body => "Names(s): #{params[:name]}
              Email: #{params[:email]}
              RSVP: #{params[:rsvp]}
              Message: #{params[:message]}",
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['GMAIL_USERNAME'],
      :password             => ENV['GMAIL_PASSWORD'],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
  })
  redirect '/thanks'
end
