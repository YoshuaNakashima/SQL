USE [TaskHierarchy]
GO
/****** Object:  StoredProcedure [dbo].[MoveToRoot]    Script Date: 2018/11/15 10:19:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[MoveToRoot]
GO
/****** Object:  StoredProcedure [dbo].[MoveSubtree]    Script Date: 2018/11/15 10:19:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[MoveSubtree]
GO
/****** Object:  StoredProcedure [dbo].[JoinToSuperTree]    Script Date: 2018/11/15 10:19:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[JoinToSuperTree]
GO
/****** Object:  StoredProcedure [dbo].[InsertToRoot]    Script Date: 2018/11/15 10:19:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertToRoot]
GO
/****** Object:  StoredProcedure [dbo].[InsertNode]    Script Date: 2018/11/15 10:19:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertNode]
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubtree]    Script Date: 2018/11/15 10:19:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[DeleteSubtree]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 2018/11/15 10:19:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[DeleteCategory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tree_paths]') AND type in (N'U'))
ALTER TABLE [dbo].[tree_paths] DROP CONSTRAINT IF EXISTS [FK__tree_path__desce__2F10007B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tree_paths]') AND type in (N'U'))
ALTER TABLE [dbo].[tree_paths] DROP CONSTRAINT IF EXISTS [FK__tree_path__ances__2E1BDC42]
GO
/****** Object:  View [dbo].[View_PathList]    Script Date: 2018/11/15 10:19:09 ******/
DROP VIEW IF EXISTS [dbo].[View_PathList]
GO
/****** Object:  View [dbo].[View_PathTable]    Script Date: 2018/11/15 10:19:09 ******/
DROP VIEW IF EXISTS [dbo].[View_PathTable]
GO
/****** Object:  View [dbo].[View_NodePath]    Script Date: 2018/11/15 10:19:09 ******/
DROP VIEW IF EXISTS [dbo].[View_NodePath]
GO
/****** Object:  View [dbo].[View_ColmnPathID]    Script Date: 2018/11/15 10:19:09 ******/
DROP VIEW IF EXISTS [dbo].[View_ColmnPathID]
GO
/****** Object:  View [dbo].[View_ColmnPath]    Script Date: 2018/11/15 10:19:09 ******/
DROP VIEW IF EXISTS [dbo].[View_ColmnPath]
GO
/****** Object:  View [dbo].[View_HierarchyPath]    Script Date: 2018/11/15 10:19:09 ******/
DROP VIEW IF EXISTS [dbo].[View_HierarchyPath]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 2018/11/15 10:19:09 ******/
DROP TABLE IF EXISTS [dbo].[categories]
GO
/****** Object:  Table [dbo].[tree_paths]    Script Date: 2018/11/15 10:19:09 ******/
DROP TABLE IF EXISTS [dbo].[tree_paths]
GO
USE [master]
GO
/****** Object:  Database [TaskHierarchy]    Script Date: 2018/11/15 10:19:09 ******/
DROP DATABASE IF EXISTS [TaskHierarchy]
GO
/****** Object:  Database [TaskHierarchy]    Script Date: 2018/11/15 10:19:09 ******/
CREATE DATABASE [TaskHierarchy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskHierarchy', FILENAME = N'***\MSSQL\DATA\TaskHierarchy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaskHierarchy_log', FILENAME = N'***\MSSQL\DATA\TaskHierarchy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Japanese_CI_AS
GO
ALTER DATABASE [TaskHierarchy] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskHierarchy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskHierarchy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskHierarchy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskHierarchy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskHierarchy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskHierarchy] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskHierarchy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaskHierarchy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskHierarchy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskHierarchy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskHierarchy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaskHierarchy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskHierarchy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskHierarchy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskHierarchy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskHierarchy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaskHierarchy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskHierarchy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaskHierarchy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaskHierarchy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaskHierarchy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskHierarchy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaskHierarchy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaskHierarchy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TaskHierarchy] SET  MULTI_USER 
GO
ALTER DATABASE [TaskHierarchy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaskHierarchy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaskHierarchy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaskHierarchy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TaskHierarchy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TaskHierarchy] SET QUERY_STORE = OFF
GO
USE [TaskHierarchy]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TaskHierarchy]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[tree_paths]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tree_paths](
	[ancestor] [bigint] NOT NULL,
	[descendant] [bigint] NOT NULL,
	[path_length] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ancestor] ASC,
	[descendant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) COLLATE Japanese_CI_AS NOT NULL,
	[nth_child] [bigint] NOT NULL,
 CONSTRAINT [PK__categori__3213E83F44FDFE9C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_HierarchyPath]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 最初と最後を指定して、パスを取得*/
CREATE VIEW [dbo].[View_HierarchyPath]
AS
SELECT [path_id]
      ,[top_name]
      ,[path]
      ,[bottom_name]
      ,DENSE_RANK() OVER (ORDER BY [top_ancestor], [bottom_descendant]) AS [DenseRank]
      ,ROW_NUMBER() OVER (PARTITION BY [top_ancestor], [bottom_descendant] ORDER BY [top_path_length]) AS [PartRowNumber]
      ,[top_ancestor]   
      ,[top_descendant] 
      ,[top_path_length]
      ,[bottom_ancestor]   
      ,[bottom_descendant] 
      ,[bottom_path_length]
