SUBROUTINE calculations
   !Subroutine to be compiled alongside rutherford.f90

IMPLICIT NONE

!All real variables established as double precision to avoid rounding errors
!Variables established for the parameters known beforehand and used in calculations
   DOUBLE PRECISION :: c, t, m
   INTEGER :: q_a, q_g, k, br, steps
!Variables established to calculate velocity of alpha particle throughout
   DOUBLE PRECISION :: input_vy, vx, vy, vx, vy
!Variables established to calculate position of alpha particle throughout
   DOUBLE PRECISION :: r, rx, ry, rx, ry, r_lim
!Variables established to find the force experienced by the alpha particle throughout
   DOUBLE PRECISION :: f, fx, fy
!Variables established to find the acceleration of the alpha particle throughout
   DOUBLE PRECISION :: ax, ay


	!----Parameters established beforehand ----!
	!All parameters given in a.u. units
	!Speed of light:
	 c = 137.035999
	!Time step:
	 t = 1d-5
	!Initial x velocity:
	 vx = 0
	!Charge on alpha particle:
	 q_a = 2     
	!Charge on gold particle:
	 q_g = 79
	!Coulombs constant:
	 k = 1
	!Mass of alpha particle:
	 m = 7294.3
	!Bohrs radius:
 	 br = 1
	!------------------------------------------!


!Initial y velocity should a proportion of speed of light in a.u. units
!As initially travelling along y-axis only, no need to account for an x velocity
   vy = input_vy * c

!Find the initial distance of the alpha particle from the gold particle
   ry = -0.005 * 1
   r = (rx**2 + ry**2)**0.5

!Set up a limit so as to not iterate once sufficient data has been collected
   r_lim = 1.1 * r

!Open file for the output before opening the do loop 
   OPEN (8, FILE='rutherford.out')

!Perform do loop to iterate through time steps whilst calculating
!Program stops iterating before 10000 iterations or until sufficient data has 
 !been collected when r_lim is met
   DO WHILE ((r .LT. r_lim) .AND. (steps .LT. 10000))

!Inlude a step counter 
   steps = steps + 1 

!Calculate the magnitude of the force 
   f = (k * (q_a * q_g)) / (r**2)

!Calculate magnitude of the force in separate x and y components
   fx = f * (rx / r)
   fy = f * (ry / r)

!Calculate the acceleration of the alpha particle
   ax = fx / m
   ay = fy / m

!Calculate the final velocity based on v = u + at
   vx = vx + (ax * t)
   vy = vy + (ay * t)

!Calculate the final displacement based on r = r + vt
   rx = rx + (vx * t)
   ry = ry + (vy * t)

!Reset the value of r with new rx and ry found before restarting the loop
   r = (rx**2 + ry**2)**0.5
 
!Write the new x and y positions of the alpha particle in every iteration to
 !the output file
 WRITE(8,*) rx, ry
  
 END DO

 CLOSE (8)

END SUBROUTINE calculations
