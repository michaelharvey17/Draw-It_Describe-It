require 'rails_helper'

RSpec.describe "drawings/index", type: :view do
  before(:each) do
    assign(:drawings, [
      Drawing.create!(
        :user_id => 1,
        :des_id => 2,
        :counter => 3,
        :parent => false,
        :active => false
      ),
      Drawing.create!(
        :user_id => 1,
        :des_id => 2,
        :counter => 3,
        :parent => false,
        :active => false
      )
    ])
  end

  it "renders a list of drawings" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
