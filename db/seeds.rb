  require "open-uri"

  WalletStock.destroy_all
  Wallet.destroy_all
  User.destroy_all
  Stock.destroy_all

  user1 = User.create!(email: "ninjamaster@hotmail.com", password: "123456", nickname: "NinjaMaster")
  user2 = User.create!(email: "drunkengenious@hotmail.com", password: "123456", nickname: "DrunkenGenious")
  user3 = User.create!(email: "starlordmaster@hotmail.com", password: "123456", nickname: "StarLord")
  user4 = User.create!(email: "carrots@hotmail.com", password: "123456", nickname: "Carrots")


  stock_symbols = %w[
    ALPA4 ABEV3 AZUL4 B3SA3 BIDI4 BIDI11 BPAN4 BBSE3
    BRML3 BBDC3 BBDC4 BRAP4 BBAS3 BRKM5 BRFS3 BPAC11 CRFB3 CCRO3
    CMIG4 CIEL3 COGN3 CPLE6 CSAN3 CPFE3 CVCB3 CYRE3 DXCO3 ECOR3
    ELET3 ELET6 EMBR3 ENBR3 ENGI11 ENEV3 EGIE3 EQTL3 EZTC3 FLRY3 GGBR4
    GOAU4 GETT11 GOLL4 NTCO3 SOMA3 HAPV3 HYPE3 IGTI11 GNDI3 IRBR3
    ITSA4 ITUB4 JBSS3 JHSF3 KLBN11 RENT3 LCAM3 LWSA3 LAME4 LREN3 MGLU3
    MRFG3 CASH3 BEEF3 MRVE3 MULT3 PCAR3 PETR3 PETR4 PRIO3 PETZ3 QUAL3
    RADL3 RDOR3 RAIL3 SBSP3 SANB11 CSNA3 SULA11 SUZB3 TAEE11 VIVT3 TIMS3
    TOTS3 UGPA3 USIM5 VALE3 VIIA3 WEGE3 YDUQ3
  ]
  stock_symbols.each do |symbol|
    puts symbol
    sleep(3)
    Stock.new(symbol: symbol).save
  end
  # puts "Waiting for timeout"
  # sleep(60)
  #VAI APARECER NO WALLETS INDEX
  Wallet.create!(user: user1, name: "National Wallet", img_url: "https://media.istockphoto.com/photos/silhouette-form-of-bull-on-technical-financial-graph-picture-id1304628896?b=1&k=20&m=1304628896&s=170667a&w=0&h=qdsckusmdk97Ba0BnOb9tFm_5QUvZSrDXjcYlFvofXI=")
  Wallet.create!(user: user1, name: "Investments", img_url: "https://media.istockphoto.com/photos/emoji-with-smiley-face-picture-id1207566766?b=1&k=20&m=1207566766&s=170667a&w=0&h=-is9Ff-mg-_S8-cUOpbaBcqr9rsEvAO_gqKT6HcM2h0=")
  Wallet.create!(user: user1, name: "Getting Rich Project", img_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfLXQiO-UGOrlps0m0ArM0BH0Zg9FFIxR-Hg&usqp=CAU")
  Wallet.create!(user: user1, name: "My first wallet", img_url: "https://media.moneytimes.com.br/uploads/2021/05/bitcoin-21.jpg")
  Wallet.create!(user: user1, name: "Wallet 1", img_url: "https://www.suno.com.br/wp-content/uploads/2021/02/principais-bolsas-de-valores-do-mundo-1024x660.jpg")
  Wallet.create!(user: user1, name: "Wallet 2", img_url: "https://media.moneytimes.com.br/uploads/2021/07/eua.jpg")
  Wallet.create!(user: user1, name: "Wallet 3", img_url: "https://media.seudinheiro.com/uploads/2021/04/brasil-economia-a%C3%A7%C3%B5es-mercados-covid-altos-baixos-628x353.png")
  Wallet.create!(user: user1, name: "Wallet 4", img_url: "https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2021/09/pexels-monstera-5849577.jpg?w=876&h=484&crop=1")
