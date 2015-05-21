helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'  
end

# Homepage (Root path)
get '/' do
  @reviews = Review.all
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
  session[:user_id] = nil
  redirect '/'
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

post '/reviews/create' do
  title = params[:review_title]
  review = params[:review]
  rating = params[:rating]
  synopsis = params[:synopsis]
  review_date = Time.now.strftime("Reviewed on %m/%d/%Y")


  new_review = current_user.reviews.create(review_title: title, review: review, review_date: review_date, rating: rating)

  redirect "/reviews/#{new_review.id}"
end

get '/reviews/:id' do
 @review = Review.find(params[:id])
 erb :reviews
end






