def game_hash() 
{
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black" , "White"], 
    players: [
      {player_name: "Alan Anderson",
      number: 0,
      shoe: 16,
      points: 22,
      rebounds: 12,
      assists: 12,
      steals: 3,
      blocks: 1,
      slam_dunks: 1
      },
      {player_name: "Reggie Evans",
      number: 30,
      shoe: 14,
      points: 12,
      rebounds: 12,
      assists: 12,
      steals: 12,
      blocks: 12,
      slam_dunks: 7
      },
      {player_name: "Brook Lopez",
      number: 11,
      shoe: 17,
      points: 17,
      rebounds: 19,
      assists: 10,
      steals: 3,
      blocks: 1,
      slam_dunks: 15
      },
      {player_name: "Mason Plumlee",
      number: 1,
      shoe: 19,
      points: 26,
      rebounds: 11,
      assists: 6,
      steals: 3,
      blocks: 8,
      slam_dunks: 5
      },
      {player_name: "Jason Terry",
      number: 31,
      shoe: 15,
      points: 19,
      rebounds: 2,
      assists: 2,
      steals: 4,
      blocks: 11,
      slam_dunks: 1
      }
    ]
  }, 
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: [
      {player_name: "Jeff Adrien",
      number: 4,
      shoe: 18,
      points: 10,
      rebounds: 1,
      assists: 1,
      steals: 2,
      blocks: 7,
      slam_dunks: 2
      },
      {player_name: "Bismack Biyombo",
      number: 0,
      shoe: 16,
      points: 12,
      rebounds: 4,
      assists: 7,
      steals: 22,
      blocks: 15,
      slam_dunks: 10
      },
      {player_name: "DeSagna Diop",
      number: 2,
      shoe: 14,
      points: 24,
      rebounds: 12,
      assists: 12,
      steals: 4,
      blocks: 5,
      slam_dunks: 5
      },
      {player_name: "Ben Gordon",
      number: 8,
      shoe: 15,
      points: 33,
      rebounds: 3,
      assists: 2,
      steals: 1,
      blocks: 1,
      slam_dunks: 0
      },
      {player_name: "Kemba Walker",
      number: 33,
      shoe: 15,
      points: 6,
      rebounds: 12,
      assists: 12,
      steals: 7,
      blocks: 5,
      slam_dunks: 12
      }
    ]
  }
}
end

def num_points_scored(player_name)

  game_hash.each do |home_or_away, everything_else|
    everything_else[:players].each do |index|
      index.each do
        if index[:player_name] == player_name
          return index[:points]
        end
      end
    end
  end
end

def shoe_size(player_name) 
  
  game_hash.each do |home_or_away, everything_else|
    everything_else[:players].each do |index|
      index.each do
        if index[:player_name] == player_name
          return index[:shoe]
        end
      end
    end
  end
end

def team_colors(team_name) 
  
  game_hash.each do |home_or_away, everything_else|
    if everything_else[:team_name] == team_name
      return everything_else[:colors]
    end
  end
end

def team_names() 
  team_names_array = []
  game_hash.each do |home_or_away, everything_else|
    team_names_array << everything_else[:team_name]
  end
  team_names_array
end

def player_numbers(team_name) 
  jersey_numbers = []
  game_hash.each do |home_or_away, everything_else|
    if everything_else[:team_name] == team_name
      everything_else[:players].each do |index|
        jersey_numbers << index[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name) 
  
  stats = {}
  
  game_hash.map do |home_or_away, everything_else|
    index = 0
    while index < everything_else[:players].length
      if everything_else[:players][index][:player_name] == player_name
        stats[:number] = everything_else[:players][index][:number]
        stats[:shoe] = everything_else[:players][index][:shoe]
        stats[:points] = everything_else[:players][index][:points]
        stats[:rebounds] = everything_else[:players][index][:rebounds]
        stats[:assists] = everything_else[:players][index][:assists]
        stats[:steals] = everything_else[:players][index][:steals]
        stats[:blocks] = everything_else[:players][index][:blocks]
        stats[:slam_dunks] = everything_else[:players][index][:slam_dunks]
        return stats
      end
      index += 1
    end
  end
end

def big_shoe_rebounds() 
  biggest_shoe = 0
  number_of_rebounds = 0
  
  game_hash.map do |home_or_away, everything_else|
    everything_else[:players].map do |index|
      index.each do 
        if index[:shoe] > biggest_shoe
          biggest_shoe = index[:shoe]
          number_of_rebounds = index[:rebounds]
        end
      end
    end
  end
  number_of_rebounds
end

def most_points_scored
  player_name = ""
  most_points = 0
  
  game_hash.map do |home_or_away, everything_else|
    everything_else[:players].map do |index|
      index.map do
        if index[:points] > most_points
          most_points = index[:points]
          player_name = index[:player_name]
        end
      end
    end
  end
  player_name
end

def winning_team
  scores = [0,0]
  game_hash.map do |home_or_away, everything_else|
    everything_else[:players].map do |index|
      index.map do
        if home_or_away == :home
        scores[0] += index[:points]
        else
        scores[1] += index[:points]
        end
      end
    end
  end
  if scores[0] > scores[1]
    return game_hash[:home][:team_name]
  else #scores[0] < scores[1]
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  player_name = ""
  game_hash.map do |home_or_away, everything_else|
    everything_else[:players].map do |index|
      index.map do
        if index[:player_name].length > name_length
          name_length = index[:player_name].length
          player_name = index[:player_name]
        end
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_player = ""
  game_hash.map do |home_or_away, everything_else|
    everything_else[:players].map do |index|
      index.map do
        if index[:steals] > most_steals
          most_steals = index[:steals]
          most_steals_player = index[:player_name]
        end
      end
    end
  end
  player_with_longest_name = player_with_longest_name()
  
  if most_steals_player == player_with_longest_name
    return true
  else
    return false
  end

end




