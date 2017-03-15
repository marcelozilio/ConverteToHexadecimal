

   MEMBER('ConverteToHexadecimal.clw')                     ! This is a MEMBER module

                     MAP
                       INCLUDE('CONVE002.INC'),ONCE        !Local module procedure declarations
                     END


exportaProdutosBalanca PROCEDURE                           ! Declare Procedure
ARQ       file,driver('TOPSPEED'),name('C:\Urano\ftp\pwd\Produtos_pwd'),pre(PROD),create,bindable,thread
porCod         key(PROD:codigo),nocase,opt,primary
record         record,pre()
codigo            long(6)
tipoProd          string(1)
descricao         string(30)
preco             real(9.2)
validade          string(4)
tipVal            string(1)
vPreco            string(1)
cLayout           string(3)
previsao          string(28)
               end
          end

CONFIG      file,driver('ASCII', '/CTRLZISEOF=OFF /ENDOFRECORD=0'),name('C:\Urano\ftp\pwd\Configuracoes_pwd.txt'),pre(CONFIG),create,bindable,thread
record         record,pre()
nome             string(12)
ipFtp            string(17)
senhaFtp         string(10)
pastaFtp         string(22)
previsao1        string(17)
previsao2        string(3)
ipCabo           string(17)
mascara          string(17)
gateway          string(17)
previsao3        string(3)
ativaMsgPublic   string(3)
msgPublicitaria  string(22)
msgPublicitaria2 string(22)
ipSNTP           string(17)
senhaDataHora    string(8)
previsao4        string(36)
previsao5        string(56)
agendaCarga      string(7)
agendaDemanda    string(7)
vendaUnidade     string(3)
vendaDireta      string(3)
edicaoValidade   string(3)
modoEmpacotadora string(3)
layoutDefault    string(6)
previsao6        string(3)
clienteSNTP      string(3)
previsao7        string(3)
previsao8        string(3)
edicaoDataHora   string(3)
previsao9        string(3)
acessoTeclas1    string(8)
acessoTeclas2    string(8)
acessoTeclas3    string(8)
acessoTeclas4    string(8)
acessoTeclas5    string(8)
acessoTeclas6    string(8)
acessoTeclas7    string(8)
acessoTeclas8    string(8)
acessoTeclas9    string(8)
acessoTeclas10   string(8)
acessoTeclas11   string(8)
acessoTeclas12   string(8)
acessoTeclas13   string(8)
acessoTeclas14   string(8)
acessoTeclas15   string(8)
acessoTeclas16   string(8)
acessoTeclas17   string(8)
acessoTeclas18   string(8)
acessoTeclas19   string(8)
acessoTeclas20   string(8)
acessoTeclas21   string(8)
acessoTeclas22   string(8)
acessoTeclas23   string(8)
acessoTeclas24   string(8)
acessoTeclas25   string(8)
acessoTeclas26   string(8)
acessoTeclas27   string(8)
acessoTeclas28   string(8)
acessoTeclas29   string(8)
acessoTeclas30   string(8)
acessoTeclas31   string(8)
acessoTeclas32   string(8)
acessoTeclas33   string(8)
acessoTeclas34   string(8)
acessoTeclas35   string(8)
acessoTeclas36   string(8)
acessoTeclas37   string(8)
acessoTeclas38   string(8)
acessoTeclas39   string(8)
acessoTeclas40   string(8)
acessoTeclas41   string(8)
acessoTeclas42   string(8)
acessoTeclas43   string(8)
acessoTeclas44   string(8)
acessoTeclas45   string(8)
acessoTeclas46   string(8)
acessoTeclas47   string(8)
acessoTeclas48   string(8)
acessoTeclas49   string(8)
acessoTeclas50   string(8)
acessoTeclas51   string(8)
acessoTeclas52   string(8)
acessoTeclas53   string(8)
acessoTeclas54   string(8)
acessoTeclas55   string(8)
acessoTeclas56   string(8)
acessoTeclas57   string(8)
acessoTeclas58   string(8)
acessoTeclas59   string(8)
acessoTeclas60   string(8)
acessoTeclas61   string(8)
acessoTeclas62   string(8)
acessoTeclas63   string(8)
acessoTeclas64   string(8)
acessoTeclas65   string(8)
acessoTeclas66   string(8)
acessoTeclas67   string(8)
acessoTeclas68   string(8)
acessoTeclas69   string(8)
acessoTeclas70   string(8)
acessoTeclas71   string(8)
acessoTeclas72   string(8)
acessoTeclas73   string(8)
acessoTeclas74   string(8)
acessoTeclas75   string(8)
acessoTeclas76   string(8)
acessoTeclas77   string(8)
acessoTeclas78   string(8)
codBarrasP       string(4)
codBarrasU       string(4)
previsao10       string(3)
previsao11       string(3)
previsao12       string(12)
previsao13       string(3)
previsao14       string(3)
previsao15       string(5)
               end
          end
