Feature: Users Should be able to sign in
  As A User i should be able to sign to prvent unauthenticated access
  Background Users in database


Scenario: Sign in happy case
Given the following users exist:
       | email   | password |
       | m@g.com | 12345678 |
       | a@s.com | 12345678 |
When I go to the homepage 
And I follow "Sign In"
And I fill in "user_email" with "admin@ostaz.com"
And I fill in "user_password" with "12345678"
And I press "user_submit"
Then I should see "com"

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
