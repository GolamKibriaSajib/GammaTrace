class AddReferencesToInterestSwaps < ActiveRecord::Migration
  def change
    add_reference :interest_swap, :user, index: true
    add_reference :searches, :user, index: true
  end
end
