# Bike For Us

## R7. Identification of the problem to solve
In the current online bike marketplace, there are mainly high-end second hand bikes for sale such as eBay and bike speciality superstores. Because th cost of sales are barriers for ordinary second hand bikes for entry. Normally they charge $20 or more for 2 months advertisement for bike value under $500, it costs more for continus listing after the first two months or bike value over $500.

## R8. The reason for sovling the problem.
On one side people store lots of idle bikes at home which are hardly being rided and on the other side people only can buy new ordinary bikes because they can not find the second hand bikes online which they prefer for saving money and protecting environment. New bikes are using resources and wasting materails. Just like second hand cars, we also need a second and bike speciality website to promote low cost listing and quick sale which benefits both bike seller and buyer. Moreover, we save resources and promoting reusing items.

## R9. A link to your deployed app (websit)
This is a link to my deployed app : [Bike-For-Us] (https://bike-for-us.herokuapp.com/)

## R10. A link to your GitHub repository (repo)
This is a link to my source control repository : [Feng-CA/bike-for-us] (https://github.com/Feng-CA/bike-for-us)

## R11. Description of the marketplace app (website)
### Purpose
The purpose of building this two sided marketplace application is to faciliate the second hand bike market online. To provide the lower cost and convinience for sellers and buyers to achive their goals. To promote reusing items and save resources.

### Functionality/features
* All listings and details can be viewed by end user without sign into an account.
* The app requires both buyers and sellers to register accounts.
* The seller can create listing and have option to upload image to listing.
* The seller can update, delete listing if they want.
* The buyer can search all listings with keywords and sort all listings by price and title
* The buyer can message the particular seller to enquire the infomation of the bike.
* The seller can reply the buyer who make an enquiry about the listing.
* The buyer can make secure payments through the website and receive the receipt as the proof of success transaction.

### Sitemap
<img src="./docs/Sitemap/sitemap.jpg" alt="sitemap" width= "#" height="#">

### Screenshots
<img src="./docs/Screenshots/Trello_project_management.png" alt="trello board" width= "#" height="#">

### Target audience
The target audience will be the poople who want to sell their idle bikes or want to buy a second hand bike.
They both want to achive their goals through this website with lower cost for seller and lower payment for buyer as well.

### Tech stack
* Rails
* Postgresql
* bootstrap
* jquery
* popper.js
* ransack
* factory_bot_rails
* rails_admin
* devise
* aws-sdk-s3
* stripe
* heroku

# R12. User stories for the app
- As a bike seller, I want to sign up for an account using my email address so  I can list my bike to sell.
- As a bike seller, I want to be able to create a listing and upload photo of the bike so I can sell my bike online.
- As a bike seller, I want to be able to update sale content of the bike I'm selling so I can respond to buyer demand.
- As a bike seller, I want to be able to delete my listing so I can withdrawal my listing online.
- As a bike seller, I want to be able to reply message to buyer so I can provide more information about the bike I am selling.
- As a bike seller, I want to be able to take payments through this site so I can quickly sell my bike.
- As a bike buyer, I want to be able to browse through the site so I can see the price and info of all listings without having to sign-up.
- As a bike buyer, I want to search the listings with key words so I can quickly find the bike I want.
- As a bike buyer, I want to sort the listings by price or size so I can quickly find the bike I want.
- As a bike buyer, I want to sign up for an account using my email address so I can buy the bike I want.
- As a bike buyer, I want to be able to make payment  through this site so I can quickly buy my bike.
- As a bike buyer, I want to receive receipt so I can prove the order is successful.
- As a bike buyer, I want to be able to send message to seller so I can find more information about the bike I like.
- As a logged in user, I want to be able to see the buttons of edit and delete for my listings only so I am unable to edit or delete other's listings.

## R13. Wireframes for the app
<img src="./docs/wireframe/Home_page.png" alt="home page wireframes" width= "#" height="#">
<img src="./docs/wireframe/Listings_page.png" alt="listings page wireframes" width= "#" height="#">
<img src="./docs/wireframe/Listing.png" alt="kisting wireframes" width= "#" height="#">
<img src="./docs/wireframe/Create_listing_page.png" alt="create listing page wireframes" width= "#" height="#">
<img src="./docs/wireframe/My_Inbox_page.png" alt="my inbox wireframes" width= "#" height="#">
<img src="./docs/wireframe/New_Conversation_page.png" alt="new conversation wireframes" width= "#" height="#">

## R14. An ERD for the app
<img src="./docs/ERD/ERD.jpg" alt="ERD" width= "#" height="#">

## R15. Explain the different high-level components in the app
This app builds on Rails framework following MVC pattern and there are some key components below:
- Routes - It matchs an incoming HTTP verb and url request from the user and determines which perticular controller to take relevant action to handle this corresponding request. It actually links URLs to codes in the controllers and views.
- Controller - A controller is a Ruby class that receives inbound request from route, retrieve data from a model, pass the data to a relevant view which creates HTML output and then display that data with format to the user. It also can save, update and delete data to the model. 
- Model - A model is also a Ruby class and it interacts with the database of this app through Active Record. By using Object Relational Mapping framework, the properties and relationships of the objects in Active Record can be easily stored and retrieved from its database without writing any SQL statement.
- View - A view interacts with the associated Controller and arrange data from Models into a perticular layout then response to the user. It is the interface for the user to see and interact with the requested content from the app. 
- Assets  - contains all CSS code and other media like images of the application to send back to the browser of the user.	

## R16. Detail any third party services that the app will use
- This app use Stripe API to handle payment system. Once the buyer decides to buy the bike and clicks the Buy button on the perticular listing page. Then the app will send a post request to routes to instruct payments controller to take action to create a checkout session. Then the app will find the perticular listing and create a new Stripe session with the required informantion of the listing such as title, description, price, currency, quantity. Also it also send the buyer id within the Stripe session. The Stripe session forwords the buyer to third party API Stripe website. After the successful payment has been done by the buyer, Stipe will notify this app about this checkout session completed so it will send a post request to routes of this app with webhook sign secrect which only recognised by this app. The relevent route of this app will instuct the payments controll to take webhook action. This app will check the credentials of the Stripe request and web signing secret which stores in the credentials file of this app. If everything is correct, the app will send a get request to routes then proceed to payments controll and show the buyer the success view with a link to the receipt from Stripe. If the buyer cancels the payment on the Stripe session then will redirect to the home page of this app.

- This app also use AWS S3 Bucket cloud storage to allow the user of the app to upload image to the app. Firstly we configure S3 Bucket and create User on IAM on AWS. Then we store the access key and secret access key of the User to the credentials file of this app. Afterthat we install aws-sdk-s3 gem to handle AWS S3 in this app. In the Storage yml file we configure amazon in this app in consistence with AWS S3 Bucket we configured.  Lastly we configure the active storage to amazon for both development and production environment in config file. This allow only the user of this app can upload image to S3 bucket cloud storage.

## R17. Describe this projects models in terms of the relationship with each other
The relationship between User model and Conversation model is many to many.
- A user can have zero or many conversations.
- A conversation can have one or many users.
The relationship between Conversation model and Message model is one to many.
- A message belongs to one conversation.
- A conversation has one or many messages.
The relationship between User model and Message model is one to many.
- A user can have zero or many messages through conversations
- A message belongs to one user through conversations.
The relationship between User model and Order model is one to many.
- A user can have zero or many orders.
- An order belongs to one user.
The relationship between Order model and Listing model is one to one.
- A listing can have zero or one order.
- An order belongs to one listing.
The relationship between User model and Listing model is one to many.
- A user can have zero or many listings.
- A listing belongs to one user.
The relationship between Type model and Listing model is one to many.
- A listing belongs to one type.
- A type can have zero or many listings.
The relationship between Size model and Listing model is one to many.
- A listing belongs to one size.
- A size can have zero or many listings.
The relationship between Gender model and Listing model is one to many.
- A listing belongs to one gender.
- A gender can have many listings.
The relationship between State model and Listing model is one to many.
- A listing belongs to one state.
- A state can have many listings.
The relationship between Listings_feature model and Listing model is many to many.
- A listing has zero or many listing_features.
- A listing_feature belongs to one listing.
The relationship between Listings_feature model and Feature model is many to many.
- A feature can have zero or many listing_feature.
- A listing_feature belongs to one feature.
The relationship between Feature model and Listing model is many to many.
- A listing can have zero or many features through listings_features
- A feature has zero or many listings through listings_features

## R18. Discuss the database relations to be implemented in the application
The model relationships of this app express the active record associations of objects through foreign keys.
Every table migrated from its model has a id attribut which is the default primary key of the table. 
The belongs_to association is always used in the model that has the foreign key.
The has_one or has_many association is always used in the model that has the primary key. So if one model belongs to another model, its table contains the primay key of another table generated by another model as a foregin key. The id attribute of another table which is the primay key of the table.
- The listings table has foreign keys of user_id, type_id, size_id, gender_id and state_id which are the primary keys of their own tables because this app sets up the Listing model belongs to the User model, Type model, Size model, Gender model and State model.
- The listings_features join table has foreign keys of listing_id and feature_id which are the primary keys of their own tables because this app sets up the Listings_feature model belongs to Listing model and Feature model.
- The order table has foregin keys of user_id (buyer_id and seller_id) and listing_id which are the primary of their own table because this app defines the Order model belongs to the User model and Listing model.
- The messages table has a foreign key of conversation_id which is the primary key of conversations table because this app defines the Message model belongs to Conversation model.

## R19. Provide the database schema design
<img src="./docs/DB_schema/schema.jpg" alt="database schema" width= "#" height="#">

The database schema diagram adds more informaiton to the tables of ERD. Each table has an id as default primary key. Foregin keys are attributes from one table referenced in a related table. The primary key of a table can reference as a foreign key in a ralated table which represents the relationship of this related table belongs to it. Reversly the table with the primary key has one or many relationship with the related table.The relationship between two entities from ERD links the primary key in a table and foreign key in a related table on the database schema diagram. All attributes on the tables have data types and contraints.

## R20. Describe the way tasks are allocated and tracked in the project
This project has applied the Kanhan Agile project management. Firstly, we create user stories to divide the whole project into small pieces.  Then using Trello board to allocate these user stories into backlogs.