## Exercises
Here is a list of exercises with which you can practice based on the data found in the sentences.sql file

You can add more (real) data if you wish. If you still do not have the file, you can download it at the following [link](https://github.com/codigofacilito/curso_base_de_datos)

---

## BOOKS
* Get all the books written by authors who have a pseudonym.
* Obtain the title of all the books published in the current year whose authors have a pseudonym.
* Obtain all books written by authors who have a pseudonym and who were born before 1965.
* Place the message not available in the description column, in all books published before the year 2000.
* Obtain the primary key of all the books whose description is different from not available.
* Get the title of the last 3 books written by the author with id 2.
* Obtain in the same result the number of books written by authors with a pseudonym and without a pseudonym.

Example

<table align='center'>
    <thead align='center'>
        <tr>
            <th>with pseudonym</th>
            <th>without pseudonym</th>
        </tr>
    </thead>
    <tbody align='center'>
        <tr>
            <td>10</td>
            <td>20</td>
        </tr>
    </tbody>
</table>

* Get the number of books published between January 2000 and January 2005.
* Obtain the title and sales number of the five best-selling books.
* Get the title and number of sales of the five best-selling books of the last decade.
* Get the number of books sold by authors with id 1, 2 and 3.

Example

<table align='center'>
    <thead align='center'>
        <tr>
            <th>author</th>
            <th>sales</th>
        </tr>
    </thead>
    <tbody align='center'>
        <tr>
            <td>1</td>
            <td>10</td>
        </tr>
        <tr>
            <td>2</td>
            <td>20</td>
        </tr>
        <tr>
            <td>3</td>
            <td>30</td>
        </tr>
    </tbody>
</table>


* Get the title of the book with the most pages.
* Get all the books whose title begins with the word "The".
* Get all the books whose title begins with the word "La" and ends with the letter "a".
* Set the stock to zero for all books published before the year of 1995
* Show the Available message if the book with id 1 has more than 5 copies in stock, otherwise show the Not Available message.
* Get the books title sorted by publication date from newest to oldest.

---

## AUTHORS

* Obtain the name of the authors whose date of birth is after 1950
* Get the full name and age of all authors.
* Obtain the full name of all the authors whose last published book is after 2005
* Obtain the id of all the writers whose sales in their books exceed the average.
* Obtain the id of all the writers whose book sales are greater than one hundred thousand copies.

---

## FUNCTIONS
* Create a function which allows us to know if a book is a loan candidate or not. Return "Available" if the book has at least one copy in stock, otherwise return "Not available."