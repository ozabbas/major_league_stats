class BettingOdd < ApplicationRecord
  def self.fetch_data
    betting_url = "https://api.the-odds-api.com/v4/sports/baseball_mlb/odds/?apiKey=7549875322df73fac8520596e0fab9bc&regions=us"
    betting_data = JSON.parse(HTTP.get(betting_url).to_s)
    betting_data.each do |game|
      home_team = game["home_team"]
      away_team = game["away_team"]
      outcomes = game["bookmakers"][0]["markets"][0]["outcomes"]
      away_team_price = outcomes[0]['price']
      home_team_price = outcomes[1]['price']
      Betting.create(home_team: home_team, away_team: away_team)

    end
  end
end