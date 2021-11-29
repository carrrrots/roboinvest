  require "open-uri"

  Wallet.destroy_all
  User.destroy_all

  user1 = User.create!(email: "ninjamaster@hotmail.com", password: "123456")
  user2 = User.create!(email: "drunkengenious@hotmail.com", password: "123456")
  user3 = User.create!(email: "starlordmaster@hotmail.com", password: "123456")
  user4 = User.create!(email: "carrots@hotmail.com", password: "123456")


  Wallet.create!(user: user1, money: 100000.00, invested_money: 90000.00, profit: 20000.00, name: "National Wallet")
  Wallet.create!(user: user2, money: 500000.00, invested_money: 150000.00, profit: 80000.00, name: "Investments")
  Wallet.create!(user: user3, money: 70000.00, invested_money: 40000.00, profit: 11000.00, name: "Getting Rich Project")
  Wallet.create!(user: user4, money: 5000.00, invested_money: 4000.00, profit: 900.00, name: "My first wallet")

#   game = Game.create!(name: 'Not Alone', category: Game::GAME_CATEGORIES.sample, price: 25.00, number_of_players: '6+', description: 'semi cooperative', user: User.all.sample)
# file = URI.open("https://m.media-amazon.com/images/I/91JTKW1zmWS._AC_SY879_.jpg")
# game.photo.attach(io: file, filename: 'notalone.jpg', content_type: 'image/jpg')
