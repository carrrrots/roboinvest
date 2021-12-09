class Wallet < ApplicationRecord
  belongs_to :user
  has_many :wallet_stocks, dependent: :delete_all


end
