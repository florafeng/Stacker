
# Login

get '/login' do
  erb :login
end

# Login validation.  This action doesn't render anything - just redirects to
# two other actions depending on a successful login.

get '/test' do
  @test_variable = "I'M ACTUALLY HERE"
  erb :test
end

post '/validate' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email).try(:authenticate, password)
  if user

# Successful login - proceed normally.

    session.delete(:login_error)
    session[:user_id] = user.id
    session[:current_user] = user.id
    redirect '/user_query'
  else
    user = User.find_by(email: email)
    if user

# Valid user - password error

      session[:login_error] = "Password error."
      redirect '/login'
    else

# Create a new user - sign'em up

      user = User.new()
      user.email = params[:email]
      user.password = params[:password]
      if user.save
        session.delete(:login_error)
        session[:user_id] = user.id
        redirect "/user_query"
      else

# This should never happen

        session[:login_error] = "Error should never happen."
        redirect "/login"
      end
    end
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

get '/user_query' do
  erb :user_query
end

#post '/' do
#    @query = params[:search]
    # @response_hash = question_title_by_votes
    # @q_title = get_q_title
#end


post '/' do
    @query = params[:search]
    response_hash
    get_data
    erb :search_result

    # redirect '/search_result'
end

# get "/search_result" do
#   # binding.pry
#   erb :search_result
# end

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
  @response_array = []
  @response_hash["items"].each do |item|
    q_title = item["title"]
    q_link = item["link"]
    @nokogiri_object = Nokogiri::HTML(open(q_link))
    q_body = @nokogiri_object.xpath("//div[@class='question']//div[@class='post-text']").to_html
    # binding.pry
    a_body = @nokogiri_object.xpath("//div[@class='answer accepted-answer']//div[@class='post-text']").to_html
    so_response = Hash.new
    so_response = {
      so_question_title: q_title,
      so_question_body: q_body,
      so_answer_body: a_body
      }
    @response_array << so_response
  end
  @response_array
end

