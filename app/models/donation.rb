class Donation < ActiveRecord::Base
  validates :charity_id, presence: true
  validates :amount, presence: true
  validates :token, presence: true
  belongs_to :charity
  before_validation :multiply_donation
  before_save :charge_card

  attr_writer :amount_in_dollars


  def charge_card

  # Set your secret key: remember to change this to your live secret key in production
# See your keys here https://dashboard.stripe.com/account
  Stripe.api_key = ENV['STRIPE_ACCOUNT_SID']
# Get the credit card details submitted by the form

# Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => amount, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
    rescue Stripe::CardError => e
      # The card has been declined
      false
    end
  end

  def multiply_donation
    number_with_precision(self.amount = (self.amount_in_dollars.to_f * 100.00), precision: 2)
  end

  def amount_in_dollars
    @amount_in_dollars || self.amount / 100.00
  end
end
