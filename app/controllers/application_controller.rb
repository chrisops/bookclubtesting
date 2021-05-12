class ApplicationController < ActionController::Base
    rescue_from Pundit::NotAuthorizedError, with: :forbidden

    private

    def forbidden
        flash[:alert] = "Not authorized to perform that action"
        redirect_to root_path
    end

end
