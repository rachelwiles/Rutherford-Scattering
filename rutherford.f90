PROGRAM rutherford
 !To be compiled alongside rutherford_sub.f90

		!**************************
		!Rachel Wiles
		!Program to model Rutherford Scattering
		!**************************

IMPLICIT NONE

!Variables established for user input
!Real variables are established as double precison to avoid rounding errors
DOUBLE PRECISION :: input_vy
DOUBLE PRECISION :: rx

!User to give value to generate starting velocity in y direction for alpha particle
WRITE(*,*) 'Input an initial velocity in y direction as a proportion of speed of light in a.u. units:'
READ(*,*) input_vy
WRITE(*,*) 'Initial y velocity', input_vy, 'c inputted'

!User to give value to generate staring displacement in x direction for alpha particle
WRITE(*,*) 'Input and initial displacement in x direction in a.u. units:'
READ(*,*) rx
WRITE(*,*) 'Initial x displacement', rx, 'inputted'

!Subroutine called to calculate and iterate through motion of alpha particle
 CALL calculations

!User informed program has been successful and destination of output before closing
WRITE(*,*) 'Experiment successful. Data outputted to file rutherford.out and graphs completed'
WRITE(*,*) 'Program exiting'

END PROGRAM rutherford
