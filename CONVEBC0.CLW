  MEMBER('ConverteToHexadecimal.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
CONVEBC0:DctInit    PROCEDURE
CONVEBC0:DctKill    PROCEDURE
CONVEBC0:FilesInit  PROCEDURE
  END

Hide:Access:P16_UnidAdic CLASS(FileManager),TYPE           ! FileManager for P16_UnidAdic
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


Hide:Relate:P16_UnidAdic CLASS(RelationManager),TYPE       ! RelationManager for P16_UnidAdic
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:P18_RefPrdFornec CLASS(FileManager),TYPE       ! FileManager for P18_RefPrdFornec
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


Hide:Relate:P18_RefPrdFornec CLASS(RelationManager),TYPE   ! RelationManager for P18_RefPrdFornec
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:P12_CtrlEstoq CLASS(FileManager),TYPE          ! FileManager for P12_CtrlEstoq
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


Hide:Relate:P12_CtrlEstoq CLASS(RelationManager),TYPE      ! RelationManager for P12_CtrlEstoq
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:P07_FilhoProduto CLASS(FileManager),TYPE       ! FileManager for P07_FilhoProduto
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
                     END


Hide:Relate:P07_FilhoProduto CLASS(RelationManager),TYPE   ! RelationManager for P07_FilhoProduto
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:P01_Produtos CLASS(FileManager),TYPE           ! FileManager for P01_Produtos
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


Hide:Relate:P01_Produtos CLASS(RelationManager),TYPE       ! RelationManager for P01_Produtos
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:T23_NcmCalcSubst CLASS(FileManager),TYPE       ! FileManager for T23_NcmCalcSubst
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


Hide:Relate:T23_NcmCalcSubst CLASS(RelationManager),TYPE   ! RelationManager for T23_NcmCalcSubst
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:P16_UnidAdic &Hide:Access:P16_UnidAdic,AUTO,THREAD
_Hide:Relate:P16_UnidAdic &Hide:Relate:P16_UnidAdic,AUTO,THREAD
_Hide:Access:P18_RefPrdFornec &Hide:Access:P18_RefPrdFornec,AUTO,THREAD
_Hide:Relate:P18_RefPrdFornec &Hide:Relate:P18_RefPrdFornec,AUTO,THREAD
_Hide:Access:P12_CtrlEstoq &Hide:Access:P12_CtrlEstoq,AUTO,THREAD
_Hide:Relate:P12_CtrlEstoq &Hide:Relate:P12_CtrlEstoq,AUTO,THREAD
_Hide:Access:P07_FilhoProduto &Hide:Access:P07_FilhoProduto,AUTO,THREAD
_Hide:Relate:P07_FilhoProduto &Hide:Relate:P07_FilhoProduto,AUTO,THREAD
_Hide:Access:P01_Produtos &Hide:Access:P01_Produtos,AUTO,THREAD
_Hide:Relate:P01_Produtos &Hide:Relate:P01_Produtos,AUTO,THREAD
_Hide:Access:T23_NcmCalcSubst &Hide:Access:T23_NcmCalcSubst,AUTO,THREAD
_Hide:Relate:T23_NcmCalcSubst &Hide:Relate:T23_NcmCalcSubst,AUTO,THREAD


CONVEBC0:DctInit PROCEDURE
  CODE
  _Hide:Access:P16_UnidAdic &= NEW(Hide:Access:P16_UnidAdic)
  _Hide:Relate:P16_UnidAdic &= NEW(Hide:Relate:P16_UnidAdic)
  _Hide:Access:P18_RefPrdFornec &= NEW(Hide:Access:P18_RefPrdFornec)
  _Hide:Relate:P18_RefPrdFornec &= NEW(Hide:Relate:P18_RefPrdFornec)
  _Hide:Access:P12_CtrlEstoq &= NEW(Hide:Access:P12_CtrlEstoq)
  _Hide:Relate:P12_CtrlEstoq &= NEW(Hide:Relate:P12_CtrlEstoq)
  _Hide:Access:P07_FilhoProduto &= NEW(Hide:Access:P07_FilhoProduto)
  _Hide:Relate:P07_FilhoProduto &= NEW(Hide:Relate:P07_FilhoProduto)
  _Hide:Access:P01_Produtos &= NEW(Hide:Access:P01_Produtos)
  _Hide:Relate:P01_Produtos &= NEW(Hide:Relate:P01_Produtos)
  _Hide:Access:T23_NcmCalcSubst &= NEW(Hide:Access:T23_NcmCalcSubst)
  _Hide:Relate:T23_NcmCalcSubst &= NEW(Hide:Relate:T23_NcmCalcSubst)
  Relate:P16_UnidAdic &= _Hide:Relate:P16_UnidAdic
  Relate:P18_RefPrdFornec &= _Hide:Relate:P18_RefPrdFornec
  Relate:P12_CtrlEstoq &= _Hide:Relate:P12_CtrlEstoq
  Relate:P07_FilhoProduto &= _Hide:Relate:P07_FilhoProduto
  Relate:P01_Produtos &= _Hide:Relate:P01_Produtos
  Relate:T23_NcmCalcSubst &= _Hide:Relate:T23_NcmCalcSubst


CONVEBC0:FilesInit PROCEDURE
  CODE
  _Hide:Relate:P16_UnidAdic.Init
  _Hide:Relate:P18_RefPrdFornec.Init
  _Hide:Relate:P12_CtrlEstoq.Init
  _Hide:Relate:P07_FilhoProduto.Init
  _Hide:Relate:P01_Produtos.Init
  _Hide:Relate:T23_NcmCalcSubst.Init


CONVEBC0:DctKill PROCEDURE
  CODE
  _Hide:Relate:P16_UnidAdic.Kill
  DISPOSE(_Hide:Relate:P16_UnidAdic)
  _Hide:Relate:P18_RefPrdFornec.Kill
  DISPOSE(_Hide:Relate:P18_RefPrdFornec)
  _Hide:Relate:P12_CtrlEstoq.Kill
  DISPOSE(_Hide:Relate:P12_CtrlEstoq)
  _Hide:Relate:P07_FilhoProduto.Kill
  DISPOSE(_Hide:Relate:P07_FilhoProduto)
  _Hide:Relate:P01_Produtos.Kill
  DISPOSE(_Hide:Relate:P01_Produtos)
  _Hide:Relate:T23_NcmCalcSubst.Kill
  DISPOSE(_Hide:Relate:T23_NcmCalcSubst)


Hide:Access:P16_UnidAdic.Init PROCEDURE
  CODE
  SELF.Init(P16_UnidAdic,GlobalErrors)
  SELF.Buffer &= P16:Record
  SELF.Create = 1
  SELF.LockRecover = 10
  SELF.AddKey(P16:PorProdutoUnid,'Por Produto',0)
  SELF.AddKey(P16:PorUnid,'PorUnid',0)
  Access:P16_UnidAdic &= SELF


Hide:Relate:P16_UnidAdic.Init PROCEDURE
  CODE
  _Hide:Access:P16_UnidAdic.Init
  SELF.Init(Access:P16_UnidAdic,1)
  DO AddRelations_1

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:P01_Produtos)


