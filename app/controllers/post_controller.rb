class PostController < ApplicationController
  def new
  end

  def show
  	@id = params[:id]
  	@post = Post.find(@id)
  end
  
  def create_reply
  	@content = params[:content]
  	@id = params[:id]
  	Reply.create(
  		content: @content,
  		post_id: @id)

  	redirect_to :back  # rails ver. 4
  	#redirect_back(fallback_llocation: post_path)  # rails ver.5
  end

  def edit
  	@id = params[:id]
  	@edit_post = Post.find(@id)
  end
  
  def update
  	@title = params[:title]
  	@content = params[:content]
  	@id = params[:id]
  	@update_post = Post.find(@id)
  	@update_post.update(title: @title, content: @content)

    redirect_to "/post/show/#{@id}"

  end

  def destroy
  	@id = params[:id]
  	@destroy_post = Post.find(@id)
  	@destroy_post.destroy
	Reply.find_by(post_id: @id).each do |r|
  		r.destroy
  	end
  	redirect_to '/'
  end

  def index
  	@posts = Post.all
  end

  def create
  	@title = params[:title]
  	@content = params[:content]

  	Post.create(title: @title, content: @content)

  	redirect_to '/'
  end
end
