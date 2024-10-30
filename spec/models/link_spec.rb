require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to validate_uniqueness_of(:url) }
  it { is_expected.to validate_uniqueness_of(:slug) }
end
