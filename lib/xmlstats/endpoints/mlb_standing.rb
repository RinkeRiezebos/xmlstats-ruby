class Xmlstats::Endpoints::MlbStanding

  include Xmlstats::Endpoint

  def self.fetch(date = Date.today)
    date_str = date.strftime("%Y%m%d") unless date.kind_of? String
    response = fetch_json("mlb/standings/#{date_str}")
    standing = response["standing"]

    standing.map do |team|
      new team.merge("date" => date)
    end
  end

end