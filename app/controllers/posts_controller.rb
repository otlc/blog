class PostsController < ApplicationController
  # This is called a controller action
  # This is the fist action. we will create
  # additional actions to create, update, delete.
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	# This pulls each of the posts in descending order and places them al into an instance variable called @posts to be referenced later by the index view page
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end

  def show
 		# we already found the post using find_post method/action by adding this method/action to the before_action definition above
  end
 
 	def edit
 		# we already found the post using find_post method/action by adding this method/action to the before_action definition above
 	end

 	def update
 		# we already found the post using find_post method/action by adding this method/action to the before_action definition above
 		if @post.update(post_params)
 			redirect_to @post
 		else
 			render 'edit'
 		end
 	end

 	def destroy
 		# we already found the post using find_post method/action by adding this method/action to the before_action definition above
 		@post.destroy
 		redirect_to root_path
 	end


  private

  def find_post
  	# Find the single correct post by post ID and assign it to the @post instance variable
  	@post = Post.find(params[:id])
  end

  def post_params
  	# Rails 4 Strong Parameters is a security feature in Rails 4.x. You must define and whitelist/permit each specific table attributes are allowed to be saved, created, updated on your model
  	params.require(:post).permit(:title, :body)
  end
end