FilesOpened     BYTE(0)
  CODE
!
    do tpsProds
    do carregaConfig
    do geraArq
!
tpsProds routine
 data
 code
     do OpenFiles
     create(ARQ)
     open(ARQ)
     set(P01_Produtos)
     loop
         next(P01_Produtos)
         if errorcode() then break.
         if P01:Status = 'A' and P01:Altura <> 0 and P01:CalculaVol = 'S'
             
             ARQ:codigo = P01:Referencia_Produto

             if P01:CodUnidade_Venda = 'KG'! pesável ou unidade
                 ARQ:tipoProd = 'P'
             else
                 ARQ:tipoProd = 'U'
             end

             ARQ:descricao = P01:Descricao
             ARQ:preco     = P01:PrecoVenda
             ARQ:validade  = '0007'
             ARQ:tipVal    = 'D'
             ARQ:vPreco    = '0'
             ARQ:cLayout   = '000'
             ARQ:previsao  = '0000000000000000000000000000'
             add(ARQ)
         end
     end
     close(ARQ)
     do CloseFiles
 exit

geraArq routine
 data
PROD      file,driver('ASCII'),name('C:\Urano\ftp\pwd\Produtos_pwd.txt'),pre(PROD),create,bindable,thread
Record         record,pre()
linha            string(90)
               end
          end

