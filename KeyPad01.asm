; 	Defining the rows and columns

;	 Col2 Col1 Col0
;	+----+----+----+
;	|  1 |  2 |  3 |	Row3
;	+----+----+----+
;	|  4 |  5 |  6 |	Row2
;	+----+----|----+
;	|  7 |  8 |  9 |	Row1
;	+----+----+----+
;	|  * |  0 |  # |	Row0
;	+----+----+----+

			;Scan Row3
Begin:		CLR P0.3			;Clear Row3
			CALL IDCode0		;Call scan column subroutine
			JB F0,Done  		;If F0 is set, end program 
						
			;Scan Row2
			CLR P0.2			;Clear Row2
			CALL IDCode1		;Call scan column subroutine
			JB F0,Done		 	;If F0 is set, end program 						

			;Scan Row1
			CLR P0.1			;Clear Row1
			CALL IDCode2		;Call scan column subroutine
			JB F0,Done			;If F0 is set, end program 

			;Scan Row0
			CLR P0.0			;Clear Row0
			CALL IDCode3		;Call scan column subroutine
			JB F0,Done			;If F0 is set, end program 
														
			JMP Begin			;Go back to scan Row3
							
Done:		JMP $				;Program execution ends and stay here

			;Scan column subroutine
IDCode0:	JNB P0.4, KeyCode03	;If Col0 Row3 is cleared - key found
			JNB P0.5, KeyCode13	;If Col1 Row3 is cleared - key found
			JNB P0.6, KeyCode23	;If Col2 Row3 is cleared - key found
			RET					

KeyCode03:	SETB F0			;Key found - set F0
			Mov R7,#0B0h	;Code for '3'
			Mov P1,R7		;Display key pressed
			RET				

KeyCode13:	SETB F0			;Key found - set F0
			Mov R7,#0A4h	;Code for '2'
			Mov P1,R7		;Display key pressed
			RET				

KeyCode23:	SETB F0			;Key found - set F0
			Mov R7,#0F9h	;Code for '1'
			Mov P1,R7		;Display key pressed
			RET				

IDCode1:	JNB P0.4, KeyCode02	;If Col0 Row2 is cleared - key found
			JNB P0.5, KeyCode12	;If Col1 Row2 is cleared - key found
			JNB P0.6, KeyCode22	;If Col2 Row2 is cleared - key found
			RET					

KeyCode02:	SETB F0			;Key found - set F0
			Mov R7,#82h		;Code for '6'
			Mov P1,R7		;Display key pressed
			RET				

KeyCode12:	SETB F0			;Key found - set F0
			Mov R7,#92h		;Code for '5'
			Mov P1,R7		;Display key pressed
			RET				

KeyCode22:	SETB F0			;Key found - set F0
			Mov R7,#99h		;Code for '4'
			Mov P1,R7		;Display key pressed
			RET				

IDCode2:	JNB P0.4, KeyCode01	;If Col0 Row1 is cleared - key found
			JNB P0.5, KeyCode11	;If Col1 Row1 is cleared - key found
			JNB P0.6, KeyCode21	;If Col2 Row1 is cleared - key found
			RET					

KeyCode01:	SETB F0			;Key found - set F0
			Mov R7,#90h		;Code for '9'
			Mov P1,R7		;Display key pressed
			RET				

KeyCode11:	SETB F0			;Key found - set F0
			Mov R7,#80h		;Code for '8'
			Mov P1,R7		;Display key pressed
			RET				

KeyCode21:	SETB F0			;Key found - set F0
			Mov R7,#0F8h	;Code for '7'
			Mov P1,R7		;Display key pressed
			RET				

IDCode3:	JNB P0.4, KeyCode00	;If Col0 Row0 is cleared - key found
			JNB P0.5, KeyCode10	;If Col1 Row0 is cleared - key found
			JNB P0.6, KeyCode20	;If Col2 Row0 is cleared - key found
			RET					

KeyCode00:	SETB F0			;Key found - set F0
			Mov R7,#0BFh	;Code for '-' replacing '#'. '#' cannot be display on 7-segment
			Mov P1,R7		;Display key pressed
			RET				

KeyCode10:	SETB F0			;Key found - set F0
			Mov R7,#0C0h	;Code for '0'
			Mov P1,R7		;Display key pressed
			RET				

KeyCode20:	SETB F0			;Key found - set F0
			Mov R7,#0BFh	;Code for '-' replacing '*'. '*' cannot be display on 7-segment
			Mov P1,R7		;Display key pressed
			RET				
		  
			End
