# frozen_string_literal: true

if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?
  AdminUser.create!(
    email: 'admin@example.com',
    password: 'STRONG_password',
    password_confirmation: 'STRONG_password'
  )
end

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

  team_size = team.league.team_size

  next if contracts.size == team_size + 1

  contracts.each { |c| c.update!(end_date: Time.current) } if contracts.any?

  team_size = team.league.team_size

  (team_size + 1).times do |i|
    participant = Participant.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      date_of_birth: Faker::Date.birthday(min_age: 17, max_age: 36),
      country: Country.all.sample
    )

    position = i < team_size ? :player : :coach

    if position == :player
      Player.create(
        talent: Faker::Number.between(from: 55, to: 95),
        position: Faker::Number.between(from: 0, to: 3),
        participant: participant
      )
    end

    Contract.create(
      participant: participant,
      team: team,
      position: position,
      start_date: Faker::Date.between(from: Time.current - 5.years, to: Time.current)
    )
  end
end
