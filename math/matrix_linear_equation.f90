PROGRAM MATRIX

	IMPLICIT NONE

	REAL :: O,x1,x2,x3,E

	INTEGER :: I,J,K,L,M,N,T

	REAL, DIMENSION (:,:), ALLOCATABLE :: A
	
	REAL, DIMENSION (:), ALLOCATABLE :: X

	M=0
	N=0

	PRINT*,"DIGITE A DIMENSAO DE SUA MATRIZ"
	READ*,N

	M=N+1

	K=0

	ALLOCATE(A(N,M))

	ALLOCATE(X(N))
	
	DO I=1,N

		PRINT*,"DIGITE A LINHA",I,"DE SUA MATRIZ"

		DO J=1,M

			PRINT*,"TERMO",J,"LINHA",I
			
			READ*,E

			A(I,J)=(E)

		END DO

	END DO

	
	DO L=1,N

		PRINT*,A(L,:)
	
	END DO


	DO J=1,M-1

		K=K+1				

		DO I=J,N-1
			
			O=A(I+1,J)/A(K,J)

			A(I+1,:)=-O*A(K,:)+A(I+1,:)	

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

	PRINT*,"AS RAIZES SAO"

	PRINT*,X
	
END PROGRAM MATRIX
