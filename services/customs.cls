Class Binary.Customs Extends %RegisteredObject
{

ClassMethod Import(dir As %String = "/usr/local/day6.txt", answers As %DynamicArray)
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
                set i=1
                
                //write !, "Loop started"
                write *32
                //write line,!

                if (line '="") {
                     write !, "Read started"
                     write *32
                     set list=$LISTFROMSTRING(line, delim) 
                     set ^answers(count)=$ZSTRIP(list,"="," ") // for only spaces
                     write ^answers(count) ,!
                     write *32
                    
                     
                     //set ^attempt(count)=^attempt(count)_$ZHEX(($ASCII($LIST(^answers(count)))))
                     //write "Attempt:", ^attempt(count) ,!
                     //set countdown=$LENGTH(line,delim)
                     set i=$INCREMENT(i)
                     set count=$INCREMENT(count)
                }
                      
            }
              
                write !,*32
                
                write !, "Double checking"
                write !,*32
                write !, "1st element of answers array: ", $LIST(^answers(1))
                
                write !, "Import process complete"
                write *32
                
                do ##class(Binary.Customs).LetterstoDecimal()
}

ClassMethod LetterstoDecimal()
{
    write !, "1st element of answers array: ", $LIST(^answers(1))
    write *32
    set con = " "
    set con=con_$ZHEX($ASCII($e($LIST(^answers(1)))))
    write "Decimal: ",con ,!
    set a=" "
    
    for i=1:1:8 {
        write $BIT($FACTOR("62"),1)
    }

    // set test = $BIT($FACTOR(con),1)

    // write test ,!

    // write bitstring ,!

    // write !,"bitstring a=",$BIT(a,1),$BIT(a,2),$BIT(a,3),$BIT(a,4),$BIT(a,5),$BIT(a,6)

    // write !,"bitstring a/3=",$BIT(a,3)

    // write !,"bitstring a/2=",$BIT(a,2)

    // write !,"bitstring a/1=",$BIT(a,1)
    write !,*32
   
    //do ##class(Binary.Customs).DecimalToBinary(dec)
}

}
