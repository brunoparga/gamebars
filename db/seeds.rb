unless Rails.env.production?
  puts 'Deleting existing records to have a clean database...'
  BarBoardGame.destroy_all
  BoardGame.destroy_all
  Bar.destroy_all
  User.destroy_all

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

  conexion = Bar.create!(
    name: 'Conexión Berlin',
    address: 'Ayacucho 1571, Buenos Aires',
    owner: me
  )

  ludus = Bar.create!(
    name: 'Ludus luderia',
    address: 'Rua Treze de Maio, 972 São Paulo',
    owner: lu
  )



end
