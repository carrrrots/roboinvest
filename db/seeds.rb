  require "open-uri"

  Wallet.destroy_all
  User.destroy_all
  Stock.destroy_all

  user1 = User.create!(email: "ninjamaster@hotmail.com", password: "123456")
  user2 = User.create!(email: "drunkengenious@hotmail.com", password: "123456")
  user3 = User.create!(email: "starlordmaster@hotmail.com", password: "123456")
  user4 = User.create!(email: "carrots@hotmail.com", password: "123456")

  # VAI APARECER NO WALLETS INDEX
  Wallet.create!(user: user1, money: 100000.00, invested_money: 90000.00, profit: 20000.00, name: "National Wallet")
  Wallet.create!(user: user2, money: 500000.00, invested_money: 150000.00, profit: 80000.00, name: "Investments")
  Wallet.create!(user: user3, money: 70000.00, invested_money: 40000.00, profit: 11000.00, name: "Getting Rich Project")
  Wallet.create!(user: user4, money: 5000.00, invested_money: 4000.00, profit: 900.00, name: "My first wallet")

  Stock.new(symbol: 'IBM').save
  Stock.new(symbol: 'AAPL').save
  Stock.new(symbol: 'MSFT').save
  Stock.new(symbol: 'GOOG').save
  Stock.new(symbol: 'AMZN').save
  # puts "Waiting for timeout"
  # sleep(60)
  Stock.new(symbol: 'TSLA').save
  Stock.new(symbol: 'FB').save
  Stock.new(symbol: 'NVDA').save
  Stock.new(symbol: 'TSM').save
  Stock.new(symbol: 'JPM').save
  Stock.new(symbol: 'UNH').save
  Stock.new(symbol: 'HD').save
  Stock.new(symbol: 'JNJ').save
  Stock.new(symbol: 'V').save
  Stock.new(symbol: 'ADI').save
  Stock.new(symbol: 'BAC').save
  Stock.new(symbol: 'WMT').save
  Stock.new(symbol: 'PG').save
  Stock.new(symbol: 'ASML').save
  Stock.new(symbol: 'BABA').save
  Stock.new(symbol: 'ADBE').save
  Stock.new(symbol: 'PFE').save
  Stock.new(symbol: 'MA').save
  Stock.new(symbol: 'NFLX').save
  Stock.new(symbol: 'NKE').save
  Stock.new(symbol: 'DIS').save
  Stock.new(symbol: 'ORCL').save
  Stock.new(symbol: 'PEP').save
  Stock.new(symbol: 'QCOM').save
  Stock.new(symbol: 'PYPL').save
  Stock.new(symbol: 'VZ').save
