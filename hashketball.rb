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

#takes in an argument of a player's name and returns number of points scored for that player
def num_points_scored(name)
  #1st level
  game_hash.each do |location, team_data|
    #2nd level
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            player.each do |p_name, data|
              #data.each do |k,v|
                #binding.pry
                if data[:player_name] == name
                  return data[:points]
                end
            end
          end
        end
      end
  end
end

#takes in an argument of a player's name and returns the shoe size for that player
def shoe_size(name)
  #third level
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

#takes in an argument of the team name and returns an array of that teams colors
def team_colors(team_name)
  colors = []
  #top level
  game_hash.each do |location, team_data|
    #1st (team name)
    if team_data[:team_name].join == team_name
      #2nd level
      team_data.each do |team_deets, values|
        #colors pair
        if team_deets == :colors
          colors << values
        end
      end
    end
  end
  colors = colors.flatten
end

#operates on the game hash to return an array of the team names
def team_names
  team_names = []
  #top level
  game_hash.each do |location, team_data|
      #2nd level
      team_data.each do |team_deets, values|
        #find team name pair
        if team_deets == :team_name
          team_names << team_data[team_deets]
        end
      end
  end
  team_names = team_names.flatten
end

#takes in an argument of a team name and returns an array of the jersey number's for that team
def player_numbers(team_name)
  player_nums = []
 #top level
  game_hash.each do |location, team_data|
    #team?
    if game_hash[location][:team_name].join == team_name
      #all players
      game_hash[location][:players].each do |all_players|
        #iterate over players
        all_players.each do |player_name,stats|
          #check number
          stats.each do |category, val|
            if category == :number
              player_nums << stats[category]
            end
          end
        end
      end
    end
  end
  player_nums
end

#takes in an argument of a player's name and returns a hash of that player's stats
def player_stats(name)
  statistics = {}
 #top level
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

#return the number of rebounds associated with the player that has the largest shoe size
#find the player with the largest shoe size
#return that player's number of rebounds
def big_shoe_rebounds
  player_shoe_sizes = {}
  largest_shoe_size = " "
  rebounds = ""
  #top level
  game_hash.each do |location, team_data|
    #1st level
      game_hash[location][:players].each do |all_players|
        #2nd level
        all_players.each do |player_name,stats|
          #add names to shoe size
            player_shoe_sizes[player_name]= stats[:shoe]
        end
        #iterates
        player_shoe_sizes.each do |k, v|
          #name of player of largest shoe size
          if v == player_shoe_sizes.values.max
            largest_shoe_size = k
          end
        end
        #rebounds of player of largest shoe size
        all_players.each do |p_name, statistics|
          if p_name == largest_shoe_size
            rebounds = statistics[:rebounds]
          end
        end
      end
  end
  rebounds
end

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
