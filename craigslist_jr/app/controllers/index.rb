get '/' do
@posts = Post.all
  erb :show_posts
  
end


get '/category' do

  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  erb :category
end


get '/post' do
  @categories = Category.all
  erb :post
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :show_post
end


get '/show_posts' do
  @posts = Post.all
  erb :show_posts
end

get '/show_categories' do
  erb :show_categories
end

get '/category/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts
  erb :show_category
end

get '/edit_post/:id' do
  @post = Post.find(params[:id])
  @categories = Category.all
  erb :edit_post
end


post '/new_user' do 
  User.create(params[:user_input])
end


post '/new_category' do 
  puts params[:user_input]
  Category.create(params[:user_input])
  redirect '/category'
end


post '/new_post' do 
  puts params[:user_input]
  Post.create(params[:user_input])
  redirect '/post'
end

post '/edit_post/:id' do
  Post.find(params[:id]).update_attributes(params[:user_input])
  redirect "edit_post/#{params[:id]}"
end
