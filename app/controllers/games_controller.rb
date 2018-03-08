class GamesController < ApplicationController
  def choose_your_own_adventure
    first_choice = params["first_choice"]
    if first_choice != nil
      if first_choice.downcase == "left"
        current_situation = "You chose left, you walk towards the open door, just then a dragon swoops down and breaths fire on you. You die."
      elsif first_choice.downcase == "right"
        current_situation = "You approach the troll on the right tentatively. He greets you cheerily. 'I have been waiting for a hero to come rescue the prisoner. Here is a map to the interior of the castle! Your new friend the troll lets you through the gate. He pauses for a moment, and is uncertain of which way to go. You have the map, he looks to you to make a decision. On the map you see to the right a garden, to the left the armory. Choose left or right in the address bar after a '/''"
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
  def the_second_choice
    first_choice = params["first_choice"]
    second_choice = params["second_choice"]
    if first_choice == "right" && second_choice != nil
      if second_choice.downcase == "left"
        current_situation = "You chose left, you walk towards the armory. The way is dark, but you get to the armory unscathed. Time to load up on weapons. As you come out of the armory you see the prisoner to the right and the dragon to the left. Choose left or right in the address bar after a '/'"
      elsif second_choice.downcase == "right"
        current_situation = "You chose to go towards the garden on the right, the troll does not wish to accompany you. He is allergic to flowers. While walking through the garden you get very sleepy. You lie down and fall into a deep slumber."
      else
        if second_choice == "slay"
          current_situation = "You do slay, and you save the prisoner. You win! Nothing left to do here. YAAAAAS!"
        else
          current_situation = "Left or Right are your only choices, choose left or right above!"
        end
      end
      render json: {message: current_situation}
    else
      if first_choice == "left"
        render json: {message: "Sorry you are dead. Ghosts can't make additional choices."}
      else
        render json: {message: "Your new friend the troll lets you through the gate. He pauses for a moment, and is uncertain of which way to go. You have the map, he looks to you to make a decision. On the map you see to the right a garden, to the left the armory. Choose left or right in the address bar after a '/'"}
      end
    end
  end

  def the_third_choice
    first_choice = params["first_choice"]
    second_choice = params["second_choice"]
    third_choice = params["third_choice"]
    if first_choice == "right" && second_choice == "left" && third_choice != nil
      if third_choice.downcase == "left"
        current_situation = "You chose left, you run towards the dragon, you slay the dragon and you save the prisoner. You win."
      elsif third_choice.downcase == "right"
        current_situation = "You chose to go towards the prisoner, the dragon swoops towards you. In the last moment you turn to cut the dragons head off with one mighty blow. You slay the dragon and save the prisoner. You win."
      else
        if third_choice == "slay"
          current_situation = "You do slay, and you save the prisoner. You win! Nothing left to do here. YAAAAAS!"
        else
          current_situation = "Left or Right are your only choices, choose left or right above!"
        end
      end
      render json: {message: current_situation}
    else
      if first_choice == "left"
        render json: {message: "Sorry you are dead. Ghosts can't make additional choices."}
      elsif second_choice == "right"
        render json: {message: "Sorry you are getting your beauty sleep. Sleeping Beauty can't make additional choices."}
      else
        render json: {message: "You find the dragon, you slay the dragon and you save the prisoner."}
      end
    end
    
  end
end
