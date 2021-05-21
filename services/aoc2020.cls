Class AOC2020.Day6 Extends %RegisteredObject
{

Property result [ MultiDimensional ];

Property answer1 As %Integer;

Property answer2 As %Integer;

ClassMethod PartOne(dir As %String = "//day6.txt", result As %String)
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
        
        set cards = $TRANSLATE(file.ReadLine(), $c(13), "")
        if cards = "" {
            set i = $INCREMENT(i)
            continue
        }
        set result(i, cards) = ""
        set input = ##class(AOC2020.Day6).%New()
        set input.result =
    }
}

/// a public method with an argument and a return value
ClassMethod PartTwo(num As %Numeric) As %String
{
    write !, "my favorite number is ", num
    return "This is my return value!!!"
}

/// a public method with an argument and a return value
ClassMethod Public(num As %Numeric) As %String
{
    write !, "my favorite number is ", num
    return "This is my return value!!!"
}

/// demo of public and private methods, along with a public variable
ClassMethod PrivatePublic()
{

    do ..Public(9)   // call a public method
}

}
