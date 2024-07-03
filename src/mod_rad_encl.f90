
module mod_rad_encl
  ! things related to enclosure radiation in room
  ! enclosure equations are written in matrix-vector format
  ! {q_r} = [G]{e_b} 
  ! {e_b} = vector of black body emissive powers, sigma*T^4
  ! {q_r} = vector of radiant heat fluxes

  use mod_precision
  implicit none

  character(len=3)            :: rad_encl   ! yes or no
  integer,   parameter        :: ns = 4     ! no surfaces in encl
  integer,   dimension(ns+4)  :: nn_1       ! input node array
  integer,   dimension(ns)    :: nn_er      ! node no's of enclosure
  integer,   dimension(ns,ns) :: nn_encl_rad ! node no j of side m
  integer,   dimension(ns)    :: nn_i       ! node no i of side m
  integer,   dimension(ns)    :: nn_j       ! node no j of side m
  real(dp),  dimension(ns)    :: Tw         ! vector wall temp
  real(dp),  dimension(ns,ns) :: F          ! view factor matrix
  real(dp),  dimension(ns+2)  :: s          ! side lengths + 2 diag
  real(dp),  dimension(ns,ns) :: d, cx, cxs ! [D], [C], saved value of [C]
  real(dp),  dimension(ns,ns) :: i_mat      ! matrix [I]
  real(dp),  dimension(ns,ns) :: G_mat      ! {q_r} = [G]{e_b}
  real(dp),  dimension(ns)    :: eps        ! vector, emit
  real(dp),  dimension(ns,ns) :: eps_mat    ! emittance matrix
  real(dp),  dimension(ns)    :: rho_vec    ! reflectance vector
  real(dp),  dimension(ns,ns) :: rho_mat    ! reflectance matrix
  real(dp),  dimension(ns,ns) :: fxrho      ! [F][rho]
  real(dp),  dimension(ns,ns) :: imfxrho    ! [I] - [F][rho]

end module mod_rad_encl