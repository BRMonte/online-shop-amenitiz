# online-shop-amenitiz

This is a small script to simulate the process of putting items to a shop cart and reading the final price after discounts are applied.
I've chosen to go with the Rails monolith to be able to focus on the Ruby aspect of this challenge. I set PostgreSQL as DB and tested with Rspec

- clone the repository
- run rails db:seed
- run rails server

  I left some things 'opened' regarding authentication/permission (eg: manage products table) system to keep things simple. but yet provide an idea of how I was thinking. Such as the admin panel, user panel etc

Features:
1- I search form to look for items
2- a sorting dropdown to sort items 
3- a pagination system to navigate through the items
4- a shop cart that calculates discounts

Things left out:
1- authentication with devise gem. That's why I didn't isolate some routes in a user.admin role as it would be done on a regular app. 
2- API versioning
3- mailing system 
4- React front-end app
5- serialization
6- in a more robust app I would have jobs to keep track of discount status
7- I left some N+1 query issues behind
8- slug for items to optimize SEO and UX

My focus was on the architecture, giving an idea of how things could scale.
About the discount system, it could be different, allowing the CRUD operation on an eventual admin panel, but my way to go was a simple ServiceObject to isolate the logic.

Thanks for this opportunity. I had a hard time thinking about all I wanted to deliver and that brought me some issues. It's not perfect, but it's decent. Hope it is worth your time



  
 
