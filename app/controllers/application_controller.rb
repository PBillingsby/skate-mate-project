class ApplicationController < ActionController::Base
  helper_method [:current_user, :logged_in?, :current_user_path]
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    session[:current_user]
  end

  def current_user_path
    redirect_to user_path(current_user)
  end

  # HANDLE ACTIVE RECORD 404 errors.
  rescue_from (ActiveRecord::RecordNotFound) { |exception| handle_exception(exception, 404) }

  protected

   def handle_exception(ex, status)
       render_error(ex, status)
       logger.error ex   
   end

   def render_error(ex, status)
       @status_code = status
       respond_to do |format|
         format.html { render :template => "error", :status => status }
         format.all { render :nothing => true, :status => status }
      end
   end
end
