@hotels.map do |hotel|
  render(hotel)
end.to_json
