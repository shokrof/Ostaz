Feature: Users Should be able to make transactions
  As A User i should be able to move money between accounts
  Background Users in database


Scenario: Make Transactiom
Given the following users exist:
       | email   | password | role_id |
       | m@g.com | 12345678 |   1     |
And the following roles exist:
       | name  |
       | admin |
And the following account types exist:
And the following accounts exist:
And the following role_can_edit exist:


 
When I go to the homepage
And I follow "Sign In"
And I fill in "user_email" with "m@g.com"
And I fill in "user_password" with "12345678"
And I press "user_submit"
Then I should see "m@g.com"

Scenario: Sign in wrong passowrd
Given the following users exist:
       | email   | password |
       | m@g.com | 12345678 |
       | a@s.com | 12345678 |
When I go to the homepage
And I follow "Sign In"
And I fill in "user_email" with "m@g.com"
And I fill in "user_password" with "wrongpassword"
And I press "user_submit"
Then I should see "Invalid email or password."

