   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE

   MAP
     MODULE('Windows API')
SystemParametersInfo PROCEDURE (LONG uAction, LONG uParam, *? lpvParam, LONG fuWinIni),LONG,RAW,PROC,PASCAL,DLL(TRUE),NAME('SystemParametersInfoA')
     END
     MODULE('CONVEBC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('CONVE001.CLW')
Main                   PROCEDURE   !
     END
   END

SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

P16_UnidAdic         FILE,DRIVER('TOPSPEED'),NAME('\PwdInfo\Dados\P16'),PRE(P16),CREATE,BINDABLE,THREAD
PorProdutoUnid           KEY(P16:Referencia_Produto,P16:Unidade),NOCASE,OPT,PRIMARY
PorUnid                  KEY(P16:Unidade,P16:Referencia_Produto),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Referencia_Produto          STRING(13)
Unidade                     STRING(2)
PrVenda                     REAL
FatorConv                   DECIMAL(7,2)
                         END
                     END                       

P18_RefPrdFornec     FILE,DRIVER('TOPSPEED'),NAME('\PwdInfo\Dados\P18'),PRE(P18),CREATE,BINDABLE,THREAD
PorRefProduto            KEY(P18:Referencia_Produto,P18:RefProdFornec),NOCASE,OPT,PRIMARY
PorRefFornec             KEY(P18:RefProdFornec),DUP,NOCASE,OPT
PorRefCodpro             KEY(P18:Referencia_Produto),DUP,NOCASE,OPT
PorCnpjRefForn           KEY(P18:Cnpj,P18:RefProdFornec),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Referencia_Produto          STRING(13)
RefProdFornec               STRING(20)
Fabricante                  STRING(20)
UnEnt                       STRING(2)
FatorConv                   REAL
DivMul                      STRING(1)
Cnpj                        STRING(14)
                         END
                     END                       

P12_CtrlEstoq        FILE,DRIVER('TOPSPEED'),NAME('\PwdInfo\Dados\P12'),PRE(P12),CREATE,BINDABLE,THREAD
PorProdutoEmpresaAuxiliar KEY(P12:Referencia_Produto,P12:CodigoEmpresa),NOCASE,OPT,PRIMARY
PorRefProd               KEY(P12:Referencia_Produto),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Referencia_Produto          STRING(13)
CodigoEmpresa               LONG
CodAuxiliar                 STRING(10)
EstoqueAtual                REAL
PrecoCusto                  REAL
PrecoVenda                  REAL
Estoque_Minimo              REAL
Estoque_Maximo              REAL
EstoqueReservado            REAL
                         END
                     END                       

P07_FilhoProduto     FILE,DRIVER('TOPSPEED'),NAME('\PwdInfo\Dados\P07'),PRE(P07),CREATE,BINDABLE,THREAD
PorRefProdutoSequencia   KEY(P07:Referencia_Produto,P07:Sequencial),NOCASE,OPT,PRIMARY
PorProduto               KEY(P07:Referencia_Produto),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Referencia_Produto          STRING(13)
Sequencial                  LONG
Descricao                   STRING(45)
Valor                       REAL
AcumulaCustos               STRING(3)
CodMatPri                   LONG
Quant                       REAL
                         END
                     END                       

P01_Produtos         FILE,DRIVER('TOPSPEED'),OEM,NAME('\PwdInfo\Dados\P01'),PRE(P01),CREATE,BINDABLE,THREAD
PorReferencia_do_Produuto KEY(P01:Referencia_Produto),NOCASE,OPT,PRIMARY
PorReferencia_do_Fornecedor KEY(P01:Referencia_Fornecedor),DUP,NOCASE,OPT
PorGrupo_e_Descricao     KEY(P01:CodGrupo,P01:Descricao),DUP,NOCASE,OPT
PorDescricao_Resumida    KEY(P01:Descricao_Resumida),DUP,NOCASE,OPT
PorDescricao             KEY(P01:Descricao),DUP,NOCASE,OPT
PorGrupo                 KEY(P01:CodGrupo),DUP,NOCASE,OPT
PorUnidade_de_Venda      KEY(P01:CodUnidade_Venda),DUP,NOCASE,OPT
PorAliquota_ICMS         KEY(P01:Cod_icms),DUP,NOCASE,OPT
PorSituacao_Tributaria   KEY(P01:CodSituacao_Tributaria),DUP,NOCASE,OPT
PorUltimo_Fornecedor     KEY(P01:CodUltimo_Fornecedor),DUP,NOCASE,OPT
PorPosFisc               KEY(P01:Posicao),DUP,NOCASE,OPT
PorEstoqueAtual          KEY(P01:EstoqueAtual,P01:Descricao),DUP,NOCASE,OPT
PorClassFiscal           KEY(P01:CodClasFiscal),DUP,NOCASE,OPT
PorAuxiliar1             KEY(P01:CodAuxiliar1),DUP,NOCASE,OPT
PorAuxiliar2             KEY(P01:CodAuxiliar2),DUP,NOCASE,OPT
PorAuxiliar3             KEY(P01:CodAuxiliar3),DUP,NOCASE,OPT
PorAuxiliar4             KEY(P01:CodAuxiliar4),DUP,NOCASE,OPT
PorIncidProduto          KEY(P01:IncidImpo),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Referencia_Produto          STRING(13)
Referencia_Fornecedor       STRING(20)
Data_Ultima_Atualizacao     DATE
CodGrupo                    STRING(10)
Sub_Grupo                   STRING(10)
Marca                       STRING(10)
Descricao                   STRING(100)
Descricao_Resumida          STRING(20)
CodUnidade_Venda            STRING(2)
PrecoVenda                  REAL
Desc_max                    REAL
CodUnidLote                 STRING(2)
PrecoLote                   REAL
EstoqueAtual                REAL
Posicao                     STRING(4)
Estoque_Minimo              REAL
Estoque_Maximo              REAL
Cod_icms                    LONG
PercentualReducao           REAL
CodSituacao_Tributaria      STRING(25)
CodUltimo_Fornecedor        LONG
Foto                        STRING(64)
EstoqueReservado            REAL
CorPrincipal                STRING(15)
CorComplem                  STRING(15)
Material                    STRING(20)
Dimensoes                   STRING(20)
Tipo                        STRING(35)
Complemento                 STRING(45)
Fabricante                  STRING(30)
PrecoCusto                  REAL
CalculaPrVenda              STRING(3)
MargemLucro                 DECIMAL(7,2)
Observacao                  STRING(160)
Cubagem                     STRING(1)
Altura                      DECIMAL(7,4)
Largura                     DECIMAL(7,4)
Comprimento                 DECIMAL(7,4)
PercComis                   DECIMAL(7,2)
Aliq_Ipi                    REAL
CodClasFiscal               STRING(20)
ProdServ                    STRING(7)
CustoAdicional              REAL
CodAuxiliar1                STRING(15)
CodAuxiliar2                STRING(20)
CodAuxiliar3                STRING(15)
CodAuxiliar4                STRING(15)
NomeAltEst                  STRING(10)
DataAltEst                  DATE
CodigoEmpresa               LONG
DtUltVenda                  DATE
PercPromo                   REAL
Origem                      LONG
IncidImpo                   LONG
CalculaVol                  STRING(1)
Status                      STRING(1)
Renavam                     STRING(15)
Chassi                      STRING(20)
EspecieVei                  STRING(15)
AnoFab                      LONG
CapPotCil                   STRING(15)
MarcaDescr                  STRING(30)
AnoModelo                   LONG
Odometro                    STRING(20)
Combustivel                 STRING(10)
EstoTrans                   REAL
TempoRep                    LONG
UnAd1                       STRING(2)
UnAd2                       STRING(2)
UnAd3                       STRING(2)
PrVenAd1                    REAL
PrVenAd2                    REAL
PrVenAd3                    REAL
FatorCAd1                   DECIMAL(7,2)
FatorCAd2                   DECIMAL(7,2)
FatorCAd3                   DECIMAL(7,2)
CodCsosn                    LONG
CodGenNcm                   LONG
Cofins                      LONG
Pis                         LONG
DtValidPromo                DATE
PermiteDes                  STRING(1)
CprodAnp                    STRING(9)
DtUltForn                   DATE
CustoFabr                   REAL
PerValPromo                 STRING(1)
EnquadrIpi                  LONG
                         END
                     END                       

T23_NcmCalcSubst     FILE,DRIVER('TOPSPEED'),NAME('\PwdInfo\Dados\T23'),PRE(T23),CREATE,BINDABLE,THREAD
PorProdUF                KEY(T23:CodProduto,T23:UfDest),NOCASE,OPT,PRIMARY
PorProduto               KEY(T23:CodProduto),DUP,NOCASE,OPT
Record                   RECORD,PRE()
CodProduto                  STRING(13)
CodNcm                      STRING(8)
UfDest                      STRING(2)
Mva                         DECIMAL(7,2)
Descricao                   STRING(50)
Cfop                        LONG
                         END
                     END                       



Access:P16_UnidAdic  &FileManager,THREAD                   ! FileManager for P16_UnidAdic
Relate:P16_UnidAdic  &RelationManager,THREAD               ! RelationManager for P16_UnidAdic
Access:P18_RefPrdFornec &FileManager,THREAD                ! FileManager for P18_RefPrdFornec
Relate:P18_RefPrdFornec &RelationManager,THREAD            ! RelationManager for P18_RefPrdFornec
Access:P12_CtrlEstoq &FileManager,THREAD                   ! FileManager for P12_CtrlEstoq
Relate:P12_CtrlEstoq &RelationManager,THREAD               ! RelationManager for P12_CtrlEstoq
Access:P07_FilhoProduto &FileManager,THREAD                ! FileManager for P07_FilhoProduto
Relate:P07_FilhoProduto &RelationManager,THREAD            ! RelationManager for P07_FilhoProduto
Access:P01_Produtos  &FileManager,THREAD                   ! FileManager for P01_Produtos
Relate:P01_Produtos  &RelationManager,THREAD               ! RelationManager for P01_Produtos
Access:T23_NcmCalcSubst &FileManager,THREAD                ! FileManager for T23_NcmCalcSubst
Relate:T23_NcmCalcSubst &RelationManager,THREAD            ! RelationManager for T23_NcmCalcSubst

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrors         ErrorClass,THREAD                     ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END

lCurrentFDSetting    LONG                                  ! Used by window frame dragging
lAdjFDSetting        LONG                                  ! ditto

  CODE
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('ConverteToHexadecimal.INI', NVD_INI)        ! Configure INIManager to use INI file
  SystemParametersInfo (38, 0, lCurrentFDSetting, 0)       ! Configure frame dragging
  IF lCurrentFDSetting = 1
    SystemParametersInfo (37, 0, lAdjFDSetting, 3)
  END
  Main
  INIMgr.Update
  IF lCurrentFDSetting = 1
    SystemParametersInfo (37, 1, lAdjFDSetting, 3)
  END
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  DctInit()


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

