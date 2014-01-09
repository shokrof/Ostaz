Feature: Users Should be have different views


Scenario: I should see admin Role

When I go to the homepage
And I follow "Sign In"
And I fill in "user_email" with "admin@ostaz.com"
And I fill in "user_password" with "12345678"
And I press "user_submit"
And I follow "Roles"
Then I should see "admin"
And I should see "Asset"


Scenario: I should delete ability

When I go to the homepage
And I follow "Sign In"
And I fill in "user_email" with "admin@ostaz.com"
And I fill in "user_password" with "12345678"
And I press "user_submit"
And I go to the show page for "admin" role  
And I follow "delete_view_Asset"
And I go to the homepage
Then I should not see "Bank"






