USE [sqlodevi]
	GO
	SELECT veriler.[urun] AS 'Maksimum Fiyatlý Ürün Adý' 
		  ,veriler.[site] AS 'Maksimum Fiyatlý Site Adý' 
		  ,veriler.[fiyat] AS 'Maksimum Fiyat'
	FROM [veriler] AS veriler
	INNER JOIN 
		(
			SELECT urun
			  ,MAX(DISTINCT [fiyat]) AS fiyat/*MAX([fiyat]) AS fiyat*/
			FROM [veriler]
			GROUP BY urun
		) AS Emp2
			ON veriler.urun = Emp2.urun AND veriler.fiyat= Emp2.fiyat

			USE [sqlodevi]
	GO
	SELECT veriler.[urun] AS 'Minimumu Fiyatlý Ürün Adý'
		  ,veriler.[site] AS 'Minimum Fiyatlý Site Adý' 
		  ,veriler.[fiyat] AS 'Minimum Fiyat'
	FROM [veriler] AS veriler
	INNER JOIN 
		(
			SELECT urun
			  ,MIN([fiyat]) AS fiyat
			FROM [veriler]
			GROUP BY urun
		) AS Emp2
			ON veriler.urun = Emp2.urun AND veriler.fiyat= Emp2.fiyat

	SELECT AVG(fiyat) AS 'Ortalama Fiyat' FROM veriler
