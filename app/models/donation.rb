class Donation < ActiveRecord::Base
  validates :charity_id, presence: true
  validates :amount, presence: true
  validates :token, presence: true
  before_save :charge_card

  def charge_card

  # Set your secret key: remember to change this to your live secret key in production
# See your keys here https://dashboard.stripe.com/account
  Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"
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

end
