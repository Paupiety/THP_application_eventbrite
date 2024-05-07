class UsersController < ApplicationController
    #before_action :authenticate_user!
    
    def show()
            id = params[:id]
            @user = User.find(id)
        unless @user
            redirect_to new_user_session_path
            flash[:error] = "Tu dois être connecter pour accéder aux détails des événements"
        end
    end

end
