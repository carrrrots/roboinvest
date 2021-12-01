  require "open-uri"

  Wallet.destroy_all
  User.destroy_all

  user1 = User.create!(email: "ninjamaster@hotmail.com", password: "123456")
  user2 = User.create!(email: "drunkengenious@hotmail.com", password: "123456")
  user3 = User.create!(email: "starlordmaster@hotmail.com", password: "123456")
  user4 = User.create!(email: "carrots@hotmail.com", password: "123456")

  #VAI APARECER NO WALLETS INDEX
  Wallet.create!(user: user1, money: 100000.00, invested_money: 90000.00, profit: 20000.00, name: "National Wallet")
  Wallet.create!(user: user1, money: 500000.00, invested_money: 150000.00, profit: 80000.00, name: "Investments")
  Wallet.create!(user: user1, money: 70000.00, invested_money: 40000.00, profit: 11000.00, name: "Getting Rich Project")
  Wallet.create!(user: user1, money: 5000.00, invested_money: 4000.00, profit: 900.00, name: "My first wallet")
