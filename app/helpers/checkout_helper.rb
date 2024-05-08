module CheckoutHelper

    def can_participate?(id)
        event = Event.find(id)
        participate = Attendance.find_by(event: event, user: current_user)
        if current_user == event.user
            redirect_to event_path(event.id)
            flash[:error]= "Tu ne peux pas payer une place d'un événement que tu as créé"
            return false
        elsif participate
            return false
            redirect_to event_path(event.id)
            flash[:error]= "Tu ne peux pas payer une place que tu as déjà payé"
        else 
            return true
        end
    end

end
