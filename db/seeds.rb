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
  Wallet.create!(user: user1, money: 10000.00, invested_money: 3000.00, profit: 900.00, name: "My first wallet")
  Wallet.create!(user: user1, money: 20000.00, invested_money: 14000.00, profit: 9000.00, name: "Wallet 1")
  Wallet.create!(user: user1, money: 30000.00, invested_money: 29000.00, profit: 11000.00, name: "Wallet 2")
  Wallet.create!(user: user1, money: 40000.00, invested_money: 31000.00, profit: 19000.00, name: "Wallet 3")
  Wallet.create!(user: user1, money: 50000.00, invested_money: 42000.00, profit: 15000.00, name: "Wallet 4", img_url: "https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2021/09/pexels-monstera-5849577.jpg?w=876&h=484&crop=1")
