# Write your code here!

def game_hash

b_nets = [
    "Alan Anderson",
    "Reggie Evans",
    "Brook Lopez",
    "Mason Plumlee",
    "Jason Terry"]
  b_numbers = [0,30,11,1,31]
  b_shoes = [16,14,17,19,15]
  b_points = [22,12,17,26,19]
  b_rebounds = [12,12,19,11,2]
  b_assists = [12,12,10,6,2]
  b_steals = [3,12,3,3,4]
  b_blocks = [1,12,1,8,11]
  b_slams = [1,7,15,5,1]
  b_keys = {player_name: "",number: 0,shoe: 0,points: 0,rebounds: 0, assists: 0, steals: 0, blocks: 0, slam_dunks: 0}
  
  k = 0
  b_hash_sub = {}
  b_array = []

  while k<5
     b_hash_sub = {}
     one = b_keys.keys[0]
     two = b_keys.keys[1]
     three = b_keys.keys[2]
     four = b_keys.keys[3]
     five = b_keys.keys[4]
     six = b_keys.keys[5]
     seven = b_keys.keys[6]
     eight = b_keys.keys[7]
     nine = b_keys.keys[8]
     
     b_hash_sub[one] = b_nets[k]
     b_hash_sub[two] = b_numbers[k]
     b_hash_sub[three] = b_shoes[k]
     b_hash_sub[four] = b_points[k]
     b_hash_sub[five] = b_rebounds[k]
     b_hash_sub[six] = b_assists[k]
     b_hash_sub[seven] = b_steals[k]
     b_hash_sub[eight] = b_blocks[k]
     b_hash_sub[nine] = b_slams[k]
     k += 1
     b_array = b_array.push(b_hash_sub)
  end
  

  c_hornets = [
    "Jeff Adrien",
    "Bismack Biyombo",
    "DeSagna Diop",
    "Ben Gordon",
    "Kemba Walker"
    ]
  c_numbers = [4,0,2,8,33]
  c_shoes = [18,16,14,15,15]
  c_points = [10,12,24,33,6]
  c_rebounds = [1,4,12,3,12]
  c_assists = [1,7,12,2,12]
  c_steals = [2,22,4,1,7]
  c_blocks = [7,15,5,1,5]
  c_slams = [2,10,5,0,12]
  c_keys = {player_name: "",number: 0,shoe: 0,points: 0,rebounds: 0, assists: 0, steals: 0, blocks: 0, slam_dunks: 0}
  
  i = 0
  c_hash_sub = {}
  c_array = []

  while i<5
     c_hash_sub = {}
     one = c_keys.keys[0]
     two = c_keys.keys[1]
     three = c_keys.keys[2]
     four = c_keys.keys[3]
     five = c_keys.keys[4]
     six = c_keys.keys[5]
     seven = c_keys.keys[6]
     eight = c_keys.keys[7]
     nine = c_keys.keys[8]
     
     c_hash_sub[one] = c_hornets[i]
     c_hash_sub[two] = c_numbers[i]
     c_hash_sub[three] = c_shoes[i]
     c_hash_sub[four] = c_points[i]
     c_hash_sub[five] = c_rebounds[i]
     c_hash_sub[six] = c_assists[i]
     c_hash_sub[seven] = c_steals[i]
     c_hash_sub[eight] = c_blocks[i]
     c_hash_sub[nine] = c_slams[i]
     i += 1
     c_array = c_array.push(c_hash_sub)
  end
  
  game_hash = {home:{team_name: "Brooklyn Nets",colors: ["Black", "White"],players:b_array},away:{team_name: "Charlotte Hornets",colors:["Turquoise", "Purple"],players:c_array}}

return game_hash
end

def num_points_scored(name)
 game_hash
 
 k = 0
 while k < 5
   if name == game_hash[:away][:players][k][:player_name]
     return game_hash[:away][:players][k][:points]
    end
   k += 1 
 end
 
 h = 0
 while h < 5
   if name == game_hash[:home][:players][h][:player_name]
     return game_hash[:home][:players][h][:points]
    end
   h += 1
  end
  
end

def shoe_size(name)
   game_hash
 
 k = 0
 while k < 5
   if name == game_hash[:away][:players][k][:player_name]
     return game_hash[:away][:players][k][:shoe]
    end
   k += 1 
 end
 
 h = 0
 while h < 5
   if name == game_hash[:home][:players][h][:player_name]
     return game_hash[:home][:players][h][:shoe]
    end
   h += 1
  end
  
end

def team_colors(team)
  game_hash
  if team == game_hash[:home][:team_name]
    return game_hash[:home][:colors]
  end
  if team == game_hash[:away][:team_name]
    return game_hash[:away][:colors]
  end
