# Homepage (Root path)
get '/' do
  erb :index
end

post '/' do
    @query = params[:search]
    # @response_hash = question_title_by_votes
    # @q_title = get_q_title
end

get '/ans' do
	@response_hash = question_title_by_votes
    @q_title = get_q_title
	erb :ans 
end

def question_title_by_votes
	#/2.2/search/advanced?order=desc&sort=votes&title=selknvslk&site=stackoverflow
	url_p1 = 'http://api.stackexchange.com/2.2/search/advanced?order=desc&sort=votes&'
	url_p3 = '&site=stackoverflow'
	url = url_p1 + @query + url_p3
    HTTParty.get(url)
end

def get_q_title
	@q_title = []
    @response_hash["items"].each do |item|
    	@q_title << item["title"]
    end
    @q_title
end
