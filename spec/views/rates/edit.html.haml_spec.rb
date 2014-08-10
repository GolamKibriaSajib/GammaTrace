require 'rails_helper'

RSpec.describe "rates/edit", :type => :view do
  before(:each) do
    @rate = assign(:rate, Rate.create!(
      :price_notation => 1
    ))
  end

  it "renders the edit rate form" do
    render

    assert_select "form[action=?][method=?]", rate_path(@rate), "post" do

      assert_select "input#rate_price_notation[name=?]", "rate[price_notation]"
    end
  end
end
