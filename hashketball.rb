require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ['Black', "White"], 
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
      :colors => ["Turquoise", 'Purple'],
      :players => [
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2 },
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
        :blocks =>5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals =>1,
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
        :slam_dunks =>12}
      ]
    }
  }

end


def num_points_scored(player)
  game_hash.each {|place, team_hash|
    team_hash[:players].each {|player_hash|
      if (player_hash[:player_name] == player)
        return player_hash[:points]
      end
    }
  }
end

def shoe_size(players_name)
  game_hash.each {|place, team_hash|
    team_hash[:players].each {|player_data|
      if player_data[:player_name] == players_name
        return player_data[:shoe]
      end
    }
  }
end

def team_colors(teams_name)
  game_hash.each {|place, team|
    if team[:team_name] == teams_name
      return team[:colors]
    end
  }
end

def team_names
  game_hash.collect {|place, team|
    team[:team_name]
  }
end

def player_numbers(teams_name)
  jerseys = []
  game_hash.each {|place, team_hash|
    if team_hash[:team_name] == teams_name
      team_hash[:players].each {|player_data|
        jerseys << player_data[:number]
      }
    end
  }
  jerseys
end

def player_stats(players_name)
  indiv_stats = {}
  game_hash.each {|place, team|
    team[:players].each {|player_hash|
    if player_hash[:player_name] == players_name
      player_hash.each {|category, data|
        if category != :player_name
          indiv_stats[category] = data
        end 
      }
    end 
    }
  }
  indiv_stats
end

def big_shoe_rebounds
  biggest = 0 
  game_hash.each {|place, team|
    team[:players].each {|player_hash|
    if player_hash[:shoe] >= biggest
      biggest = player_hash[:shoe]
    end 
    }
  }
  game_hash.each {|place, team|
    team[:players].each {|player_hash|
    if player_hash[:shoe] == biggest
      return player_hash[:rebounds]
    end
    }
  }
end
      
def most_points_scored
  most_points = 0
  player = ''
  game_hash.each {|place, team|
    team[:players].each {|player_hash|
    if player_hash[:points] >= most_points
      most_points = player_hash[:points]
      player = player_hash[:player_name]
    end 
    }
  }
  player
end

def winning_team
  home_team_total = 0
  away_team_total = 0
  game_hash.each {|place, team|
    if place == :home
      team[:players].each {|player_hash|
        home_team_total += player_hash[:points]
      }
    elsif place == :away
      team[:players].each {|player_hash|
        away_team_total += player_hash[:points]
      }
    end
  }
  if home_team_total > away_team_total
    return game_hash[:home][:team_name]
  elsif home_team_total < away_team_total
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  names = []
  game_hash.each {|place, team|
    team[:players].each {|player_hash|
      names << player_hash[:player_name]
    }
  }
  return names.max_by {|x| x.length}
end


def most_steals
  steals = 0
  player = ''
  game_hash.each {|place, team|
    team[:players].each {|player_hash|
    if player_hash[:steals] >= steals
      steals = player_hash[:steals]
      player = player_hash[:player_name]
    end 
    }
  }
  player
end

def long_name_steals_a_ton?
  who_steals = most_steals
  who_name = player_with_longest_name
  if who_name == who_steals
    return true
  else
    return false
  end
end
