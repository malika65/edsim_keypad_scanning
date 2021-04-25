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
		  
			End
