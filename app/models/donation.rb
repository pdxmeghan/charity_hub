class Donation < ActiveRecord::Base
  validates :user_id, presence: true
  validates :charity_id, presence: true
  validates :amount, presence: true

end
