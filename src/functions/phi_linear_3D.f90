SUBROUTINE phi_linear_3D(H,k,angle,x,y,z,d,omega,time,grav,phix,phiy,phiz,phi,phit)
!
USE Precision
IMPLICIT NONE
!
REAL(KIND=long), INTENT(IN)  :: H,k,angle,x,y,z,d,omega,time,grav
REAL(KIND=long), INTENT(OUT) :: phix,phiy,phiz
REAL(KIND=long), INTENT(OUT), OPTIONAL :: phi,phit
! REAL(KIND=long), OPTIONAL :: y,phi,phiyy !Boundary fitted ?
! Local variables
REAL(KIND=long) :: kx, ky, k_omegat, sink_omegat, cosk_omegat, temp1, temp2
!
!
kx=k*cos(angle)
ky=k*sin(angle)
!
k_omegat=kx*x+ky*y-omega*time
sink_omegat = sin(k_omegat)
cosk_omegat = cos(k_omegat)
!
temp1 = COSH(k*(z+d))/COSH(k*d)
temp2 = H*0.5d0*grav/omega
!
phiz = temp2*sink_omegat*temp1*k*tanh(k*(z+d))
phix = temp2*kx*cosk_omegat*temp1
phiy = temp2*ky*cosk_omegat*temp1
!
IF(present(phit)) THEN
    phit = -temp2*omega*cosk_omegat*temp1
ENDIF
IF(present(phi)) THEN
    phi  =  temp2*sink_omegat*temp1
ENDIF

END SUBROUTINE phi_linear_3D
