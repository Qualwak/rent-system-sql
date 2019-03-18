class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: {status: 'success', data: @users}, status: :ok
  end

  # GET /users/1
  def show
    render json: {status: 'success', data: @user}, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      # render json: @user, status: :created, location: @user
      render json: {status: 'success', data: @user}, status: :created, location: @user
    else
      #render json: @user.errors, status: :unprocessable_entity
      render json: {status: 'fail', data: @user.errors}, status: :unprocessable_entity

    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: {status: 'success', data: @user}, status: :ok
    else
      render json: {status: 'fail', data: @user.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: {status: 'success', data: nil}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params.require(:user).permit(:password, :username, :email, :name, :surname, :phone, :role_id)
      # to create a user, we need only these parameters
      params.require(:user).permit(:password, :email, :role_id)
    end
end
