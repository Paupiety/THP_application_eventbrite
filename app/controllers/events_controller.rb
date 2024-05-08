class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index()
        @events = Event.all
    end

    def create()
        @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], user: current_user)
        if @event.save
            redirect_to events_path
            flash[:success] = "Votre événement a bien été créé"
        else
            redirect_to new_event_path
            flash[:error] = "Un ou plusieurs erreurs ont été détectée : #{@event.errors.full_messages.join(",")}"
        end
    end

    def show()
        id = params[:id]
        @event = Event.find(id)
    end

    def edit()
        id = params[:id]
        @event = Event.find(id)
    end

    def update()
        id = params[:id]
        @event = Event.find(id)
        @update = @event.update(title: params[:title], description: params[:description], price: params[:price], location: params[:location])
        if @update
            redirect_to "/events/#{@event.id}"
            flash[:success] = "Ton événement a bien été modifié"
        else
            redirect_to "/events/#{@event.id}/edit"
            flash[:error] = "Une erreur a été détecté :#{@event.errors.full_messages.join(",")}"
        end 
    end

    def destroy()
        id = params[:id]
        @event = Event.find(id)
        @event.destroy
        redirect_to root_path
        flash[:success] = "Votre événement a bien été supprimé"
    end

end