This is a minimal example attempting to provide a <select> widget to allow the user to easily edit a foreign-key field.

In order to minimize possible errors, this code:

- uses only two tables ("parent" table 'color', and "child" table 'thing')
```
    table color : { 
      Id : int, 
      Nam : string 
    }
    PRIMARY KEY Id,
 
    table thing : {
      Id : int, 
      Nam : string,
      Color : int
    }
    PRIMARY KEY Id,
    CONSTRAINT Tabl_isof_Color FOREIGN KEY Color REFERENCES color(Id)
```
- does not use a sequence or auto-increment (ie, the user has to select the primary key)

- does not use any meta-programming

- does not use Ur/Web modules, structures, functors or libraries

- provides a web interface only for *creating* records in table 'thing' (no updating or deleting)

- provides no web interface for creating, updating or deleting 'color' records (must add via psql)

The Ur/Web compile gives the following error:
```
Some constructor unification variables are undetermined in declaration
(look for them as "<UNIF:...>")
```
It is hard to debug this error, as it refers to a wide range of lines (the entire 





