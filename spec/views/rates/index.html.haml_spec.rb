require 'rails_helper'

RSpec.describe "rates/index", :type => :view do
  before(:each) do
    assign(:rates, [
      Rate.create!(
        :price_notation => 1
      ),
      Rate.create!(
        :price_notation => 1
      )
    ])
  end

  it "renders a list of rates" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
