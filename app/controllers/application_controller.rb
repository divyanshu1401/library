class ApplicationController < ActionController::Base
include Response
  def show_errors(exception)
    if exception.class == ActiveRecord::RecordNotFound
      json_response({ message: exception.message }, :not_found)
    else
      json_response({ message: exception.message }, :unprocessable_entity)
    end
  end
end
