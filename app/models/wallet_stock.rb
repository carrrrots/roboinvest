class WalletStock < ApplicationRecord
  belongs_to :wallet
  belongs_to :stock
end
