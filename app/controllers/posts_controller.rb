class PostsController < ApplicationController
  def index
    @w=0
    if @current_user != 1 
      @posts = Post.where user_id: "#{@current_user.id}"
    else
      @post = Post.all.order(user_id: :asc)
      @posts = @post.user_id
    end
    @count=0
    # binding.pry
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new

  end
  @i = 1
  if Post.all.ids == []
    p = [0]
  else
    p = Post.all.ids
  end
  $cnts=p.last
  @w=0
  def create
    @post=Post.new(
      name:params[:name],
      date:params[:date],
      memo:params[:memo]
      )
    @post.user_id="#{@current_user.id}"
    if params[:image]
      $cnt=$cnts+1
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
    # binding.pry
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
