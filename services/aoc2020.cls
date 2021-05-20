Class AOC2020.Day6 Extends %RegisteredObject
{

Property result As %Stream.FileCharacter;

Property answer1 As %Integer;

Property answer2 As %Integer;

ClassMethod PartOne(dir As %String = "//day6.txt", result)
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

    // Iterate over the file and at the carriage return add a null value
    WHILE ('file.AtEnd) {

        set noreturn = $TRANSLATE(file.ReadLine(), $c(13), "")
        if noreturn = "" {
            set i = $INCREMENT(i)
            continue
        }
        set ^result(i, noreturn) = ""
       
    }
        write !, result
}

/// Assign the value of no return to result

}
