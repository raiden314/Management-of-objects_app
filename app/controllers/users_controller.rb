class UsersController < ApplicationController
  before_action:authenticate_user,{only: [:index,:show,:edit,:update]}
  before_action:forbid_login_user,{only: [:new,:create,:login_form,:login]}
  before_action:ensure__correct_user,{only:[:edit,:update]}
  before_action:ensure__correct_manager,{only:[:index]}
  def ensure__correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end
  def ensure__correct_manager
    if @current_user.id != 1
      flash[:notice]="権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end
  def index
    @users = User.all
  end
  def show
    @user=User.find_by(id:params[:id])
  end
  def new
    @user=User.new
  end
  def create
    @user=User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new",status: :unprocessable_entity)
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice]="ユーザー情報を編集しました"
    else
      render("users/edit",status: :unprocessable_entity)
    end
  end
  def login_form
    
  end
  def login
    @user=User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message="メールアドレスまたはパスワードが間違っています"
      @email=params[:email]
      @password=params[:password]
      render("users/login_form",status: :unprocessable_entity)
    end
  end
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
end
