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
}

}