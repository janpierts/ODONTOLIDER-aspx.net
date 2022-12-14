USE [master]
GO
/****** Object:  Database [BD_SWGACO]    Script Date: 16/06/2022 18:55:50 ******/
CREATE DATABASE [BD_SWGACO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_SWGACO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_SWGACO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_SWGACO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_SWGACO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_SWGACO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_SWGACO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_SWGACO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_SWGACO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_SWGACO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_SWGACO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_SWGACO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_SWGACO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_SWGACO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_SWGACO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_SWGACO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_SWGACO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_SWGACO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_SWGACO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_SWGACO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_SWGACO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_SWGACO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_SWGACO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_SWGACO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_SWGACO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_SWGACO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_SWGACO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_SWGACO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_SWGACO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_SWGACO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_SWGACO] SET  MULTI_USER 
GO
ALTER DATABASE [BD_SWGACO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_SWGACO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_SWGACO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_SWGACO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_SWGACO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_SWGACO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_SWGACO', N'ON'
GO
ALTER DATABASE [BD_SWGACO] SET QUERY_STORE = OFF
GO
USE [BD_SWGACO]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[PK_ID_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VD_Codigo_Medico] [varchar](50) NULL,
	[VD_Nombre] [varchar](50) NULL,
	[VD_Apellidos] [varchar](50) NULL,
	[ID_Numero_Colegiado] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[PK_ID_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Almacen]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Almacen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NULL,
	[stock] [int] NULL,
	[categoria] [nchar](10) NULL,
	[ubicacion] [nchar](10) NULL,
 CONSTRAINT [PK_T_Almacen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Cita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Cita](
	[PK_IC_Cod] [int] IDENTITY(1,1) NOT NULL,
	[DC_Fecha_Cita] [date] NULL,
	[VC_Tratamiento] [varchar](50) NULL,
	[IC_Costo_Cita] [int] NULL,
	[FK_IP_Cod] [int] NULL,
	[FK_ID_Cod] [int] NULL,
	[FK_IH_Cod] [int] NULL,
	[FK_IEC_Cod] [int] NULL,
 CONSTRAINT [PK_T_Cita] PRIMARY KEY CLUSTERED 
(
	[PK_IC_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Estado_Cita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Estado_Cita](
	[PK_IEC_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VEC_Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_T_Estado_Cita] PRIMARY KEY CLUSTERED 
(
	[PK_IEC_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_EstadoTratamientoForCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_EstadoTratamientoForCita](
	[PK_IETFC_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VETFC_Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_T_EstadoTratamientoForCita] PRIMARY KEY CLUSTERED 
(
	[PK_IETFC_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Historia_Clinica]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Historia_Clinica](
	[PK_IHC_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VHC_Codigo] [varchar](50) NULL,
	[DHC_Fecha_Historia] [date] NULL,
	[VHC_Motivo_Consulta] [varchar](50) NULL,
	[DHC_Ultima_Visita] [date] NULL,
	[VHC_Alergias] [varchar](50) NULL,
	[BHC_Toma_Medicamento] [bit] NULL,
	[VHC_Diagnostico] [varchar](50) NULL,
	[FK_IP_Cod] [int] NULL,
 CONSTRAINT [PK_T_Historia_Clinica] PRIMARY KEY CLUSTERED 
(
	[PK_IHC_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Horarios]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Horarios](
	[PK_IH_Cod] [int] IDENTITY(1,1) NOT NULL,
	[TH_Horario_Atencion] [time](7) NULL,
 CONSTRAINT [PK_T_Horarios] PRIMARY KEY CLUSTERED 
(
	[PK_IH_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Persona]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Persona](
	[PK_IP_Cod] [int] IDENTITY(1,1) NOT NULL,
	[IP_Dni] [int] NULL,
	[VP_Nombre_Completo] [varchar](50) NULL,
	[VP_Apellido_Paterno] [varchar](50) NULL,
	[VP_Apellido_Materno] [varchar](50) NULL,
	[VP_Correo_Electronico] [varchar](50) NULL,
	[VP_Direccion] [varchar](50) NULL,
	[DP_Fecha_Nacimiento] [date] NULL,
	[DP_Fecha_Registro] [date] NULL,
	[IP_Telefono] [int] NULL,
 CONSTRAINT [PK_T_Persona] PRIMARY KEY CLUSTERED 
(
	[PK_IP_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Roles]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Roles](
	[PK_IR_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VR_Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_T_Roles] PRIMARY KEY CLUSTERED 
(
	[PK_IR_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TratamientoForCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TratamientoForCita](
	[PK_ITFC_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VITFC_NombreTratamiento] [varchar](50) NULL,
	[ITFC_Cantidad] [int] NULL,
	[ITFC_NumeroSesiones] [int] NULL,
	[ITFC_CostoUnitario] [int] NULL,
	[ITFC_CostoTotal] [int] NULL,
	[FK_IC_Cod] [int] NULL,
	[FK_ITRA_Cod] [int] NULL,
	[FK_IETFC_Cod] [int] NULL,
 CONSTRAINT [PK_T_TratamientoForCita] PRIMARY KEY CLUSTERED 
(
	[PK_ITFC_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Usuario]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Usuario](
	[PK_IU_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VU_Correo] [varchar](50) NULL,
	[VU_Contraseña] [varchar](50) NULL,
	[IU_Dni] [int] NULL,
	[FK_IP_Cod] [int] NULL,
	[FK_IR_Cod] [int] NULL,
 CONSTRAINT [PK_T_Usuario] PRIMARY KEY CLUSTERED 
(
	[PK_IU_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamiento](
	[PK_ITRA_Cod] [int] IDENTITY(1,1) NOT NULL,
	[VTRA_Nombre] [varchar](50) NULL,
	[ITRA_Costo] [int] NULL,
 CONSTRAINT [PK_Tratamiento] PRIMARY KEY CLUSTERED 
(
	[PK_ITRA_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_Cita]  WITH CHECK ADD  CONSTRAINT [FK_T_Cita_Doctor] FOREIGN KEY([FK_ID_Cod])
REFERENCES [dbo].[Doctor] ([PK_ID_Cod])
GO
ALTER TABLE [dbo].[T_Cita] CHECK CONSTRAINT [FK_T_Cita_Doctor]
GO
ALTER TABLE [dbo].[T_Cita]  WITH CHECK ADD  CONSTRAINT [FK_T_Cita_T_Estado_Cita] FOREIGN KEY([FK_IEC_Cod])
REFERENCES [dbo].[T_Estado_Cita] ([PK_IEC_Cod])
GO
ALTER TABLE [dbo].[T_Cita] CHECK CONSTRAINT [FK_T_Cita_T_Estado_Cita]
GO
ALTER TABLE [dbo].[T_Cita]  WITH CHECK ADD  CONSTRAINT [FK_T_Cita_T_Horarios] FOREIGN KEY([FK_IH_Cod])
REFERENCES [dbo].[T_Horarios] ([PK_IH_Cod])
GO
ALTER TABLE [dbo].[T_Cita] CHECK CONSTRAINT [FK_T_Cita_T_Horarios]
GO
ALTER TABLE [dbo].[T_Cita]  WITH CHECK ADD  CONSTRAINT [FK_T_Cita_T_Persona] FOREIGN KEY([FK_IP_Cod])
REFERENCES [dbo].[T_Persona] ([PK_IP_Cod])
GO
ALTER TABLE [dbo].[T_Cita] CHECK CONSTRAINT [FK_T_Cita_T_Persona]
GO
ALTER TABLE [dbo].[T_Historia_Clinica]  WITH CHECK ADD  CONSTRAINT [FK_T_Historia_Clinica_T_Persona] FOREIGN KEY([FK_IP_Cod])
REFERENCES [dbo].[T_Persona] ([PK_IP_Cod])
GO
ALTER TABLE [dbo].[T_Historia_Clinica] CHECK CONSTRAINT [FK_T_Historia_Clinica_T_Persona]
GO
ALTER TABLE [dbo].[T_TratamientoForCita]  WITH CHECK ADD  CONSTRAINT [FK_T_TratamientoForCita_T_Cita] FOREIGN KEY([FK_IC_Cod])
REFERENCES [dbo].[T_Cita] ([PK_IC_Cod])
GO
ALTER TABLE [dbo].[T_TratamientoForCita] CHECK CONSTRAINT [FK_T_TratamientoForCita_T_Cita]
GO
ALTER TABLE [dbo].[T_TratamientoForCita]  WITH CHECK ADD  CONSTRAINT [FK_T_TratamientoForCita_Tratamiento] FOREIGN KEY([FK_ITRA_Cod])
REFERENCES [dbo].[Tratamiento] ([PK_ITRA_Cod])
GO
ALTER TABLE [dbo].[T_TratamientoForCita] CHECK CONSTRAINT [FK_T_TratamientoForCita_Tratamiento]
GO
ALTER TABLE [dbo].[T_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_T_Persona] FOREIGN KEY([FK_IP_Cod])
REFERENCES [dbo].[T_Persona] ([PK_IP_Cod])
GO
ALTER TABLE [dbo].[T_Usuario] CHECK CONSTRAINT [FK_T_Usuario_T_Persona]
GO
ALTER TABLE [dbo].[T_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_T_Usuario_T_Roles] FOREIGN KEY([FK_IR_Cod])
REFERENCES [dbo].[T_Roles] ([PK_IR_Cod])
GO
ALTER TABLE [dbo].[T_Usuario] CHECK CONSTRAINT [FK_T_Usuario_T_Roles]
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_Password]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Actualizar_Password]
@documentoidentidad int,
@contrasenia varchar(50),
@contrasenia_nueva varchar(50)
as
begin
	UPDATE T_Usuario
	SET VU_Contraseña = @contrasenia_nueva
	WHERE T_Usuario.IU_Dni = @documentoidentidad and T_Usuario.VU_Contraseña=@contrasenia;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarEstadoCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_actualizarEstadoCita]
@PK_IC_Cod int,
@FK_IEC_Cod int
AS
BEGIN

  SET NOCOUNT ON;
		UPDATE T_Cita
		SET  FK_IEC_Cod  = @FK_IEC_Cod 
		WHERE PK_IC_Cod = @PK_IC_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[SP_asistioDCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_asistioDCita]
@PK_IC_Cod int
as
begin
	UPDATE T_Cita
	SET T_Cita.FK_IEC_Cod = 4
	WHERE T_Cita.PK_IC_Cod = @PK_IC_Cod;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarPersona]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BuscarPersona]@Dni intASSELECT *  from T_Persona WHERE IP_Dni=@Dni 
GO
/****** Object:  StoredProcedure [dbo].[sp_cancelarCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_cancelarCita]
@PK_IC_Cod int
AS
BEGIN
	SET NOCOUNT ON;
		DELETE FROM T_TratamientoForCita where FK_IC_Cod=@PK_IC_Cod;
		DELETE FROM T_Cita WHERE PK_IC_Cod=@PK_IC_Cod;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelarPCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CancelarPCita]
@PK_IC_Cod int
AS
BEGIN

	delete from [dbo].[T_Cita]
	where PK_IC_Cod = @PK_IC_Cod
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarCostoTratamiento]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarCostoTratamiento]
@PKINT int
AS
BEGIN
SELECT ITRA_Costo FROM Tratamiento WHERE PK_ITRA_Cod =@PKINT
END

GO
/****** Object:  StoredProcedure [dbo].[sp_doctorDefault]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_doctorDefault]
@PK_IC_Cod int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT FK_ID_Cod FROM T_Cita WHERE PK_IC_Cod=@PK_IC_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[sp_editarMaterial]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_editarMaterial]
@id int,
@nombre varchar(45),
@stock int,
@categoria varchar(45),
@ubicacion varchar(45)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE T_Almacen
		SET  nombre  = @nombre,
		stock=@stock,
		categoria  = @categoria,
		ubicacion  = @ubicacion
		WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminaMaterial]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminaMaterial]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM T_Almacen WHERE id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_horaDefault]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_horaDefault]
@PK_IC_Cod int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT FK_IH_Cod FROM T_Cita WHERE PK_IC_Cod=@PK_IC_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Citas]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Citas]
AS
BEGIN
select ci.PK_IC_Cod,per.VP_Nombre_Completo, (per.VP_Apellido_Paterno+ ' ' + VP_Apellido_Materno) as Apellidos,per.IP_Dni,
  ci.DC_Fecha_Cita,convert(varchar(5),ho.TH_Horario_Atencion,108)as Hora,('Dr. ' + doc.VD_Apellidos) as Doctor,ci.VC_Tratamiento,
  ec.VEC_Nombre
  from T_Persona per
  inner join T_Cita ci on per.PK_IP_Cod = ci.FK_IP_Cod
  inner join T_Horarios ho on ci.FK_IH_Cod = ho.PK_IH_Cod
  inner join Doctor doc on ci.FK_ID_Cod = doc.PK_ID_Cod
  inner join T_Estado_Cita ec on ci.FK_IEC_Cod= ec.PK_IEC_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_CitasPorPaciente]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Listar_CitasPorPaciente]
AS
BEGIN
select c.PK_IC_Cod,p.VP_Nombre_Completo,(p.VP_Apellido_Materno + ' ' + p.VP_Apellido_Paterno) as Apellidos,p.IP_Dni,c.DC_Fecha_Cita,convert(varchar(5),TH_Horario_Atencion,108)as Hora ,('Dr. ' + VD_Apellidos)as Doctor from T_Persona p
inner join T_Cita  c on p.PK_IP_Cod = c.FK_IP_Cod
inner join Doctor d on c.FK_ID_Cod =  d.PK_ID_Cod
inner join T_Horarios h on c.FK_IH_Cod =  h.PK_IH_Cod
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Doctor_ddl]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Listar_Doctor_ddl]
AS
BEGIN
SELECT PK_ID_Cod, ('Dr. ' + VD_Apellidos) as apellido FROM Doctor
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Hora_ddl]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Listar_Hora_ddl]
AS
BEGIN
SELECT PK_IH_Cod, convert(varchar(5),TH_Horario_Atencion,108)as HORA FROM T_Horarios
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_material]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listar_material]
AS
BEGIN
	SELECT * FROM T_Almacen
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Paciente_Nuevo]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Paciente_Nuevo]
AS
BEGIN
select ci.PK_IC_Cod,per.VP_Nombre_Completo, (per.VP_Apellido_Paterno+ ' ' + VP_Apellido_Materno) as Apellidos,per.IP_Dni,
  ci.DC_Fecha_Cita,convert(varchar(5),ho.TH_Horario_Atencion,108)as Hora,('Dr. ' + doc.VD_Apellidos) as Doctor,ci.VC_Tratamiento
 
  from T_Persona per
  inner join T_Cita ci on per.PK_IP_Cod = ci.FK_IP_Cod
  inner join T_Horarios ho on ci.FK_IH_Cod = ho.PK_IH_Cod
  inner join Doctor doc on ci.FK_ID_Cod = doc.PK_ID_Cod
  inner join T_Estado_Cita ec on ci.FK_IEC_Cod= ec.PK_IEC_Cod
  where ci.VC_Tratamiento='Nuevo' and ec.VEC_Nombre='Pagado' and ci.FK_ID_Cod=5
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Tratamiento_ddl]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Tratamiento_ddl]
AS
BEGIN
SELECT PK_ITRA_Cod,VTRA_Nombre FROM Tratamiento
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_TratamientoForCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_TratamientoForCita]
@pkcita int
AS
BEGIN
select tfc.PK_ITFC_Cod,tfc.VITFC_NombreTratamiento,tfc.ITFC_Cantidad,tfc.ITFC_NumeroSesiones,tfc.ITFC_CostoUnitario,tfc.ITFC_CostoTotal from T_TratamientoForCita tfc
where FK_IETFC_Cod = 1 and FK_IC_Cod = @pkcita
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarDCitas]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ListarDCitas]
as 
begin
select ci.PK_IC_Cod,per.VP_Nombre_Completo, (per.VP_Apellido_Paterno+ ' ' + VP_Apellido_Materno) as Apellidos,per.IP_Dni,
  ci.DC_Fecha_Cita,convert(varchar(5),ho.TH_Horario_Atencion,108)as Hora,('Dr. ' + doc.VD_Apellidos) as Doctor,ci.VC_Tratamiento,
  ec.VEC_Nombre
  from T_Persona per
  inner join T_Cita ci on per.PK_IP_Cod = ci.FK_IP_Cod
  inner join T_Horarios ho on ci.FK_IH_Cod = ho.PK_IH_Cod
  inner join Doctor doc on ci.FK_ID_Cod = doc.PK_ID_Cod
  inner join T_Estado_Cita ec on ci.FK_IEC_Cod= ec.PK_IEC_Cod
  where ci.FK_IEC_Cod=2 or ci.FK_IEC_Cod=4
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarPCitas]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ListarPCitas]
@documentoidentidad int 
as 
begin
select ci.PK_IC_Cod,per.VP_Nombre_Completo, (per.VP_Apellido_Paterno+ ' ' + VP_Apellido_Materno) as Apellidos,per.IP_Dni,
  ci.DC_Fecha_Cita,convert(varchar(5),ho.TH_Horario_Atencion,108)as Hora,('Dr. ' + doc.VD_Apellidos) as Doctor,ci.VC_Tratamiento,
  ec.VEC_Nombre
  from T_Persona per
  inner join T_Cita ci on per.PK_IP_Cod = ci.FK_IP_Cod
  inner join T_Horarios ho on ci.FK_IH_Cod = ho.PK_IH_Cod
  inner join Doctor doc on ci.FK_ID_Cod = doc.PK_ID_Cod
  inner join T_Estado_Cita ec on ci.FK_IEC_Cod= ec.PK_IEC_Cod
  where per.IP_Dni=@documentoidentidad
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarPersona]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[SP_ListarPersona]
AS
SELECT * from T_Persona
GO
/****** Object:  StoredProcedure [dbo].[sp_mostrar_datos_material]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_mostrar_datos_material]
@id int
AS
BEGIN
	SET NOCOUNT ON;
	select nombre,stock,categoria,ubicacion from T_Almacen where id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_DatosCitaYPersonales]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Mostrar_DatosCitaYPersonales]
@PK_IC_Cod  int
AS
BEGIN
select per.VP_Nombre_Completo, per.VP_Apellido_Paterno,VP_Apellido_Materno,per.IP_Telefono,per.VP_Correo_Electronico,
per.VP_Direccion,ci.DC_Fecha_Cita,TH_Horario_Atencion,doc.VD_Apellidos,ci.VC_Tratamiento
  from T_Persona per
  inner join T_Cita ci on per.PK_IP_Cod = ci.FK_IP_Cod
  inner join T_Horarios ho on ci.FK_IH_Cod = ho.PK_IH_Cod
  inner join Doctor doc on ci.FK_ID_Cod = doc.PK_ID_Cod
  where ci.PK_IC_Cod =@PK_IC_Cod 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Registrar_Cita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registrar_Cita]
@DC_Fecha_Cita date,
@VC_Tratamiento varchar(50),
@FK_IP_Cod int,
@FK_IH_Cod int,
@FK_ID_Cod int,
@FK_IEC_Cod int
AS
INSERT INTO T_Cita(DC_Fecha_Cita,VC_Tratamiento,FK_IP_Cod,FK_ID_Cod,FK_IH_Cod,FK_IEC_Cod)

VALUES (@DC_Fecha_Cita,@VC_Tratamiento,@FK_IP_Cod,@FK_ID_Cod,@FK_IH_Cod,@FK_IEC_Cod )
GO
/****** Object:  StoredProcedure [dbo].[sp_Registrar_CostoCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registrar_CostoCita]
@PK_IC_Cod int
AS
BEGIN

  SET NOCOUNT ON;
		UPDATE T_Cita
		SET  IC_Costo_Cita  = 50
		WHERE PK_IC_Cod = @PK_IC_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Registrar_HistoriaClinica]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registrar_HistoriaClinica]
@VHC_Codigo varchar(50),
@DHC_Fecha_Historia date,
@VHC_Motivo_Consulta varchar(50),
@DHC_Ultima_Visita date,
@VHC_Alergias varchar(50),
@BHC_Toma_Medicamento bit,
@VHC_Diagnostico varchar(50),
@FK_IP_Cod int
AS
INSERT INTO T_Historia_Clinica(VHC_Codigo,DHC_Fecha_Historia,VHC_Motivo_Consulta,DHC_Ultima_Visita,VHC_Alergias,BHC_Toma_Medicamento,VHC_Diagnostico,FK_IP_Cod)

VALUES (@VHC_Codigo,@DHC_Fecha_Historia,@VHC_Motivo_Consulta,@DHC_Ultima_Visita,@VHC_Alergias,@BHC_Toma_Medicamento ,
@VHC_Diagnostico,@FK_IP_Cod)
GO
/****** Object:  StoredProcedure [dbo].[sp_Registrar_Persona]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registrar_Persona]
@IP_Dni int,
@VP_Nombre_Completo varchar(50),
@VP_Apellido_Paterno varchar(50),
@VP_Apellido_Materno varchar(50),
@VP_Correo_Electronico varchar(50),
@VP_Direccion varchar(50),
@DP_Fecha_Nacimiento date,
@DP_Fecha_Registro date,
@IP_Telefono int
AS
INSERT INTO T_Persona(IP_Dni,VP_Nombre_Completo,VP_Apellido_Paterno,VP_Apellido_Materno,VP_Correo_Electronico,VP_Direccion,DP_Fecha_Nacimiento,DP_Fecha_Registro,IP_Telefono)

VALUES (@IP_Dni ,@VP_Nombre_Completo ,@VP_Apellido_Paterno,@VP_Apellido_Materno,@VP_Correo_Electronico,@VP_Direccion ,@DP_Fecha_Nacimiento,@DP_Fecha_Registro,@IP_Telefono )
GO
/****** Object:  StoredProcedure [dbo].[sp_Registrar_TratamientoForCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registrar_TratamientoForCita]
@VITFC_NombreTratamiento varchar(50),
@ITFC_Cantidad int,
@ITFC_NumeroSesiones int,
@ITFC_CostoUnitario int,
@ITFC_CostoTotal int,
@FK_IC_Cod int,
@FK_ITRA_Cod int
AS
INSERT INTO T_TratamientoForCita(
VITFC_NombreTratamiento ,
ITFC_Cantidad,
ITFC_NumeroSesiones ,
ITFC_CostoUnitario ,
ITFC_CostoTotal ,
FK_IC_Cod ,
FK_ITRA_Cod ,
FK_IETFC_Cod
)

VALUES (
@VITFC_NombreTratamiento ,
@ITFC_Cantidad ,
@ITFC_NumeroSesiones ,
@ITFC_CostoUnitario ,
@ITFC_CostoTotal ,
@FK_IC_Cod ,
@FK_ITRA_Cod ,
1
)
GO
/****** Object:  StoredProcedure [dbo].[sp_registrarMaterial]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_registrarMaterial]
@nombre varchar(45),
@stock int,
@categoria varchar(45),
@ubicacion varchar(45)
AS
BEGIN

	SET NOCOUNT ON;
INSERT INTO T_Almacen(nombre,stock,categoria,ubicacion)

VALUES (@nombre ,@stock ,@categoria,@ubicacion)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_reprogramarCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_reprogramarCita]
@PK_IC_Cod int,
@DC_Fecha_Cita date,
@FK_ID_Cod int,
@FK_IH_Cod int
AS
BEGIN
	SET NOCOUNT ON;
		UPDATE T_Cita
		SET  FK_ID_Cod  = @FK_ID_Cod,
		DC_Fecha_Cita=@DC_Fecha_Cita,
		FK_IH_Cod  = @FK_IH_Cod
		WHERE PK_IC_Cod = @PK_IC_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStateTratamientoForCita]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_UpdateStateTratamientoForCita]
@pkitfc int
AS
BEGIN

	update T_TratamientoForCita
	set FK_IETFC_Cod = 2
	where PK_ITFC_Cod = @pkitfc
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Validar_Usuario]    Script Date: 16/06/2022 18:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Validar_Usuario]
@documentoidentidad int,
@contrasenia varchar(50)
as
begin
	select * from T_Usuario where IU_Dni = @documentoidentidad and VU_Contraseña=@contrasenia
end

GO
USE [master]
GO
ALTER DATABASE [BD_SWGACO] SET  READ_WRITE 
GO
