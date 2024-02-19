require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_six)
	
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_ten)
end

get("/dice/1/20") do
  dice = rand(1..20)

  @outcome = "You rolled a #{dice}!"

  erb(:one_twenty)
end

get("/dice/5/4") do
  first_dice = rand(1..4)
  second_dice = rand(1..4)
  third_dice = rand(1..4)
  fourth_dice = rand(1..4)
  fifth_dice = rand(1..4)

  @outcome = "Your first dice is #{first_dice}!
             Your second dice is #{second_dice}!
             Your third dice is #{third_dice}!
             Your fourth dice is #{fourth_dice}!
             Your fifth dice is #{fifth_dice}!
             Your total is #{first_dice+second_dice+third_dice+fourth_dice+fifth_dice}!"
  erb(:five_four)

end
