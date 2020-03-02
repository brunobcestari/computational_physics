PROGRAM TERMINAL
	IMPLICIT NONE
	REAL :: G,V,X,H,T,N,I,B,U
	OPEN(unit=10,file="velocidadetempo.txt")
	OPEN(unit=11,file="espacotempo.txt")
	DO
		G=-9.8E0
		V=0
		X=0E0
		H=0.0001E0
		T=0E0
		B=4E-3
		U=0

		PRINT*, "VELOCIDADE INICIAL"
		READ*, V


		DO
			U=V
			T=T+H
			V=V+(G-B*(V**2))*H
			X=X+V*H

			PRINT*,T,X,-V
			WRITE(10,*) T,-V ! FORMATO LIVRE
			WRITE(11,*) T,X ! FORMATO LIVRE
			IF (V==U) THEN
				EXIT
			END IF

		END DO
	END DO


END PROGRAM 
