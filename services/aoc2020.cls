Class AOC2020.Day6 Extends %RegisteredObject
{

Property result As %String;

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
        set input = ##class(AOC2020.Day6).%New()
        set cards = $TRANSLATE(file.ReadLine(), $c(13), "")
        if cards = "" {
            set i = $INCREMENT(i)
            continue
        }
        set result(i, cards) = ""
        write !, result(i)
    }
        
 // initialise the variables 
    set answer1 = 0, answer2 = 0
    set group = ""
    
    // order the result and assign it to the new variable group
    for {
        set group = $order(result(group))
        
        if group="" quit

        // initialise the answer and people counter
        
        k count
        set answer = ""
        set people = 0
        
        //iterate over the answer to find its length and extract it
        for {
            set answer = $order(result(group, answer))
            if answer="" quit
            
            set people = $INCREMENT(people)
            
            for i=1:1:$length(answer) {
                set curr = $extract(answer, i)
                set count(curr) = $get(count(curr)) + 1
            }
        }

        
        // iterate over the questions and place them in order and if the target 
        // is equal to the number of people then set all yes otherwise 
        set ques = ""
        set anyYes = 0
        set allYes = 0
        

        for {
            set ques = $order(count(ques), 1, targ)
            //write !, 
            if ques = "" quit
            
            set anyYes = $INCREMENT(anyYes)
            if targ=people set allYes = $INCREMENT(allYes)
        }
        set answer1=answer1+anyYes, answer2=answer2+allYes
    }
    set landing.answer1 = answer1
    set landing.answer2 = answer2

    //write !, answer1
    //write !, answer2
    //write !, %result 
    //return answer1_"^"_answer2}}
}

}
