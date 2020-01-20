# Write your code here!
def game_hash
  {
  :home=>{
    :team_name=>"Brooklyn Nets",
  :colors=>["Black","White"],
  :players=> {
  
      "Alan Anderson"=>
  {
:number=>0,
:shoe=>16,
:points=>22,
:rebounds=>12,
:assists=>12,
:steals=>3,
:blocks=>1,
:slam_dunks=>1},
"Reggie Evans"=>
{
:number=>30,
:shoe=>14,
:points=>12,
:rebounds=>12,
:assists=>12,
:steals=>12,
:blocks=>12,
:slam_dunks=>7},
"Brook Lopez"=>
{
:number=>11,
:shoe=>17,
:points=>17,
:rebounds=>19,
:assists=>10,
:steals=>3,
:blocks=>1,
:slam_dunks=>15},
"Mason Plumlee"=>
{
:number=>1,
:shoe=>19,
:points=>26,
:rebounds=>11,
:assists=>6,
:steals=>3,
:blocks=>8,
:slam_dunks=>5},
"Jason Terry"=>
{
:number=>31,
:shoe=>15,
:points=>19,
:rebounds=>2,
:assists=>2,
:steals=>4,
:blocks=>11,
:slam_dunks=>1}
  }
  },
    
    
        :away=>{:team_name=>"Charlotte Hornets",
        :colors=>["Purple", "Turquoise"],
        :players=>
{"Jeff Adrien"=>
{
:number=>4,
:shoe=>18,
:points=>10,
:rebounds=>1,
:assists=>1,
:steals=>2,
:blocks=>7,
:slam_dunks=>2},
"Bismack Biyombo"=>
{
:number=>0,
:shoe=>16,
:points=>12,
:rebounds=>4,
:assists=>7,
:steals=>22,
:blocks=>15,
:slam_dunks=>10},
"DeSagna Diop"=>
{
:number=>2,
:shoe=>14,
:points=>24,
:rebounds=>12,
:assists=>12,
:steals=>4,
:blocks=>5,
:slam_dunks=>5},
"Ben Gordon"=>
{
:number=>8,
:shoe=>15,
:points=>33,
:rebounds=>3,
:assists=>2,
:steals=>1,
:blocks=>1,
:slam_dunks=>0},
"Kemba Walker"=>
{
:number=>33,
:shoe=>15,
:points=>6,
:rebounds=>12,
:assists=>12,
:steals=>7,
:blocks=>5,
:slam_dunks=>12}
}
}
}
end

def num_points_scored(player)
game_hash.each {|team, team_data| team_data.each {|players,name| 
if name.include?(player)
  return game_hash[team][players][player][:points]
end
}
}
end

def shoe_size(player)
game_hash.each {|teams, team_data| team_data.each {|players,name| 
if name.include?(player)
  return game_hash[teams][players][player][:shoe]
end
}
}
end

def team_colors(team_name)
  game_hash.each{ |teams, team_data| 
  if team_data[:team_name]==team_name
    team_data.each {|color,value|
    if color==:colors
      return value
    end
    }
  end
  }
end
      
def team_names
team_array=[]
game_hash.each{|team,team_data|
value = team_data[:team_name]
team_array << value
}
team_array
end

def player_numbers(team_name)
  jersey_numbers=[]
  game_hash.each {|teams, team_data|
   
if team_name == team_data[:team_name]
  team_data.each{|players, player|
  if players == :players
    player.each{ |number,value|
      
  jersey_numbers.push(game_hash[teams][players][number][:number]) 
    }
end
  }
end
}
return jersey_numbers
end



def player_stats(player)
  game_hash.each {|teams, team_data| team_data.each {|players,name| 
if name.include?(player)
  return game_hash[teams][players][player]
end
}
}
end



def big_shoe_rebounds
    rebound = nil 
    shoe_data = []
    biggest_shoe = nil

    game_hash.collect do |team, team_data|
      team_data[:players].collect do |player, player_data|
        shoe_data.push(player_data[:shoe])
        biggest_shoe = shoe_data.sort[-1]
        player_data.collect do |category, stat|
        if category == :shoe 
        if stat == biggest_shoe
       rebound = player_data[:rebounds]
      end 
      end 
      end 
      end 
    end 
    rebound
  end 



  def most_points_scored
 points_data = [] 
   most_points = nil

   name = nil 
      game_hash.each do |team, team_data|
      team_data[:players].each do |attribute, data|
      points_data.push(data[:points])
      most_points = points_data.sort[-1]
    end 
  end 
  game_hash.each do |team, team_data|
    name = team_data[:players].each do |name, stats|
      if stats[:points] == most_points
     return name 
   end 
 end 
 end 
end 

def winning_team
  winner_points = 0 
  winner_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]
    current_points = 0
    name = a[:team_name]
    a[:players].reduce({}) do |memo, (key, value)|
      current_points += a[:players][key][:points]
    end
    if current_points > winner_points
      winner_points = current_points
      winner_name = name
    end
  end
  return winner_name
end

def player_with_longest_name
  longest_name_length = 0 
  longest_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]  
    a[:players].reduce({}) do |memo, (key, value)|
      if key.length > longest_name_length
        longest_name_length = key.length
        longest_name = key
  end
  end
  end
  return longest_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_rebounds = most_rebounds_scored
  p longest_name == most_rebounds
return true
end

def most_rebounds_scored
  most = 0 
  points_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
  a = game_hash[key]
   a[:players].reduce({}) do |memo, (key, value)|
   name = key
   if a[:players][key][:steals] > most
    most = a[:players][key][:steals]
    points_name = name
    end
    end
  end
  return most
end 
