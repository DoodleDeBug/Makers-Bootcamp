# Bookmark Manager

A bookmark manager is a website to maintain a collection of bookmarks (URLs). You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse bookmarks other users have added. You can comment on the bookmarks.

## To run the Bookmark Manager app

1. `cd` into the folder
2. Run `rackup`
3. To view bookmarks, navigate to `localhost:3000/bookmarks`

## How to set up the database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`

## To run tests

1. `cd` into the folder
2. Run `rspec`

## User Stories

```
As a user,
To know what ive saved,
I'd like the website to be able to show a list of bookmarks 

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

## Website Specifications

The website will have the following specification:

    - Show a list of bookmarks
    - Add new bookmarks
    - Delete bookmarks
    - Update bookmarks
    - Comment on bookmarks
    - Tag bookmarks into categories
    - Filter bookmarks by tag
    - Users are restricted to manage only their own bookmarks


### User Interface Sketch (Hi-Fi)

This is the basic view of the website that we were given. We will build it by working through a sequence of challenges.

![](https://dchtm6r471mui.cloudfront.net/hackpad.com_jubMxdBrjni_p.52567_1380279073159_Screen%20Shot%202013-09-27%20at%2011.06.12.png "Bookmark Manager")

## Domain Model

![Screenshot 2021-11-08 at 14 24 55](https://user-images.githubusercontent.com/68062425/140759434-fa4d4839-e9cd-4b45-a4c9-5a2ee1ecb70a.png)
