class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :good, null: false, foreign_key: true
      t.datetime :borrowed_at
      t.datetime :due_at
      t.string :owner_notes
      t.string :borrower_notes

      t.timestamps
    end
  end
end
