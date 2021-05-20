Class AOC2020.Day6 Extends %RegisteredObject
{

/// Description
Property WholeLine As %String;

ClassMethod Import(dir As %String = "//day6.txt", result)
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
    set i = 1
    WHILE ('file.AtEnd) {

        set curated = $TRANSLATE(file.ReadLine(), $c(13), "")
        if curated = "" {
            s i = i + 1
            continue
        }
        s result(i, curated) = ""

        write !, curated
    
       
        
        
        

        // get length of line
        //set lline = $LENGTH(line)
        //write !, lline

    }
}

}
