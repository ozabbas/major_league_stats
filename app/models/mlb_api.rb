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
        team_name = team["name_display_full"]
        position = player["position_txt"]
        career_stats_url = "http://lookup-service-prod.mlb.com/json/named.sport_career_hitting.bam?league_list_id=%27mlb%27&game_type=%27R%27&player_id=%27#{player_id}%27"
        player_data = JSON.parse(HTTP.get(career_stats_url).to_s)

        if player_data.dig("sport_career_hitting", "queryResults", "row").is_a?(Array)
          average = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("avg")
          home_run = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("hr")
          rbi = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("rbi")
          at_bats = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("ab")
          stolen_bases = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("sb")
          hits = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("h")
          obp = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("obp")
          ops = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("ops")
          runs = player_data.dig("sport_career_hitting", "queryResults", "row").first.dig("r")

        else
          average = player_data.dig("sport_career_hitting", "queryResults", "row", "avg")
          home_run = player_data.dig("sport_career_hitting", "queryResults", "row", "hr")
          rbi = player_data.dig("sport_career_hitting", "queryResults", "row", "rbi")
          at_bats = player_data.dig("sport_career_hitting", "queryResults", "row", "ab")
          stolen_bases = player_data.dig("sport_career_hitting", "queryResults", "row", "sb")
          hits = player_data.dig("sport_career_hitting", "queryResults", "row", "h")
          obp = player_data.dig("sport_career_hitting", "queryResults", "row", "obp")
          ops = player_data.dig("sport_career_hitting", "queryResults", "row", "ops")
          runs = player_data.dig("sport_career_hitting", "queryResults", "row", "r")
        end

        pitching_stats_url = "http://lookup-service-prod.mlb.com/json/named.sport_career_pitching.bam?league_list_id='mlb'&game_type='R'&player_id='#{player_id}'"
        pitcher_data = JSON.parse(HTTP.get(pitching_stats_url).to_s)
     
        if pitcher_data.dig("sport_pitching", "queryResults", "row").is_a?(Array)
          era = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("era")
          whip = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("whip")
          wpct = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("wpct")
          gp = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("g")
          gs = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("gs")
          sv = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("sv")
          ip = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("ip")
          so = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("so")
          whip = pitcher_data.dig("sport_career_pitching", "queryResults", "row").first.dig("whip")
        else 
          era = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "era")
          whip = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "whip")
          wpct = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "wpct")
          g = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "g")
          gs = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "gs")
          sv = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "sv")
          ip = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "ip")
          so = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "so")
          whip = pitcher_data.dig("sport_career_pitching", "queryResults", "row", "whip")
        end

        Player.create(name: name, team_name: team_name, position: position, ab: at_bats, r: runs, h: hits, home_run: home_run, rbi: rbi, sb: stolen_bases, avg: average, obp: obp, ops: ops, wpct: wpct, era: era, g: g, gs: gs, sv: sv, ip: ip, so: so, whip: whip)

        
      end
    end
  end
end