linhaAux    string(83)
hexadecimal string(4)
qtdProd     long
 code
     open(ARQ)!TPS de produtos
     create(PROD)
     open(PROD)
     set(ARQ:porCod)
     loop
         next(ARQ)
         if errorcode() then break.
         qtdProd = qtdProd +1
         linhaAux = format(ARQ:codigo, @N06) & ARQ:tipoProd & format(ARQ:descricao, @S30) & format(ARQ:preco, @N09.2) & ARQ:validade & ARQ:tipVal & ARQ:vPreco & ARQ:cLayout & ARQ:previsao
         
         !  calcula hexadecimal
         loop i# = 1 to len(clip(linhaAux))
             a# = a# + val(linhaAux[i#])
         end

         !a# = 3261!TESTE

         if a# % 16 > 9
             if a# % 16 = 10
                 hexadecimal[4] = 'a'
             elsif a# % 16 = 11
                 hexadecimal[4] = 'b'
             elsif a# % 16 = 12
                 hexadecimal[4] = 'c'
             elsif a# % 16 = 13
                 hexadecimal[4] = 'd'
             elsif a# % 16 = 14
                 hexadecimal[4] = 'e'
             else
                 hexadecimal[4] = 'f'
             end
         else
             hexadecimal[4] = a# % 16
         end

         a# = a# / 16

         i# = 3
         loop
             if a# % 16 > 9
                 if a# % 16 = 10
                     hexadecimal[i#] = 'a'
                 elsif a# % 16 = 11
                     hexadecimal[i#] = 'b'
                 elsif a# % 16 = 12
                     hexadecimal[i#] = 'c'
                 elsif a# % 16 = 13
                     hexadecimal[i#] = 'd'
                 elsif a# % 16 = 14
                     hexadecimal[i#] = 'e'
                 elsif a# % 16 = 15
                     hexadecimal[i#] = 'f'
                 end
             else
                 hexadecimal[i#] = a# % 16
             end
             a# = a# / 16
             i# = i# - 1 !decrementa a varaivel i#
             if a# = 0 then break.
         end
         if hexadecimal[1] = '' then hexadecimal[1] = '0' end ! se o hexadecimal tiver 3 digitos adc 0 na frente
         !add no arquivo
         PROD:linha = '' & clip(linhaAux) & hexadecimal & ''
         add(PROD)
     end
     close(PROD)
     close(ARQ)
     remove(ARQ)!remove tps
     
     message('Carga Gerada|Produtos Importados -> ' & qtdProd)
 exit

carregaConfig routine
 data
 code
     create(config)
     open(config)
     config:nome =             'pwd     ' & chr(13) & chr(10)
     config:ipFtp =            '192.168.0.100  ' & chr(13) & chr(10)
     config:senhaFtp =         '1234    ' & chr(13) & chr(10)
     config:pastaFtp =         'pwd                 ' & chr(13) & chr(10)
     config:previsao1 =        '127.0.0.1      ' & chr(13) & chr(10)
     config:previsao2 =        '0' & chr(13) & chr(10)
     config:ipCabo =           '192.168.0.101  ' & chr(13) & chr(10)
     config:mascara =          '255.255.255.0  ' & chr(13) & chr(10)
     config:gateway =          '192.168.0.1    ' & chr(13) & chr(10)
     config:previsao3 =        '0' & chr(13) & chr(10)
     config:ativaMsgPublic =   '1' & chr(13) & chr(10)
     config:msgPublicitaria =  '*SUPERMERCADO URSO* ' & chr(13) & chr(10)
     config:msgPublicitaria2 = '                    ' & chr(13) & chr(10)
     config:ipSNTP =           '               ' & chr(13) & chr(10)
     config:senhaDataHora =    '225588' & chr(13) & chr(10)
     config:previsao4 =        'reservado3                        ' & chr(13) & chr(10)
     config:previsao5 =        'reservado4                                            ' & chr(13) & chr(10)
     config:agendaCarga =      '     ' & chr(13) & chr(10)
     config:agendaDemanda =    '     ' & chr(13) & chr(10)
     config:vendaUnidade =     '1' & chr(13) & chr(10)
     config:vendaDireta =      '1' & chr(13) & chr(10)
     config:edicaoValidade =   '1' & chr(13) & chr(10)
     config:modoEmpacotadora = '1' & chr(13) & chr(10)
     config:layoutDefault =    '0000' & chr(13) & chr(10)
     config:previsao6 =        '1' & chr(13) & chr(10)
     config:clienteSNTP =      '0' & chr(13) & chr(10)
     config:previsao7 =        '4' & chr(13) & chr(10)
     config:previsao8 =        '3' & chr(13) & chr(10)
     config:edicaoDataHora =   '1' & chr(13) & chr(10)
     config:previsao9 =        '0' & chr(13) & chr(10)
     config:acessoTeclas1  = '000000' & chr(13) & chr(10)    
     config:acessoTeclas2  = '000000' & chr(13) & chr(10)
     config:acessoTeclas3  = '000000' & chr(13) & chr(10)
     config:acessoTeclas4  = '000000' & chr(13) & chr(10)
     config:acessoTeclas5  = '000000' & chr(13) & chr(10)
     config:acessoTeclas6  = '000000' & chr(13) & chr(10)
     config:acessoTeclas7  = '000000' & chr(13) & chr(10)
     config:acessoTeclas8  = '000000' & chr(13) & chr(10)
     config:acessoTeclas9  = '000000' & chr(13) & chr(10)
     config:acessoTeclas10 = '000000' & chr(13) & chr(10)
     config:acessoTeclas11 = '000000' & chr(13) & chr(10)
     config:acessoTeclas12 = '000000' & chr(13) & chr(10)
     config:acessoTeclas13 = '000000' & chr(13) & chr(10)
     config:acessoTeclas14 = '000000' & chr(13) & chr(10)
     config:acessoTeclas15 = '000000' & chr(13) & chr(10)
     config:acessoTeclas16 = '000000' & chr(13) & chr(10)
     config:acessoTeclas17 = '000000' & chr(13) & chr(10)
     config:acessoTeclas18 = '000000' & chr(13) & chr(10)
     config:acessoTeclas19 = '000000' & chr(13) & chr(10)
     config:acessoTeclas20 = '000000' & chr(13) & chr(10)
     config:acessoTeclas21 = '000000' & chr(13) & chr(10)
     config:acessoTeclas22 = '000000' & chr(13) & chr(10)
     config:acessoTeclas23 = '000000' & chr(13) & chr(10)
     config:acessoTeclas24 = '000000' & chr(13) & chr(10)
     config:acessoTeclas25 = '000000' & chr(13) & chr(10)
     config:acessoTeclas26 = '000000' & chr(13) & chr(10)
     config:acessoTeclas27 = '000000' & chr(13) & chr(10)
     config:acessoTeclas28 = '000000' & chr(13) & chr(10)
     config:acessoTeclas29 = '000000' & chr(13) & chr(10)
     config:acessoTeclas30 = '000000' & chr(13) & chr(10)
     config:acessoTeclas31 = '000000' & chr(13) & chr(10)
     config:acessoTeclas32 = '000000' & chr(13) & chr(10)
     config:acessoTeclas33 = '000000' & chr(13) & chr(10)
     config:acessoTeclas34 = '000000' & chr(13) & chr(10)
     config:acessoTeclas35 = '000000' & chr(13) & chr(10)
     config:acessoTeclas36 = '000000' & chr(13) & chr(10)
     config:acessoTeclas37 = '000000' & chr(13) & chr(10)
     config:acessoTeclas38 = '000000' & chr(13) & chr(10)
     config:acessoTeclas39 = '000000' & chr(13) & chr(10)
     config:acessoTeclas40 = '000000' & chr(13) & chr(10)
     config:acessoTeclas41 = '000000' & chr(13) & chr(10)
     config:acessoTeclas42 = '000000' & chr(13) & chr(10)
     config:acessoTeclas43 = '000000' & chr(13) & chr(10)
     config:acessoTeclas44 = '000000' & chr(13) & chr(10)
     config:acessoTeclas45 = '000000' & chr(13) & chr(10)
     config:acessoTeclas46 = '000000' & chr(13) & chr(10)
     config:acessoTeclas47 = '000000' & chr(13) & chr(10)
     config:acessoTeclas48 = '000000' & chr(13) & chr(10)
     config:acessoTeclas49 = '000000' & chr(13) & chr(10)
     config:acessoTeclas50 = '000000' & chr(13) & chr(10)
     config:acessoTeclas51 = '000000' & chr(13) & chr(10)
     config:acessoTeclas52 = '000000' & chr(13) & chr(10)
     config:acessoTeclas53 = '000000' & chr(13) & chr(10)
     config:acessoTeclas54 = '000000' & chr(13) & chr(10)
     config:acessoTeclas55 = '000000' & chr(13) & chr(10)
     config:acessoTeclas56 = '000000' & chr(13) & chr(10)
     config:acessoTeclas57 = '000000' & chr(13) & chr(10)
     config:acessoTeclas58 = '000000' & chr(13) & chr(10)
     config:acessoTeclas59 = '000000' & chr(13) & chr(10)
     config:acessoTeclas60 = '000000' & chr(13) & chr(10)
     config:acessoTeclas61 = '000000' & chr(13) & chr(10)
     config:acessoTeclas62 = '000000' & chr(13) & chr(10)
     config:acessoTeclas63 = '000000' & chr(13) & chr(10)
     config:acessoTeclas64 = '000000' & chr(13) & chr(10)
     config:acessoTeclas65 = '000000' & chr(13) & chr(10)
     config:acessoTeclas66 = '000000' & chr(13) & chr(10)
     config:acessoTeclas67 = '000000' & chr(13) & chr(10)
     config:acessoTeclas68 = '000000' & chr(13) & chr(10)
     config:acessoTeclas69 = '000000' & chr(13) & chr(10)
     config:acessoTeclas70 = '000000' & chr(13) & chr(10)
     config:acessoTeclas71 = '000000' & chr(13) & chr(10)
     config:acessoTeclas72 = '000000' & chr(13) & chr(10)
     config:acessoTeclas73 = '000000' & chr(13) & chr(10)
     config:acessoTeclas74 = '000000' & chr(13) & chr(10)
     config:acessoTeclas75 = '000000' & chr(13) & chr(10)
     config:acessoTeclas76 = '000000' & chr(13) & chr(10)
     config:acessoTeclas77 = '000000' & chr(13) & chr(10)
     config:acessoTeclas78 = '000000' & chr(13) & chr(10)
     config:codBarrasP = '27' & chr(13) & chr(10)
     config:codBarrasU = '27' & chr(13) & chr(10)
     config:previsao10 = '1' & chr(13) & chr(10)
     config:previsao11 = '0' & chr(13) & chr(10)
     config:previsao12 = 'GMT -03:00' & chr(13) & chr(10)
     config:previsao13 = '1' & chr(13) & chr(10)
     config:previsao14 = '3' & chr(13) & chr(10)
     config:previsao15 = '99f4'
     add(config)
     clear(config)
     close(config)
 exit
!--------------------------------------
OpenFiles  ROUTINE
  Access:P01_Produtos.Open                                 ! Open File referenced in 'Other Files' so need to inform it's FileManager
  Access:P01_Produtos.UseFile                              ! Use File referenced in 'Other Files' so need to inform it's FileManager
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Access:P01_Produtos.Close
     FilesOpened = False
  END
