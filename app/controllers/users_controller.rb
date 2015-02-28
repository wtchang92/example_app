class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
   @posts = @user.posts.all
  end
  
  def new
    @user = User.new

  end
  
   def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to the Example App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