FROM(
SELECT c.id             AS [path_id]
      ,c1.name          AS [top_name]
      ,c .name          AS [path]
      ,c2.name          AS [bottom_name]
      ,t1.[ancestor]    AS [top_ancestor]   
      ,t1.[descendant]  AS [top_descendant] 
      ,t1.[path_length] AS [top_path_length]
      ,t2.[ancestor]    AS [bottom_ancestor]   
      ,t2.[descendant]  AS [bottom_descendant] 
      ,t2.[path_length] AS [bottom_path_length]
  FROM [dbo].[categories] AS c
       -- ツリー先頭のリスト
       INNER JOIN [dbo].[tree_paths] AS t1
       ON c.id = t1.descendant
           LEFT JOIN [dbo].[categories] AS c1
           ON t1.ancestor = c1.id
       -- ツリー末端のリスト
       INNER JOIN [dbo].[tree_paths] AS t2
       ON c.id = t2.ancestor
           LEFT JOIN [dbo].[categories] AS c2
           ON t2.descendant = c2.id
 WHERE(t1.ancestor   IN (
        -- ツリーの先頭を取得
        SELECT ancestor
          FROM [dbo].[tree_paths]
         WHERE ancestor NOT IN (SELECT DISTINCT descendant FROM [dbo].[tree_paths] WHERE descendant <> ancestor)
         GROUP BY ancestor
      ))
   AND(t2.descendant IN (
        -- ツリーの末端を取得
        SELECT descendant
          FROM [dbo].[tree_paths]
         WHERE descendant NOT IN (SELECT DISTINCT ancestor FROM [dbo].[tree_paths] WHERE descendant <> ancestor)
         GROUP BY descendant
      ))
) AS A
-- 以下の ORDER BY を使用してください。
-- ORDER BY [top_ancestor], [bottom_descendant], [top_path_length]
GO


/****** Object:  View [dbo].[View_ColmnPath]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 最初と最後を指定して、パスを取得*/
CREATE VIEW [dbo].[View_ColmnPath]
AS
SELECT ROW_NUMBER() OVER (ORDER BY [1],[2],[3],[4],[5],[6],[7]) AS [RowNumber]
      ,[DenseRank]
      ,PV.[1] AS [取引先]
      ,PV.[2] AS [システム]
      ,PV.[3] AS [区分1]
      ,PV.[4] AS [区分2]
      ,PV.[5] AS [区分3]
      ,PV.[6] AS [区分4]
      ,PV.[7] AS [区分5]
FROM( SELECT [path],[PartRowNumber],[DenseRank]
        FROM [TaskHierarchy].[dbo].[View_HierarchyPath] ) AS T
PIVOT ( MAX([path])FOR [PartRowNumber] IN([1],[2],[3],[4],[5],[6],[7]) ) AS PV
GO


/****** Object:  View [dbo].[View_ColmnPathID]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 最初と最後を指定して、パスを取得*/
CREATE VIEW [dbo].[View_ColmnPathID]
AS
SELECT [DenseRank]
      ,PV.[1] AS [取引先]
      ,PV.[2] AS [システム]
      ,PV.[3] AS [区分1]
      ,PV.[4] AS [区分2]
      ,PV.[5] AS [区分3]
      ,PV.[6] AS [区分4]
      ,PV.[7] AS [区分5]
FROM( SELECT [path_id],[PartRowNumber],[DenseRank]
        FROM [TaskHierarchy].[dbo].[View_HierarchyPath] ) AS T
PIVOT ( MAX([path_id])FOR [PartRowNumber] IN([1],[2],[3],[4],[5],[6],[7]) ) AS PV
GO


/****** Object:  View [dbo].[View_NodePath]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 最初と最後を指定して、パスを取得*/
CREATE VIEW [dbo].[View_NodePath]
AS
    SELECT ROW_NUMBER() OVER (PARTITION BY descendant ORDER BY path_length DESC) AS RowNumber
          ,* 
      FROM categories AS c
           INNER JOIN tree_paths AS t
           ON c.id = t.ancestor
GO


