
USE ContosoRetailDW

SELECT 
	OS.ProductKey,
	P.ProductName,
	OS.SalesAmount AS Maximo
FROM FactOnlineSales AS OS
INNER JOIN DimProduct AS P ON P.ProductKey = OS.ProductKey
WHERE OS.SalesAmount >= 2000
--GROUP BY OS.ProductKey, P.ProductName
ORDER BY Maximo ASC

--Diferenças Principais
--Com MAX:

--A consulta agrupa os resultados por ProductKey e ProductName.
--Para cada grupo, retorna apenas o valor máximo de SalesAmount.
--O resultado é uma linha por produto, representando a maior venda que atende ao critério.
--Sem MAX:

--A consulta não agrupa os resultados.
--Cada venda individual que atende ao critério de SalesAmount é retornada.
--O resultado pode ter múltiplas linhas por produto, representando cada venda que atende ao critério.