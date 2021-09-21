require "application_system_test_case"

class LoansTest < ApplicationSystemTestCase
  setup do
    @loan = loans(:one)
  end

  test "visiting the index" do
    visit loans_url
    assert_selector "h1", text: "Loans"
  end

  test "creating a Loan" do
    visit loans_url
    click_on "New Loan"

    fill_in "Borrowed at", with: @loan.borrowed_at
    fill_in "Borrower notes", with: @loan.borrower_notes
    fill_in "Due at", with: @loan.due_at
    fill_in "Good", with: @loan.good_id
    fill_in "Owner notes", with: @loan.owner_notes
    fill_in "User", with: @loan.user_id
    click_on "Create Loan"

    assert_text "Loan was successfully created"
    click_on "Back"
  end

  test "updating a Loan" do
    visit loans_url
    click_on "Edit", match: :first

    fill_in "Borrowed at", with: @loan.borrowed_at
    fill_in "Borrower notes", with: @loan.borrower_notes
    fill_in "Due at", with: @loan.due_at
    fill_in "Good", with: @loan.good_id
    fill_in "Owner notes", with: @loan.owner_notes
    fill_in "User", with: @loan.user_id
    click_on "Update Loan"

    assert_text "Loan was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan" do
    visit loans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan was successfully destroyed"
  end
end
