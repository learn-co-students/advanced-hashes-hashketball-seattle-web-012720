require 'pry'

def game_hash
  hashketball = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson", 
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1, 
        :slam_dunks => 1, 
        },
        {
        :player_name => "Reggie Evans", 
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12, 
        :slam_dunks => 7, 
        }, 
        {
        :player_name => "Brook Lopez", 
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1, 
        :slam_dunks => 15, 
        },
        {
        :player_name => "Mason Plumlee", 
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8, 
        :slam_dunks => 5, 
        },
        {
        :player_name => "Jason Terry", 
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11, 
        :slam_dunks => 1, 
        }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien", 
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7, 
        :slam_dunks => 2, 
        },
        {
        :player_name => "Bismack Biyombo", 
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15, 
        :slam_dunks => 10, 
        }, 
        {
        :player_name => "DeSagna Diop", 
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5, 
        :slam_dunks => 5, 
        },
        {
        :player_name => "Ben Gordon", 
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1, 
        :slam_dunks => 0, 
        },
        {
        :player_name => "Kemba Walker", 
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5, 
        :slam_dunks => 12, 
        }]
    } 
  } 
 
end 


def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            points = player[:points]
           return points 
          end 
        end 
      end 
    end 
 end 
end



def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            shoe_size = player[:shoe]
            return shoe_size
          end 
        end 
      end 
    end 
  end 
end 

def team_colors(team_name) 
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      colors = team[:colors]
      return colors 
    end 
  end 
end 


def team_names
  array = [] 
  game_hash.map do |place, team|
    names = team[:team_name]
    array << names
  end 
  array
end 

def player_numbers(team_name)
  array = [] 
  game_hash.map do |place, team|
   if team_name == team[:team_name] 
     team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name]
            number = player[:number]
           array << number 
          end 
        end 
       end 
     end 
   end 
  end 
  array
end 


def player_stats(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player| 
          if players_name == player[:player_name]
              stats = player.slice(:number,:shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks) 
              return stats
          end 
        end 
      end 
    end 
  end 
end 

def find_rebounds_by_shoe(shoe_size)
  game_hash.each do |place, team|
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player|
          if shoe_size == player[:shoe]
            rebounds = player[:rebounds]
            return rebounds
          end 
        end 
      end 
    end 
  end 
end 


def big_shoe_rebounds
  array = [] 
 game_hash.each do |place, team| 
   team.each do |attribute, data| 
     if attribute == :players
       data.each do |player|
         shoe_sizes = player[:shoe]
         array << shoe_sizes
       end 
     end 
   end 
 end 
big_shoe = array.max
 find_rebounds_by_shoe(big_shoe)
end 



def most_points_scored
  array = [] 
  game_hash.each do |place, team|
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player|
          points = player[:points]
          array << points 
        end 
      end 
    end 
  end 
  max_points = array.max 
  get_player_name_by_points(max_points)
end 

def get_player_name_by_points(point)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player| 
           if point == player[:points]
            name = player[:player_name]
            return name
          end 
        end 
      end 
    end 
  end 
end 

def winning_team 
  total = 0 
  win_team = ""
  game_hash.each do |place, team|
    points_per_team = 0 
    team_name = game_hash[place][:team_name]
    team[:players].each do |player|
      points = player[:points]
      points_per_team += points
    end 
    win_team, total = team_name, points_per_team if points_per_team > total 
  end 
  return win_team
end 


def get_player_name_by_name_size(name_size)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player| 
           if name_size == player[:player_name].size
            name = player[:player_name]
            return name
          end 
        end 
      end 
    end 
  end 
end 


def player_with_longest_name 
  array = []
  game_hash.each do |place, team|
    team[:players].each do |player|
      name_size = player[:player_name].size
     array << name_size
    end 
  end 
  long_name = array.max 
  longest_name = get_player_name_by_name_size(long_name)
  return longest_name
end 


def find_player_by_steals(steals)
  game_hash.each do |place, team| 
    team[:players].each do |player| 
      if steals == player[:steals]
        return player[:player_name]
      end 
    end 
  end 
end 


def long_name_steals_a_ton?
  array = []
  game_hash.each do |place, team|
    team[:players].each do |player|
      steals = player[:steals]
      array << steals 
    end 
  end 
  most_steals = array.max 
  steals_a_ton = find_player_by_steals(most_steals)
  if player_with_longest_name == steals_a_ton
    return true 
  else 
  return false 
  end 
end 
  

