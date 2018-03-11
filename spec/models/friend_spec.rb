require 'rails_helper'

RSpec.describe Friend, type: :model do
  let(:user) { User.new(email: "sue@example.com", password: "abc123") }
  subject(:friend) { Friend.new(user: user) }

  describe "validations" do
    it "allow saving" do
      expect(friend).to be_valid
    end
  end

  describe "last_catchup" do
    it "returns the most recent catchup record" do
      friend.save!

      last = friend.catchups.create!(user: friend.user, happened_at: Time.now - 100)
      expect(friend.reload.last_catchup).to eq(last)

      new_last = friend.catchups.create!(user: friend.user, happened_at: Time.now)
      expect(friend.reload.last_catchup).to eq(new_last)
    end
  end
end
