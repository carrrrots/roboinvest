namespace :stock do
  desc "Scrape Data from Google"
  task get_data_from_google: :environment do
    unless %w[Sunday Saturday].include?(DateTime.now.strftime("%A"))
      stocks = Stock.all
      stocks.each(&:save)
    end
  end
  task get_previous_close_to_array: :environment do
    unless %w[Sunday Saturday].include?(DateTime.now.strftime("%A"))
      if DateTime.now.new_offset("-03:00").hour == 11
        stocks = Stock.all
        stocks.each(&:save)
      end
    end
  end
end
