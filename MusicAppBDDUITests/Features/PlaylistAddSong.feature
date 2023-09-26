Feature: Add songs to a playlist

Scenario: As a user, I want to add songs to my playlist so I can keep track of my favourite songs

Given I launch the application and the playlist is empty
When I click on the menu icon on a song titled "The Best Jazz Club In New Orleans" list item and I click on the "add to playlist" button
Then I should see one song added to the playlist
