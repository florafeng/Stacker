# Homepage (Root path)
get '/' do
  erb :index
end

post '/' do
	@search = Search.new(
		)
end

