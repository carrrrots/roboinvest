class WalletStock < ApplicationRecord
  belongs_to :wallet
  belongs_to :stock
  validates :investment_stock, :number_of_stock, :date,  presence: true
end
