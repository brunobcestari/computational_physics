PROGRAM VEL_SIM_3_8
	IMPLICIT NONE
	REAL :: M,T,KB, VI, VF, V, F, I, H, P
	
	M = 2E0*14E0*1.67E0*1E-27
	T = 300
	KB = 1.38E0-23
	H=0.01
	
	
	
	PRINT*,"QUAL A VELOCIDADE INFERIOR?"
	READ*, VI
	PRINT*, "QUAL A VELOCIDADE SUPERIOR?"
	READ*, VF
	
	V=VI
	
	DO 
		
		IF (V>VF) EXIT
		
		I=I+(3*H/8)*(F(V)+3E0*F(V+H)+3E0*F(V+2*H)+F(V+3*H))
		V=V+3*H
		
		
	END DO
	
	P=100*I
	
	PRINT*, "A PORCENTAGEM DE PARTICULAS ENTRE",VI,"E",VF,"É:"
	PRINT*, P
		
		
END PROGRAM VEL_SIM_3_8


REAL FUNCTION F(V)
	IMPLICIT NONE
	REAL :: M,T,KB, PI=3.141592, V
	
	M = 2E0*14E0*1.67E0*1E-27
	T = 300
	KB = 1.38E-23
	
	F=SQRT((2E0/PI)*((M/(KB*T))**3E0))*(V**2)*EXP((-1)*(M*(V**2E0))/(2E0*KB*T))
	
	RETURN
	
END FUNCTION F
