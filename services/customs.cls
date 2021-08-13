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
                     //set readvalue = $EXTRACT(line,i,i)
                     write *32
                     //write "Value",readvalue ,!
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

// ClassMethod DecimalToBinary(ByRef dec As %Integer)

// {

//         //write hex ,!

//         //set dec=61

//         write "Decimal:",dec ,!

//         for i=1:1:16 

//             {set $BIT(a,i) = $BIT($FACTOR(dec),i)}

//                 write !,"Number of 1 bits=",$BITCOUNT($FACTOR(dec),1)

//                 write !,"bitstring a=",$BIT(a,1),$BIT(a,2),$BIT(a,3),$BIT(a,4),$BIT(a,5),$BIT(a,6)

//                 write !,"bitstring c/3=",$BIT(a,3)

//                 write !,*32

//                 zwrite a

// #;set dec=62

//         #;for i=1:1:16 

//         #;{set $BIT(b,i) = $BIT($FACTOR(dec),i)}

// #;write !,"Number of 1 bits=",$BITCOUNT($FACTOR(dec),1)

//         #;write !,"bitstring b=",$BIT(b,1),$BIT(b,2),$BIT(b,3),$BIT(b,4),$BIT(b,5),$BIT(b,6)

//         #;write !,"bitstring b/2=",$BIT(b,2)

//         #;write !,*32

//         #;zwrite b             

//         #;set dec= 63 

//         #;for i=1:1:16 {set $BIT(c,i) = $BIT($FACTOR(dec),i) 

//         #;write !,"Number of 1 bits=",$BITCOUNT($FACTOR(dec),1)

//         #;write !,"bitstring c=",$BIT(c,1),$BIT(c,2),$BIT(c,3),$BIT(c,4),$BIT(c,5),$BIT(c,6)

//         #;write !,"bitstring c/1=",$BIT(c,1)

//         #;write !,*32

//         #;zwrite c

//     /// Description

//     // Class LogicBit()

//     // {

//     //     // Set a to [1,1]

//     // SET $BIT(a,1) = 1

//     // SET $BIT(a,2) = 1

//     // // Set b to [0,1]

//     // SET $BIT(b,1) = 0

//     // SET $BIT(b,2) = 1

//     // WRITE !,"bitstring a=",$BIT(a,1),$BIT(a,2)

//     // WRITE !,"bitstring b=",$BIT(b,1),$BIT(b,2)

//     // SET c = $BITLOGIC(~b)

//     // WRITE !,"The one's complement of b=",$BIT(c,1),$BIT(c,2)

//     // // Find the intersection (AND) of a and b

//     // SET c = $BITLOGIC(a&b)   // c should be [0,1]

//     // WRITE !,"The AND of a and b=",$BIT(c,1),$BIT(c,2)

//     // SET c = $BITLOGIC(a&~b)   // c should be [1,0]

//     // WRITE !,"The AND of a and ~b=",$BIT(c,1),$BIT(c,2)

//     // // Find the union (OR) of a and b

//     // SET c = $BITLOGIC(a|b)   // c should be [1,1]

//     // WRITE !,"The OR of a and b=",$BIT(c,1),$BIT(c,2)

// //

// }

// }

}
