class ChangeBodyInViews < ActiveRecord::Migration
  def change
    change_column :views, :body, :json
  end
end
