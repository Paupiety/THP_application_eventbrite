module EventsHelper

    def current_user?(event)
        if event.user == current_user
            return true
        else
            return false
        end
    end

end
