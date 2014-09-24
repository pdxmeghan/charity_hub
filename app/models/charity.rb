class Charity < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name
  has_many :donations

  def donation_total
    donations = Donation.where(:charity_id => self.id)
    donation_total = 0
    donations.each do |donation|
      donation_total += (donation.amount_in_dollars)
    end

      donation_total.round(2)
  end
end
