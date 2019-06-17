# Bookmark Manager

A bookmark manager is a website to maintain a collection of bookmarks (URLs). You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse bookmarks other users have added. You can comment on the bookmarks.

## User stories

```
As a user
So I can stay organized 
I want to see a list of bookmarks

```
* Domain Model 

Client --> get request --> Controller(app.rb)
Controller --> Bookmark.all --> Model
Model --> [bookmarks] ---> Controller
Controller --> [bookmarks] --> View(.erb)
View --> html --> Controller
Controller --> response --> Client 

