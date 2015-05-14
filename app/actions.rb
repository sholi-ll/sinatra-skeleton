helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)

  if user.password == password
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
    puts "wrong!"
  end
end

get '/profile' do
  erb :profile
end

post '/profile' do
  redirect '/'
end

get '/logout' do
  erb :logout
end

get '/signup' do
  erb :signup
end

post '/signup' do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)

  if user
    redirect '/signup'
  else
    user = User.create(email: email, password: password)
    session[:user_id] = user.id
    redirect '/'
  end
end


