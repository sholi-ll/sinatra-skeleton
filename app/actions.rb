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

  if user
    if user.password == password
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/login'
    end
  else
    redirect '/login'
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
    redirect '/'
  else
    user = User.create(email: email, password: password)
    session[:user_id] = user.id
    redirect '/'
  end
end

get '/reviews/new' do
  erb :new_review
end

post '/reviews/new' do
  title = params[:review_title]
  review = params[:review]

  current_user.reviews.create(review_title: title, review: review)

end




