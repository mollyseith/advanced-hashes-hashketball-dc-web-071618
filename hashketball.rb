require 'pry'
def game_hash
  game_hash = {
    :home => {
      :team_name => ["Brooklyn Nets"],
      :colors => ["Black", "White"],
      :players => [
        {"Alan Anderson" =>
          {:player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
          }
          },
          {"Reggie Evans" =>
            {
            :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }
          },
          {"Brook Lopez" =>
            {
            :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
          },
        },
        {
        "Mason Plumlee" =>
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }
        },
        {
          "Jason Terry" =>
          {
            :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
          }
        }
      ]
      },
    :away => {
      :team_name => ["Charlotte Hornets"],
      :colors => ["Turquoise", "Purple"],
      :players => [
        {"Jeff Adrien" =>
          {:player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
          }
          },
          {"Bismak Biyombo" =>
            {
            :player_name => "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        }
          },
          {"DeSagna Diop" =>
            {
            :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
          },
        },
        {"Ben Gordon" =>
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }
        },
        {"Brendan Haywood" =>
          {
            :player_name => "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
          }
        }
      ]
      }
  }
end


def num_points_scored(name)
  #Iterate over the first level of the hash (ex. :home)
  game_hash.each do |location, team_data|
    #Iterate over the second level of the hash (ex. :team name)
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            player.each do |p_name, data|
              #data.each do |k,v|
                #binding.pry
                if data[:player_name] == name
                  return data[:points]
                end
              #end
            end
          end
        end
      end
  end
end

 #Iterate over the third level (ex. Brooklyn Nets)
        # data.each do |item|
        #   #Is the value a hash?
        #     if item.class == Hash
        #     #If yes, go through the hash (ex. :shoe => 10)
        #       item.each do |k, v|
        #         if k == name
        #           v.collect do |category, val|
        #             if category == :points
        #               return v[category]
        #             end
        #             #binding.pry
        #           end
        #         end
        #       end

def shoe_size(name)
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        data.each do |item|
            if item.class == Hash
              item.each do |k, v|
                if k == name
                  return item[k][:shoe]
                end
              end
            end
        end
      end
  end
end

def team_colors(team_name)
  #empty array for later use
  colors = []
  #iterate over the top level of the hash
  game_hash.each do |location, team_data|
    #check if the team name == the argument
    if team_data[:team_name].join == team_name
      #iterate over the second level of the hash
      team_data.each do |team_deets, values|
        #find the colors pair
        if team_deets == :colors
          #add all the colors to the empty array
          colors << values
        end
      end
    end
  end
  #flatten and return the array called colors
  colors = colors.flatten
end

def team_names
  #empty array for later use
  team_names = []
  #iterate over the top level of the hash
  game_hash.each do |location, team_data|
      #iterate over the second level of the hash
      team_data.each do |team_deets, values|
        #find the team_name pair
        if team_deets == :team_name
          #add the team name to the array called team_names
          team_names << team_data[team_deets]
        end
      end
  end
  #flatten and return the array called team_names
  team_names = team_names.flatten
end

def player_numbers(team_name)
  player_nums = []
 #iterate over the top level of the hash
  game_hash.each do |location, team_data|
    #Have you found the correct team?
    if game_hash[location][:team_name].join == team_name
      #get access to all of the players
      game_hash[location][:players].each do |all_players|
        #iterater over the nested hashes that represent each player
        all_players.each do |player_name,stats|
          #check if each stat is the player's number
          stats.each do |category, val|
            if category == :number
              #shovel all the numbers into a list
              player_nums << stats[category]
            end
          end
        end
      end
    end
  end
  #return all player numbers
  player_nums
end

def player_stats(name)
  statistics = {}
 #iterate over the top level of the hash
  game_hash.each do |location, team_data|
      game_hash[location][:players].each do |all_players|
        all_players.each do |player_name,stats|
          if player_name == name
            statistics = stats.delete_if do |category, val|
              category == :player_name
            end
          end
        end
      end
  end
  statistics
end

def big_shoe_rebounds
  # Hash to store all players' shoe sizes
  player_shoe_sizes = {}
  # Variable to store name of player with largest shoe
  largest_shoe_size = " "
  # Variable to track rebounds
  rebounds = ""
  #Iterate over top level of hash
  game_hash.each do |location, team_data|
    # Access first level of all player data
      game_hash[location][:players].each do |all_players|
        # Access second level of all player data
        all_players.each do |player_name,stats|
          # Add each player name and shoe size to hash
            player_shoe_sizes[player_name]= stats[:shoe]
        end
        # Iterate over hash
        player_shoe_sizes.each do |k, v|
          # Get the name of the player with the largest shoe size
          if v == player_shoe_sizes.values.max
            largest_shoe_size = k
          end
        end
        # Get the number of rebounds associated with the player with the largest shoe size
        all_players.each do |p_name, statistics|
          if p_name == largest_shoe_size
            rebounds = statistics[:rebounds]
          end
        end
      end
  end
  # Return the number of rebounds
  rebounds
end

# BONUS
def most_points_scored
  most_points = 0
  pts = 0
  player_and_points = {}
  game_hash.each do | location, team_data |
    team_data.each do | attribute, details |
      binding.pry
      if attribute = :players
        pts = details[:points]
        if pts > most_points
          pts = most_points
          player_and_points = {}
          player_and_points[details[:points].key] = details[:points]
        end
      end
    end
  end
  most_scoring_player = player_and_points.keys

  player_and_points[0]
end 
