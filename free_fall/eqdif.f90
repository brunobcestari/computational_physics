PROGRAM RES_EQ_DIF
        IMPLICIT NONE
	REAL :: G=9.8E0, B, Y, V, T, H, U
        INTEGER :: R
        OPEN (UNIT=10,FILE="SPACE_TIME.txt")
        OPEN (UNIT=11,FILE="VELOCITY_TIME.txt")
        
        Y=1E4
        V=0
        
        PRINT*, "CONSIDER AIR RESISTANCE? (B=4*10^(-3))? 0 = SIM ; 1 = NAO"
        READ*, R
        IF (R==0) THEN
                B=4E-3
        ELSE
                B=0
        END IF
        
        PRINT*, "TYPE THE STEP VALUE YOU WOULD LIKE TO USE. (EXAMPLE = 0.01)"
        READ*, H
        
        DO
                
                U=V
                T=T+H
                Y=Y+H*V
                V=V+H*(-G+B*(V**2))
                WRITE (10,*) T,Y ! NO FORMAT
                WRITE (11,*) T,V ! NO FORMAT
                
                IF (U==V .OR. Y<=0) THEN
                EXIT
                END IF
                
                PRINT*, T, Y, V
                
        END DO
        
END PROGRAM

