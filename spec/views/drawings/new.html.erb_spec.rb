require 'rails_helper'

RSpec.describe "drawings/new", type: :view do
  before(:each) do
    assign(:drawing, Drawing.new(
      :user_id => 1,
      :des_id => 1,
      :counter => 1,
      :parent => false,
      :active => false
    ))
  end

  it "renders new drawing form" do
    render

    assert_select "form[action=?][method=?]", drawings_path, "post" do

      assert_select "input#drawing_user_id[name=?]", "drawing[user_id]"

      assert_select "input#drawing_des_id[name=?]", "drawing[des_id]"

      assert_select "input#drawing_counter[name=?]", "drawing[counter]"

      assert_select "input#drawing_parent[name=?]", "drawing[parent]"

      assert_select "input#drawing_active[name=?]", "drawing[active]"
    end
  end
end
