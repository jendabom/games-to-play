class GamesController < ApplicationController
  def choose_your_own_adventure
    first_choice = params["first_choice"]
    if first_choice != nil
      if first_choice.downcase == "left"
        current_situation = "You chose left, you walk towards the open door, just then a dragon swoops down and breaths fire on you. You die."
      elsif first_choice.downcase == "right"
        current_situation = "You approach the troll on the right tentatively. He greets you cheerily. 'I have been waiting for a hero to come rescue the prisoner. Here is a map to the interior of the castle!'"
      else
        if first_choice == "slay"
          current_situation = "You do slay, and you save the prisoner. You win! Nothing left to do here. YAAAAAS!"
        else
          current_situation = "Left or Right are your only choices, choose left or right above!"
        end
      end
      render json: {message: current_situation}
    else
      render json: {message: "You are strong and heroic, you stand fearless outside a castle. You have come to save the prisoner and fight the dragon. To the left you see an open door, to the right a troll stands outside a gate in. Choose left or right in the address bar after a '/'"}
    end
  end
end
