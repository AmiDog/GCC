! { dg-do run }
!
! PR fortran/33197
!
! Complex inverse trigonometric functions
! and complex inverse hyperbolic functions
!
! Run-time evaluation check
!
module test
  implicit none
  real(4), parameter :: eps4 = epsilon(0.0_4)*4.0_4
  real(8), parameter :: eps8 = epsilon(0.0_8)*2.0_8
  interface check
    procedure check4, check8
  end interface check
contains
  SUBROUTINE check4(z, zref)
    complex(4), intent(in) :: z, zref
    if (    abs (real(z)-real(zref)) > eps4 &
        .or.abs (aimag(z)-aimag(zref)) > eps4) then
      print '(a,/,2((2g0," + I ",g0),/))', "check4:","   z=",z,'zref=',zref
      print '(a,g0," + I*",g0,"  eps=",g0)', 'Diff: ', &
                                 real(z)-real(zref), &
                                 aimag(z)-aimag(zref), eps4
      call abort()
    end if
  END SUBROUTINE check4
  SUBROUTINE check8(z, zref)
    complex(8), intent(in) :: z, zref
    if (    abs (real(z)-real(zref)) > eps8 &
        .or.abs (aimag(z)-aimag(zref)) > eps8) then
      print '(a,/,2((2g0," + I ",g0),/))', "check8:","   z=",z,'zref=',zref
      print '(a,g0," + I*",g0,"  eps=",g0)', 'Diff: ', &
                                 real(z)-real(zref), &
                                 aimag(z)-aimag(zref), eps8
      call abort()
    end if
  END SUBROUTINE check8
end module test

PROGRAM ArcTrigHyp
  use test
  IMPLICIT NONE
  complex(4), volatile :: z4
  complex(8), volatile :: z8

!!!!! ZERO !!!!!!

  ! z = 0
  z4 = cmplx(0.0_4, 0.0_4, kind=4)
  z8 = cmplx(0.0_8, 0.0_8, kind=8)

  ! Exact: 0
  call check(asin(z4), cmplx(0.0_4, 0.0_4, kind=4))
  call check(asin(z8), cmplx(0.0_8, 0.0_8, kind=8))
  ! Exact: Pi/2 = 1.5707963267948966192313216916397514
  call check(acos(z4), cmplx(1.57079632679489661920_4, 0.0_4, kind=4))
  call check(acos(z8), cmplx(1.57079632679489661920_8, 0.0_8, kind=8))
  ! Exact: 0
  call check(atan(z4), cmplx(0.0_4, 0.0_4, kind=4))
  call check(atan(z8), cmplx(0.0_8, 0.0_8, kind=8))
  ! Exact: 0
  call check(asinh(z4), cmplx(0.0_4, 0.0_4, kind=4))
  call check(asinh(z8), cmplx(0.0_8, 0.0_8, kind=8))
  ! Exact: I*Pi/2 = I*1.5707963267948966192313216916397514
  call check(acosh(z4), cmplx(0.0_4, 1.57079632679489661920_4, kind=4))
  call check(acosh(z8), cmplx(0.0_8, 1.57079632679489661920_8, kind=8))
  ! Exact: 0
  call check(atanh(z4), cmplx(0.0_4, 0.0_4, kind=4))
  call check(atanh(z8), cmplx(0.0_8, 0.0_8, kind=8))


