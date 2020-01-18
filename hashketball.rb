
def game_hash
  main_hash = {:home => {:team_name => "", :colors => [], :players => []}, :away => {:team_name => "", :colors => [], :players => []}}
  home_head_data = {:side => "home", :team_name => "Brooklyn Nets", :colors => ["Black", "White"]}
  away_head_data = {:side => "away", :team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"]}
  main_hash = parse_data(home_head_data, "./HomeData.txt", main_hash)  
  main_hash = parse_data(away_head_data, "./AwayData.txt", main_hash)
  
  glob_hash = main_hash
  main_hash
end

def parse_data(team_head_data, player_file_name, hash)
    hash[team_head_data[:side].to_sym][:team_name] = team_head_data[:team_name]
    hash[team_head_data[:side].to_sym][:colors] = team_head_data[:colors]    

    player_array = []
    File.open(player_file_name).each do |line|
        temp_array = line.split(",").drop(1)
        player_array = temp_array.map{|n| n = {:player_name => n.strip, :number => nil, :shoe => nil, :points => nil, :rebounds => nil, :assists => nil, :steals => nil, :blocks => nil, :slam_dunks => nil}}   
        break
    end
    
    row_symbol_lookup = [:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks]
    symbol_index = 0
    player_array_mapped = []
    File.open(player_file_name).drop(1).each do |line|
        attribute_row = line.split(" ").drop(1)
        player_index = 0
        player_array_mapped = player_array.map{ |player| 
            player[row_symbol_lookup[symbol_index]] = attribute_row[player_index].to_i
            player_index+=1
            player
        }
        symbol_index+=1
    end
    hash[team_head_data[:side].to_sym][:players] = player_array_mapped
    hash
end

def num_points_scored(pl_name)    
    value = get_player_by_name(pl_name)

    if(value != nil)
        value = value[:points]
    end
    value    
end

def get_player_by_name(pl_name)
    hash = game_hash    
    value = nil
    value = hash[:home][:players].find{|x| x[:player_name] == pl_name}
    if(value == nil)
        value = hash[:away][:players].find{|x| x[:player_name] == pl_name}
    end
    value
end

def team_names
  hash = game_hash    
  team_array = hash.map{|key,value| value[:team_name]}
  team_array
end

def shoe_size(pl_name)    
    value = get_player_by_name(pl_name)

    if(value != nil)
        value = value[:shoe]
    end
    value    
end

def team_colors(team_name)
    team = get_team_by_name(team_name)
    value = team[:colors]
    value
  end
  
def get_team_by_name(team_name)
  hash = game_hash    
  value = nil
  if(hash[:home][:team_name] == team_name)
      value = hash[:home]
  else
      value = hash[:away]
  end
  value
end

def player_numbers(team_name)
  team = get_team_by_name(team_name)
  value = team[:players].map{|player| player = player[:number]}
  value = value.sort        
  value    
end
  
def player_stats(player_name)
  value = get_player_by_name(player_name)        
  player =  value.reduce({}) do |memo, (key, value)|
      memo[key] = value
      memo
  end
  player.delete(:player_name)
  player
end

def big_shoe_rebounds
  combined = get_all_players
  big_foot_home_player = combined.reduce({}) do |memo, (key,value)|
    memo = key if memo  == {}      
    if(memo[:shoe]< key[:shoe])
      memo = key
    end
    memo
  end
  big_foot_home_player[:rebounds]
end

def get_all_players
  hash = game_hash
  home_players = hash[:home][:players]
  away_players = hash[:away][:players]
  home_players + away_players
end
  
def most_points_scored
  combined = get_all_players
  most_points_player = combined.reduce({}) do |memo, (key,value)|
    memo = key if memo  == {}   
    if(memo[:points] < key[:points])
      memo = key
    end
    memo
  end
  most_points_player[:player_name]
end

def winning_team
  hash = game_hash
  home_players = hash[:home][:players]
  away_players = hash[:away][:players]
  home_points = home_players.reduce(0) do |memo, (key,value)|
      memo = memo + key[:points]
      memo
  end
  away_points = away_players.reduce(0) do |memo, (key,value)|
      memo = memo + key[:points]
      memo
  end
  winner = home_points > away_points ?  hash[:home][:team_name] : hash[:away][:team_name]
  winner
end

def longest_name_player
  combined_players = get_all_players    
  player = combined_players.reduce({}) do |memo, (key,value)|
    memo = key if memo  == {}
    if(memo[:player_name].length < key[:player_name].length)
      memo = key
    end
    memo
  end 
end

def player_with_longest_name
  player = longest_name_player
  player[:player_name]
end

def long_name_steals_a_ton?
  player = longest_name_player
  combined_players = get_all_players
  player_with_most_steals = most_steals
  value = false
  if(player[:player_name]== player_with_most_steals)
      value = true
  end
  value
end

def most_steals
  combined = get_all_players
  player_with_steals = combined.reduce({}) do |memo, (key,value)|
    memo = key if memo  == {}   
    if(memo[:steals] < key[:steals])
      memo = key
    end
    memo
  end
  player_with_steals[:player_name]
end