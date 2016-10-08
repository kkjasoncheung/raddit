#Raddit

To run the app:
1. Clone the files onto your machine.
2. Change directories to the project (cd to project)
3. Run 'bundle install'
4. Run 'rake db:migrate'
5. Run 'rails s' or 'rails server'
6. Open your internet browser and go to localhost:3000


Raddit is a simple blogging app built using the framework Ruby on Rails. 

This app allows users to view posts (via the front page or by subcategory) as well as register an account to create, share and edit their own posts. Users will be able to give their posts a title, content, upload an image, and categorize their post within a subcategory. Users with a registered account can also upvote and downvote on posts.


Some app features include:
  
  CRUD actions for users and posts 
  
  encryption of passwords for users using blowfish and the bcrypt-gem
  
  upload of images with the paperclip-gem
  
  utlization of the Bootstrap framework
  
  usage of mySQL database to store and manipulate records for users, posts and categories (subraddits).
