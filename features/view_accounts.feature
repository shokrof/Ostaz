Feature: Users Should be able view Accounts and it transactions
  As A User i should be able to view Accounts
  Background Users in database


Scenario: View Accounts
Given the following users exist:
       | email   | password | role_id |
       | m@g.com | 12345678 |   2     |
And the following roles exist:
       | name  |
       | assit |
And the following role_can_edit exist:
       | role_id | account_type_id |
       | 2       |  1              |
       | 2       |  2              |
       | 2       |  3              |
       | 2       |  4              |
When I go to the homepage
And I follow "Sign In"
And I fill in "user_email" with "m@g.com"
And I fill in "user_password" with "12345678"
And I press "user_submit"
And I select "Capital" from "transaction_credit"
And I select "Cash" from "transaction_debit"
And I fill in "transaction_amount" with "10"
And I fill in "transaction_note" with "Cucumber test"
And I press "make submit"
And I select "Cash" from "transaction_credit"
And I select "Bank" from "transaction_debit"
And I fill in "transaction_amount" with "5"
And I fill in "transaction_note" with "Cucumber test2"
And I press "make submit"
And I go to the show page for "Cash" account
Then I should see "Cucumber test"
And I should see "10"
And I should see "5"



