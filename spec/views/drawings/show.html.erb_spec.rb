require 'rails_helper'

RSpec.describe "drawings/show", type: :view do
  before(:each) do
    @drawing = assign(:drawing, Drawing.create!(
      :user_id => 1,
      :des_id => 2,
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
