# SB-Social-Network
A half-day attempt at a Social Network, in Ruby. To demonstrate the application I decided to experiment and build a command line interface (CLI) tutorial.

This social network focuses on the ability to:
1) Create profiles.
2) Add friends (who also have created a profiles).
3) Send messages between one another.

### To Run
* Fork and clone this repo. Once in the SB-Social-Network folder...
* Run ```$ bundle``` from the terminal to install gems.
* Use the command ```$ ruby social_network.rb``` to boot up the tutorial.
* Use the CLI to input user's names and to receive feedback from the application.

### Focus
* I wanted to focus on best practices of object-orientated design.
* There are three classes with distinct responsibilities:
1) SocialNetwork
2) UserProfile
3) Messages
