unless Rails.env.production?
  puts 'Deleting existing records to have a clean database...'
  BarBoardGame.destroy_all
  BoardGame.destroy_all
  Bar.destroy_all
  User.destroy_all

  puts 'Creating users...'
  me = User.create!(
    email: 'brunoparga@gmail.com',
    password: 'senhasenha',
    first_name: 'Bruno',
    last_name: 'Parga'
  )

  lu = User.create!(
    email: 'luiza.parga@gmail.com',
    password: 'soulinda',
    first_name: 'Luiza',
    last_name: 'Brahemcha'
  )

  puts 'then create bars...'
  conexion = Bar.create!(
    name: 'Conexión Berlin',
    address: 'Ayacucho 1571',
    city: 'Buenos Aires',
    opening_hours: 'Saturdays 22h ─ 05h',
    owner: me
  )

  ludus = Bar.create!(
    name: 'Ludus luderia',
    address: 'Rua Treze de Maio, 972',
    city: 'São Paulo',
    opening_hours: 'Wed-Thu 18h ─ 00h, Fri-Sat 18h ─ 03h, Sun 16h ─ 00h. Open on holidays and the day before',
    owner: lu
  )

  puts 'next, create some games...'
  settlers_of_catan = BoardGame.create!(
    name: 'Settlers of Catan',
    min_players: 3,
    max_players: 4,
    optimal_players: 4,
    min_playing_time: 60,
    max_playing_time: 120
  )

  carcassonne = BoardGame.create!(
    name: 'Carcassonne',
    min_players: 2,
    max_players: 5,
    optimal_players: 2,
    min_playing_time: 30,
    max_playing_time: 45
  )

  love_letter = BoardGame.create!(
    name: 'Love Letter',
    min_players: 2,
    max_players: 4,
    optimal_players: 4,
    min_playing_time: 20,
    max_playing_time: 20
  )

  istanbul = BoardGame.create!(
    name: 'Istanbul',
    min_players: 2,
    max_players: 5,
    optimal_players: 4,
    min_playing_time: 40,
    max_playing_time: 60
  )

  dominion = BoardGame.create!(
    name: 'Dominion',
    min_players: 2,
    max_players: 4,
    optimal_players: 3,
    min_playing_time: 30,
    max_playing_time: 30
  )

  zendo = BoardGame.create!(
    name: 'Zendo',
    min_players: 3,
    max_players: 5,
    optimal_players: 4,
    min_playing_time: 60,
    max_playing_time: 60
  )

  puerto_rico = BoardGame.create!(
    name: 'Puerto Rico',
    min_players: 2,
    max_players: 5,
    optimal_players: 4,
    min_playing_time: 90,
    max_playing_time: 150
  )

  diplomacy = BoardGame.create!(
    name: 'Diplomacy',
    min_players: 6,
    max_players: 7,
    optimal_players: 7,
    min_playing_time: 360,
    max_playing_time: 360
  )

  king_of_tokyo = BoardGame.create!(
    name: 'King of Tokyo',
    min_players: 2,
    max_players: 6,
    optimal_players: 4,
    min_playing_time: 30,
    max_playing_time: 30
  )

  puts 'finally, create menus of games in bars'
  ludus_games =
    { ludus =>
        [settlers_of_catan,
         carcassonne,
         istanbul,
         dominion,
         puerto_rico,
         king_of_tokyo] }

  conexion_games =
    { conexion =>
        [settlers_of_catan,
         love_letter,
         zendo,
         diplomacy,
         dominion,
         king_of_tokyo] }

  [ludus_games, conexion_games].each do |game_list|
    game_list.each do |bar, games|
      games.each do |game|
        BarBoardGame.create!(bar: bar, board_game: game)
      end
    end
  end

  puts 'Done seeding!'
end
