class Wallet < ApplicationRecord

  belongs_to :user

  validates :user_id, presence: true
  validates :money, presence: true

  # def add_funds(amount)
  #   self.money += amount if amount > 0
  # end
  #
  # def remove_funds(amount)
  #   self.money -= amount if amount > 0
  # end
end



