# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    cleared "MyString"
    indication_of_collateralization "MyString"
    indication_of_end_user_exception "MyString"
    execution_venue "MyString"
    effective_date 1
    end_date 1
    settlement_currency "MyString"
    notional_currency_1 "MyString"
    notional_currency_2 "MyString"
    rounded_notional_amount_1 1
    rounded_notional_amount_2 1
    option_strike_price 1
    option_type "MyString"
    option_premium "MyString"
    option_expiration_date 1
    floating_leg_reset "MyString"
    user nil
  end
end
