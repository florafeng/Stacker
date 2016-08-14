
# Login

get '/login' do
  erb :login
end

# Login validation.  This action doesn't render anything - just redirects to
# two other actions depending on a successful login.

post '/validate' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email).try(:authenticate, password)
  if user

# Successful login - proceed normally.

    session.delete(:login_error)
    session[:user_id] = user.id
    session[:current_user] = user.id
    redirect '/'
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
        redirect "/"
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

# Pull out all content from stackoverflow
post '/' do
  @query = params[:search]
  @response_array = get_data(response_hash(@query))
  SavedPost.delete_all
  erb :search_result
end

post '/saved_post' do
  # binding.pry
  saved_post
  if session[:current_user].nil?
  else
  @saved_post = SavedPost.where(user_id: session[:current_user])
  end

  erb :saved_post
end

# get '/saved_post' do
#   @saved_post = SavedPost.where(user_id: session[:current_user])
#   erb :saved_post
# end


def response_hash(q)
  #/2.2/search/advanced?order=desc&sort=votes&title=selknvslk&site=stackoverflow
  url_p1 = 'http://api.stackexchange.com/2.2/search/advanced?order=desc&sort=votes&'
  url_p3 = '&site=stackoverflow'
  url = url_p1 + q + url_p3
  HTTParty.get(url)
end

def get_data(r_hash)
  r_array = []
  r_hash["items"].each do |item|
    q_title = item["title"]
    q_link = item["link"]
    nokogiri_object = Nokogiri::HTML(open(q_link))
    q_body = nokogiri_object.xpath("//div[@class='question']//div[@class='post-text']").to_html
    a_body = nokogiri_object.xpath("//div[@class='answer accepted-answer']//div[@class='post-text']").to_html
    so_response = Hash.new
    so_response = {
      so_question_title: q_title,
      so_question_body: q_body,
      so_answer_body: a_body,
      so_link: q_link,
      so_query: @query
      }
      # binding.pry
    r_array << so_response
  end
  r_array
end


def saved_post
  # binding.pry
  if session[:current_user].nil?
  else
    saved_post = SavedPost.find_by(user_id: session[:current_user], q_link: params[:q_link])
    if saved_post.nil?
      SavedPost.create(user_id: session[:current_user], q_link: params[:q_link], query_text: params[:query_text], q_title: params[:q_title])
    end
  end
end
