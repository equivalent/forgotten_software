# Errors Controller
#
# controller is for rendering and generating error pages.
#
#    http://localhost:3000/errors/404
#    http://localhost:3000/errors/500
#
# You can generate public error pages (public/404.html and
# public/500.html) with:
#
#     rake error_pages:generate
#
class ErrorsController < ApplicationController
  layout 'error_page'
  before_filter :authenticate_user!, except: [:show] #skip devise

  def show
    set_status
    set_title
    respond_to do |format|
      format.html { render action: @status }
      format.json { render json: {status: @status, error: @title} }
    end
  end

private
  def set_title
    @title = messages[@status.to_s]
    raise ActiveResource::BadRequest unless @title # unknown code render 500
  end

  def set_status
    @status = request.path.split('/').last[0..2]
  end

  def messages
    messages = {}
    messages['404'] = "Page not found"
    messages['500'] = "Page error"
    messages
  end

end