Hide:Access:P16_UnidAdic.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:P16_UnidAdic &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Relate:P16_UnidAdic.Kill PROCEDURE

  CODE
  _Hide:Access:P16_UnidAdic.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:P16_UnidAdic &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:P16_UnidAdic)                       ! destroy the file manager


Hide:Access:P18_RefPrdFornec.Init PROCEDURE
  CODE
  SELF.Init(P18_RefPrdFornec,GlobalErrors)
  SELF.Buffer &= P18:Record
  SELF.Create = 1
  SELF.LockRecover = 10
  SELF.AddKey(P18:PorRefProduto,'Por Ref.Produto',0)
  SELF.AddKey(P18:PorRefFornec,'Por Ref. Fornecedor',0)
  SELF.AddKey(P18:PorRefCodpro,'PorRefCodPro',0)
  SELF.AddKey(P18:PorCnpjRefForn,'Por Cnpj / Ref Forn',0)
  Access:P18_RefPrdFornec &= SELF


Hide:Relate:P18_RefPrdFornec.Init PROCEDURE
  CODE
  _Hide:Access:P18_RefPrdFornec.Init
  SELF.Init(Access:P18_RefPrdFornec,1)
  DO AddRelations_1

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:P01_Produtos)


Hide:Access:P18_RefPrdFornec.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:P18_RefPrdFornec &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Relate:P18_RefPrdFornec.Kill PROCEDURE

  CODE
  _Hide:Access:P18_RefPrdFornec.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:P18_RefPrdFornec &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:P18_RefPrdFornec)                   ! destroy the file manager


