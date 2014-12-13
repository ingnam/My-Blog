class PostsController < ApplicationController

	def index
		@posts=Post.all.order('created_at DESC')
	end

	def new
		@post=Post.new
	end

	def show
		#params[:id] will be the post id 
		@post = Post.find(params[:id])
	end

	#in order to save our post, we need to define create method
	def create
		#first create the post
		@post=Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end	
	end

	#Rails 4 has a security feature called strong parameters
	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
