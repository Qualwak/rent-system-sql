class ApplicationController < ActionController::API
  # before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    if request.path == '/users' and request.request_method == 'POST'
    #   render json: { status: "ok" }
    else
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
  end
end