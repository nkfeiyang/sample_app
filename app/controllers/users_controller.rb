class UsersController < ApplicationController
  before_filter :authenticate, :except => [ :show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = CGI.escapeHTML(@user.name)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample APP!"
      redirect_to @user
    else
      @title = "Signup up"
      render 'new'
    end
  end

  def edit    
    @title = "Edit user"
  end
  
  def update    
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end      
  end
  
  def destroy
    if User.find(params[:id]) == current_user
      flash[:success] = "You can not delete yourself!"      
    else
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed"      
    end
    redirect_to users_path
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Follower"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  private
    
    #def authenticate
    #  deny_access unless signed_in?
    #end
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end





























