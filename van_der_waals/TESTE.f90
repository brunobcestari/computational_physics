PROGRAM VAN_DER_WAALS
	
	IMPLICIT NONE

	INTEGER :: I1	

	REAL :: PVT,DIF,t,v,a,b,c,d,e,I,J,RES,EQ,A1,A2

	CHARACTER(LEN=1024) :: GRAF,GRAF2	

	DO I1=1,18   !DO (T)
	
	PRINT*,"CHEGUEI AQUI"
	
	WRITE(GRAF,*) t,".txt"
	GRAF=ADJUSTL(GRAF)
	OPEN (UNIT=1,FILE=GRAF)	

	t=0.1*(I1+2)

	v=0.34

		IF (t>=1) THEN			

					DO !V DE 0,34 ATE 31
						
						PRINT*,"CHEGUEI AQUI"
						
						v=v+1E-3

						WRITE(1,*),v,PVT(v,t)	

						IF (V>=31) EXIT
				
					END DO
			
				ELSE

					DO	
					
						PRINT*,"CHEGUEI AQUI"

						v=v+1E-3					

						I=0.34
						J=1

						CALL RAIZ (I,J,RES)

						d=RES			
				
						I=1
						J=(4/t)
				
						CALL RAIZ (I,J,RES)

						e=RES

						I=0.34
						J=d

						CALL RAIZ2 (I,J,RES)

						a=RES

						I=d
						J=e

						CALL RAIZ2 (I,J,RES)

						b=RES
	
						I=e
						J=((8*t)/(3*PVT(v,t)))+1/3

						CALL RAIZ2 (I,J,RES)

						c=RES	
				
				
						!COMPARAÇAO DAS AREAS

						A1=PVT(v,t)*(b-a)+(8*t/3)*LOG((3*a-1)/(3*b-1))-(3/b)+(3/a)

						A2=-PVT(v,t)*(c-d)-(8*t/3)*LOG((3*a-1)/(3*b-1))+(3/b)-(3/b)

						IF (ABS(A1-A2)<1E-3) THEN
						
							DO						
					
								PRINT*,"CHEGUEI AQUI"
						
								v=v+1E-3												

								IF (v>a .AND. v<b) THEN

										EQ=PVT(a,t)
	
									ELSE

										EQ=PVT(v,t)
								
								END IF

								WRITE(1,*),v,EQ
								
								END IF
								
								IF (v>=31) EXIT

							END DO
							
							
						

					END DO
								
					
					
		END IF
					
	END DO
	
	CLOSE(UNIT=1)					

END PROGRAM VAN_DER_WAALS


!-----------------------------------------------------------------------


REAL FUNCTION PVT(V,T)

	REAL :: V,T

	PVT=((8*T)/(3*V-1))-3/(V**2)
	
	RETURN

END FUNCTION PVT


!-------------------------------------------------------------------------


REAL FUNCTION DIF(V,T)

	REAL :: V,T

	DIF=6*((3*V-1)**2)-24*T*(V**3)

	RETURN

END FUNCTION DIF

!------------------------------------------------------------------------

SUBROUTINE RAIZ (a,b,resp)

REAL :: x1,x2,a,b,resp

	x1=0

	x2=0
	
	DO

		x1=((a+b)/2)

		IF ((DIF(x,t)*DIF(b,t)<0)) THEN
		
				b=x

			ELSE

				a=x

		END IF
	
		x2=(a+b)/2

		IF (ABS(x1-x2)<0.001) EXIT

	END DO

	resp=(x1+x2)/2


END SUBROUTINE RAIZ

!---------------------------------------------------------------------


SUBROUTINE RAIZ2 (a,b,resp)

	REAL :: x1,x2,a,b,resp

	x1=0

	x2=0

	DO

		x1=(a+b)/2

		IF (PVT(x1,t)*PVT(b,t)<0) THEN

		
				b=x

			ELSE

				a=x
		
		END IF

	
		x2=(a+b)/2

		IF (ABS(x1-x2)<0.001) EXIT

	END DO

	resp=(x1+x2)/2

END SUBROUTINE RAIZ2
