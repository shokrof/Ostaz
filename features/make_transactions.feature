Feature: Users Should be able to make transactions
  As A User i should be able to move money between accounts
  Background Users in database


Scenario: Make Transactiom
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
Then I should see "Cucumber test"


Scenario: Make Transaction betwwen the same accounts
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
And I select "Capital" from "transaction_debit"
And I fill in "transaction_amount" with "10"
And I fill in "transaction_note" with "Cucumber test"
And I press "make submit"
Then I should see "Cannot make transactions between the same account"


Scenario: cannot make Transactions when there is no enough money
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
And I select "Cash" from "transaction_credit"
And I select "Bank" from "transaction_debit"
And I fill in "transaction_amount" with "10000000000"
And I fill in "transaction_note" with "Cucumber test"
And I press "make submit"
Then I should see "Accounts doesnt have enough money"
