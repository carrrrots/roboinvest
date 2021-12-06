namespace :stock do
  desc "Scrape Data from Google"
  task get_data_from_google: :environment do
    stocks = Stock.all
    stocks.each(&:save)
  end

end
