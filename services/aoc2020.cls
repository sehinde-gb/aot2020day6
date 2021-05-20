Class AOC2020.Day6 Extends %RegisteredObject
{

Property result As %String;

Property answer1 As %Integer;

Property answer2 As %Integer;

ClassMethod Import(dir As %String = "//day6.txt", win)
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
            set i = i + 1
            continue
        }
        set win(i, curated) = ""

        //write !, result(i, curated)
       
    }
    return win
}

ClassMethod AnsweredQuestions(result, answer1, answer2)
{
    set answer1 = 0, answer2 = 0
	set group = ""
	
    for {
		set group = $o(result(group))
		if group="" quit

        //write !, group 
		
		k count
		set answer = ""
		set numPeople = 0
		
        for {
			set answer = $o(result(group, answer))
			if answer="" quit
			
			set numPeople = numPeople + 1
			
			for i=1:1:$length(answer) {
				set curr = $extract(answer, i)
				set count(curr) = $get(count(curr)) + 1
			}
}

        
		
		s ques = ""
		s anyYes = 0
		s allYes = 0
		
        for {
			s ques = $order(count(ques), 1, targ)
            //write !, ques
			if ques = "" quit
			
			s anyYes = anyYes + 1
			if targ=numPeople s allYes = allYes + 1
		}
		s answer1=answer1+anyYes, answer2=answer2+allYes
	}
    //write !, answer1
    //write !, answer2

	return answer1_"^"_answer2
}

}
