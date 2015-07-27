# urweb-colorThing_Fk

In order to minimize possible errors, I am trying to do minimal example of a `<select>` widget to edit a foreign-key field, but I am still getting a compile error "Some constructor unification variables are undetermined". 

Strangely, this error message mentions a field `[Id = string]` - but my code only uses `[Id = int]`.

In order to minimize possible errors, this code uses only two tables ("parent" table `color`, and "child" table `thing`):

```
table color : { 
  Id : int, 
  Nam : string 
}
PRIMARY KEY Id
 
table thing : {
  Id : int, 
  Nam : string,
  Color : int
}
PRIMARY KEY Id,
CONSTRAINT Tabl_isof_Color FOREIGN KEY Color REFERENCES color(Id)
```

It also makes the following additional simplifications:

- no sequence or auto-increment (ie, the user has to create the primary key)

- no meta-programming

- no Ur/Web modules, structures, functors or libraries

- web interface only for *creating* records in table `thing` (no updating or deleting)

- no web interface for creating, updating or deleting `color` records (must add via psql)

The Ur/Web compiler gives the following error:

```
Some constructor unification variables are undetermined in declaration
(look for them as "<UNIF:...>")
```
The complete error message from the compiler is reproduced in [Issue 1](https://github.com/StefanScott/urweb-colorThing_Fk/issues/1).

It can be difficult to debug this error, as it refers to a wide range of lines (covering all the function definitions).

Clue:

There is one interesting clue in the compiler error message: it frequently mentions a field:

```
Id = string
```

However, both instances of `Id` defined in the program (the primary keys of tables `thing` and `color`) have type `int`, not `string`.

Thanks for any help explaining these errors!
