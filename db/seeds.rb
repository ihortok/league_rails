# frozen_string_literal: true

2.times { Country.all.size < 2 ? Country.create(name: Faker::Address.country) : break }
5.times { City.all.size < 5 ? City.create(name: Faker::Address.city, country: Country.all.sample) : break }

2.times do
  break unless League.all.size < 2

  League.create(
    name: Faker::Sports::Football.competition,
    team_size: 10,
    first_team_size: 6,
    country: Country.all.sample
  )
end

League.all.each do |league|
  5.times do
    break unless league.teams.size < 5

    Team.create(
      name: Faker::Sports::Football.team,
      league: league,
      city: City.all.sample
    )
  end
end

Team.all.each do |team|
  contracts = team.contracts.active

  next if contracts.size == 11

  contracts.each { |c| c.update!(end_date: Time.current) } if contracts.any?

  team_size = team.league.team_size

  team_size.times do |i|
    participant = Participant.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      date_of_birth: Faker::Date.birthday(min_age: 17, max_age: 36),
      country: Country.all.sample
    )

    Player.create(
      talent: Faker::Number.between(from: 55, to: 95),
      position: Faker::Number.between(from: 0, to: 3),
      participant: participant
    )

    position = i < team_size - 1 ? :player : :coach

    Contract.create(
      participant: participant,
      team: team,
      position: position,
      start_date: Faker::Date.between(from: Time.current - 5.years, to: Time.current)
    )
  end
end
