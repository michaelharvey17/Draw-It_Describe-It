require 'rails_helper'

RSpec.describe "descriptions/show", type: :view do
  before(:each) do
    @description = assign(:description, Description.create!(
      :user_id => 1,
      :draw_id => 2,
      :counter => 3,
      :parent => false,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
