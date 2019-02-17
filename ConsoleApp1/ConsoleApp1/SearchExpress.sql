/****** SSMS の SelectTopNRows コマンドのスクリプト  ******/
SELECT [ancestor]
      ,[descendant]
      ,[path_length]
  FROM [TaskHierarchy].[dbo].[tree_paths] AS A1
 WHERE EXISTS (
	SELECT * 
	  FROM [TaskHierarchy].[dbo].[tree_paths] A2
	 WHERE ancestor = 3
	   AND A1.ancestor = A2.ancestor
	   AND A1.descendant = A2.descendant
	   AND A1.path_length = A2.path_length
)

  SELECT NULL

SELECT [ancestor]
      ,[descendant]
      ,[path_length]
  FROM [TaskHierarchy].[dbo].[tree_paths] AS A1
  WHERE EXISTS (
	SELECT *
	  FROM [TaskHierarchy].[dbo].[tree_paths] A2
	 WHERE ancestor = 3
)

SELECT *
  FROM [TaskHierarchy].[dbo].[tree_paths] AS A1
  WHERE ancestor IN (
	SELECT descendant
	  FROM [TaskHierarchy].[dbo].[tree_paths] A2
	 WHERE ancestor = 3
	)
	 AND ancestor IN (
	SELECT descendant
	  FROM [TaskHierarchy].[dbo].[tree_paths] A2
	 WHERE ancestor = 17
	)
	 AND ancestor IN (
	SELECT descendant
	  FROM [TaskHierarchy].[dbo].[tree_paths] A2
	 WHERE ancestor = 31
	)
	 AND ancestor IN (
	SELECT descendant
	  FROM [TaskHierarchy].[dbo].[tree_paths] A2
	 WHERE ancestor = 110
	)

SELECT * 
  FROM [TaskHierarchy].[dbo].[categories]
 INNER JOIN (
	SELECT A1.*
	  FROM [TaskHierarchy].[dbo].[tree_paths] AS A1
	 INNER JOIN (
		SELECT *
		  FROM [TaskHierarchy].[dbo].[tree_paths]
		 WHERE ancestor = 3
	 ) AS A2 ON A1.ancestor = A2.descendant
	 INNER JOIN (
		SELECT *
		  FROM [TaskHierarchy].[dbo].[tree_paths]
		 WHERE ancestor = 8
	 ) AS A5 ON A1.ancestor = A5.descendant
	 INNER JOIN (
		SELECT *
		  FROM [TaskHierarchy].[dbo].[tree_paths]
		 WHERE ancestor = 159
	 ) AS A3 ON A1.ancestor = A3.descendant
	 INNER JOIN (
		SELECT *
		  FROM [TaskHierarchy].[dbo].[tree_paths]
		 WHERE ancestor = 160
	 ) AS A4 ON A1.ancestor = A4.descendant
	 INNER JOIN (
		SELECT *
		  FROM [TaskHierarchy].[dbo].[tree_paths]
		 WHERE ancestor = 161
	 ) AS A6 ON A1.ancestor = A6.descendant
) AS B ON [TaskHierarchy].[dbo].categories.id = B.descendant



SELECT [Extent1].[ancestor] AS [ancestor],
	   [Extent1].[descendant] AS [descendant],
	   [Extent1].[path_length] AS [path_length]
  FROM [dbo].[tree_paths] AS [Extent1]
 INNER JOIN [dbo].[tree_paths] AS [Extent2] ON [Extent1].[ancestor] = [Extent2].[descendant]
 INNER JOIN [dbo].[tree_paths] AS [Extent3] ON [Extent1].[ancestor] = [Extent3].[descendant]
 INNER JOIN [dbo].[tree_paths] AS [Extent4] ON [Extent1].[ancestor] = [Extent4].[descendant]
 INNER JOIN [dbo].[tree_paths] AS [Extent5] ON [Extent1].[ancestor] = [Extent5].[descendant]
 WHERE ([Extent2].[ancestor] = @p__linq__0)
   AND ([Extent3].[ancestor] = @p__linq__1) 
   AND ([Extent4].[ancestor] = @p__linq__2) 
   AND ([Extent5].[ancestor] = @p__linq__3)
;


SELECT [Extent1].[id] AS [id], 
       [Extent1].[name] AS [name], 
       [Extent1].[nth_child] AS [nth_child]
  FROM [dbo].[categories] AS [Extent1]
 INNER JOIN  (
	   SELECT [Extent2].[descendant] AS [descendant1], 
		      [Extent3].[ancestor] AS [ancestor1],
		      [Extent4].[ancestor] AS [ancestor2], 
		      [Extent5].[ancestor] AS [ancestor3], 
		      [Extent6].[ancestor] AS [ancestor4], 
		      [Extent7].[ancestor] AS [ancestor5]
         FROM [dbo].[tree_paths] AS [Extent2]
         INNER JOIN [dbo].[tree_paths] AS [Extent3] ON [Extent2].[ancestor] = [Extent3].[descendant]
         INNER JOIN [dbo].[tree_paths] AS [Extent4] ON [Extent2].[ancestor] = [Extent4].[descendant]
         INNER JOIN [dbo].[tree_paths] AS [Extent5] ON [Extent2].[ancestor] = [Extent5].[descendant]
         INNER JOIN [dbo].[tree_paths] AS [Extent6] ON [Extent2].[ancestor] = [Extent6].[descendant]
         INNER JOIN [dbo].[tree_paths] AS [Extent7] ON [Extent2].[ancestor] = [Extent7].[descendant] 
	) AS [Join5] ON [Extent1].[id] = [Join5].[descendant1]
WHERE ([Join5].[ancestor1] = @p__linq__0) AND 
	  ([Join5].[ancestor2] = @p__linq__1) AND 
	  ([Join5].[ancestor3] = @p__linq__2) AND 
	  ([Join5].[ancestor4] = @p__linq__3) AND 
	  ([Join5].[ancestor5] = @p__linq__4)
