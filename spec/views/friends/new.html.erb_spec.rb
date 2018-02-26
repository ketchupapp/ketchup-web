require 'rails_helper'

RSpec.describe "friends/new", type: :view do
  before(:each) do
    assign(:friend, Friend.new(
      :name => "MyString",
      :nickname => "MyString",
      :avatar_url => "MyString",
      :user => nil
    ))
  end

  it "renders new friend form" do
    render

    assert_select "form[action=?][method=?]", friends_path, "post" do

      assert_select "input[name=?]", "friend[name]"

      assert_select "input[name=?]", "friend[nickname]"

      assert_select "input[name=?]", "friend[avatar_url]"

      assert_select "input[name=?]", "friend[user_id]"
    end
  end
end
