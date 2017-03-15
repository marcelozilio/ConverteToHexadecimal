

   MEMBER('ConverteToHexadecimal.clw')                     ! This is a MEMBER module

                     MAP
                       INCLUDE('CONVE003.INC'),ONCE        !Local module procedure declarations
                     END


zeros                PROCEDURE                             ! Declare Procedure
aux long
FilesOpened     BYTE(0)
  CODE
    do OpenFiles
    set(T23_NcmCalcSubst)
    loop
        next(T23_NcmCalcSubst)
        if errorcode() then break.
        aux = T23:CodProduto
        T23:CodProduto = format(aux, @N06)
        Access:T23_NcmCalcSubst.Update()
    end
    do CloseFiles
    message('fim')
!--------------------------------------
OpenFiles  ROUTINE
  Access:P01_Produtos.Open                                 ! Open File referenced in 'Other Files' so need to inform it's FileManager
  Access:P01_Produtos.UseFile                              ! Use File referenced in 'Other Files' so need to inform it's FileManager
  Access:T23_NcmCalcSubst.Open                             ! Open File referenced in 'Other Files' so need to inform it's FileManager
  Access:T23_NcmCalcSubst.UseFile                          ! Use File referenced in 'Other Files' so need to inform it's FileManager
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Access:P01_Produtos.Close
     Access:T23_NcmCalcSubst.Close
     FilesOpened = False
  END
