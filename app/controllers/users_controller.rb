require 'digest/sha1'
class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
 # before_action :authenticate, except: [:new, :create, :autorization]
  # GET /users or /users.json
  def index
    @users = User.all
 end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @new_user_params = user_params
    @new_user_params[:password] = Digest::SHA1.hexdigest(user_params[:password])
    @user = User.new(@new_user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to lab_input_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
        session[:current_user_id] = @user.id
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @new_user_params = user_params
    @new_user_params[:password] = Digest::SHA1.hexdigest(user_params[:password])
    @user = User.find_by(login: user_params[:login])
    respond_to do |format|
      if @user.update(@new_user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :password)
    end
end