/****** Object:  View [dbo].[View_PathTable]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_PathTable]
AS
    SELECT ROW_NUMBER() OVER (ORDER BY [1],[2],[3],[4],[5],[6]) AS [Row_Num]
          ,PVT.[descendant] AS [id]
          ,[1],[2],[3],[4],[5],[6]
      FROM(SELECT d.[RowNumber]
                 ,d.[name]
                 ,d.[descendant]
             FROM(--各ノードに至るパスを取得
                   SELECT ROW_NUMBER() OVER (PARTITION BY descendant ORDER BY path_length DESC) AS RowNumber
                       ,* 
                   FROM categories AS c
                        INNER JOIN tree_paths AS t
                        ON c.id = t.ancestor) AS d
          ) AS T
     PIVOT(MAX([name])
           FOR [RowNumber] IN ([1],[2],[3],[4],[5],[6])) AS PVT
GO


/****** Object:  View [dbo].[View_PathList]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_PathList]
AS
    SELECT CONCAT(CASE WHEN T.[1] IS NOT NULL THEN N'[ ' +[1] ELSE N'' END,
                  CASE WHEN T.[2] IS NOT NULL THEN N' > '+[2] ELSE N'' END,
                  CASE WHEN T.[3] IS NOT NULL THEN N' > '+[3] ELSE N'' END,
                  CASE WHEN T.[4] IS NOT NULL THEN N' > '+[4] ELSE N'' END,
                  CASE WHEN T.[5] IS NOT NULL THEN N' > '+[5] ELSE N'' END,
                  CASE WHEN T.[6] IS NOT NULL THEN N' > '+[6] ELSE N'' END,N' ]') AS [Path]
      FROM [TaskHierarchy].[dbo].[View_PathTable] AS T
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (1, N'COMPANY1', 1)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (2, N'COM2', 2)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (3, N'COM3', 3)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (4, N'自社', 4)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (5, N'COM4', 5)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (6, N'COM5', 6)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (7, N'PRDCT1', 1)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (8, N'PRDCT2', 2)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (9, N'PRDCT3', 3)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (10, N'PRDCT4', 4)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (11, N'PRDCT5', 5)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (12, N'PRDCT6', 6)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (13, N'PRDCT7', 7)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (14, N'PRDCT8', 8)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (15, N'PRDCT9', 9)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (16, N'PRDCT10', 10)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (17, N'PRDCT11', 11)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (18, N'PRDCT12', 12)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (19, N'教育', 13)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (20, N'社内業務', 14)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (21, N'社外業務', 15)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (22, N'調査', 16)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (23, N'開発', 1)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (24, N'CI', 2)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (25, N'保守', 3)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (26, N'1.機能改良', 1)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (27, N'2.システム仕様変更・追加による機能改善', 2)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (28, N'3.既存機能の不具合修正', 3)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (29, N'4.既存機能の不具合修正', 4)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (30, N'5.その他', 5)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (31, N'PRDCT11とする為の機能開発', 6)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (33, N'サーバー保守', 8)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (34, N'その他保守', 9)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (35, N'顧客対応', 10)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (36, N'社内向けeLearningシステム開発', 11)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (37, N'1.基本設計その他', 1)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (38, N'1.仕様検討', 2)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (39, N'2.Webサーバー上のmdb廃止の対応', 3)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (40, N'2.設計・計画', 4)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (41, N'3.PRDCT11機能の対応', 5)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (42, N'3.実装・構築', 6)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (43, N'4.PRDCT3側機能の対応', 7)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (44, N'4.検証・修正', 8)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (45, N'連動', 9)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (46, N'PRDCT7関連', 10)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (47, N'WindowsUpdate適用', 11)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (48, N'インストール', 12)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (49, N'インストールキット作成', 13)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (50, N'オートアップデート更新', 14)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (51, N'その他', 15)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (52, N'その他付帯ソフトアップデートなど', 16)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (53, N'データ保守など', 17)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (54, N'バグ修正・軽微なコード変更', 18)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (55, N'バックアップ関連業務など', 19)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (56, N'パッチリリース関連', 20)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (57, N'復旧', 21)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (58, N'ユーザー追加', 22)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (59, N'印刷レイアウト', 23)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (60, N'モデル', 24)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (61, N'会議・資料作成', 25)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (62, N'月次報告書作成', 26)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (63, N'工数集計', 27)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (64, N'構造', 28)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (65, N'仕様書', 29)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (66, N'社員・協力会社追加', 30)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (67, N'社員環境整備', 31)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (68, N'新年度組織変更の対応', 32)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (69, N'図面', 33)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (70, N'設計', 34)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (71, N'組織変更', 35)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (72, N'打合せ・進捗会議など', 36)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (73, N'対応', 37)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (74, N'対応.インストールキット作成', 38)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (75, N'単価期更新のサーバー設定対応', 39)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (76, N'報告書・書類作成', 40)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (77, N'問合せ対応・調査など', 41)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (78, N'1.1.基本設計、詳細設計など', 1)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (79, N'1.2.お打合せ、資料作成など', 2)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (80, N'1.3.開発環境準備・維持・管理', 3)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (81, N'2.1.SQLServer PRDCT3.DBに「元データテーブル」「計算結果テーブル」「スケジュールテーブル」等作成', 4)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (82, N'2.10.工積結果CSV出力処理のmdb廃止対応', 5)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (83, N'2.11.LISM･基幹連携DATA生成&転送処理のmdb廃止対応', 6)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (84, N'2.12.支店メンテナンスのmdb廃止対応', 7)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (85, N'2.13.計算スケジューラー管理処理のmdb廃止対応', 8)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (86, N'2.14.PRDCT2からのmdb生成処理廃止対応', 9)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (87, N'2.15.mdbからSQLServerへのデータコンバート', 10)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (88, N'2.2.PRDCT11データ読込処理のmdb廃止対応', 11)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (89, N'2.3.工積付加情報設定登録処理のmdb廃止対応', 12)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (90, N'2.4.工積処理のmdb廃止対応', 13)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (91, N'2.5.合算処理のmdb廃止対応', 14)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (92, N'2.6.差額処理のmdb廃止対応', 15)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (93, N'2.7.明細補正処理のmdb廃止対応', 16)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (94, N'2.8.移管処理のmdb廃止対応', 17)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (95, N'2.9.工積結果印刷処理のmdb廃止対応', 18)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (96, N'3.1.ボタンなどUIの作成', 19)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (97, N'3.10.付加情報アップロード処理のサーバー側対応(受け取りとDBへの書き込み)', 20)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (98, N'3.11.工積予約処理の対応', 21)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (99, N'3.12.モデルに「ステータス」を追加', 22)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (100, N'3.13.結果取得UIの作成', 23)
GO
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (101, N'3.14.結果ダウンロード処理PRDCT11側の対応', 24)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (102, N'3.15.結果ダウンロード処理サーバー側の対応', 25)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (103, N'3.16.結果をモデルデータに保持する機能の対応', 26)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (104, N'3.17.原価帳票印刷機能の対応', 27)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (105, N'3.18.設計済みフラグOFFのタイミングで原価データを無効にする処理の対応', 28)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (106, N'3.2.付加情報設定ダイアログの作成(概要、パネル枚数、現場対応.引継時原価固定.取込ボタン）', 29)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (107, N'3.3.付加情報をPRDCT11データとして保持するように対応(モデル情報)', 30)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (108, N'3.4.PRDCT3データ書き出しを内部的に行なう処理の対応', 31)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (109, N'3.5.PRDCT3データアップロード処理のPRDCT11側対応', 32)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (110, N'3.6.PRDCT3データアップロード処理のサーバー側対応(受け取りとDBへの書き込み)', 33)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (111, N'3.7.引継時原価固定データの保持機能対応', 34)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (112, N'3.8.引継時原価固定データのアップロード対応', 35)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (113, N'3.9.付加情報アップロード処理のPRDCT11側対応', 36)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (114, N'4.1.PRDCT3側データと混在しないようプラン情報に識別フラグ追加', 37)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (115, N'4.2.PRDCT3工事一覧などでPRDCT11のものは表示しないように対応', 38)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (116, N'4.3.引継時原価固定データ保存データベース構造対応(引継時固定データフラグ、親子関係保持)', 39)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (117, N'4.4.引継時原価固定データの受け取りおよびデータ登録処理', 40)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (118, N'4.5.引継時原価固定データ特別処理の対応(差額画面でのみ表示、親を消すと一緒に消える、色の変更)', 41)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (119, N'4.6.引継時原価固定データ LISM・基幹連携データ生成転送処理の対応', 42)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (123, N'開発', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (125, N'開発', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (126, N'保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (127, N'サーバー保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (128, N'その他', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (129, N'WindowsUpdate適用', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (130, N'その他', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (131, N'付帯ソフトアップデートなど', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (132, N'バックアップ関連業務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (133, N'パッチリリース関連', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (134, N'月次報告書作成', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (135, N'社員・協力会社追加', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (136, N'組織変更', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (137, N'問合せ対応・調査など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (138, N'その他', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (139, N'工数集計', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (140, N'報告書・書類作成', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (141, N'問合せ対応・調査など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (142, N'保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (143, N'サーバー保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (144, N'WindowsUpdate適用', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (145, N'その他', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (146, N'その他付帯ソフトアップデートなど', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (147, N'バックアップ関連業務など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (148, N'パッチリリース関連', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (149, N'問合せ対応・調査など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (150, N'その他保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (151, N'その他保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (152, N'その他', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (153, N'バグ修正・軽微なコード変更', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (154, N'会議・資料作成', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (155, N'工数集計', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (156, N'対応', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (157, N'報告書・書類作成', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (158, N'問合せ対応・調査など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (159, N'保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (160, N'サーバー保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (161, N'その他', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (162, N'データ保守など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (163, N'バックアップ関連業務など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (164, N'パッチリリース関連', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (165, N'問合せ対応・調査など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (166, N'その他保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (167, N'会議・資料作成', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (168, N'工数集計', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (169, N'問合せ対応・調査など', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (170, N'その他', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (171, N'報告書・書類作成', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (172, N'連動', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (173, N'PRDCT7関連', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (174, N'インストール', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (175, N'復旧', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (176, N'印刷レイアウト', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (177, N'モデル', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (178, N'構造', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (179, N'仕様書', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (180, N'図面', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (181, N'設計', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (182, N'連動', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (183, N'PRDCT7関連', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (184, N'インストール', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (185, N'復旧', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (186, N'印刷レイアウト', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (187, N'モデル', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (188, N'構造', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (189, N'仕様書', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (190, N'図面', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (191, N'設計', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (192, N'連動', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (193, N'PRDCT7関連', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (194, N'インストール', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (195, N'復旧', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (196, N'印刷レイアウト', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (197, N'モデル', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (198, N'構造', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (199, N'仕様書', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (200, N'図面', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (201, N'設計', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (202, N'連動', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (203, N'PRDCT7関連', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (204, N'インストール', 0)
GO
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (205, N'復旧', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (206, N'印刷レイアウト', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (207, N'モデル', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (208, N'構造', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (209, N'仕様書', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (210, N'図面', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (211, N'設計', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (212, N'保守', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (213, N'開発', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (214, N'開発', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (215, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (216, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (217, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (218, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (219, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (220, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (221, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (222, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (223, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (224, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (225, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (226, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (227, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (228, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (229, N'事務', 0)
INSERT [dbo].[categories] ([id], [name], [nth_child]) VALUES (230, N'事務', 0)
SET IDENTITY_INSERT [dbo].[categories] OFF
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 1, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 18, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 23, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 36, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 38, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 40, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 42, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 44, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (1, 226, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 2, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 12, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 125, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 126, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 127, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 128, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 129, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 130, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 131, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 132, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 133, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 134, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 135, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 136, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 137, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 138, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 139, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 140, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 141, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (2, 220, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 3, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 7, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 8, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 9, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 13, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 14, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 15, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 16, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 17, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 24, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 25, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 26, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 27, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 28, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 29, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 30, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 31, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 33, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 34, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 35, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 37, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 39, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 41, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 43, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 45, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 46, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 47, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 48, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 49, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 50, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 51, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 52, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 53, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 54, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 55, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 56, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 57, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 58, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 59, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 60, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 61, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 62, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 63, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 64, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 65, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 66, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 67, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 68, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 69, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 70, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 71, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 72, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 73, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 74, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 75, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 76, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 77, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 78, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 79, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 80, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 81, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 82, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 83, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 84, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 85, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 86, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 87, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 88, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 89, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 90, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 91, 5)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 92, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 93, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 94, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 95, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 96, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 97, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 98, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 99, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 100, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 101, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 102, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 103, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 104, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 105, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 106, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 107, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 108, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 109, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 110, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 111, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 112, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 113, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 114, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 115, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 116, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 117, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 118, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 119, 5)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 123, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 142, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 143, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 144, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 145, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 146, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 147, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 148, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 149, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 151, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 152, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 153, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 154, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 155, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 156, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 157, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 158, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 159, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 160, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 161, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 162, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 163, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 164, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 165, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 166, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 167, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 168, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 169, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 170, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 171, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 172, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 173, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 174, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 175, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 176, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 177, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 178, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 179, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 180, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 181, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 182, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 183, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 184, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 185, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 186, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 187, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 188, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 189, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 190, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 191, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 192, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 193, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 194, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 195, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 196, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 197, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 198, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 199, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 200, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 201, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 202, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 203, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 204, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 205, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 206, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 207, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 208, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 209, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 210, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 211, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 215, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 216, 2)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 217, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 221, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 222, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 223, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 224, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (3, 225, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 4, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 11, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 19, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 20, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 22, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 212, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 213, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 219, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 227, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 228, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (4, 230, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (5, 5, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (5, 21, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (5, 229, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (6, 6, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (6, 10, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (6, 214, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (6, 218, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 7, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 142, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 143, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 144, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 145, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 146, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 147, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 148, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 149, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 151, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 152, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 153, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 154, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 155, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 156, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 157, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 158, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (7, 215, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 8, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 159, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 160, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 161, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 162, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 163, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 164, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 165, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 166, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 167, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 168, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 169, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 170, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 171, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (8, 216, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (9, 9, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (9, 217, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (10, 10, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (10, 214, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (10, 218, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (11, 11, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (11, 212, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (11, 213, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (11, 219, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 12, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 125, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 126, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 127, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 128, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 129, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 130, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 131, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 132, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 133, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 134, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 135, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 136, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 137, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 138, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 139, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 140, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 141, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (12, 220, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (13, 13, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (13, 221, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (14, 14, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (14, 222, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (15, 15, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (15, 223, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (16, 16, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (16, 224, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 17, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 24, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 25, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 26, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 27, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 28, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 29, 2)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 30, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 31, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 33, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 34, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 35, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 37, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 39, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 41, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 43, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 45, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 46, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 47, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 48, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 49, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 50, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 51, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 52, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 53, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 54, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 55, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 56, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 57, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 58, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 59, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 60, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 61, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 62, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 63, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 64, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 65, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 66, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 67, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 68, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 69, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 70, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 71, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 72, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 73, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 74, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 75, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 76, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 77, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 78, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 79, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 80, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 81, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 82, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 83, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 84, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 85, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 86, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 87, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 88, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 89, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 90, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 91, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 92, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 93, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 94, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 95, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 96, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 97, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 98, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 99, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 100, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 101, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 102, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 103, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 104, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 105, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 106, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 107, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 108, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 109, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 110, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 111, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 112, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 113, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 114, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 115, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 116, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 117, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 118, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 119, 4)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 123, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 172, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 173, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 174, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 175, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 176, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 177, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 178, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 179, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 180, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 181, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 182, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 183, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 184, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 185, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 186, 3)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 187, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 188, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 189, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 190, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 191, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 192, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 193, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 194, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 195, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 196, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 197, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 198, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 199, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 200, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 201, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 202, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 203, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 204, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 205, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 206, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 207, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 208, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 209, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 210, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 211, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (17, 225, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 18, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 23, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 36, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 38, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 40, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 42, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 44, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (18, 226, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (19, 19, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (19, 227, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (20, 20, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (20, 228, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (21, 21, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (21, 229, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (22, 22, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (22, 230, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (23, 23, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (23, 36, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (23, 38, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (23, 40, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (23, 42, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (23, 44, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 24, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 26, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 27, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 28, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 29, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 30, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 45, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 46, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 48, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 57, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 59, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 60, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 64, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 65, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 69, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 70, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 172, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 173, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 174, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 175, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 176, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 177, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 178, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 179, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 180, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 181, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 182, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 183, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 184, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 185, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 186, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 187, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 188, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 189, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 190, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 191, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 192, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 193, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 194, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 195, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 196, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 197, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 198, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 199, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 200, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 201, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 202, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 203, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 204, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 205, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 206, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 207, 2)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 208, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 209, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 210, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (24, 211, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 25, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 33, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 34, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 35, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 47, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 49, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 50, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 51, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 52, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 53, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 54, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 55, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 56, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 58, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 61, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 62, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 63, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 66, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 67, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 68, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 71, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 72, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 73, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 74, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 75, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 76, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (25, 77, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 26, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 45, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 46, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 48, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 57, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 59, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 60, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 64, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 65, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 69, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (26, 70, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 27, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 192, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 193, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 194, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 195, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 196, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 197, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 198, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 199, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 200, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (27, 201, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 28, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 172, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 173, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 174, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 175, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 176, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 177, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 178, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 179, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 180, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (28, 181, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 29, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 182, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 183, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 184, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 185, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 186, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 187, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 188, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 189, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 190, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (29, 191, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 30, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 202, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 203, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 204, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 205, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 206, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 207, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 208, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 209, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 210, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (30, 211, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 31, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 37, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 39, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 41, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 43, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 78, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 79, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 80, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 81, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 82, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 83, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 84, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 85, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 86, 2)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 87, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 88, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 89, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 90, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 91, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 92, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 93, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 94, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 95, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 96, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 97, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 98, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 99, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 100, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 101, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 102, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 103, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 104, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 105, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 106, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 107, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 108, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 109, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 110, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 111, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 112, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 113, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 114, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 115, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 116, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 117, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 118, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (31, 119, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 33, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 47, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 52, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 53, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 55, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 56, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 62, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 66, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 67, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 68, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 71, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (33, 75, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 34, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 49, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 50, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 51, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 54, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 61, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 63, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 72, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 73, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 74, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (34, 76, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (35, 35, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (35, 58, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (35, 77, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (36, 36, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (36, 38, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (36, 40, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (36, 42, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (36, 44, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (37, 37, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (37, 78, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (37, 79, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (37, 80, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (38, 38, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 39, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 81, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 82, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 83, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 84, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 85, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 86, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 87, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 88, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 89, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 90, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 91, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 92, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 93, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 94, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (39, 95, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (40, 40, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 41, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 96, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 97, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 98, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 99, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 100, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 101, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 102, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 103, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 104, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 105, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 106, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 107, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 108, 1)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 109, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 110, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 111, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 112, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (41, 113, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (42, 42, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (43, 43, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (43, 114, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (43, 115, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (43, 116, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (43, 117, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (43, 118, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (43, 119, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (44, 44, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (45, 45, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (46, 46, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (47, 47, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (48, 48, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (49, 49, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (50, 50, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (51, 51, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (52, 52, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (53, 53, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (54, 54, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (55, 55, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (56, 56, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (57, 57, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (58, 58, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (59, 59, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (60, 60, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (61, 61, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (62, 62, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (63, 63, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (64, 64, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (65, 65, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (66, 66, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (67, 67, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (68, 68, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (69, 69, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (70, 70, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (71, 71, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (72, 72, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (73, 73, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (74, 74, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (75, 75, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (76, 76, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (77, 77, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (78, 78, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (79, 79, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (80, 80, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (81, 81, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (82, 82, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (83, 83, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (84, 84, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (85, 85, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (86, 86, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (87, 87, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (88, 88, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (89, 89, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (90, 90, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (91, 91, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (92, 92, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (93, 93, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (94, 94, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (95, 95, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (96, 96, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (97, 97, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (98, 98, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (99, 99, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (100, 100, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (101, 101, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (102, 102, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (103, 103, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (104, 104, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (105, 105, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (106, 106, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (107, 107, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (108, 108, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (109, 109, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (110, 110, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (111, 111, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (112, 112, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (113, 113, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (114, 114, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (115, 115, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (116, 116, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (117, 117, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (118, 118, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (119, 119, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 31, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 37, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 39, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 41, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 43, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 78, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 79, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 80, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 81, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 82, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 83, 3)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 84, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 85, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 86, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 87, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 88, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 89, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 90, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 91, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 92, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 93, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 94, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 95, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 96, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 97, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 98, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 99, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 100, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 101, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 102, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 103, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 104, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 105, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 106, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 107, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 108, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 109, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 110, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 111, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 112, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 113, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 114, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 115, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 116, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 117, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 118, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 119, 3)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (123, 123, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (125, 125, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 126, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 127, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 128, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 129, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 130, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 131, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 132, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 133, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 134, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 135, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 136, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 137, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 138, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 139, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 140, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (126, 141, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 127, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 129, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 130, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 131, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 132, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 133, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 134, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 135, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 136, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (127, 137, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (128, 128, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (128, 138, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (128, 139, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (128, 140, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (128, 141, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (129, 129, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (130, 130, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (131, 131, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (132, 132, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (133, 133, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (134, 134, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (135, 135, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (136, 136, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (137, 137, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (138, 138, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (139, 139, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (140, 140, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (141, 141, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 142, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 143, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 144, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 145, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 146, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 147, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 148, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 149, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 151, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 152, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 153, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 154, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 155, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 156, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 157, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (142, 158, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (143, 143, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (143, 144, 1)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (143, 145, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (143, 146, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (143, 147, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (143, 148, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (143, 149, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (144, 144, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (145, 145, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (146, 146, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (147, 147, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (148, 148, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (149, 149, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 151, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 152, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 153, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 154, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 155, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 156, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 157, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (151, 158, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (152, 152, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (153, 153, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (154, 154, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (155, 155, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (156, 156, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (157, 157, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (158, 158, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 159, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 160, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 161, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 162, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 163, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 164, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 165, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 166, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 167, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 168, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 169, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 170, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (159, 171, 2)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (160, 160, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (160, 161, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (160, 162, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (160, 163, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (160, 164, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (160, 165, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (161, 161, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (162, 162, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (163, 163, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (164, 164, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (165, 165, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (166, 166, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (166, 167, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (166, 168, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (166, 169, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (166, 170, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (166, 171, 1)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (167, 167, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (168, 168, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (169, 169, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (170, 170, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (171, 171, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (172, 172, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (173, 173, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (174, 174, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (175, 175, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (176, 176, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (177, 177, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (178, 178, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (179, 179, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (180, 180, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (181, 181, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (182, 182, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (183, 183, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (184, 184, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (185, 185, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (186, 186, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (187, 187, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (188, 188, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (189, 189, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (190, 190, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (191, 191, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (192, 192, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (193, 193, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (194, 194, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (195, 195, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (196, 196, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (197, 197, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (198, 198, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (199, 199, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (200, 200, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (201, 201, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (202, 202, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (203, 203, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (204, 204, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (205, 205, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (206, 206, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (207, 207, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (208, 208, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (209, 209, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (210, 210, 0)
GO
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (211, 211, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (212, 212, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (213, 213, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (214, 214, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (215, 215, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (216, 216, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (217, 217, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (218, 218, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (219, 219, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (220, 220, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (221, 221, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (222, 222, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (223, 223, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (224, 224, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (225, 225, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (226, 226, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (227, 227, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (228, 228, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (229, 229, 0)
INSERT [dbo].[tree_paths] ([ancestor], [descendant], [path_length]) VALUES (230, 230, 0)
ALTER TABLE [dbo].[tree_paths]  WITH CHECK ADD  CONSTRAINT [FK__tree_path__ances__2E1BDC42] FOREIGN KEY([ancestor])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[tree_paths] CHECK CONSTRAINT [FK__tree_path__ances__2E1BDC42]
GO
ALTER TABLE [dbo].[tree_paths]  WITH CHECK ADD  CONSTRAINT [FK__tree_path__desce__2F10007B] FOREIGN KEY([descendant])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[tree_paths] CHECK CONSTRAINT [FK__tree_path__desce__2F10007B]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		nakashima
-- Create date: 2017/08/10
-- Description:	サブツリー全体を削除してから、カテゴリーも削除
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCategory] 
	-- Add the parameters for the stored procedure here
    @delete_node    bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    -- ノードとサブツリー全体を削除してから、カテゴリーを削除
    EXECUTE [dbo].[DeleteSubtree] @delete_node

    DELETE FROM [dbo].[categories]
     WHERE [id] = @delete_node
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubtree]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		nakashima
-- Create date: 2017/08/10
-- Description:	ノードを指定して、サブツリー全体を削除
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSubtree] 
	-- Add the parameters for the stored procedure here
    @delete_node    bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    -- ノードとサブツリー全体の削除
    -- 対象ノードを子孫として参照しているすべての行と、
    -- 対象ノードの子孫を子孫として参照しているすべての行を削除。
    DELETE FROM [dbo].[tree_paths]
     WHERE [descendant] IN (SELECT x.id 
                              FROM (SELECT descendant AS id
                                      FROM [dbo].[tree_paths]
                                     WHERE ancestor = @delete_node) AS x )
END
GO
/****** Object:  StoredProcedure [dbo].[InsertNode]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		nakashima
-- Create date: 2017/08/10
-- Description:	挿入先を指定して、新規ノードを挿入
-- =============================================
CREATE PROCEDURE [dbo].[InsertNode] 
	-- Add the parameters for the stored procedure here
	@categorie_name nvarchar(255) = N'', 
    @insert_node    bigint = 0  ,
    @nth_child      bigint = 0  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    -- 新規ノードのID
    DECLARE @new_node bigint

    -- 新規カテゴリーの挿入
    INSERT INTO [dbo].[categories]
               ([name]
               ,[nth_child])
         VALUES
               (@categorie_name
               ,@nth_child)
    
    SET @new_node = SCOPE_IDENTITY()

    -- 最初に自己参照を挿入する。
    -- 次に、挿入先のノードを子孫とするノード集合を取得し、新規ノードを子孫とする。
    INSERT INTO [dbo].[tree_paths]
               ([ancestor]
               ,[descendant]
               ,[path_length])
         SELECT t.ancestor, @new_node, (t.path_length + 1)
           FROM [dbo].[tree_paths] AS t
          WHERE t.descendant = @insert_node
          UNION ALL
         SELECT @new_node, @new_node, 0
END
GO
/****** Object:  StoredProcedure [dbo].[InsertToRoot]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		nakashima
-- Create date: 2017/08/10
-- Description:	挿入先を指定して、新規ノードを挿入
-- =============================================
CREATE PROCEDURE [dbo].[InsertToRoot] 
	-- Add the parameters for the stored procedure here
	@categorie_name nvarchar(255) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    -- 新規ノードのID
    DECLARE @new_node bigint

    -- 新規カテゴリーの挿入
    INSERT INTO [dbo].[categories]
               ([name]
               ,[nth_child])
         VALUES
               (@categorie_name
               ,0)
    
    SET @new_node = SCOPE_IDENTITY()

    -- 最初に自己参照を挿入する。
    -- 次に、挿入先のノードを子孫とするノード集合を取得し、新規ノードを子孫とする。
    INSERT INTO [dbo].[tree_paths]
               ([ancestor]
               ,[descendant]
               ,[path_length])
         SELECT @new_node, @new_node, 0
END
GO
/****** Object:  StoredProcedure [dbo].[JoinToSuperTree]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		nakashima
-- Create date: 2017/08/10
-- Description:	サブツリー全体を親ツリーに接続
-- =============================================
CREATE PROCEDURE [dbo].[JoinToSuperTree] 
	-- Add the parameters for the stored procedure here
    @target  bigint ,
    @move_to bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    -- 次に移動先の先祖とサブツリーの子孫の組合せを表す行を挿入して、
    -- 孤立したサブツリーを追加。
    INSERT INTO [dbo].[tree_paths]
               ([ancestor]
               ,[descendant]
               ,[path_length])
         SELECT supertree.ancestor, subtree.descendant, (supertree.path_length + subtree.path_length + 1)
           FROM [dbo].[tree_paths] AS supertree
                -- 移動先の祖先とサブツリーのすべてのノードの組合せを生成
                CROSS JOIN [dbo].[tree_paths] AS subtree
          WHERE supertree.descendant = @move_to
            AND subtree.ancestor = @target
END
GO
/****** Object:  StoredProcedure [dbo].[MoveSubtree]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		nakashima
-- Create date: 2017/08/10
-- Description:	サブツリー全体を移動
-- =============================================
CREATE PROCEDURE [dbo].[MoveSubtree] 
	-- Add the parameters for the stored procedure here
    @target  bigint ,
    @move_to bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    -- まず、サブツリーのトップのノードとそのノードの子孫の祖先を参照する行を削除して、祖先からサブツリーを外す。
    -- 自己参照を削除しないように。
    EXECUTE [dbo].[MoveToRoot] @target

    ---- 次に移動先の先祖とサブツリーの子孫の組合せを表す行を挿入して、孤立したサブツリーを追加。
    EXECUTE [dbo].[JoinToSuperTree] @target,@move_to
END
GO
/****** Object:  StoredProcedure [dbo].[MoveToRoot]    Script Date: 2018/11/15 10:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		nakashima
-- Create date: 2017/08/10
-- Description:	サブツリー全体をルートに移動
-- =============================================
CREATE PROCEDURE [dbo].[MoveToRoot] 
	-- Add the parameters for the stored procedure here
    @target  bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

    -- まず、サブツリーのトップのノードとそのノードの子孫の祖先を参照する行を削除して、祖先からサブツリーを外す。
    -- 自己参照を削除しないように。
    DELETE FROM [dbo].[tree_paths]
        -- 子孫が、サブツリーの子孫となっており、
     WHERE [descendant] IN (SELECT x.id 
                              FROM (SELECT [descendant] AS id
                                      FROM [dbo].[tree_paths]
                                     WHERE [ancestor] = @target) AS x )
        -- かつ祖先が、サブツリーのトップの祖先になっているもの。
       AND [ancestor]   IN (SELECT y.id 
                              FROM (SELECT [ancestor] AS id
                                      FROM [dbo].[tree_paths]
                                     WHERE [descendant] = @target
                                       AND [ancestor]  != [descendant]) AS y )
END
GO
USE [master]
GO
ALTER DATABASE [TaskHierarchy] SET  READ_WRITE 
GO
