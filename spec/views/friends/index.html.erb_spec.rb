require 'rails_helper'

RSpec.describe "friends/index", type: :view do
  before(:each) do
    assign(:friends, [
      Friend.create!(
        :name => "Name",
        :nickname => "Nickname",
        :avatar_url => "Avatar Url",
        :user => nil
      ),
      Friend.create!(
        :name => "Name",
        :nickname => "Nickname",
        :avatar_url => "Avatar Url",
        :user => nil
      )
    ])
  end

  it "renders a list of friends" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar Url".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