!!!!! POSITIVE NUMBERS !!!!!!

  ! z = tanh(1.0)
  z4 = cmplx(0.76159415595576488811945828260479359_4, 0.0_4, kind=4)
  z8 = cmplx(0.76159415595576488811945828260479359_8, 0.0_8, kind=8)

  ! Numerically: 0.86576948323965862428960184619184444
  call check(asin(z4), cmplx(0.86576948323965862428960184619184444_4, 0.0_4, kind=4))
  call check(asin(z8), cmplx(0.86576948323965862428960184619184444_8, 0.0_8, kind=8))
  ! Numerically: 0.70502684355523799494171984544790700
  call check(acos(z4), cmplx(0.70502684355523799494171984544790700_4, 0.0_4, kind=4))
  call check(acos(z8), cmplx(0.70502684355523799494171984544790700_8, 0.0_8, kind=8))
  ! Numerically: 0.65088016802300754993807813168285564
  call check(atan(z4), cmplx(0.65088016802300754993807813168285564_4, 0.0_4, kind=4))
  call check(atan(z8), cmplx(0.65088016802300754993807813168285564_8, 0.0_8, kind=8))
  ! Numerically: 0.70239670712987482778422106260749699
  call check(asinh(z4), cmplx(0.70239670712987482778422106260749699_4, 0.0_4, kind=4))
  call check(asinh(z8), cmplx(0.70239670712987482778422106260749699_8, 0.0_8, kind=8))
  ! Numerically: 0.70502684355523799494171984544790700*I
  call check(acosh(z4), cmplx(0.0_4, 0.70502684355523799494171984544790700_4, kind=4))
  call check(acosh(z8), cmplx(0.0_8, 0.70502684355523799494171984544790700_8, kind=8))
  ! Exact: 1
  call check(atanh(z4), cmplx(1.0_4, 0.0_4, kind=4))
  call check(atanh(z8), cmplx(1.0_8, 0.0_8, kind=8))


  ! z = I*tanh(1.0)
  z4 = cmplx(0.0_4, 0.76159415595576488811945828260479359_4, kind=4)
  z8 = cmplx(0.0_8, 0.76159415595576488811945828260479359_8, kind=8)

  ! Numerically: I*0.70239670712987482778422106260749699
  call check(asin(z4), cmplx(0.0_4, 0.70239670712987482778422106260749699_4, kind=4))
  call check(asin(z8), cmplx(0.0_8, 0.70239670712987482778422106260749699_8, kind=8))
  ! Numerically: 1.5707963267948966192313216916397514 - I*0.7023967071298748277842210626074970
  call check(acos(z4), cmplx(1.5707963267948966192313216916397514_4, -0.7023967071298748277842210626074970_4, kind=4))
  call check(acos(z8), cmplx(1.5707963267948966192313216916397514_8, -0.7023967071298748277842210626074970_8, kind=8))
  ! Exact: I*1
  call check(atan(z4), cmplx(0.0_4, 1.0_4, kind=4))
  call check(atan(z8), cmplx(0.0_8, 1.0_8, kind=8))
  ! Numerically: I*0.86576948323965862428960184619184444
  call check(asinh(z4), cmplx(0.0_4, 0.86576948323965862428960184619184444_4, kind=4))
  call check(asinh(z8), cmplx(0.0_8, 0.86576948323965862428960184619184444_8, kind=8))
  ! Numerically: 0.7023967071298748277842210626074970 + I*1.5707963267948966192313216916397514
  call check(acosh(z4), cmplx(0.7023967071298748277842210626074970_4, 1.5707963267948966192313216916397514_4, kind=4))
  call check(acosh(z8), cmplx(0.7023967071298748277842210626074970_8, 1.5707963267948966192313216916397514_8, kind=8))
  ! Numerically: I*0.65088016802300754993807813168285564
  call check(atanh(z4), cmplx(0.0_4, 0.65088016802300754993807813168285564_4, kind=4))
  call check(atanh(z8), cmplx(0.0_8, 0.65088016802300754993807813168285564_8, kind=8))


  ! z = (1+I)*tanh(1.0)
  z4 = cmplx(0.76159415595576488811945828260479359_4, 0.76159415595576488811945828260479359_4, kind=4)
  z8 = cmplx(0.76159415595576488811945828260479359_8, 0.76159415595576488811945828260479359_8, kind=8)

  ! Numerically: 0.59507386031622633330574869409179139 + I*0.82342412550090412964986631390412834
  call check(asin(z4), cmplx(0.59507386031622633330574869409179139_4, 0.82342412550090412964986631390412834_4, kind=4))
  call check(asin(z8), cmplx(0.59507386031622633330574869409179139_8, 0.82342412550090412964986631390412834_8, kind=8))
  ! Numerically: 0.97572246647867028592557299754796005 - I*0.82342412550090412964986631390412834
  call check(acos(z4), cmplx(0.97572246647867028592557299754796005_4, -0.82342412550090412964986631390412834_4, kind=4))
  call check(acos(z8), cmplx(0.97572246647867028592557299754796005_8, -0.82342412550090412964986631390412834_8, kind=8))
  ! Numerically: 0.83774433133636226305479129936568267 + I*0.43874835208710654149508159123595167
  call check(atan(z4), cmplx(0.83774433133636226305479129936568267_4, 0.43874835208710654149508159123595167_4, kind=4))
  call check(atan(z8), cmplx(0.83774433133636226305479129936568267_8, 0.43874835208710654149508159123595167_8, kind=8))
  ! Numerically: 0.82342412550090412964986631390412834 + I*0.59507386031622633330574869409179139
  call check(asinh(z4), cmplx(0.82342412550090412964986631390412834_4, 0.59507386031622633330574869409179139_4, kind=4))
  call check(asinh(z8), cmplx(0.82342412550090412964986631390412834_8, 0.59507386031622633330574869409179139_8, kind=8))
  ! Numerically: 0.82342412550090412964986631390412834 + I*0.97572246647867028592557299754796005
  call check(acosh(z4), cmplx(0.82342412550090412964986631390412834_4, 0.97572246647867028592557299754796005_4, kind=4))
  call check(acosh(z8), cmplx(0.82342412550090412964986631390412834_8, 0.97572246647867028592557299754796005_8, kind=8))
  ! Numerically: 0.43874835208710654149508159123595167 + I*0.83774433133636226305479129936568267
  call check(atanh(z4), cmplx(0.43874835208710654149508159123595167_4, 0.83774433133636226305479129936568267_4, kind=4))
  call check(atanh(z8), cmplx(0.43874835208710654149508159123595167_8, 0.83774433133636226305479129936568267_8, kind=8))


  ! z = 1+I
  z4 = cmplx(1.0_4, 1.0_4, kind=4)
  z8 = cmplx(1.0_8, 1.0_8, kind=8)

  ! Numerically: 0.66623943249251525510400489597779272 + I*1.06127506190503565203301891621357349
  call check(asin(z4), cmplx(0.66623943249251525510400489597779272_4, 1.06127506190503565203301891621357349_4, kind=4))
  call check(asin(z8), cmplx(0.66623943249251525510400489597779272_8, 1.06127506190503565203301891621357349_8, kind=8))
  ! Numerically: 0.90455689430238136412731679566195872 - I*1.06127506190503565203301891621357349
  call check(acos(z4), cmplx(0.90455689430238136412731679566195872_4, -1.06127506190503565203301891621357349_4, kind=4))
  call check(acos(z8), cmplx(0.90455689430238136412731679566195872_8, -1.06127506190503565203301891621357349_8, kind=8))
  ! Numerically: 1.01722196789785136772278896155048292 + I*0.40235947810852509365018983330654691
  call check(atan(z4), cmplx(1.01722196789785136772278896155048292_4, 0.40235947810852509365018983330654691_4, kind=4))
  call check(atan(z8), cmplx(1.01722196789785136772278896155048292_8, 0.40235947810852509365018983330654691_8, kind=8))
  ! Numerically: 1.06127506190503565203301891621357349 + I*0.66623943249251525510400489597779272
  call check(asinh(z4), cmplx(1.06127506190503565203301891621357349_4, 0.66623943249251525510400489597779272_4, kind=4))
  call check(asinh(z8), cmplx(1.06127506190503565203301891621357349_8, 0.66623943249251525510400489597779272_8, kind=8))
  ! Numerically: 1.06127506190503565203301891621357349 + I*0.90455689430238136412731679566195872
  call check(acosh(z4), cmplx(1.06127506190503565203301891621357349_4, 0.90455689430238136412731679566195872_4, kind=4))
  call check(acosh(z8), cmplx(1.06127506190503565203301891621357349_8, 0.90455689430238136412731679566195872_8, kind=8))
  ! Numerically: 0.40235947810852509365018983330654691 + I*1.01722196789785136772278896155048292
  call check(atanh(z4), cmplx(0.40235947810852509365018983330654691_4, 1.01722196789785136772278896155048292_4, kind=4))
  call check(atanh(z8), cmplx(0.40235947810852509365018983330654691_8, 1.01722196789785136772278896155048292_8, kind=8))


  ! z = (1+I)*1.1
  z4 = cmplx(1.1_4, 1.1_4, kind=4)
  z8 = cmplx(1.1_8, 1.1_8, kind=8)

  ! Numerically: 0.68549840630267734494444454677951503 + I*1.15012680127435581678415521738176733
  call check(asin(z4), cmplx(0.68549840630267734494444454677951503_4, 1.15012680127435581678415521738176733_4, kind=4))
  call check(asin(z8), cmplx(0.68549840630267734494444454677951503_8, 1.15012680127435581678415521738176733_8, kind=8))
  ! Numerically: 0.8852979204922192742868771448602364 - I*1.1501268012743558167841552173817673
  call check(acos(z4), cmplx(0.8852979204922192742868771448602364_4, -1.1501268012743558167841552173817673_4, kind=4))
  call check(acos(z8), cmplx(0.8852979204922192742868771448602364_8, -1.1501268012743558167841552173817673_8, kind=8))
  ! Numerically: 1.07198475450905931839240655913126728 + I*0.38187020129010862908881230531688930
  call check(atan(z4), cmplx(1.07198475450905931839240655913126728_4, 0.38187020129010862908881230531688930_4, kind=4))
  call check(atan(z8), cmplx(1.07198475450905931839240655913126728_8, 0.38187020129010862908881230531688930_8, kind=8))
  ! Numerically: 1.15012680127435581678415521738176733 + I*0.68549840630267734494444454677951503
  call check(asinh(z4), cmplx(1.15012680127435581678415521738176733_4, 0.68549840630267734494444454677951503_4, kind=4))
  call check(asinh(z8), cmplx(1.15012680127435581678415521738176733_8, 0.68549840630267734494444454677951503_8, kind=8))
  ! Numerically: 1.1501268012743558167841552173817673 + I*0.8852979204922192742868771448602364
  call check(acosh(z4), cmplx(1.1501268012743558167841552173817673_4, 0.8852979204922192742868771448602364_4, kind=4))
  call check(acosh(z8), cmplx(1.1501268012743558167841552173817673_8, 0.8852979204922192742868771448602364_8, kind=8))
  ! Numerically: 0.38187020129010862908881230531688930 + I*1.07198475450905931839240655913126728
  call check(atanh(z4), cmplx(0.38187020129010862908881230531688930_4, 1.07198475450905931839240655913126728_4, kind=4))
  call check(atanh(z8), cmplx(0.38187020129010862908881230531688930_8, 1.07198475450905931839240655913126728_8, kind=8))


