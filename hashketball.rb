def game_hash
  das_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
          {:player_name => "Alan Anderson",
           :number => 0,
           :shoe => 16,
           :points => 22,
           :rebounds => 12,
           :assists => 12,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 1},
           {:player_name => "Reggie Evans",
           :number => 30,
           :shoe => 14,
           :points => 12,
           :rebounds => 12,
           :assists => 12,
           :steals => 12,
           :blocks => 12,
           :slam_dunks => 7},
           {:player_name => "Brook Lopez",
           :number => 11,
           :shoe => 17,
           :points => 17,
           :rebounds => 19,
           :assists => 10,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 15},
           {:player_name => "Mason Plumlee",
           :number => 1,
           :shoe => 19,
           :points => 26,
           :rebounds => 11,
           :assists => 6,
           :steals => 3,
           :blocks => 8,
           :slam_dunks => 5},
           {:player_name => "Jason Terry",
           :number => 31,
           :shoe => 15,
           :points => 19,
           :rebounds => 2,
           :assists => 2,
           :steals => 4,
           :blocks => 11,
           :slam_dunks => 1}
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
          {:player_name => "Jeff Adrien",
           :number => 4,
           :shoe => 18,
           :points => 10,
           :rebounds => 1,
           :assists => 1,
           :steals => 2,
           :blocks => 7,
           :slam_dunks => 2},
           {:player_name => "Bismack Biyombo",
           :number => 0,
           :shoe => 16,
           :points => 12,
           :rebounds => 4,
           :assists => 7,
           :steals => 22,
           :blocks => 15,
           :slam_dunks => 10},
           {:player_name => "DeSagna Diop",
           :number => 2,
           :shoe => 14,
           :points => 24,
           :rebounds => 12,
           :assists => 12,
           :steals => 4,
           :blocks => 5,
           :slam_dunks => 5},
           {:player_name => "Ben Gordon",
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0},
           {:player_name => "Kemba Walker",
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals => 7,
           :blocks => 5,
           :slam_dunks => 12}
        ]
    }
  }
  
  das_hash
end

def array_of_all_players
  list = game_hash[:home][:players] + game_hash[:away][:players]
  list
end

def num_points_scored(player_name)
  array_of_all_players.each do |index| 
    index.each do |key|
      if key.include?(player_name)
        return index[:points]
      end
    end    
  end
  puts "Not found"
end

def shoe_size(player_name)
  array_of_all_players.each do |index| 
    index.each do |key|
      if key.include?(player_name)
        return index[:shoe]
      end
    end    
  end
  puts "Not found"
end

def team_colors(t_name)
  game_hash.each do |h_a|
    if h_a[1][:team_name] === t_name
      return h_a[1][:colors]
    end
  end
  puts "Not found"
end

def team_names
  new = []
  game_hash.each do |h_a|
    new << h_a[1][:team_name] 
  end
  new
end

def player_numbers(t_name)
  game_hash.each do |h_a|
    if h_a[1][:team_name] === t_name
      new = []
      p_list = h_a[1][:players]
      p_list.each do |each_player|
        new << each_player[:number]
      end
      return new
    end
  end
  puts "Not found"
end

def player_stats(player_name)
    array_of_all_players.each do |index| 
    index.each do |key|
      if key.include?(player_name)
        index.delete(:player_name)
        return index
      end
    end    
  end
  puts "Not found"
end

def big_shoe_rebounds
  new = []
  array_of_all_players.each do |index| 
    index.each do |key|
     if key.include?(:shoe)
       new << index[:shoe]
     end
    end
  end
  
  array_of_all_players.each do |index| 
    if index[:shoe] == new.sort.last
      return index[:rebounds]
    end
  end
end

def most_points_scored
  new = []
  array_of_all_players.each do |index| 
    index.each do |key|
     if key.include?(:points)
       new << index[:points]
     end
    end
  end
  
  array_of_all_players.each do |index| 
    if index[:points] == new.sort.last
      return index[:player_name]
    end
  end
end

def winning_team
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_points = []
  away_points = []
  
  home_players.each do |hash|
    hash.each do |key, value|
      if key == :points
        home_points << value
      end
    end  
  end
  
  away_players.each do |hash|
    hash.each do |key, value|
      if key == :points
        away_points << value
      end
    end  
  end
  
  if home_points.sum > away_points.sum
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  list_of_names = []
  array_of_all_players.each do |index| 
    list_of_names << index[:player_name]
  end
  sorted = list_of_names.sort_by {|x| x.length}
  sorted.last
end 

def long_name_steals_a_ton?
  list_of_steals = []
  array_of_all_players.each do |index| 
    list_of_steals << index[:steals]
  end
  most_steals = list_of_steals.sort.last
  
  long_name_steals = 0
  array_of_all_players.each do |index| 
    index.each do |key|
      if key.include?(player_with_longest_name)
        long_name_steals = index[:steals]
      end
    end    
  end
  most_steals == long_name_steals
end