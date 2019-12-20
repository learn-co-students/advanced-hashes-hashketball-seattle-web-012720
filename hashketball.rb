# Write your code here!
def game_hash()
  {
    home:
    {   team_name:"Brooklyn Nets",
        colors:["Black", "White"], 
        players:[
          {player_name:"Alan Anderson", number:0, shoe:16, points:22, rebounds:12, assists:12, steals:3, blocks:1, slam_dunks:1},
          {player_name:"Reggie Evans", number:30, shoe:14, points:12, rebounds:12, assists:12, steals:12, blocks:12, slam_dunks:7},
          {player_name:"Brook Lopez", number:11, shoe:17, points:17, rebounds:19, assists:10, steals:3, blocks:1, slam_dunks:15},
          {player_name:"Mason Plumlee", number:1, shoe:19, points:26, rebounds:11, assists:6, steals:3, blocks:8, slam_dunks:5},
          {player_name:"Jason Terry", number:31, shoe:15, points:19, rebounds:2, assists:2, steals:4, blocks:11, slam_dunks:1}]
    },
    away:
    {   team_name:"Charlotte Hornets",
        colors:["Turquoise", "Purple"], 
        players:[
          {player_name:"Jeff Adrien", number:4, shoe:18, points:10, rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2},
          {player_name:"Bismack Biyombo", number:0, shoe:16, points:12, rebounds:4, assists:7, steals:22, blocks:15, slam_dunks:10},
          {player_name:"DeSagna Diop", number:2, shoe:14, points:24, rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5},
          {player_name:"Ben Gordon", number:8, shoe:15, points:33, rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0},
          {player_name:"Kemba Walker", number:33, shoe:15, points:6, rebounds:12, assists:12, steals:7, blocks:5, slam_dunks:12}]
    }
  }
end

require 'pp'

def num_points_scored(player)
  score = 0
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:player_name]==player)
            score = player_hash[:points]
          end
        end
      end
    end
  end
  return score
end

def shoe_size(player)
  size = 0
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:player_name]==player)
            size = player_hash[:shoe]
          end
        end
      end
    end
  end
  return size
end

def team_colors(teamname)
  teamcolors = []
  game_hash.each do |key, value|
    if(value[:team_name] == teamname)
      teamcolors = value[:colors]
    end
  end
  return teamcolors
end

def team_names
  teamnames = []
  game_hash.each do |key, value|
      teamnames << value[:team_name]
  end
  return teamnames
end

def player_numbers(teamname)
  teamnumbers = []
  game_hash.each do |key, value|
    if(value[:team_name] == teamname)
      value[:players].each do|values|
        teamnumbers << values[:number]
      end
    end
  end
  return teamnumbers
end

def player_stats(player)
  hash = {}
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:player_name]==player)
            hash = player_hash
            hash.delete(:player_name)
          end
        end
      end
    end
  end
  return hash
end

def player_info(playername, stat)
  output = 0
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:player_name]==playername)
            output = player_hash[stat]
          end
        end
      end
    end
  end
  return output
end

def big_shoe_rebounds()
  rebound = 0
  maxshoesize = 0
  playername = ""
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:shoe]>maxshoesize)
              maxshoesize = player_hash[:shoe]
              playername = player_hash[:player_name]
          end
        end
      end
    end
  end
  
  rebound = player_info(playername, :rebounds)
  return rebound
end

def most_points_scored()

  max = 0
  playername = ""
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:points]>max)
              max = player_hash[:points]
              playername = player_hash[:player_name]
          end
        end
      end
    end
  end
  return playername
end

def most_steals_scored()

  max = 0
  playername = ""
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:steals]>max)
              max = player_hash[:steals]
              playername = player_hash[:player_name]
          end
        end
      end
    end
  end
  return playername
end

def player_with_longest_name()
  max = 0
  playername = ""
  game_hash.each do |key, value|
    value.each do|name_color_players, values|
      if(name_color_players == :players)
        values.each do|player_hash|
          if(player_hash[:player_name].length>max)
              max = player_hash[:player_name].length
              playername = player_hash[:player_name]
          end
        end
      end
    end
  end
  return playername
end

def winning_team()
  home_score = 0
  away_score = 0
  winningteam_name = ""
  game_hash.each do |key, value|
    if(key == :home)
      value.each do|name_color_players, values|
        if(name_color_players == :players)
          values.each do |player_hash|
            home_score = home_score + player_hash[:points]
          end
        end
      end
    else
      value.each do|name_color_players, values|
        if(name_color_players == :players)
          values.each do |player_hash|
            away_score = away_score + player_hash[:points]
          end
        end
      end
    end
  end

  if(home_score>away_score)
    winningteam_name = game_hash[:home][:team_name]
  else
    winningteam_name = game_hash[:away][:team_name]
  end
  
  return winningteam_name
end

def long_name_steals_a_ton?()
  
  longestnameplayer = player_with_longest_name()
  moststealplayer = most_steals_scored()
  
  return (longestnameplayer==moststealplayer)? true:false
end