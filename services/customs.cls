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
                
                write !, "Loop started"
                write *32
                //write line,!

                if (line '="") {
                     write !, "Read started"
                     write *32
                     set ^answers(count)=$LISTFROMSTRING(line, delim)
                     set readvalue = $EXTRACT(line,i,i)
                     write *32
                     write "Value",readvalue ,!
                     set ^attempt(count)=^attempt(count)_$ZHEX(($ASCII($LIST(^answers(count)))))
                     write "Attempt:", ^attempt(count) ,!
                     set countdown=$LENGTH(line,delim)
                     set i=$INCREMENT(i)
                     set count=$INCREMENT(count)
                }
               

                
                
        
            }
                set lamb=""
                write !,*32
                //write ^dec
                write !, "Double checking"
                write !,*32
                write !, "1st element of answers array: ", $LIST(^answers(1))
                //write ^dec = $ZHEX($ASCII($e(54)))
                //set dec(count)=dec(count)_$ZHEX($ASCII($e(^answers(count))))
                
               
                
                //write !, "3rd element of answers array: ", $LIST(^answers(3))
                //set element(3) = $LIST(answers(3))
                write !, "Import process complete"
                write *32
                
                do ##class(Binary.Customs).LetterstoDecimal()
}

ClassMethod LetterstoDecimal()
{
    set dec=""
    set count=1
    //zw ^answers
    //write ^answers(1) ,!
    //write ^answers(3) ,!
    for i=1:17:^answers(count) {
      write ^answers(count)
      //set dec=dec_$ZHEX($ASCII($e(^answers(5))))
      //write "Decimal: ",dec ,!
      set count=$INCREMENT(count)
    }

    //set dec=dec_$ZHEX($ASCII($e(^answers(3))))
    //write "Decimal:",dec ,!
    //do ##class(Binary.Customs).DecimalToBinary(dec)
}

}
