json.extract! loan, :id, :user_id, :good_id, :borrowed_at, :due_at, :owner_notes, :borrower_notes, :created_at, :updated_at, :returned_at
json.url loan_url(loan, format: :json)