Hide:Access:P12_CtrlEstoq.Init PROCEDURE
  CODE
  SELF.Init(P12_CtrlEstoq,GlobalErrors)
  SELF.Buffer &= P12:Record
  SELF.Create = 1
  SELF.LockRecover = 10
  SELF.AddKey(P12:PorProdutoEmpresaAuxiliar,'Por Produto / Empresa / auxiliar',0)
  SELF.AddKey(P12:PorRefProd,'Por Ref.Produto',0)
  Access:P12_CtrlEstoq &= SELF


Hide:Relate:P12_CtrlEstoq.Init PROCEDURE
  CODE
  _Hide:Access:P12_CtrlEstoq.Init
  SELF.Init(Access:P12_CtrlEstoq,1)
  DO AddRelations_1

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:P01_Produtos)


Hide:Access:P12_CtrlEstoq.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:P12_CtrlEstoq &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Relate:P12_CtrlEstoq.Kill PROCEDURE

  CODE
  _Hide:Access:P12_CtrlEstoq.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:P12_CtrlEstoq &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:P12_CtrlEstoq)                      ! destroy the file manager


Hide:Access:P07_FilhoProduto.Init PROCEDURE
  CODE
  SELF.Init(P07_FilhoProduto,GlobalErrors)
  SELF.Buffer &= P07:Record
  SELF.Create = 1
  SELF.LockRecover = 10
  SELF.AddKey(P07:PorRefProdutoSequencia,'Por Produto / Sequencial',2)
  SELF.AddKey(P07:PorProduto,'Por produto',0)
  Access:P07_FilhoProduto &= SELF


Hide:Relate:P07_FilhoProduto.Init PROCEDURE
  CODE
  _Hide:Access:P07_FilhoProduto.Init
  SELF.Init(Access:P07_FilhoProduto,1)
  DO AddRelations_1

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:P01_Produtos)


Hide:Access:P07_FilhoProduto.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:P07_FilhoProduto &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:P07_FilhoProduto.PrimeFields PROCEDURE

  CODE
  P07:Quant = 1                                            ! Assign initial field value
  PARENT.PrimeFields


Hide:Relate:P07_FilhoProduto.Kill PROCEDURE

  CODE
  _Hide:Access:P07_FilhoProduto.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:P07_FilhoProduto &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:P07_FilhoProduto)                   ! destroy the file manager


