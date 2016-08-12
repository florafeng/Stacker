def check_login
  @user = User.find_by(id: session[:user_id])
  unless @user
    session[:login_error] = "You must be logged in"
    redirect '/login'
  end
end

# Login
get '/login' do
  erb :login
end

# Login validation
# Note this action doesn't render anything - just redirects to
# two other actions depending on a successful login.
post '/validate' do
  email = params[:email]
  password = params[:password]
  # We're using has_secure_password on User, so we'll check the password using
  # User#authenticate. Now, because we can get a wrong email too, we can have
  # a situation where User.find_by(email ...) will return nil, blowing up
  # on authenticate. To avoid that we'll use the .try() method, which
  # automatically stops if we get a nil from User#find_by.
  user = User.find_by(email: email).try(:authenticate, password)
  binding.pry
  if user
    session.delete(:login_error) # Login successful, delete login error message
    session[:user_id] = user.id
    redirect '/ans'
  else
    session.delete(:user_id) # Just to make sure we're logged out
    session[:login_error] = "You must be logged in."
    redirect '/login'
  end
end

# Logout
get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

# Homepage (Root path)
get '/' do
  erb :index
end

post '/' do
    @query = params[:search]
	puts "s"
	redirect '/ans' if @query != nil
end

get '/ans' do
	
	erb :ans 
end

