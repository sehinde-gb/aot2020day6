Class Binary.Customs Extends %RegisteredObject
{

ClassMethod Import(dir As %String = "/usr/local/day6.txt", result As %String)
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
    set count=1
    /// loop to go through each line and save it to a global that increments
    
    WHILE ('file.AtEnd) 
    {
        set delim=" "
        set line = file.ReadLine()
        write !, "Loop started"
        write *32
        write line,!
        set answers(count)=$LISTFROMSTRING(line, delim)
        set countdown=$LENGTH(line,delim)
        set count=$INCREMENT(count)
 
    }
        write !,*32
        write !, "Double checking"
        write !,*32
        //write !, "1st element of answers array", $LIST(answers(1))
        //write !, "2nd element of answers array ", $LIST(answers(2))
      
        write !, "Import process complete"
        write *32
        //do ##class(Passport.Processing).Process()
}

ClassMethod LetterstoHex()
{
    set hex=""

    for i=1:1:$I(abc) 
        set hex=hex_$ZHEX($ASCII($e("abc")))
        write "Hexadecimal: ",hex ,!
}

}
