PROGRAM RAIZ_NEWTON

	IMPLICIT NONE
	
	REAL :: F,DF,X,K,TOL,X0,X1,X2

	X=0
	K=0
	TOL=0
	
	PRINT*, "DIGITE O VALOR DE X0"
	READ*, X

	PRINT*, "DIGITE A TOLERANCIA"
	READ*, TOL

	X0=X

	DO

		X=X-((F(X))/(DF(X)))

		K=ABS(F(X))

		
		IF (K<TOL) THEN
			X1=X  !PRIMEIRA RAIZ DA EQUAÇAO
									
			IF (DF(X0)*DF(X1-X0)<=0 .AND. F(X0)*F(X1-2*TOL)<0) THEN !PROCURANDO UMA POSSIVEL RAIZ EM UM RAIO IGUAL A X0
					X0=X1
					EXIT
				ELSE
					EXIT
			END IF

			EXIT
		END IF

	END DO

	IF (X0==X1) THEN
		
		X=X0-TOL  !PARA NAO ENCONTRAR A MESMA RAIZ

		DO

			X=X+((F(X))/(ABS(DF(X))))   !O SINAL DE + E O ABS SAO PARA CORRIGIR O SINAL NO LADO NEGATIVO DA FUNÇAO
		
			K=ABS(F(X))

			IF (K<TOL) THEN
				X2=X
				EXIT
			END IF

		END DO


		ELSE

		X2=X1

	END IF
	
	PRINT*, "AS RAIZES DA EQUAÇAO SAO",X1,X2
		

END PROGRAM RAIZ_NEWTON


REAL FUNCTION F(A)

	REAL :: A
	F=(A**2)-(4*A)+3
	RETURN

END FUNCTION F

REAL FUNCTION DF(B)

	REAL :: B
	DF=(2*B)-4
	RETURN

END FUNCTION DF