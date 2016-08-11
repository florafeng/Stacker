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

