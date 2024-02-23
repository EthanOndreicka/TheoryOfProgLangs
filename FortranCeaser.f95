program BonillaFortran
    implicit none
    character(len=100) :: toDecrypt, decrypted
    
    print *, 'Encrypt/Decrypt Ex1'
    print *
    
    toDecrypt = encrypt('Operation Daybreak', 2)
    print *, 'Encrypted:', toDecrypt
    print *
    decrypted = decrypt(toDecrypt, 2)
    print *, 'Decrypted:', decrypted
    print *
    
    print *, 'Encrypt/Decrypt Ex2'
    print *
    
    toDecrypt = encrypt('Shadow Wizard Money Gang', 7)
    print *, 'Encrypted:', toDecrypt
    print *
    decrypted = decrypt(toDecrypt, 7)
    print *, 'Decrypted:', decrypted
    print *
    
    print *, 'Encrypt/Decrypt Ex3'
    print *
    
    toDecrypt = encrypt('English Bulldog', 15)
    print *, 'Encrypted:', toDecrypt
    print *
    decrypted = decrypt(toDecrypt, 15)
    print *, 'Decrypted:', decrypted
    print *
    
    print *, 'Solve Ex1'
    print*
    call solve('Hal', 26)
    print*
    print *, 'Solve Ex2'
    print*
    call solve('The quick brown fox jumps over the lazy dog', 26)
    print*
    print *, 'Solve Ex3'
    print*
    call solve('Pack my box with five dozen liquor jugs', 26)
    print*

contains

    function to_upper(input_str)
        character(len=*), intent(in) :: input_str
        character(len=len(input_str)) :: to_upper
        integer :: i
        
        to_upper = input_str
        do i = 1, len(input_str)
            if (ichar(input_str(i:i)) >= ichar('a') .and. ichar(input_str(i:i)) <= ichar('z')) then
                to_upper(i:i) = char(ichar(input_str(i:i)) - ichar('a') + ichar('A'))
            end if
        end do
    end function to_upper

    
    function encrypt(str, shift)
        character(len=*), intent(in) :: str
        integer, intent(in) :: shift
        character(len=len(str)) :: encrypt
        character(len=len(str)) :: str_upper
        integer :: i
        character :: ch
        
        str_upper = to_upper(str)
        encrypt = str_upper
        do i = 1, len(str_upper)
            ch = str_upper(i:i)
            if (ch >= 'A' .and. ch <= 'Z') then
                ch = char(mod((ichar(ch) - ichar('A') + shift), 26) + ichar('A'))
            end if
            encrypt(i:i) = ch
        end do
    end function encrypt
    
    function decrypt(str, shift)
        character(len=*), intent(in) :: str
        integer, intent(in) :: shift
        character(len=len(str)) :: decrypt
        character(len=len(str)) :: str_upper
        integer :: i
        character :: ch
        
        str_upper = to_upper(str)
        decrypt = str_upper
        do i = 1, len(str_upper)
            ch = str_upper(i:i)
            if (ch >= 'A' .and. ch <= 'Z') then
                ch = char(mod((ichar(ch) - ichar('A') - shift + 26), 26) + ichar('A'))
            end if
            decrypt(i:i) = ch
        end do
    end function decrypt

    
    subroutine solve(input_str, iterations)
        character(len=*), intent(in) :: input_str
        integer, intent(in) :: iterations
        character(len=50) :: encryptedResult
        character(len=1) :: ch
        character(len=len(input_str)) :: str_upper
        integer :: i, j
        
        str_upper = to_upper(input_str)
        do i = iterations, 0, -1
            encryptedResult = encrypt(str_upper, i)
            write(*, '(A, I3, A)', advance="no") ' Caesar ', i, ': '
            do j = 1, len(encryptedResult)
                ch = encryptedResult(j:j)
                write(*, "(A)", advance="no") ch
            end do
            print *
        end do
    end subroutine solve



end program BonillaFortran
