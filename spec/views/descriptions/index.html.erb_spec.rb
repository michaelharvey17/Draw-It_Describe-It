require 'rails_helper'

RSpec.describe "descriptions/index", type: :view do
  before(:each) do
    assign(:descriptions, [
      Description.create!(
        :user_id => 1,
        :draw_id => 2,
        :counter => 3,
        :parent => false,
        :active => false
      ),
      Description.create!(
        :user_id => 1,
        :draw_id => 2,
        :counter => 3,
        :parent => false,
        :active => false
      )
    ])
  end

  it "renders a list of descriptions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
