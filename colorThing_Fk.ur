table color : {
  Id : int, 
  Nam : string
}
  PRIMARY KEY Id,
  CONSTRAINT Nam UNIQUE Nam,
  CONSTRAINT Id CHECK Id >= 0

table thing : {
  Id : int, 
  Nam : string,
  Color : int
}
  PRIMARY KEY Id,
  CONSTRAINT Id CHECK Id >= 0,
  CONSTRAINT Tabl_isof_Color FOREIGN KEY Color REFERENCES color(Id)


fun list () =

  thingRows <- 
    queryX1 (SELECT * FROM thing)
    (fn r => <xml> <tr> 
               <td> {[r.Id]} </td> 
               <td> {[r.Nam]} </td> 
               <td> {[r.Color]} </td> 
             </tr> </xml>);
  colorOptions <- 
    queryX1 (SELECT * FROM color)
    (fn r => <xml> <option value={r.Id}> {[r.Nam]} </option> </xml>);
  return
    <xml>
      <table border={1}>
        <tr> <th>Id</th> <th>Nam</th> <th>Color</th> </tr>
        {thingRows}
      </table>
      <br/><hr/><br/>
      <form>
        <table>
          <tr> <th>A:</th> <td><textbox{#Id}/></td> </tr>
          <tr> <th>B:</th> <td><textbox{#Nam}/></td> </tr>
          <tr> <th>C:</th> <td><select{#Color}>{colorOptions}</select></td> </tr>
          <tr> <th/> <td><submit action={create} value="Add Row"/></td> </tr>
        </table>
      </form>
    </xml>

and create r  =
  dml (INSERT INTO thing (Id, Nam, Color) 
       VALUES ({[readError r.Id]}, {[r.Nam]}, {[readError r.Color]}));
  ls <- list ();
  return
    <xml><body>
      <p>Thing inserted!</p>
      {ls}
    </body></xml>

and main () =
  ls <- list ();
  return <xml><body>
    <h1>Things</h1>
    {ls}
  </body></xml>


