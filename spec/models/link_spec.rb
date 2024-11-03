require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to validate_uniqueness_of(:url) }
  it { is_expected.to validate_numericality_of(:count).is_greater_than_or_equal_to(1) }
end