Hide:Access:P01_Produtos.Init PROCEDURE
  CODE
  SELF.Init(P01_Produtos,GlobalErrors)
  SELF.Buffer &= P01:Record
  SELF.Create = 1
  SELF.LockRecover = 10
  SELF.AddKey(P01:PorReferencia_do_Produuto,'referencai produto',0)
  SELF.AddKey(P01:PorReferencia_do_Fornecedor,'referencia fornecedor',0)
  SELF.AddKey(P01:PorGrupo_e_Descricao,'grupo e descricao',0)
  SELF.AddKey(P01:PorDescricao_Resumida,'descricao resumida',0)
  SELF.AddKey(P01:PorDescricao,'descricao',0)
  SELF.AddKey(P01:PorGrupo,'estrangeira grupo',0)
  SELF.AddKey(P01:PorUnidade_de_Venda,'estrangeira unidade de venda',0)
  SELF.AddKey(P01:PorAliquota_ICMS,'estrangeira aliquota icms',0)
  SELF.AddKey(P01:PorSituacao_Tributaria,'estrangeira situacao tributaria',0)
  SELF.AddKey(P01:PorUltimo_Fornecedor,'estrangeira ultimo fornecedor',0)
  SELF.AddKey(P01:PorPosFisc,'P01:PorPosFisc',0)
  SELF.AddKey(P01:PorEstoqueAtual,'Por Estoque / Descricao',0)
  SELF.AddKey(P01:PorClassFiscal,'Por Classif Fiscal',0)
  SELF.AddKey(P01:PorAuxiliar1,'Por Auxiliar1',0)
  SELF.AddKey(P01:PorAuxiliar2,'Por Auxiliar2',0)
  SELF.AddKey(P01:PorAuxiliar3,'Por Auxiliar 3',0)
  SELF.AddKey(P01:PorAuxiliar4,'Por Auxiliar4',0)
  SELF.AddKey(P01:PorIncidProduto,'Por Incidencia',0)
  Access:P01_Produtos &= SELF


Hide:Relate:P01_Produtos.Init PROCEDURE
  CODE
  _Hide:Access:P01_Produtos.Init
  SELF.Init(Access:P01_Produtos,1)
  DO AddRelations_1

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:P18_RefPrdFornec,RI:None,RI:CASCADE,P18:PorRefCodpro)
  SELF.AddRelationLink(P01:Referencia_Produto,P18:Referencia_Produto)
  SELF.AddRelation(Relate:T23_NcmCalcSubst,RI:None,RI:CASCADE,T23:PorProduto)
  SELF.AddRelationLink(P01:Referencia_Produto,T23:CodProduto)
  SELF.AddRelation(Relate:P16_UnidAdic,RI:CASCADE,RI:CASCADE,P16:PorProdutoUnid)
  SELF.AddRelationLink(P01:Referencia_Produto,P16:Referencia_Produto)
  SELF.AddRelation(Relate:P12_CtrlEstoq,RI:CASCADE,RI:CASCADE,P12:PorProdutoEmpresaAuxiliar)
  SELF.AddRelationLink(P01:Referencia_Produto,P12:Referencia_Produto)
  SELF.AddRelation(Relate:P07_FilhoProduto,RI:CASCADE,RI:CASCADE,P07:PorRefProdutoSequencia)
  SELF.AddRelationLink(P01:Referencia_Produto,P07:Referencia_Produto)


Hide:Access:P01_Produtos.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:P01_Produtos &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Relate:P01_Produtos.Kill PROCEDURE

  CODE
  _Hide:Access:P01_Produtos.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:P01_Produtos &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:P01_Produtos)                       ! destroy the file manager


Hide:Access:T23_NcmCalcSubst.Init PROCEDURE
  CODE
  SELF.Init(T23_NcmCalcSubst,GlobalErrors)
  SELF.Buffer &= T23:Record
  SELF.Create = 1
  SELF.LockRecover = 10
  SELF.AddKey(T23:PorProdUF,'Por Produto / UF',0)
  SELF.AddKey(T23:PorProduto,'PorProduto',0)
  Access:T23_NcmCalcSubst &= SELF


Hide:Relate:T23_NcmCalcSubst.Init PROCEDURE
  CODE
  _Hide:Access:T23_NcmCalcSubst.Init
  SELF.Init(Access:T23_NcmCalcSubst,1)
  DO AddRelations_1

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:P01_Produtos)


Hide:Access:T23_NcmCalcSubst.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:T23_NcmCalcSubst &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Relate:T23_NcmCalcSubst.Kill PROCEDURE

  CODE
  _Hide:Access:T23_NcmCalcSubst.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:T23_NcmCalcSubst &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:T23_NcmCalcSubst)                   ! destroy the file manager

