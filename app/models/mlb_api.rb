class MlbApi < ApplicationRecord
  def self.fetch_data
    teams_url = "http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code=%27mlb%27&all_star_sw=%27N%27&sort_order=name_asc&season=%272021%27"
    team_data = JSON.parse(HTTP.get(teams_url).to_s)
    team_data["team_all_season"]["queryResults"]["row"].each do |team|
      team_id = team["team_id"]
      roster_url = "https://lookup-service-prod.mlb.com/json/named.roster_40.bam?team_id=%27#{team_id}%27"
      roster_data = JSON.parse(HTTP.get(roster_url).to_s)
      roster_data["roster_40"]["queryResults"]["row"].each do |player|
        player_id = player["player_id"]
        name = player["name_display_first_last"]
        career_stats_url = "http://lookup-service-prod.mlb.com/json/named.sport_career_hitting.bam?league_list_id=%27mlb%27&game_type=%27R%27&player_id=%27#{player_id}%27"
        player_data = JSON.parse(HTTP.get(career_stats_url).to_s)

        if player_data.dig("sport_career_hitting", "queryResults", "row").is_a?(Array)
          average = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("avg")
          home_run = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("hr")
          rbi = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("rbi")
        else
          average = player_data.dig("sport_career_hitting", "queryResults", "row", "avg")
          home_run = player_data.dig("sport_career_hitting", "queryResults", "row", "hr")
          rbi = player_data.dig("sport_career_hitting", "queryResults", "row", "rbi")
        end
        team_name = team["name_display_full"]
        position = player["position_txt"]
        pitching_stats_url = "https://lookup-service-prod.mlb.com/json/named.sport_pitching_tm.bam?league_list_id=%27mlb%27&game_type=%27R%27&season=%272021%27&player_id=%27#{player_id}%27"
        pitcher_data = JSON.parse(HTTP.get(pitching_stats_url).to_s)
        if pitcher_data.dig("sport_pitching_tm", "queryResults", "row").is_a?(Array)
          era = pitcher_data.dig("sport_pitching_tm", "queryResults", "row").first.dig("era")
          whip = pitcher_data.dig("sport_pitching_tm", "queryResults", "row").first.dig("whip")
        else 
          era = pitcher_data.dig("sport_pitching_tm", "queryResults", "row", "era")
          whip = pitcher_data.dig("sport_pitching_tm", "queryResults", "row", "whip")
        end
        Player.create(name: name, home_run: home_run, rbi: rbi, avg: average, team_name: team_name, position: position, era: era, whip: whip)
        
      end
    end
  end
end
# keep doing this for other stats here