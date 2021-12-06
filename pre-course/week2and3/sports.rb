players = [
  { :name => "Sam", :sport => "tennis" },
  { :name => "Mary", :sport => "squash" },
  { :name => "Ed", :sport => "tennis" },
  { :name => "Mark", :sport => "football" }
  ]

sport_players_sorted = {}



players.each do |player|
  sport = player[:sport]

  if sport_players_sorted[sport] == nil
    sport_players_sorted[sport] = []
  end
  sport_players_sorted[sport].push(player[:name])
end

puts sport_players_sorted