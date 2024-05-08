class AttendancesController < ApplicationController

    def index()
        id = params[:event_id]
        @event = Event.find(id)
    end

end
