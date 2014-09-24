Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_ACCOUNT_SID'],
  :secret_key      => ENV['STRIPE_AUTH_TOKEN']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
