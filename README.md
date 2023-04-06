# Epic-Yelp
#### An MVC web application for Lunch spots around Epicodus Campus.

#### By Brent Hickman, Nick Guzy, Michael Sol, Viradeth Xay-Ananh

## Technologies Used

* C#
* Dotnet 6
* Entity Framework Core
* MySQL
* Html
* Css


## Epic-Yelp is an MVC application built for Epicodus students to find and rate restaurants around campus. All users can view restaurants, their offerings and community reviews. Registered users can log in to add reviews and track which restaurants they have reviewed. Admin level users can create Restaurant entries, manage their items offered and moderate reviews.

## Setup/Installation Requirements

* Open a terminal window and clone this repository by entering into the command line:
> git clone https://github.com/xayananh4/epic-yelp.git
* In the terminal, navigate to the console application with the command:
> cd Epic-Yelp/RestaurantApp
* Once in the "RestaurantApp" directory, create a new file called appsettings.json
* Within appsettings.json, put in the following code, replacing the [YOURUSERNAME] and [YOURPASSWORD] values with your own username and password for MySQL.
>{
  "ConnectionStrings": {
      "DefaultConnection": "Server=localhost;Port=3306;database=restaurantApp01;uid=[YOURUSERNAME];pwd=[YOURPASSWORD];"
  }
}
* Next, enter the following into the command line:
> dotnet restore
* then:
> dotnet ef database update
* To launch the application in development mode, enter the following lines into the command line:
> dotnet watch run
* The application should the be available at:
> https://localhost:7101/
* Please register an account to have full access to the site features.

## Known Bugs

* Cannot access Admin level without the built in Admin account.
* Search bar is not currently functional.

## License

* [MIT](https://opensource.org/licenses/MIT)
* Brent Hickman, Nick Guzy, Michael Sol, Viradeth Xay-Ananh 4/6/23