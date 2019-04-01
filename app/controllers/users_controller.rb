class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: :create
  wrap_parameters :user, include: [:name, :email, :username,
                                   :surname, :phone, :role_id,
                                   :password, :password_confirmation]

  include Response

  # GET /users
  def index
    @users = User.all
    # render json: {status: 'success', data: @users}, status: :ok
    json_response(@users, :ok)
  end

  # GET /users/1
  def show
    json_response(@user, :ok)
    # render json: {status: 'success', data: @user}, status: :ok
  end

  # GET /current_user
  def current_user
    render json: { status: 'success', data: AuthorizeApiRequest.call(request.headers).result }
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: {status: 'success', data: @user}, status: :created, location: @user
    else
      render json: {status: 'fail', data: @user.errors}, status: :unprocessable_entity
    end
  end

  # GET /users/{id}/items - shows only items of current user - deprecated
  # GET /my-items/ items of current user
  def get_user_items
    @current_user = AuthorizeApiRequest.call(request.headers).result
    @items = Item.where(user_id: @current_user.id)
    render json: { data: @items }
  end

  # GET /my-orders/rented
  def get_items_i_rented
    @current_user = AuthorizeApiRequest.call(request.headers).result
    @orders = Order.where(user_id: @current_user.id)
    # @items = Item.where(id: @orders.item_id)
    # name = @items.first.title
    # @orders.each do |order|
    #
    # end
    @names_hash = []
    @orders.each do |order|
      @items = Item.where(id: order.item_id)
      @names_hash << {id: order.id, item_id: order.item_id, user_id: order.user_id, duration: order.duration,
                      status: order.status, description: order.description, final_price: (@items.first.price.* order.duration.to_i), created_at: order.created_at, updated_at: order.updated_at}
      # @names_hash << {order: order, final_price: (@items.first.price.* order.duration.to_i)}
    end
    render json: { status: 'success', data: @names_hash}
    # render json: { status: 'success', data: @orders }
  end

  def return_item_name(id)
    name = Item.where(id: id).title
  end

  # GET /my-orders/rent
  def get_items_i_rent
    @current_user = AuthorizeApiRequest.call(request.headers).result
    @orders = Order.where("item_id IN (SELECT item_id FROM items WHERE user_id = #{@current_user.id})")
    # @orders = Order.joins(:item).where('items.user_id' => @current_user.id)
    # @orders.each do |order|
    #   order["price"] = 1
    # end
    # @names = []
    # @orders.each do |order|
    #   @names << Item.where(id: order.item_id)
    # end
    @names_hash = []
    @orders.each do |order|
      @items = Item.where(id: order.item_id)
      @names_hash << {id: order.id, item_id: order.item_id, user_id: order.user_id, duration: order.duration,
      status: order.status, description: order.description, final_price: (@items.first.price.* order.duration.to_i), created_at: order.created_at, updated_at: order.updated_at}
      # @names_hash << {order: order, final_price: (@items.first.price.* order.duration.to_i)}
    end
    render json: { status: 'success', data: @names_hash}
    # render json: { status: 'success', data: @orders, names: @names}
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
    render json: {status: 'success', data: nil}, status: :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
    else
      json_response(nil, :not_found)
    end
    # if User.find(params[:id]).present?
    #   @user = User.find(params[:id])
    # else
    #   json_response(nil, :not_found)
    # end
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    # to create a user, we need only these parameters
    params.require(:user).permit(:password, :email, :role_id, :name, :surname, :phone)
  end
end