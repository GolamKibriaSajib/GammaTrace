class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.string :name
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
