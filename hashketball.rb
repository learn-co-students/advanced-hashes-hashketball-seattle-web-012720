def game_hash
 nest = {
   :home => {
     :team_name => 'Brooklyn Nets',
     :colors => ['Black', 'White'],
     :players => [
        {
         :player_name => 'Alan Anderson',
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
       },
       {
         :player_name => 'Reggie Evans',
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7
       },
       {
         :player_name => 'Brook Lopez',
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
       },
       {
         :player_name => 'Mason Plumlee',
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
       },
       {
         :player_name => 'Jason Terry',
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
       } 
      ]
   }, 
   :away => {
     :team_name => 'Charlotte Hornets', 
     :colors => ['Turquoise', 'Purple'], 
     :players => [
        {
         :player_name => 'Jeff Adrien',
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
       },
       {
         :player_name => 'Bismack Biyombo',
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10
       },
       {
         :player_name => 'DeSagna Diop',
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
       },
       {
         :player_name => 'Ben Gordon',
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
       },
       {
         :player_name => 'Kemba Walker',
         :number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12
       } 
       ] 
   }
 }
nest
end

def num_points_scored(player_name)
  nest = game_hash
  
  nest[:home][:players].each do |player|
    player.each do |stat, value|
      if player[:player_name] == player_name
        return player[:points]
      else
        nest[:away][:players].each do |player|
          player.each do |stat, value|
            if player[:player_name] == player_name
              return player[:points]
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  nest = game_hash
  
  nest[:home][:players].each do |player|
    player.each do |stat, value|
      if player[:player_name] == player_name
        return player[:shoe]
      else
        nest[:away][:players].each do |player|
          player.each do |stat, value|
            if player[:player_name] == player_name
              return player[:shoe]
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  nest = game_hash 
  if nest[:home][:team_name] == team_name
    return nest[:home][:colors]
  else
    if nest[:away][:team_name] == team_name
      return nest[:away][:colors]
    end
  end
end

def team_names
  nest = game_hash  
  teams = []
  teams.push(nest[:home][:team_name], nest[:away][:team_name])
  teams
end

def player_numbers(team_name)
  nest = game_hash
  player_number_array = []
  if nest[:home][:team_name] == team_name
    nest[:home][:players].each do |player|
      player_number_array.push(player[:number])
    end
  else
    nest[:away][:players].each do |player|
      player_number_array.push(player[:number])
    end
  end
  return player_number_array
end

def player_stats(player_name)
  nest = game_hash
  players_stats = {}
  nest[:home][:players].each do |player|
    if player[:player_name] == player_name
      players_stats = player
    else
      nest[:away][:players].each do |player|
        if player[:player_name] == player_name
          players_stats = player
        end
      end
    end
  end
  players_stats.delete(:player_name)
  return players_stats
end

def big_shoe_rebounds
  nest = game_hash
  biggest_shoe = 0
  player_w_biggest_shoe = ''
  nest[:home][:players].each do |player|
    if player[:shoe] > biggest_shoe
      biggest_shoe = player[:shoe]
      player_w_biggest_shoe = player[:player_name]
    end
  nest[:away][:players].each do |player|
    if player[:shoe] > biggest_shoe
      biggest_shoe = player[:shoe]
      player_w_biggest_shoe = player[:player_name]
    end
  end
  end
  nest[:home][:players].each do |player|
    if player[:player_name] == player_w_biggest_shoe
      return player[:rebounds]
    else
      nest[:away][:players]. each do |player|
        if player[:player_name] == player_w_biggest_shoe
          return player[:rebounds]
        end  
      end
    end
  end
end

def most_points_scored
  nest = game_hash 
  top_points = 0
  player_w_most_points = ""
  nest[:home][:players].each do |player|
    if player[:points] > top_points
      top_points = player[:points]
      player_w_most_points = player[:player_name]
    end
  nest[:away][:players].each do |player|
    if player[:points] > top_points
      top_points = player[:points]
      player_w_most_points = player[:player_name]
    end
  end
  end
  return player_w_most_points
end

def winning_team
  nest = game_hash
  home_team_points = 0
  away_team_points = 0
  nest[:home][:players].each do |player|
    home_team_points += player[:points]
  end
  nest[:away][:players].each do |player|
    away_team_points += player[:points]
  end
  if home_team_points > away_team_points
    return nest[:home][:team_name]
  else
    return nest[:away][:team_name]
  end
end

def player_with_longest_name
  nest = game_hash
  longest_name = ""
  longest_name_length = 0
  nest[:home][:players].each do |player|
    if player[:player_name].length > longest_name_length
      longest_name = player[:player_name]
      longest_name_length = player[:player_name].length
    else
      nest[:away][:players].each do |player|
        if player[:player_name].length > longest_name_length
          longest_name = player[:player_name]
          longest_name_length = player[:player_name].length
        end
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  nest = game_hash
  top_steals = 0
  top_stealer = ""
  steals_a_ton = false
  nest[:home][:players].each do |player|
    if player[:steals] > top_steals
      top_stealer = player[:player_name]
      top_steals = player[:steals]
    else
      nest[:away][:players].each do |player|
        if player[:steals] > top_steals
          top_stealer = player[:player_name]
          top_steals = player[:steals]
        end
      end
    end
  end
  if top_stealer == player_with_longest_name
    steals_a_ton = true
  end
  return steals_a_ton
end