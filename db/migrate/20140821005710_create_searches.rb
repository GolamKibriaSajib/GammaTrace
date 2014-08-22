class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :cleared
      t.string :indication_of_collateralization
      t.string :indication_of_end_user_exception
      t.string :execution_venue
      t.integer :effective_date
      t.integer :end_date
      t.string :settlement_currency
      t.string :notional_currency_1
      t.string :notional_currency_2
      t.integer :rounded_notional_amount_1
      t.integer :rounded_notional_amount_2
      t.integer :option_strike_price
      t.string :option_type
      t.string :option_premium
      t.integer :option_expiration_date
      t.string :floating_leg_reset

      t.timestamps
    end
  end
end
