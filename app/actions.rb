# Homepage (Root path)
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/profile' do
  erb :profile
end

get '/logout' do
  erb :logout
end

get '/signup' do
  erb :signup
end
