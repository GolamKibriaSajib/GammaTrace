require 'rails_helper'

RSpec.describe "searches/show", :type => :view do
  before(:each) do
    @search = assign(:search, Search.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cleared/)
    expect(rendered).to match(/Indication Of Collateralization/)
    expect(rendered).to match(/Indication Of End User Exception/)
    expect(rendered).to match(/Execution Venue/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Settlement Currency/)
    expect(rendered).to match(/Notional Currency 1/)
    expect(rendered).to match(/Notional Currency 2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Option Type/)
    expect(rendered).to match(/Option Premium/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/Floating Leg Reset/)
    expect(rendered).to match(//)
  end
end