end

def team_names
game_hash
  team_n = []
  team_n.push(game_hash[:home][:team_name])
  team_n = team_n.push(game_hash[:away][:team_name])
  return team_n
end

def player_numbers(jersey_team)
  game_hash
  array = []
  jersey = 0
  k = 0
  if jersey_team == game_hash[:home][:team_name]
    while k < 5
      jersey = game_hash[:home][:players][k][:number]
      array.push(jersey)
      k +=1
    end
  else
    while k < 5
      jersey = game_hash[:away][:players][k][:number]
      array.push(jersey)
      k += 1
    end
  end
  return array
end

def player_stats(name)
  game_hash
  k = 0
  line = {}
  while k < 5
   if name == game_hash[:away][:players][k][:player_name]
     line = game_hash[:away][:players][k]
    end
   k += 1 
  end
 
  h = 0
  while h < 5
   if name == game_hash[:home][:players][h][:player_name]
     line = game_hash[:home][:players][h]
    end
   h += 1
  end
  line.delete(:player_name)
  return line
end

def big_shoe_rebounds
  game_hash
  b_biggest = 0
  c_biggest = 0
  b_location = 0
  c_location = 0
  
  i = 0
  while i < 5
    if b_biggest < game_hash[:home][:players][i][:shoe]
      b_biggest = game_hash[:home][:players][i][:shoe]
      b_location = i
    end
    i +=1
  end
  k = 0
  while k < 5
    if c_biggest < game_hash[:away][:players][k][:shoe]
      curr_biggest = game_hash[:away][:players][k][:shoe]
      c_location = k
    end
    k +=1
  end
  if b_biggest > c_biggest
    return game_hash[:home][:players][b_location][:rebounds]
  else
    return game_hash[:away][:players][c_location][:rebounds]
  end
end

def most_points_scored
game_hash
  b_high_pt = 0
  b_index = 0
  c_high_pt = 0
  c_index = 0
  
  i = 0
  while i < 5
    if b_high_pt < game_hash[:home][:players][i][:points]
      b_high_pt = game_hash[:home][:players][i][:points]
      b_index = i
    end
    i +=1
  end
  k = 0
  while k < 5
    if c_high_pt < game_hash[:away][:players][k][:points]
      c_high_pt = game_hash[:away][:players][k][:points]
      c_index = k
    end
    k +=1
  end
  if b_high_pt > c_high_pt
    return game_hash[:home][:players][b_index][:player_name]
  else
    return game_hash[:away][:players][c_index][:player_name]
  end  

end

def winning_team
game_hash
  b_score = 0
  c_score = 0
  
  i = 0
  while i < 5
    b_score = b_score + game_hash[:home][:players][i][:points]
    i +=1
  end
  k = 0
  while k < 5
    c_score = c_score + game_hash[:away][:players][k][:points]
    k +=1
  end
  if b_score > c_score
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end  

end

def player_with_longest_name
  game_hash
  long_name = ""
  float = ""
  
  i = 0
  while i < 5
    float = game_hash[:home][:players][i][:player_name]
    if long_name.length < float.length
      long_name = game_hash[:home][:players][i][:player_name]
    end
    i +=1
  end
  k = 0
  while k < 5
    float = game_hash[:away][:players][k][:player_name]
    if long_name.length < float.length
      long_name = game_hash[:away][:players][k][:player_name]
    end
    k +=1
  end
return long_name
end

def long_name_steals_a_ton?
  game_hash
  b_high_st = 0
  b_index = 0
  c_high_st = 0
  c_index = 0
  thief = ""
  
  i = 0
  while i < 5
    if b_high_st < game_hash[:home][:players][i][:steals]
      b_high_st = game_hash[:home][:players][i][:steals]
      b_index = i
    end
    i +=1
  end
  
  k = 0
  while k < 5
    if c_high_st < game_hash[:away][:players][k][:steals]
      c_high_st = game_hash[:away][:players][k][:steals]
      c_index = k
    end
    k +=1
  end
  
  if b_high_st > c_high_st
    thief = game_hash[:home][:players][b_index][:player_name]
  else
    thief = game_hash[:away][:players][c_index][:player_name]
   end

  long_name = ""
  float = ""
  
  i = 0
  while i < 5
    float = game_hash[:home][:players][i][:player_name]
    if long_name.length < float.length
      long_name = game_hash[:home][:players][i][:player_name]
    end
    i +=1
  end
  
  k = 0
  while k < 5
    float = game_hash[:away][:players][k][:player_name]
    if long_name.length < float.length
      long_name = game_hash[:away][:players][k][:player_name]
    end
    k +=1
  end

  if thief = long_name
    return true
  else
    return false
  end

end  