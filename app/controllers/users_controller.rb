class UsersController < ApplicationController
#  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def new
    @user = User.new
  end
  
  def create
    @user_params = params[:user]
    # if the user is not logged in, then restrict roles
	if current_user
		if current_user.role != '1'
	    	  @user_params[:role] = '2'
		end
	end
    @user = User.new(@user_params)
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
	# admin can change all users
	if current_user.role == '1'
	  @user = User.find(params[:id])
	else
	# other users can only change themselves
	  @user = @current_user
	end
  end

  def edit
	# admin can change all users
	if current_user.role == '1'
	  @user = User.find(params[:id])
	else
	# other users can only change themselves
	  @user = @current_user
	end
  end
  
  def update
	# admin can change all users
	if current_user.role == '1'
	  @user = User.find(params[:id])
	else
	# other users can only change themselves
	  @user = @current_user
	end
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
	if current_user.role == '1'
	      redirect_to users_url
	else
	      redirect_to account_url
	end
    else
      render :action => :edit
    end
  end
end
