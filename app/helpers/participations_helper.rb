module ParticipationsHelper

    def select_player_form
        User.all.collect {|u| [u.username, u.id]}
    end
end
