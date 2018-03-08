Rails.application.routes.draw do
  get '/adventure/' => "games#choose_your_own_adventure"
  get '/adventure/:first_choice' => "games#choose_your_own_adventure"
  get '/adventure/:first_choice/:second_choice' => "games#the_second_choice"
  get '/adventure/:first_choice/:second_choice/:third_choice' => "games#the_third_choice"
end
