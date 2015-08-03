require 'rails_helper'

RSpec.describe "descriptions/new", type: :view do
  before(:each) do
    assign(:description, Description.new(
      :user_id => 1,
      :draw_id => 1,
      :counter => 1,
      :parent => false,
      :active => false
    ))
  end

  it "renders new description form" do
    render

    assert_select "form[action=?][method=?]", descriptions_path, "post" do

      assert_select "input#description_user_id[name=?]", "description[user_id]"

      assert_select "input#description_draw_id[name=?]", "description[draw_id]"

      assert_select "input#description_counter[name=?]", "description[counter]"

      assert_select "input#description_parent[name=?]", "description[parent]"

      assert_select "input#description_active[name=?]", "description[active]"
    end
  end
end
