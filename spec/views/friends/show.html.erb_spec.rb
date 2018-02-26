require 'rails_helper'

RSpec.describe "friends/show", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(
      :name => "Name",
      :nickname => "Nickname",
      :avatar_url => "Avatar Url",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Avatar Url/)
    expect(rendered).to match(//)
  end
end
