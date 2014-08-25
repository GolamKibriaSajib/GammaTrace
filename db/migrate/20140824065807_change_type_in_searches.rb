class ChangeTypeInSearches < ActiveRecord::Migration
  def change
    change_column :searches, :rounded_notional_amount_1, :string
  end
end
