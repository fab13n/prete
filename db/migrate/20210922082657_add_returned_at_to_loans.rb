class AddReturnedAtToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :returned_at, :datetime
  end
end
