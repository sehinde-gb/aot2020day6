Class AOC2020.Day6 Extends %RegisteredObject
{

/// Description
Property result As %String;

/// Description
ClassMethod Extract()
{
    s answer1 = 0, answer2 = 0
	s group = ""
	
    for {
		s group = $o(nums(group))
		if group="" quit
		
		k count
		s answer = ""
		s numPeople = 0
		for {
			s answer = $o(nums(group, answer))
			if answer="" quit
			
			s numPeople = numPeople + 1
			
			for i=1:1:$length(answer) {
				s curr = $extract(answer, i)
				s count(curr) = $get(count(curr)) + 1
			}
		}
		
		s ques = ""
		s anyYes = 0
		s allYes = 0
		for {
			s ques = $order(count(ques), 1, targ)
			if ques = "" quit
			
			s anyYes = anyYes + 1
			if targ=numPeople s allYes = allYes + 1
		}
		s answer1=answer1+anyYes, answer2=answer2+allYes
	}
	return answer1_"^"_answer2
}

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

        write !, sc
       

    }
}

}
