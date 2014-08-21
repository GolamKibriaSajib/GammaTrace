require 'rails_helper'

RSpec.describe "searches/new", :type => :view do
  before(:each) do
    assign(:search, Search.new(
      :cleared => "MyString",
      :indication_of_collateralization => "MyString",
      :indication_of_end_user_exception => "MyString",
      :execution_venue => "MyString",
      :effective_date => 1,
      :end_date => 1,
      :settlement_currency => "MyString",
      :notional_currency_1 => "MyString",
      :notional_currency_2 => "MyString",
      :rounded_notional_amount_1 => 1,
      :rounded_notional_amount_2 => 1,
      :option_strike_price => 1,
      :option_type => "MyString",
      :option_premium => "MyString",
      :option_expiration_date => 1,
      :floating_leg_reset => "MyString",
      :user => nil
    ))
  end

  it "renders new search form" do
    render

    assert_select "form[action=?][method=?]", searches_path, "post" do

      assert_select "input#search_cleared[name=?]", "search[cleared]"

      assert_select "input#search_indication_of_collateralization[name=?]", "search[indication_of_collateralization]"

      assert_select "input#search_indication_of_end_user_exception[name=?]", "search[indication_of_end_user_exception]"

      assert_select "input#search_execution_venue[name=?]", "search[execution_venue]"

      assert_select "input#search_effective_date[name=?]", "search[effective_date]"

      assert_select "input#search_end_date[name=?]", "search[end_date]"

      assert_select "input#search_settlement_currency[name=?]", "search[settlement_currency]"

      assert_select "input#search_notional_currency_1[name=?]", "search[notional_currency_1]"

      assert_select "input#search_notional_currency_2[name=?]", "search[notional_currency_2]"

      assert_select "input#search_rounded_notional_amount_1[name=?]", "search[rounded_notional_amount_1]"

      assert_select "input#search_rounded_notional_amount_2[name=?]", "search[rounded_notional_amount_2]"

      assert_select "input#search_option_strike_price[name=?]", "search[option_strike_price]"

      assert_select "input#search_option_type[name=?]", "search[option_type]"

      assert_select "input#search_option_premium[name=?]", "search[option_premium]"

      assert_select "input#search_option_expiration_date[name=?]", "search[option_expiration_date]"

      assert_select "input#search_floating_leg_reset[name=?]", "search[floating_leg_reset]"

      assert_select "input#search_user_id[name=?]", "search[user_id]"
    end
  end
end
