require 'rails_helper'

RSpec.describe "searches/index", :type => :view do
  before(:each) do
    assign(:searches, [
      Search.create!(
        :cleared => "Cleared",
        :indication_of_collateralization => "Indication Of Collateralization",
        :indication_of_end_user_exception => "Indication Of End User Exception",
        :execution_venue => "Execution Venue",
        :effective_date => 1,
        :end_date => 2,
        :settlement_currency => "Settlement Currency",
        :notional_currency_1 => "Notional Currency 1",
        :notional_currency_2 => "Notional Currency 2",
        :rounded_notional_amount_1 => 3,
        :rounded_notional_amount_2 => 4,
        :option_strike_price => 5,
        :option_type => "Option Type",
        :option_premium => "Option Premium",
        :option_expiration_date => 6,
        :floating_leg_reset => "Floating Leg Reset",
        :user => nil
      ),
      Search.create!(
        :cleared => "Cleared",
        :indication_of_collateralization => "Indication Of Collateralization",
        :indication_of_end_user_exception => "Indication Of End User Exception",
        :execution_venue => "Execution Venue",
        :effective_date => 1,
        :end_date => 2,
        :settlement_currency => "Settlement Currency",
        :notional_currency_1 => "Notional Currency 1",
        :notional_currency_2 => "Notional Currency 2",
        :rounded_notional_amount_1 => 3,
        :rounded_notional_amount_2 => 4,
        :option_strike_price => 5,
        :option_type => "Option Type",
        :option_premium => "Option Premium",
        :option_expiration_date => 6,
        :floating_leg_reset => "Floating Leg Reset",
        :user => nil
      )
    ])
  end

  it "renders a list of searches" do
    render
    assert_select "tr>td", :text => "Cleared".to_s, :count => 2
    assert_select "tr>td", :text => "Indication Of Collateralization".to_s, :count => 2
    assert_select "tr>td", :text => "Indication Of End User Exception".to_s, :count => 2
    assert_select "tr>td", :text => "Execution Venue".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Settlement Currency".to_s, :count => 2
    assert_select "tr>td", :text => "Notional Currency 1".to_s, :count => 2
    assert_select "tr>td", :text => "Notional Currency 2".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Option Type".to_s, :count => 2
    assert_select "tr>td", :text => "Option Premium".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "Floating Leg Reset".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
