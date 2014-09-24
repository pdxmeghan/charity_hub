require 'rails_helper'

describe Charity do
  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}
  it {should have_many :donations}
end
