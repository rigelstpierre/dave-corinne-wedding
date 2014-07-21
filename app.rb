get '/' do
  erb :index
end

get '/thanks' do
  erb :thanks
end

post '/contact' do 
  Pony.mail({
    :to => 'corinne@stuckwithpins.com',
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
      :user_name            => 'rigel@rigel.co',
      :password             => 'armour471003',
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
  })
  redirect '/thanks'
end
