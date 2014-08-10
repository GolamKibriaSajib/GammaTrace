require 'rails_helper'

RSpec.describe "rates/show", :type => :view do
  before(:each) do
    @rate = assign(:rate, Rate.create!(
      :price_notation => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
