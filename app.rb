require 'sinatra'
require 'sinatra/reloader'
require_relative 'appDB'


configure do
	enable :sessions
	set :username, "john"
	set :password, "doe"
end


get '/login' do
	@title= "login page"
	erb :login, :layout => :aboutlayout
end

get '/logout' do
	erb :logout, :layout => :aboutlayout
end

post '/login' do     
	if params[:username] == settings.username && params[:password] == settings.password 
		session[:admin] = true       
		redirect to '/logout'     
	elsif params[:out]=="logout"
		session.clear
		redirect to ('/login')
	else 
		erb :login, :layout => :aboutlayout 
	end 
end

get '/' do
  erb :home
end

get '/home' do
  @title = "home page"
  erb :home
end

get '/about' do
  @title = "about page"
  erb :about, :layout => :aboutlayout 
end

get '/students' do 
#	@title= "students page"
	@students= StudentsData.all
	erb :students, :layout => :aboutlayout
end

post '/students' do
	if params[:submit]=="Save"
		StudentsData.get(params[:id]).update(firstname:params[:firstname], lastname:params[:lastname],birth:params[:birthday], address:params[:address])
	elsif params[:delete]=="Delete"
		#StudentsData.get(params[:id]).destroy
		StudentsData.get(params[:id]).destroy
	elsif params[:add]=="Add"
		StudentsData.create(firstname:params[:firstname], lastname:params[:lastname],birth:params[:birthday], address:params[:address])
	else

	end
	@students=StudentsData.all
	redirect to '/students'
end

get '/students/addStudent' do
	erb :addStudent, :layout => :aboutlayout
end

get '/students/edit/:id' do
	@students=StudentsData.get(params[:id])
	erb :editStudents, :layout => :aboutlayout
end

get '/students/:id' do
	@students=StudentsData.get(params[:id])
	erb :showStudent, :layout => :aboutlayout
end

post '/comment' do
	@title= "comment page"
	Comment.create(name:params[:name], content:params[:comment])
	@comment= Comment.all
	redirect to '/comment'
end
get '/comment' do

	@title= "comment page"
	@comment= Comment.all
	erb :comment, :layout => :aboutlayout
end

get '/comment/addComment' do
	@title= "Add Comment Page"
	erb :commentAdd, :layout => :aboutlayout
end

get '/comment/:commentId' do
	@comment=Comment.get(params[:commentId])
	erb :commentInfo, :layout => :aboutlayout
end

get '/video' do
	@title= "video page"
	erb :video, :layout => :aboutlayout
end

get '/contact' do
  @title = "contact page"  
  erb :contact, :layout => :aboutlayout
end


