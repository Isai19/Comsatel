USE [master]
GO
/****** Object:  Database [Comsatel]    Script Date: 24/07/2020 00:37:37 ******/
CREATE DATABASE [Comsatel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Comsatel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Comsatel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Comsatel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Comsatel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Comsatel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Comsatel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Comsatel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Comsatel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Comsatel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Comsatel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Comsatel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Comsatel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Comsatel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Comsatel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Comsatel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Comsatel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Comsatel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Comsatel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Comsatel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Comsatel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Comsatel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Comsatel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Comsatel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Comsatel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Comsatel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Comsatel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Comsatel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Comsatel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Comsatel] SET RECOVERY FULL 
GO
ALTER DATABASE [Comsatel] SET  MULTI_USER 
GO
ALTER DATABASE [Comsatel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Comsatel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Comsatel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Comsatel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Comsatel] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Comsatel', N'ON'
GO
ALTER DATABASE [Comsatel] SET QUERY_STORE = OFF
GO
USE [Comsatel]
GO
/****** Object:  Table [dbo].[tareas]    Script Date: 24/07/2020 00:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tareas](
	[tarea_id] [int] IDENTITY(1,1) NOT NULL,
	[tarea_descripcion] [varchar](50) NOT NULL,
	[tarea_estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tarea_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SPM_Agregar]    Script Date: 24/07/2020 00:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPM_Agregar] 
	@descripcion varchar(50),
	@estado bit
AS
BEGIN
	insert into tareas values (@descripcion,@estado)
END
GO
/****** Object:  StoredProcedure [dbo].[SPM_Editar]    Script Date: 24/07/2020 00:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SPM_Editar] 
	@id_tarea int,
	@descripcion varchar(50),
	@estado bit
AS
BEGIN
	UPDATE tareas SET tarea_descripcion = @descripcion, tarea_estado=@estado WHERE tarea_id=@id_tarea;
END
GO
/****** Object:  StoredProcedure [dbo].[SPM_Eliminar]    Script Date: 24/07/2020 00:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPM_Eliminar] 
	@id_tarea int
AS
BEGIN
	delete tareas where tarea_id=@id_tarea
END
GO
/****** Object:  StoredProcedure [dbo].[SPM_Listar]    Script Date: 24/07/2020 00:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPM_Listar] 
AS
BEGIN
	select tarea_id, tarea_descripcion, tarea_estado from tareas
END
GO
/****** Object:  StoredProcedure [dbo].[SPM_ListarId]    Script Date: 24/07/2020 00:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[SPM_ListarId] 

@id_tarea int 
AS
BEGIN
	select tarea_id, tarea_descripcion, tarea_estado from tareas where tarea_id=@id_tarea
END
GO
USE [master]
GO
ALTER DATABASE [Comsatel] SET  READ_WRITE 
GO
