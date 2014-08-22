class Add < ActiveRecord::Migration
  def change
    add_column :searches, :taxonomy, :string
  end
end
