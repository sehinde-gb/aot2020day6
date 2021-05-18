Class AOC2020.Day6 Extends %RegisteredObject
{

/// Description
Property WholeLine As %String;

ClassMethod Import(dir As %String = "//day6.txt")
{
    // Open my text file and check it exists
    IF ##class(%File).Exists(dir) '=1 {
    write !, "Unable to Open: "_dir
    QUIT}
    ELSE { write "File: "_dir_" is open"}

     // instantiate a new class called file
    set file = ##class(%Stream.FileCharacter).%New()
    // create a new variable called sc
    set sc = file.LinkToFile(dir)
    WHILE ('file.AtEnd) {
    
        //read line of text from file
        set line = file.ReadLine()
        // create nline and go through each line of text from file whilst incrementing the counter
        set nline = $INCREMENT(nline)

        //if line exists loop through each line until no more lines
        //IF (line ="abc"){
                //write !, line
               // Write $CHAR(10)
           // }
     
        write !, line
        // get length of line
        set lline = $LENGTH(line)

    }
            ///write !, line
            ///Write $CHAR(10)
        //IF (nline >= 1) & (line '= "") {
            
            
            //read line of text from file           
          //  set row = ##class(AOC2020.Day6).%New()
}

}
