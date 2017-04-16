/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     16/4/2017 12:25:37                           */
/*==============================================================*/


drop index CLIENTE_PK;

drop table CLIENTE;

drop index SE_GENERA_FK;

drop index DETALLE_FACTURA_PK;

drop table DETALLE_FACTURA;

drop index TIENENN_FK;

drop index DETALLE_USUARIO_PK;

drop table DETALLE_USUARIO;

drop index ESTADO_PEDIDO_PK;

drop table ESTADO_PEDIDO;

drop index FACTURA_PK;

drop table FACTURA;

drop index FUNCION_PK;

drop table FUNCION;

drop index IU_ELEMENT_PK;

drop table IU_ELEMENT;

drop index ES_UN_FK;

drop index OBTIENE_FK;

drop index IU_FUNCION_PK;

drop table IU_FUNCION;

drop index PAIS_PK;

drop table PAIS;

drop index ESTA_UN_FK;

drop index REALIZAN_UN_FK;

drop index REALIZA_FK;

drop index SE_OBTIENE_FK;

drop index CONTIENE_FK;

drop index PEDIDO_PK;

drop table PEDIDO;

drop index A_UN_FK;

drop index TIENE_FK;

drop index PEDIDO_FACTURA_PK;

drop table PEDIDO_FACTURA;

drop index PRODUCTO_PK;

drop table PRODUCTO;

drop index SE_ENCUENTRA_FK;

drop index PROVEEDOR_PK;

drop table PROVEEDOR;

drop index ROL_PK;

drop table ROL;

drop index PROVIENE_FK;

drop index REALIZAN_FK;

drop index ROL_FUNCION_PK;

drop table ROL_FUNCION;

drop index INICIA_FK;

drop index SESSION_PK;

drop table SESSION;

drop index USUARIO_PK;

drop table USUARIO;

drop index CONTIENEN_FK;

drop index TIENEN_FK;

drop index USUARIO_ROL_PK;

drop table USUARIO_ROL;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC(10)          not null,
   NOMBRE               VARCHAR(25)          null,
   APELLIDO             VARCHAR(25)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   ID_FACTURA           INT4                 not null,
   ID_DETALLE_FAC       SERIAL               not null,
   DESCRIPCION_FAC      VARCHAR(250)         null,
   PRECIO_UNIT          INT4                 null,
   PRECIO_TOTAL         INT4                 null,
   constraint PK_DETALLE_FACTURA primary key (ID_FACTURA, ID_DETALLE_FAC)
);

/*==============================================================*/
/* Index: DETALLE_FACTURA_PK                                    */
/*==============================================================*/
create unique index DETALLE_FACTURA_PK on DETALLE_FACTURA (
ID_FACTURA,
ID_DETALLE_FAC
);

/*==============================================================*/
/* Index: SE_GENERA_FK                                          */
/*==============================================================*/
create  index SE_GENERA_FK on DETALLE_FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Table: DETALLE_USUARIO                                       */
/*==============================================================*/
create table DETALLE_USUARIO (
   ID_USUARIO           INT4                 not null,
   ID_DETALLE_USER      SERIAL               not null,
   NOMBRE               VARCHAR(25)          null,
   APELLIDO             VARCHAR(25)          null,
   CELU_TELF            NUMERIC(10)          null,
   DIRECCION            VARCHAR(75)          null,
   constraint PK_DETALLE_USUARIO primary key (ID_USUARIO, ID_DETALLE_USER)
);

/*==============================================================*/
/* Index: DETALLE_USUARIO_PK                                    */
/*==============================================================*/
create unique index DETALLE_USUARIO_PK on DETALLE_USUARIO (
ID_USUARIO,
ID_DETALLE_USER
);

/*==============================================================*/
/* Index: TIENENN_FK                                            */
/*==============================================================*/
create  index TIENENN_FK on DETALLE_USUARIO (
ID_USUARIO
);

/*==============================================================*/
/* Table: ESTADO_PEDIDO                                         */
/*==============================================================*/
create table ESTADO_PEDIDO (
   ID_EST               SERIAL               not null,
   DESCRIPCION_EST      VARCHAR(75)          null,
   constraint PK_ESTADO_PEDIDO primary key (ID_EST)
);

