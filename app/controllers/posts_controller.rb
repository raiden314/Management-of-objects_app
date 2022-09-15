class PostsController < ApplicationController
  def index
    @posts = Post.where user_id: #{@current_user}
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new

  end
  p = Post.all.ids
  cnts=p.last(1)
  def create
    @post=Post.new(
      name:params[:name],
      date:params[:date],
      memo:params[:memo]
      )
    @post.user_id="#{@current_user}"
    if params[:image]
      $cnt=cnts[0]+1
      @post.image_name="#{$cnt}.jpg"
      $cnt+=1
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
    $cnt=$cnt + 14
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
