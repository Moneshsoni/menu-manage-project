# menu-manage-project
  The menu-manage project feature
  1. User can check number of menus.
  2. User search by menu by name.
  3. User can sort the price and name.
  4. Pagination enables users to navigate through a large dataset by breaking it into multiple pages. It typically includes links or buttons for "Next," "Previous," and specific page numbers.
  5. Deploy on the render cloud platforms.

## Prerequisites:
 1. Ruby 3.0.0
 2. Rails 7.0.8
 3. Database system  PostgreSQL
 4. Bundler
 5. Node.js and Yarn (if using Webpacker)

## Installation With Docker:
 1. Clone the project's from the Git repository.
    ```bash
      $ git clone url
    ``` 
 2. Change the directory
    ```bash
      $ cd project_directory
    ``` 

 3. Build the docker image using command on root directory
    ```bash
      $ sudo docker-compose up --build
    ``` 
 4. create db on postgresql command
    ```bash
      $ docker-compose run rails rails db:create
    ``` 
 5. migrate db on postgresql command
    ```bash
      $ docker-compose run rails rails db:create
    ``` 
 6. run the project after all installations and dependencies.

    #### http://0.0.0.0:3000/api/v1/menus.json
 7. Down the project using command

    ```bash
      $ docker-compose down # stop a container
    ``` 
    
## Installation Without Docker:
 1. Clone the project's Git repository.
  git clone url

 2. cd project_directory

 3. Install the all the dependencies
    ```bash
    $ bundle install
    ``` 
 4. Create the DB postgresql
    ```bash
    $ rails db:create
    ``` 
 5. Migrate the DB
    ```bash
    $ rails db:migrate
    ``` 
 6. run the project after all installations and dependencies.
     #### http://127.0.0.1:3000/api/v1/menus.json

## Run the testcases using command on the root directory
  ```bash
    $ rspec
  ```

