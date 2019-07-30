# VIPERSwift
This is template source code for Swift

# Environment
Swift: 4.2<br />
IDE: Xcode 10.1 or later.<br />
Cocoas Pod: 1.7.5<br />

# Design Pattern or Architechture
We use VIPER Design Pattern for this project.

V - View: Responsibility of view is to send user interactions to presenter and show whatever the presenter asks it to.<br />
I - Interactor: It has the business logic for the app specified by a use case.<br />
P - Presenter: Contains the view logic for preparing content for display and for reacting to user interactions.<br />
E - Entity: The basic model for objects used by interaction.<br />
R - Router: Contains logic for routing of screens.<br />

Extra: Repository: Data transmission local and remote.<br />

All of these components communicate with each other through protocols.<br />

![VIPER Flow](https://i.screenshot.net/rqm01fv)

# Why choose VIPER?
. To make the structure more modular.<br />
. To reduce the load and dependency on controllers.<br />
. To build the application on the #Single Responsibility Principle#.<br />
. To build the app on basis of use cases or behaviour based.<br />
. Testability out-of-the-box.<br />
. VIPER is really good for large teams.<br />
. Codebase looks similar.<br />

# Disadvantages of VIPER
. We do have lots of code to write down.<br />
. We have lots of files added to our project.<br />
. Communication between different file handlers become difficult and needs to be planned before implementation.<br />
. VIPER in small projects can be a killer, time consuming and bulgy.<br />