/*==============================================================*/
/* Index: ESTADO_PEDIDO_PK                                      */
/*==============================================================*/
create unique index ESTADO_PEDIDO_PK on ESTADO_PEDIDO (
ID_EST
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           SERIAL               not null,
   FECHA_FACTURA        DATE                 null,
   TOTAL                INT4                 null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Table: FUNCION                                               */
/*==============================================================*/
create table FUNCION (
   ID_FUNCION           SERIAL               not null,
   DESCRIPCION_FUNCION  VARCHAR(50)          null,
   constraint PK_FUNCION primary key (ID_FUNCION)
);

/*==============================================================*/
/* Index: FUNCION_PK                                            */
/*==============================================================*/
create unique index FUNCION_PK on FUNCION (
ID_FUNCION
);

/*==============================================================*/
/* Table: IU_ELEMENT                                            */
/*==============================================================*/
create table IU_ELEMENT (
   ID_IUEL              SERIAL               not null,
   NOMBRE_IU            VARCHAR(50)          null,
   constraint PK_IU_ELEMENT primary key (ID_IUEL)
);

/*==============================================================*/
/* Index: IU_ELEMENT_PK                                         */
/*==============================================================*/
create unique index IU_ELEMENT_PK on IU_ELEMENT (
ID_IUEL
);

/*==============================================================*/
/* Table: IU_FUNCION                                            */
/*==============================================================*/
create table IU_FUNCION (
   ID_FUNCION           INT4                 not null,
   ID_IUEL              INT4                 not null,
   ACTIVO_IU            BOOL                 null,
   constraint PK_IU_FUNCION primary key (ID_FUNCION, ID_IUEL)
);

/*==============================================================*/
/* Index: IU_FUNCION_PK                                         */
/*==============================================================*/
create unique index IU_FUNCION_PK on IU_FUNCION (
ID_FUNCION,
ID_IUEL
);

/*==============================================================*/
/* Index: OBTIENE_FK                                            */
/*==============================================================*/
create  index OBTIENE_FK on IU_FUNCION (
ID_FUNCION
);

/*==============================================================*/
/* Index: ES_UN_FK                                              */
/*==============================================================*/
create  index ES_UN_FK on IU_FUNCION (
ID_IUEL
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              SERIAL               not null,
   NOMBRE_PAIS          VARCHAR(25)          null,
   COSTO_PAIS           INT4                 null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Index: PAIS_PK                                               */
/*==============================================================*/
create unique index PAIS_PK on PAIS (
ID_PAIS
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO (
   ID_PEDIDO            SERIAL               not null,
   ID_PRODUCTO          INT4                 null,
   ID_USUARIO           INT4                 null,
   ID_CLIENTE           NUMERIC(10)          null,
   ID_EST               INT4                 null,
   ID_PROVEEDOR         INT4                 null,
   FECHA_PEDIDO         DATE                 null,
   FECHA_LLEGADA        DATE                 null,
   COSTO_PEDIDO         INT4                 null,
   constraint PK_PEDIDO primary key (ID_PEDIDO)
);

/*==============================================================*/
/* Index: PEDIDO_PK                                             */
/*==============================================================*/
create unique index PEDIDO_PK on PEDIDO (
ID_PEDIDO
);

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create  index CONTIENE_FK on PEDIDO (
ID_PRODUCTO
);

/*==============================================================*/
/* Index: SE_OBTIENE_FK                                         */
/*==============================================================*/
create  index SE_OBTIENE_FK on PEDIDO (
ID_PROVEEDOR
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create  index REALIZA_FK on PEDIDO (
ID_CLIENTE
);

/*==============================================================*/
/* Index: REALIZAN_UN_FK                                        */
/*==============================================================*/
create  index REALIZAN_UN_FK on PEDIDO (
ID_USUARIO
);

/*==============================================================*/
/* Index: ESTA_UN_FK                                            */
/*==============================================================*/
create  index ESTA_UN_FK on PEDIDO (
ID_EST
);

/*==============================================================*/
/* Table: PEDIDO_FACTURA                                        */
/*==============================================================*/
create table PEDIDO_FACTURA (
   ID_PEDIDO            INT4                 not null,
   ID_FACTURA           INT4                 not null,
   constraint PK_PEDIDO_FACTURA primary key (ID_PEDIDO, ID_FACTURA)
);

/*==============================================================*/
/* Index: PEDIDO_FACTURA_PK                                     */
/*==============================================================*/
create unique index PEDIDO_FACTURA_PK on PEDIDO_FACTURA (
ID_PEDIDO,
ID_FACTURA
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on PEDIDO_FACTURA (
ID_PEDIDO
);

/*==============================================================*/
/* Index: A_UN_FK                                               */
/*==============================================================*/
create  index A_UN_FK on PEDIDO_FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          SERIAL               not null,
   NOMBRE_PRO           VARCHAR(25)          null,
   CANTIDAD_PRO         INT4                 null,
   COSTO_PRO            INT4                 null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
ID_PRODUCTO
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   ID_PROVEEDOR         SERIAL               not null,
   ID_PAIS              INT4                 null,
   NOMBRE_PROV          VARCHAR(25)          null,
   constraint PK_PROVEEDOR primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
ID_PROVEEDOR
);

/*==============================================================*/
/* Index: SE_ENCUENTRA_FK                                       */
/*==============================================================*/
create  index SE_ENCUENTRA_FK on PROVEEDOR (
ID_PAIS
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   ID_ROL               SERIAL               not null,
   DESCRIPCION_ROL      VARCHAR(50)          null,
   constraint PK_ROL primary key (ID_ROL)
);

/*==============================================================*/
/* Index: ROL_PK                                                */
/*==============================================================*/
create unique index ROL_PK on ROL (
ID_ROL
);

/*==============================================================*/
/* Table: ROL_FUNCION                                           */
/*==============================================================*/
create table ROL_FUNCION (
   ID_ROL               INT4                 not null,
   ID_FUNCION           INT4                 not null,
   ACTIVO_FUNCION       BOOL                 null,
   constraint PK_ROL_FUNCION primary key (ID_ROL, ID_FUNCION)
);

/*==============================================================*/
/* Index: ROL_FUNCION_PK                                        */
/*==============================================================*/
create unique index ROL_FUNCION_PK on ROL_FUNCION (
ID_ROL,
ID_FUNCION
);

/*==============================================================*/
/* Index: REALIZAN_FK                                           */
/*==============================================================*/
create  index REALIZAN_FK on ROL_FUNCION (
ID_ROL
);

/*==============================================================*/
/* Index: PROVIENE_FK                                           */
/*==============================================================*/
create  index PROVIENE_FK on ROL_FUNCION (
ID_FUNCION
);

/*==============================================================*/
/* Table: SESSION                                               */
/*==============================================================*/
create table SESSION (
   ID_USUARIO           INT4                 not null,
   ID_SESSION           SERIAL               not null,
   DIR_IP               VARCHAR(15)          null,
   ACTIVO_SESSION       BOOL                 null,
   FECHA_SESSION        DATE                 null,
   PID                  NUMERIC(5)           null,
   constraint PK_SESSION primary key (ID_USUARIO, ID_SESSION)
);

/*==============================================================*/
/* Index: SESSION_PK                                            */
/*==============================================================*/
create unique index SESSION_PK on SESSION (
ID_USUARIO,
ID_SESSION
);

/*==============================================================*/
/* Index: INICIA_FK                                             */
/*==============================================================*/
create  index INICIA_FK on SESSION (
ID_USUARIO
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           SERIAL               not null,
   LOGIN                VARCHAR(50)          null,
   PASSWORD             VARCHAR(50)          null,
   ACTIVO_USUARIO       BOOL                 null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
ID_USUARIO
);

/*==============================================================*/
/* Table: USUARIO_ROL                                           */
/*==============================================================*/
create table USUARIO_ROL (
   ID_USUARIO           INT4                 not null,
   ID_ROL               INT4                 not null,
   ACTIVO_USUARIO_ROL   BOOL                 null,
   constraint PK_USUARIO_ROL primary key (ID_USUARIO, ID_ROL)
);

/*==============================================================*/
/* Index: USUARIO_ROL_PK                                        */
/*==============================================================*/
create unique index USUARIO_ROL_PK on USUARIO_ROL (
ID_USUARIO,
ID_ROL
);

/*==============================================================*/
/* Index: TIENEN_FK                                             */
/*==============================================================*/
create  index TIENEN_FK on USUARIO_ROL (
ID_USUARIO
);

/*==============================================================*/
/* Index: CONTIENEN_FK                                          */
/*==============================================================*/
create  index CONTIENEN_FK on USUARIO_ROL (
ID_ROL
);

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__SE_GENERA_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table DETALLE_USUARIO
   add constraint FK_DETALLE__TIENENN_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table IU_FUNCION
   add constraint FK_IU_FUNCI_ES_UN_IU_ELEME foreign key (ID_IUEL)
      references IU_ELEMENT (ID_IUEL)
      on delete restrict on update restrict;

alter table IU_FUNCION
   add constraint FK_IU_FUNCI_OBTIENE_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_CONTIENE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_ESTA_UN_ESTADO_P foreign key (ID_EST)
      references ESTADO_PEDIDO (ID_EST)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_REALIZA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_REALIZAN__USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_SE_OBTIEN_PROVEEDO foreign key (ID_PROVEEDOR)
      references PROVEEDOR (ID_PROVEEDOR)
      on delete restrict on update restrict;

alter table PEDIDO_FACTURA
   add constraint FK_PEDIDO_F_A_UN_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table PEDIDO_FACTURA
   add constraint FK_PEDIDO_F_TIENE_PEDIDO foreign key (ID_PEDIDO)
      references PEDIDO (ID_PEDIDO)
      on delete restrict on update restrict;

alter table PROVEEDOR
   add constraint FK_PROVEEDO_SE_ENCUEN_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table ROL_FUNCION
   add constraint FK_ROL_FUNC_PROVIENE_FUNCION foreign key (ID_FUNCION)
      references FUNCION (ID_FUNCION)
      on delete restrict on update restrict;

alter table ROL_FUNCION
   add constraint FK_ROL_FUNC_REALIZAN_ROL foreign key (ID_ROL)
      references ROL (ID_ROL)
      on delete restrict on update restrict;

alter table SESSION
   add constraint FK_SESSION_INICIA_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table USUARIO_ROL
   add constraint FK_USUARIO__CONTIENEN_ROL foreign key (ID_ROL)
      references ROL (ID_ROL)
      on delete restrict on update restrict;

alter table USUARIO_ROL
   add constraint FK_USUARIO__TIENEN_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

