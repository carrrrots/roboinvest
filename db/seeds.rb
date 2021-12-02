  require "open-uri"

  Wallet.destroy_all
  User.destroy_all

  user1 = User.create!(email: "ninjamaster@hotmail.com", password: "123456", nickname: "NinjaMaster")
  user2 = User.create!(email: "drunkengenious@hotmail.com", password: "123456", nickname: "DrunkenGenious")
  user3 = User.create!(email: "starlordmaster@hotmail.com", password: "123456", nickname: "StarLord")
  user4 = User.create!(email: "carrots@hotmail.com", password: "123456", nickname: "Carrots")

  #VAI APARECER NO WALLETS INDEX
  Wallet.create!(user: user1, money: 100000.00, invested_money: 90000.00, profit: 20000.00, name: "National Wallet", img_url: "https://media.istockphoto.com/photos/silhouette-form-of-bull-on-technical-financial-graph-picture-id1304628896?b=1&k=20&m=1304628896&s=170667a&w=0&h=qdsckusmdk97Ba0BnOb9tFm_5QUvZSrDXjcYlFvofXI=")
  Wallet.create!(user: user1, money: 500000.00, invested_money: 150000.00, profit: 80000.00, name: "Investments", img_url: "https://media.istockphoto.com/photos/emoji-with-smiley-face-picture-id1207566766?b=1&k=20&m=1207566766&s=170667a&w=0&h=-is9Ff-mg-_S8-cUOpbaBcqr9rsEvAO_gqKT6HcM2h0=")
  Wallet.create!(user: user1, money: 70000.00, invested_money: 40000.00, profit: 11000.00, name: "Getting Rich Project", img_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfLXQiO-UGOrlps0m0ArM0BH0Zg9FFIxR-Hg&usqp=CAU")
  Wallet.create!(user: user1, money: 10000.00, invested_money: 3000.00, profit: 900.00, name: "My first wallet", img_url: "https://media.moneytimes.com.br/uploads/2021/05/bitcoin-21.jpg")
  Wallet.create!(user: user1, money: 20000.00, invested_money: 14000.00, profit: 9000.00, name: "Wallet 1", img_url: "https://www.suno.com.br/wp-content/uploads/2021/02/principais-bolsas-de-valores-do-mundo-1024x660.jpg")
  Wallet.create!(user: user1, money: 30000.00, invested_money: 29000.00, profit: 11000.00, name: "Wallet 2", img_url: "https://media.moneytimes.com.br/uploads/2021/07/eua.jpg")
  Wallet.create!(user: user1, money: 40000.00, invested_money: 31000.00, profit: 19000.00, name: "Wallet 3", img_url: "https://media.seudinheiro.com/uploads/2021/04/brasil-economia-a%C3%A7%C3%B5es-mercados-covid-altos-baixos-628x353.png")
  Wallet.create!(user: user1, money: 50000.00, invested_money: 42000.00, profit: 15000.00, name: "Wallet 4", img_url: "https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2021/09/pexels-monstera-5849577.jpg?w=876&h=484&crop=1")
