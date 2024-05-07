class EventsController < ApplicationController

    def index()
        @events = Event.all
    end

    def create()
        @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], user: User.first)
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
    



end