# SniffSpot-API
## Project Overview

This project is a web application for managing and booking unique spots for travellers. The application allows users to:

- Add a new spot with a title, description, list of images, and price

-   Edit an existing spot's title, description, list of images, and price

-   View a list of all spots
    
-   Add reviews to a specific spot
    
-   Edit existing reviews for a specific spot
    
-   Sort spots by price

Users can browse through different spots, view images, and read reviews from other travellers. They can also leave their own reviews and list a spot directly from the website. The application provides an easy and efficient way for travellers to discover spots for their next trip.

## Versions Required
- ### Ruby 3.1.0
- ### Rails 7.0.4.2
- ### Postgres 14.6
# Schema Design

The application consists of three main models: Spot, Review, and Image.

### Spot

A Spot has the following attributes:

    Title (string)
    Description (text)
    Price (decimal)
    

A Spot **has_many** Images and Reviews.

  

### Review

A Review has the following attributes:

    Content (text)
    Rating (Decimal).
    Spot (reference to a Spot)
    

A Review **belongs_to** only one Spot.

 
### Image

An Image has the following attributes:

     Url (string)
     Spot (reference to a Spot)
    

An Image **belongs_to** only one Spot

All your files and folders are presented as a tree in the file explorer. You can switch from one to another by clicking a file in the tree.

## Setting up the project

 

 - Clone the repository
	  `$ git clone https://github.com/Awais914/sniffspot_api.git`

    

- Change into the project directory
		 `$ cd sniffspot_api`
		
- Install dependencies
	`$ bundle install`

## Host Link
	https://sniffspot-seatle.herokuapp.com/



