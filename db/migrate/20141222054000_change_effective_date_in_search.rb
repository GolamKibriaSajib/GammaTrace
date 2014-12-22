class ChangeEffectiveDateInSearch < ActiveRecord::Migration
  def change
    change_column :searches, :effective_date, :string
    change_column :searches, :end_date, :string
  end
end
