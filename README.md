# Bookstore project

- This is a fictional bookstore built by [Khuong Mai](mailto:khuongngoc1518@gmail.com)

## Description of the project

A client wants to build an online bookstore. The project includes two stages:

- First stage: client wants a website can show all book information like: title, author, publisher, price, publication date. Books can be categorized by genres, popular, ... and users can search to find books

- Second stage: they want the system can have features that users can search books, select desired books, view prices, and then order them. In addition, it can store information of customers: address, email, order history. (_ This feature has been unfinished yet_)

## Database

- Dataset: I used a crawling tool to grab a dataset stored in .db/book_store_dataset.csv. The data is taken from [hullsbookstores.com](https://hullsbookstores.com) - a local bookstore in Winnipeg. This data is only used for learning purpose.

- This project uses sqlite to store data. All databases can be found at ./db

ERD diagram:
! [ERD diagram](/db/book_store_intro_project.png)

## Some features of this project:

- A simple model
- Model associations
- Validations
- Data sources (from hullsbookstores.com and from Faker gem)
- Web navigation (about page and menu)
- Data navigation (member pages, multi-model data, hierarchical collection, pagination, searching, markup and design with bootstrap)

## Screenshot of this project

! [Screenshot 1!](/db/bookstore.jpg)
