class PostsController < ApplicationController
  def index
    @posts = Post.where user_id: "#{@current_user.id}"
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new

  end

  def create
    @post=Post.new(
      name:params[:name],
      date:params[:data],
      memo:params[:memo],
      image_name:"",
      user_id: @current_user.id
    )
    if params[:image]
      @post.image_name = "#{@current_user.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}",image.read)
    end
    @post.save
    redirect_to("/posts/index")
  end
end
