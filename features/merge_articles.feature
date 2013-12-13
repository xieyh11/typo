Feature: Merge articles
  As a blog admin
  In order to combine articels with simular content
  I want to be able to merge articles

  Background:
    Given the blog is set up 
    Given the following contents exist:
    | title | author | body | published | id |
    | first | xie | the first blog | t | 2 |

 Scenario: A non-admin cannot merge articles.
    Given the user exists
    Given I am logged into the user panel 
    And I follow "All Articles"
    Then I should see "Manage articles"
    And I follow "first"
    And I should not see "Merge Articles"
    And I follow "Log out"

 Scenario: An admin can merge articles
    Given I am logged into the admin panel
    And I am on the admin content page
    Given I follow "first"
    Then I should see "Merge Articles"
    And I follow "Log out"

 Scenario: When articles are merged, the merged article should contain the text of both previous articles.
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "first"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    When I follow "first"
    Then I should see "the first blogWelcome to Typo. This is your first article. Edit or delete it, then start blogging!"


 Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article).
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "first"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should see "xie"

 Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "first"
    And I fill in "merge_with" with "1"
    And I press "Merge"


 Scenario: The title of the new article should be the title from either one of the merged articles.
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "first"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "first"
    And I should not see "Hello World!"
