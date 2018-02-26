require 'rails_helper'

RSpec.describe "friends/edit", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(
      :name => "MyString",
      :nickname => "MyString",
      :avatar_url => "MyString",
      :user => nil
    ))
  end

  it "renders the edit friend form" do
    render

    assert_select "form[action=?][method=?]", friend_path(@friend), "post" do

      assert_select "input[name=?]", "friend[name]"

      assert_select "input[name=?]", "friend[nickname]"

      assert_select "input[name=?]", "friend[avatar_url]"

      assert_select "input[name=?]", "friend[user_id]"
    end
  end
end
