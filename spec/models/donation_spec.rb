require 'rails_helper'

describe Donation do
  it {should validate_presence_of :charity_id}
  it {should validate_presence_of :amount}
  it {should validate_presence_of :token}
end
