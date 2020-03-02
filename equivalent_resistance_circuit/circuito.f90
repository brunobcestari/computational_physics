PROGRAM CIRCUITO

	IMPLICIT NONE

	REAL :: O,x1,x2,x3,E,PIVO,V=110,VB=0,VC=0,VD=0,VE=0,VF=0,VG=0,VH=0,VI=0,REF

	INTEGER :: I,J,K,L,M,N,T,Z,L1

	REAL, DIMENSION (:,:), ALLOCATABLE :: A
	
	REAL, DIMENSION (:), ALLOCATABLE :: X

	REAL, DIMENSION (:), ALLOCATABLE :: B
	
	REAL, DIMENSION (12):: R

	N=7
	M=N+1

	K=0
	
	PRINT*, "DIGITE O VALOR DE SUAS RESISTENCIAS"
	READ*,R(:)

	ALLOCATE(A(N,M))

	ALLOCATE(X(N))

	ALLOCATE(B(M))
	
	
      A(1,1)=((1/R(1))+(1/R(3))+(1/R(4)));   A(1,2)=0;
      A(1,3)=-(1/R(3));                      A(1,4)=-(1/R(4));
      A(1,5)=0;                              A(1,6)=0;
      A(1,7)=0;                              A(1,8)=(v/R(1))

      A(2,1)=0;                              A(2,2)=((1/R(2))+(1/R(5))+(1/R(6)));
      A(2,3)=0;                              A(2,4)=-(1/R(5));
      A(2,5)=-(1/R(6));                      A(2,6)=0;
      A(2,7)=0;                              A(2,8)=(v/R(2))
      
      A(3,1)=(1/R(3));                       A(3,2)=0;
      A(3,3)=-((1/R(3))+(1/R(7)));           A(3,4)=0;
      A(3,5)=0;                              A(3,6)=(1/R(7));
      A(3,7)=0;                              A(3,8)=0
      
      A(4,1)=(1/R(4));                       A(4,2)=(1/R(5));
      A(4,3)=0;                              A(4,4)=-((1/R(4))+(1/R(5))+(1/R(8))+(1/R(9)));
      A(4,5)=0;                              A(4,6)=(1/R(8));
      A(4,7)=(1/R(9));                       A(4,8)=0
      
      A(5,1)=0;                              A(5,2)=(1/R(6));
      A(5,3)=0;                              A(5,4)=0;
      A(5,5)=-((1/R(6))+(1/R(10)));          A(5,6)=0;
      A(5,7)=(1/R(10));                      A(5,8)=0
      
      A(6,1)=0;                              A(6,2)=0;
      A(6,3)=(1/R(7));                       A(6,4)=(1/R(8));
      A(6,5)=0;                              A(6,6)=-((1/R(7))+(1/R(8))+(1/R(11)));
      A(6,7)=0;                              A(6,8)=0
      
      A(7,1)=0;                              A(7,2)=0;
      A(7,3)=0;                              A(7,4)=(1/R(9));
      A(7,5)=(1/R(10));                      A(7,6)=0;
      A(7,7)=-((1/R(9))+(1/R(10))+(1/R(12)));A(7,8)=0
	
	
	DO L=1,N

		PRINT*,A(L,:)
	
	END DO


	DO J=1,M-1

		K=K+1				

		PIVO=A(K,K)
		
		L1=K		

		DO Z=J,N

			IF (ABS(A(Z,K))>PIVO) THEN
				
				PIVO=A(Z,K)

				L1=Z

			END IF

		END DO

		B(:)=A(L1,:)
		A(L1,:)=A(J,:)
		A(J,:)=B(:)

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
	
	PRINT*,R
	
	DO I=1,N,1
        WRITE (*,"('V',i1,f7.2)")I+1,X(I)
    END DO
    
    print*, " "
    REF=V/((X(7)/R(7)) + (X(6)/R(6)))
    write (*,"('A RESISTENCIA EQUIVALENTE E',f6.2)")ref
	
END PROGRAM CIRCUITO
