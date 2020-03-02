PROGRAM TERMINAL
    IMPLICIT NONE
    REAL :: G,V,X,H,T,N,I
    OPEN(unit=10,file="velocidadetempo.txt")
    OPEN(unit=11,file="espacotempo.txt")
    DO
        G=-9.8E0
        V=0
        X=0E0
        H=0.0001E0
        T=0E0

        PRINT*, "VELOCIDADE INICIAL"
        READ*, V


        DO
           T=T+H
           V=V+G*H
           X=X+V*H

           PRINT*,T,X,V
           WRITE(10,*) v,T ! FORMATO LIVRE
           WRITE(11,*) X,T ! FORMATO LIVRE
           IF (X<=0) THEN
                EXIT
           END IF

        END DO
    END DO
END PROGRAM

