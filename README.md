# VIPERSwift
This is template source code for Swift

# Environment
Swift: 4.2
IDE: Xcode 10.1 or later.
Cocoas Pod: 1.7.5

# Design Pattern or Architechture
We use VIPER Design Pattern for this project.

V - View: Responsibility of view is to send user interactions to presenter and show whatever the presenter asks it to.
I - Interactor: It has the business logic for the app specified by a use case. 
P - Presenter: Contains the view logic for preparing content for display and for reacting to user interactions.
E - Entity: The basic model for objects used by interaction.
R - Router: Contains logic for routing of screens.

All of these components communicate with each other through protocols.

![VIPER Flow](https://screenshot.net/rqm01fv)

# Why choose VIPER?
. To make the structure more modular.
. To reduce the load and dependency on controllers.
. To build the application on the Single Responsibility Principle.
. To build the app on basis of use cases or behaviour based.
. Testability out-of-the-box
. VIPER is really good for large teams
. Codebase looks similar

# Disadvantages of VIPER
. We do have lots of code to write down.
. We have lots of files added to our project.
. Communication between different file handlers become difficult and needs to be planned before implementation.
. VIPER in small projects can be a killer, time consuming and bulgy.
