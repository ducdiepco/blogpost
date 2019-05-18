class ApplicationController < ActionController::Base
  class_attribute :permitted_attrs

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_404
  end

  rescue_from(ActionController::UnknownFormat) do
    render_404
  end

  def render_404
    respond_to do |format|
      format.html { render :file => Rails.root.join('public/404.html'),  :status => 404 }
      format.js { render json: '', status: :not_found, content_type: 'application/json' }
      format.any { head :not_found }
    end
  end

  def model_params
    params.permit(permitted_attrs)
  end
end
