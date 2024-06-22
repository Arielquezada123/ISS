CREATE TABLE [dbo].[usuarios](
	[usu_rut] [varchar](12) NOT NULL,
	[usu_nombre] [varchar](20) NULL,
	[usu_apelllido] [varchar](20) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[usu_rut] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO