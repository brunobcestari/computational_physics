PROGRAM TESTE_INTEGRAL
	IMPLICIT NONE
	INTEGER :: J
	REAL :: X, I, H, F, A, B
	
	PRINT*, "DIGITE O LIMITE INFERIOR E SUPERIOR DA INTEGRAL"
	READ*, A
	READ*, B
	
	J=0
	X=A
	I=0
	H=0.001E0
	
	
	DO
	
		IF (X>B) EXIT
	
		
		I=I+(H/2E0)*(F(X-H)+F(X))
	
		X=X+H
		
	END DO
	
	PRINT*, "A INTEGRAL DE F(X) DE",A,"A",B,"É:"
	PRINT*, I

END PROGRAM TESTE_INTEGRAL

REAL FUNCTION F(X)
	IMPLICIT NONE
	REAL :: X
	
	F=X*EXP(X*2E0)
	
	RETURN
	
	END FUNCTION F