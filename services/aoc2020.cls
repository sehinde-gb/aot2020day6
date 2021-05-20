ROUTINE AoC2020Day6

/// key takeaways: parsing strategy from day 4 continues to be useful for files that should be split on "\n\n"

Start() PUBLIC {
	s input="/irisdev/app/inputs/input6.txt"
	d readInput(input, .nums)
	
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

getBase10(a, b) PUBLIC {
	s c = 0
	for i=1:1:$length(a) {
		s c = c * b
		s c = c + $extract(a, i)
	}
	quit c
}

readInput(input, result) PUBLIC {
	set file = ##class(%Stream.FileCharacter).%New()
	s sc = file.LinkToFile(input)
	s i = 1
	while 'file.AtEnd {
		s curr = $translate(file.ReadLine(), $c(13), "")
		if curr = "" {
			s i = i + 1
			continue
		}
		s result(i, curr) = ""
	}
}