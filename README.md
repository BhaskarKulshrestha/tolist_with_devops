# To-Do List Web Application
This is a simple web application built using Express.js and MongoDB that allows users to create and manage to-do lists. The application utilizes EJS for rendering dynamic web pages and features a responsive and visually appealing design using CSS.

**------------------------------ > [CHECK OUT THE WORKING APPLICATION](https://todolistbybhaskar.onrender.com) < --------------------------------------**

## Getting Started
### Prerequisites
- Node.js and npm should be installed on your machine.
- MongoDB should be installed and running locally.

### Installation
- Clone or download the repository to your local machine.

- Navigate to the project directory using your terminal.

- Install the necessary dependencies by running:

```
npm install
```
### Usage
- Make sure MongoDB is running locally on port 27017.

- Run the following command to start the application:

```
node app.js
```
Open a web browser and visit http://localhost:3000 to access the application.

### Features
- Create and manage multiple to-do lists.
- Add new items to a list.
- Mark items as completed by checking them off.
- Delete items from a list.
- Responsive and user-friendly design.

### File Structure
- app.js: The main application file that sets up the server, routes, and database connection.
- date.js: A module that provides utility functions for working with dates (not included in the provided code snippet).
- list.ejs: The EJS template for rendering the to-do list page.
- views: This directory contains the EJS templates used for rendering different pages.
- public: This directory contains static files such as CSS (style.css) and other client-side resources.
  
### Technologies Used
    -  Node.js
    -  Express.js
    -  EJS (Embedded JavaScript)
    -  MongoDB
    -  HTML/CSS

### Course used to make this project:
  [Web development Bootcamp](https://www.udemy.com/course/the-complete-web-development-bootcamp/)

## Funtioning of the code:

**- Imports and Setup:**
  - express, body-parser, mongoose, date, and _ are imported as required modules.
  - express is used to create the web application.
  - body-parser is used to parse the incoming request bodies.
  - mongoose is an Object Data Modeling (ODM) library for MongoDB.
  - date.js (not provided) is likely a custom module for handling date-related operations.
  - _ is used from the lodash library for utility functions.
  - app is created as an instance of the Express application.
  - View engine is set to EJS.
  - Body parser and static file serving from the "public" directory are configured.
  - MongoDB connection is established.

**- Mongoose Schemas and Models:**
  - itemsSchema defines the schema for a single to-do list item.
  - Item model is created using the itemsSchema.
  - defaultItems array contains default items for a new list.
  - listSchema defines the schema for a to-do list.
  - List model is created using the listSchema.

**- Homepage Route ("/"):**

  - Finds existing to-do list items using Item.find().
  - If no items are found, inserts defaultItems into the database.
  - Renders the "list" view with the found items or the default items.

**- Custom List Route ("/:customListName"):**

  - Handles dynamic routes based on the list name in the URL.
  - Capitalizes the custom list name using _.capitalize().
  - Searches for a list with the provided name using List.findOne().
  - If no list is found, creates a new list with default items and redirects to the new list.
  - If a list is found, renders the "list" view with the list's items.

**- POST Route ("/" - Adding New Items):**

  - Handles the submission of a new to-do item.
  - Creates a new Item instance with the provided name.
  - If the list name is "Today", the item is saved to the database and the user is redirected to the homepage.
  - If the list name is a custom list, the item is added to the list and the user is redirected to the custom list.

**- POST Route ("/delete" - Deleting Items):**

- Handles the deletion of to-do items.
- If the list name is "Today", finds and removes the item by ID using Item.findByIdAndRemove().
- If the list name is a custom list, uses $pull to remove the item from the list using List.findOneAndUpdate().

**- About Route ("/about"):**

- Renders the "about" view.

**- Server Start:**

- Listens on port 3000 and starts the server.

**- list.ejs (EJS Template):**

- Displays the list title at the top of the page.
- Loops through newListItems to display each item.
- Each item is displayed along with a checkbox for marking completion.
- Items can be deleted using the delete form.
- New items can be added using the input form at the bottom.

**- style.css (CSS Stylesheet):**

- Defines the styling for the web application, including colors, fonts, and layout.


## Functioning of each and every Mongoose function implemented:

**- mongoose.connect("mongodb://localhost:27017/todolistDB"):**

- This function establishes a connection to the MongoDB database named "todolistDB" running locally on the default port (27017).

**- const Item = mongoose.model("Item", itemsSchema);**

- This creates a Mongoose model named "Item" based on the itemsSchema.
- The model represents a collection in the database where each document follows the itemsSchema structure.

**- const List = mongoose.model("List", listSchema);**

- Similar to the previous step, this creates a Mongoose model named "List" based on the listSchema.

**- Item.find():**

- Retrieves all documents from the "Item" collection.
- Returns a Promise that resolves to an array of items.

**- Item.insertMany(defaultItems):**

- Inserts an array of documents (defaultItems) into the "Item" collection.
- Returns a Promise that resolves to an array of inserted items.

**- List.findOne({ name: customListName }):**

- Searches for a single document in the "List" collection that matches the provided customListName.
- Returns a Promise that resolves to the found document or null if not found.

**- list.save():**

- Saves a new document (list) to the "List" collection.

**- List.findOneAndUpdate({ name: listName }, { $pull: { items: { _id: checkedItemId } } }):**

- Finds a document in the "List" collection by its name and updates it using the $pull operator to remove an item from the items array.
- Returns a Promise that resolves to the updated document.

**- Item.findByIdAndRemove(checkedItemId):**

- Finds a document by its ID and removes it from the "Item" collection.
- Returns a Promise that resolves when the operation is complete.

**- foundList.items.push(item):**

- Adds a new item to the items array of a found list document.

**- foundList.save():**

- Saves the changes made to a list document, including the newly added item.

These Mongoose functions allow the application to perform various database operations, such as querying for documents, inserting new documents, updating existing documents, and removing documents. The usage of these functions helps in creating, updating, and managing the to-do items and lists in the application.

## Advantages and Disadvantages of diffrent Technologies Used:

***Technologies Used:***

**1. Node.js:**

**- Advantages:** 
Node.js is a runtime environment that allows running JavaScript on the server-side. It provides non-blocking, event-driven architecture, making it efficient for handling a large number of connections. Its extensive package ecosystem (npm) simplifies development.
  
**- Disadvantages:** 
Single-threaded nature can lead to performance issues for CPU-intensive tasks. Asynchronous programming can be complex.

**- Future Scope:** 
Node.js continues to grow in popularity and is widely used for building scalable and real-time applications.
  
**2. Express.js:**

**- Advantages:** 
Express.js is a minimalistic web application framework for Node.js. It simplifies route handling, middleware usage, and request/response management. It's highly customizable and has a large community.

**- Disadvantages:**
Being minimalistic means some advanced features might need additional libraries.

**- Future Scope:** 
Express.js remains a go-to choice for building web applications and APIs with Node.js.
 
**3. EJS (Embedded JavaScript):**

**- Advantages:** 

- EJS is a templating engine for rendering dynamic HTML content. It allows embedding JavaScript within HTML, making it easy to generate dynamic pages.
- Disadvantages: Mixing code and HTML can sometimes make templates less readable or maintainable.
- Future Scope: EJS is still used for server-side rendering in Node.js applications, but newer front-end technologies like React and Vue.js are gaining more popularity.
 
**4. MongoDB:**

**- Advantages:** 
MongoDB is a NoSQL database known for its flexibility, scalability, and ease of use. It can handle unstructured data, and its document-based structure suits applications with evolving schemas.

**- Disadvantages:** 
Not suitable for complex transactions, might require denormalization, and lacks certain features of relational databases.

**- Future Scope:** 
MongoDB remains a popular choice for various types of applications, especially those requiring scalability and real-time data.
  
**-5. HTML/CSS:**

**- Advantages:** 
HTML defines the structure of web content, and CSS is used for styling. They are fundamental for web development.

**- Disadvantages:**
CSS can become complex for larger applications, and browser compatibility can be an issue.

**- Future Scope:**
 HTML and CSS continue to evolve, with new features and standards being introduced regularly.


## Future Scope

- The application can be enhanced by incorporating additional features such as user authentication and user-specific to-do lists.

- Front-end technologies like React or Vue.js can be integrated to provide a more dynamic and interactive user experience.

- Error handling and validation can be improved to provide better user feedback and prevent issues.

- The application can be deployed to a cloud platform to make it accessible from anywhere and to ensure better scalability.

- Integration of a task scheduling or notification system to remind users of pending tasks could be considered.

- The use of GraphQL for more efficient and precise data retrieval could be explored.

- Considering serverless architecture or containerization for improved scalability and resource optimization.

- Continuous integration and automated testing can be set up to ensure code quality and reliability.

- Incorporating a mobile version of the application or making it responsive for various devices.

- Exploring alternative databases or database architectures for specific scalability and performance needs.


**- Mongoose:**

- Advantages:

    - Simplified Data Modeling: Mongoose provides an elegant and intuitive way to model and structure data for MongoDB. Schema definitions make it easy to define data types and relationships.
    - Validation and Middleware: Mongoose offers built-in validation for data integrity and middleware functions that can be executed before or after certain operations, enhancing control over data manipulation.
    - Querying and Aggregation: Mongoose simplifies complex queries and aggregation operations, allowing developers to work with MongoDB's querying capabilities more easily.
    - Object-Document Mapping (ODM): Mongoose acts as an ODM, abstracting away the low-level MongoDB driver and making it more developer-friendly.
    - Plugins and Extensibility: Developers can create and use plugins to extend Mongoose's functionality, making it adaptable to specific project needs.

- Disadvantages:

    - Learning Curve: While Mongoose provides powerful features, it might require a learning curve, especially for developers new to MongoDB and NoSQL databases.
    - Performance Overhead: Mongoose adds a layer of abstraction, which might introduce a small performance overhead compared to using the MongoDB driver directly for simple operations.

- Future Scope:

    - Mongoose is likely to continue evolving, providing better integration with new MongoDB features and enhancements.
    - As the MongoDB ecosystem grows, Mongoose could adapt to new database paradigms or expand its capabilities for improved data handling.

**- Lodash:**

- Advantages:

    - Utility Functions: Lodash offers a rich set of utility functions that streamline common programming tasks, such as iterating, manipulating collections, and handling data.
    - Performance Optimizations: Lodash functions are highly optimized and well-tested, often performing better than custom implementations.
    - Modularity: Lodash's modular structure allows developers to use only the functions they need, reducing unnecessary code bloat.
    - Cross-Browser Compatibility: Lodash addresses browser inconsistencies, making it easier to write cross-browser-compatible code.

- Disadvantages:

    - Code Size: Including the entire Lodash library, especially if not all functions are used, can increase the size of the final bundle.
    - Dependency Management: While Lodash's modularity is an advantage, managing multiple dependencies can be challenging in larger projects.
         
- Future Scope:

    - Lodash will likely continue to provide essential utility functions, adapting to modern JavaScript standards and practices.
    - With the advent of ES6 and the JavaScript ecosystem's evolution, Lodash might explore ways to align more closely with native language features.
  
## **Overall Future Scope:**

**1. Integration of Mongoose and Lodash:**
   
- Exploring the optimization of Mongoose queries using Lodash functions to enhance code readability and performance.

**2. Adopting New Standards:**

- Both Mongoose and Lodash will likely adopt and integrate new ECMAScript features and language updates.

**3. Community and Ecosystem Growth:**

- Both technologies are likely to expand their communities, provide more documentation, and offer new features based on user feedback and emerging trends.

**4. Integration with Modern Front-End Frameworks:**

- Both Mongoose and Lodash can be used alongside modern front-end frameworks like React, Angular, or Vue.js for full-stack development.

## Demonstration

**1.Default Page**
![](https://github.com/BhaskarKulshrestha/To-Do-List-with-MongoDB-integrated/blob/main/PICTURES/Default.png)

**2. Added first item in the default page**
![](https://github.com/BhaskarKulshrestha/To-Do-List-with-MongoDB-integrated/blob/main/PICTURES/Added%20first%20item%20in%20default%20list.png)

**3. Work Page**
![](https://github.com/BhaskarKulshrestha/To-Do-List-with-MongoDB-integrated/blob/main/PICTURES/work.png)

**4. Shopping list after deletion process**
![](https://github.com/BhaskarKulshrestha/To-Do-List-with-MongoDB-integrated/blob/main/PICTURES/shopping%20list%20after%20deletion.png)

**5. View of Node.js Server Running**
<br>
![](https://github.com/BhaskarKulshrestha/To-Do-List-with-MongoDB-integrated/blob/main/PICTURES/view%20of%20the%20node%20js%20server.png)

**6. MongoDB database View during CRUD operation**
<br>
![](https://github.com/BhaskarKulshrestha/To-Do-List-with-MongoDB-integrated/blob/main/PICTURES/mongodb%20database%20view.png)

**7. Compact view of MongoDB**
<br>
![](https://github.com/BhaskarKulshrestha/To-Do-List-with-MongoDB-integrated/blob/main/PICTURES/compact%20view%20of%20data%20in%20mongodb.png)

