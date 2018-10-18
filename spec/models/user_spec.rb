require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:likes) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end
end
