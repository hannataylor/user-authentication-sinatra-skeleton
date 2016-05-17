# display a list of all users
get '/users' do
  @users = User.all
  erb :'users/index'
end

# return an HTML form for creating a new user
get '/users/new' do
  erb :'users/new'
end

# create a new user
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/users'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# display a specific user
get '/users/:id' do
  @user = User.find_by(id: params[:id])

  if logged_in?
    erb :'users/show'
  else
    redirect '/'
  end
end

# return an HTML form for editing a user
get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  erb :'users/edit'
end

# update a specific user
put '/users/:id' do
  @user = User.find_by(id: params[:id])
  @user.assign_attributes(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
  erb :'users/edit'
  end
end

# delete a specific user
delete '/users/:id' do
  @user = User.find_by(id: params[:id])
  @user.destroy
  redirect '/users'
end
