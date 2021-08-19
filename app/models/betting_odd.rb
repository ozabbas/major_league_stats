class BettingOdd < ApplicationRecord
  def self.fetch_data
    betting_url = "https://api.the-odds-api.com/v4/sports/baseball_mlb/odds/?apiKey=7549875322df73fac8520596e0fab9bc&regions=us"
    betting_data = JSON.parse(HTTP.get(betting_url).to_s)
    betting_data["bookmakers"]["markets"]["outcomes"].each do |bet|
      home_team = bet["home_team"]
      away_team = bet["away_team"]
      outcomes = bet.to_i["bookmakers"]["markets"]["outcomes"]
      Betting.create(home_team: home_team, away_team: away_team)

    end
  end
end