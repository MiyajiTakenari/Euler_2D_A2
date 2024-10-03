program euler_2D_A2
    use params
    use globals
    use interface_mod

    implicit none
    integer :: n

    !time.txtをフォーマット
    open(50, file = 'time.txt')
    write(50, *) 'filename,     n,      time'
    write(50, *)
    write(50, *)
    close(50)

    !計算開始
    call alloc(1)       !配列割り付け
    call glid           !座標定義
    call init           !初期条件設定
    call metrics        !metrics計算
    !時間進める
    do n = 1, nmax
        call bound      !境界条件
        call cflc       !CFLcondition
        if (exit_flag == 1) exit
        call integ      !fluxから基本量計算
        call calc_res   !残差計算
        call writed(n)  !data出力
    end do
    write(*,'(a9, i3)') 'ntime = ', n - 1

    call alloc(0)       !割り付け解放

end program euler_2D_A2