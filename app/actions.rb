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
    response_hash
    get_data
end

# get '/ans' do
# 	@response_hash = question_title_by_votes
#     @q_title = get_q_title
# 	erb :ans 
# end

def response_hash
	#/2.2/search/advanced?order=desc&sort=votes&title=selknvslk&site=stackoverflow
	url_p1 = 'http://api.stackexchange.com/2.2/search/advanced?order=desc&sort=votes&'
	url_p3 = '&site=stackoverflow'
	url = url_p1 + @query + url_p3
  @response_hash = HTTParty.get(url)
end

def get_data
    @response_hash["items"].each do |item|
      @q_title = item["title"]
      @q_link = item["link"]
      @nokogiri_object = Nokogiri::HTML(open(@q_link))
      @q_body = @nokogiri_object.xpath("//div[@class='question']//div[@class='post-text']").to_s
      @a_body = @nokogiri_object.xpath("//div[@class='answer accepted-answer']//div[@class='post-text']").to_s
    end
end