!!!!! Negative NUMBERS !!!!!!
  ! z = -(1+I)*1.1
  z4 = cmplx(-1.1_4, -1.1_4, kind=4)
  z8 = cmplx(-1.1_8, -1.1_8, kind=8)

  ! Numerically: -0.68549840630267734494444454677951503 - I*1.15012680127435581678415521738176733
  call check(asin(z4), cmplx(-0.68549840630267734494444454677951503_4, -1.15012680127435581678415521738176733_4, kind=4))
  call check(asin(z8), cmplx(-0.68549840630267734494444454677951503_8, -1.15012680127435581678415521738176733_8, kind=8))
  ! Numerically: 2.2562947330975739641757662384192665 + I*1.1501268012743558167841552173817673
  call check(acos(z4), cmplx(2.2562947330975739641757662384192665_4, 1.1501268012743558167841552173817673_4, kind=4))
  call check(acos(z8), cmplx(2.2562947330975739641757662384192665_8, 1.1501268012743558167841552173817673_8, kind=8))
  ! Numerically: -1.07198475450905931839240655913126728 - I*0.38187020129010862908881230531688930
  call check(atan(z4), cmplx(-1.07198475450905931839240655913126728_4, -0.38187020129010862908881230531688930_4, kind=4))
  call check(atan(z8), cmplx(-1.07198475450905931839240655913126728_8, -0.38187020129010862908881230531688930_8, kind=8))
  ! Numerically: -1.15012680127435581678415521738176733 - I*0.68549840630267734494444454677951503
  call check(asinh(z4), cmplx(-1.15012680127435581678415521738176733_4, -0.68549840630267734494444454677951503_4, kind=4))
  call check(asinh(z8), cmplx(-1.15012680127435581678415521738176733_8, -0.68549840630267734494444454677951503_8, kind=8))
  ! Numerically: 1.1501268012743558167841552173817673 - I*2.2562947330975739641757662384192665
  call check(acosh(z4), cmplx(1.1501268012743558167841552173817673_4, -2.2562947330975739641757662384192665_4, kind=4))
  call check(acosh(z8), cmplx(1.1501268012743558167841552173817673_8, -2.2562947330975739641757662384192665_8, kind=8))
  ! Numerically: 0.38187020129010862908881230531688930 + I*1.07198475450905931839240655913126728
  call check(atanh(z4), cmplx(-0.38187020129010862908881230531688930_4, -1.07198475450905931839240655913126728_4, kind=4))
  call check(atanh(z8), cmplx(-0.38187020129010862908881230531688930_8, -1.07198475450905931839240655913126728_8, kind=8))
END PROGRAM ArcTrigHyp
