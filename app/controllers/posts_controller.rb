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
    @pos = Post.find_by(id: params[:id])
    @post=Post.new(
      name:params[:name],
      date:params[:date],
      memo:params[:memo],
      image_name:"",
      user_id: "#{@current_user.id}"
    )
    if params[:image]
      @post.image_name = "@pos.id"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}",image.read)
    end
    @post.save
    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])
    @post.name=params[:name]
    @post.date=params[:date]
    @post.memo=params[:memo]
    if params[:image]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}",image.read)
    end
    @post.save
    
    redirect_to("/posts/index")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
