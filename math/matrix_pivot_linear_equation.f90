PROGRAM MATRIX_PIVO

	IMPLICIT NONE

	REAL :: O,x1,x2,x3,E,PIVO

	INTEGER :: I,J,K,L,M,N,T,Z,L1

	REAL, DIMENSION (:,:), ALLOCATABLE :: A
	
	REAL, DIMENSION (:), ALLOCATABLE :: X

	REAL, DIMENSION (:), ALLOCATABLE :: B

	M=0
	N=0

	PRINT*,"DIGITE A DIMENSAO DE SUA MATRIZ DOS COEFICIENTES"
	READ*,N

	M=N+1

	K=0

	ALLOCATE(A(N,M))

	ALLOCATE(X(N))

	ALLOCATE(B(M))
	
	DO I=1,N

		PRINT*,"DIGITE A LINHA",I,"DE SUA MATRIZ"

		DO J=1,M

			IF (J<M) THEN

					PRINT*,"TERMO",J,"LINHA",I
				ELSE

					PRINT*,"DIGITE O TERMO INDEPENDENTE"

			END IF

			
			READ*,E

			A(I,J)=(E)

		END DO

	END DO

	
	DO L=1,N

		PRINT*,A(L,:)
	
	END DO


	DO J=1,M-1

		K=K+1				

		PIVO=A(K,K)
		
		L1=K		

		DO Z=J,N

			IF (A(Z,K)<0) THEN

				A(Z,:)=-A(Z,:)
				
			END IF

			IF (ABS(A(Z,K))>PIVO) THEN
				
				PIVO=A(Z,K)

				L1=Z

			END IF

		END DO

		B(:)=A(L1,:)
		A(L1,:)=A(J,:)
		A(J,:)=B(:)

		DO I=J,N-1

			IF (A(K,J)/=0) THEN
			
				O=A(I+1,J)/A(K,J)

				A(I+1,:)=-O*A(K,:)+A(I+1,:)	

			END IF
			
		END DO

		PRINT*," "

		DO T=1,N

			PRINT*,A(T,:)

		END DO

	END DO

	PRINT*," "

	X(:)=0

	DO I=N,1,-1

		IF (I==N) THEN

				X(I)=(A(I,M))/(A(I,I))

			ELSE
				
				X(I)=(A(I,M))/(A(I,I))

				DO J=N,I+1,-1

					X(I)=X(I)-X(J)*(A(I,J)/A(I,I))	

				END DO
		
		END IF		

	END DO

	PRINT*," "

	PRINT*,"AS SOLUCOES SAO"

	PRINT*,X
	
END PROGRAM MATRIX_PIVO
