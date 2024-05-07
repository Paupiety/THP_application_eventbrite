class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show()
        puts current_user_id?
        if current_user_id?
            id = params[:id]
            @user = User.find(id)
        else
            redirect_to events_path
            flash[:error] = "Bien essayé mais tu ne peux pas accéder à la page profil d'un autre utilisateur mouhahahaha"
        end
    end

    def update()
        @update = current_user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
        if @update
            redirect_to "/users/#{current_user.id}"
            flash[:success] = "Ton profil a bien été modifié"
        else
            redirect_to "/users/#{current_user.id}/edit"
            flash[:error] = "Une erreur a été détecté :#{current_user.errors.full_messages.join(",")}"
        end
    end

    def current_user_id?
        find = true
        id = params[:id]
        if current_user.id.to_i != id.to_i
            find = false
        end
        return find
    end

end

# def current_user_id?
#     id = params[:id]
#     puts id
#     puts "curent user fjdkfhidrne #{current_user.id}"
#     unless current_user.id == id
#         redirect_to events_path
#         flash[:error] = "Bien essayé mais tu ne peux pas accéder à la page profil d'un autre utilisateur mouhahahaha"
#     end
# end