class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  private

  def authenticate_request
    if (request.path == '/users' and request.request_method == 'POST') or
        (request.path == '/items' and request.request_method == 'GET')
        render json: { status: "ok" }
    elsif request.path == '/users/token'

      render json: {"data": AuthorizeApiRequest.call(request.headers).result}
    elsif request.path == '/users/items'
      @current_user = AuthorizeApiRequest.call(request.headers).result
      @items = Item.where("EXISTS(SELECT * from users where users.id = items.user_id)")
      render json: {"data": @items}
    else
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
  end

end