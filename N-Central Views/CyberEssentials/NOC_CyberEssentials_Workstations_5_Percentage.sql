SELECT        Count, Passed, CONVERT(DECIMAL, Passed * 100 / Count) / 100 AS Percentage, NEWID() AS id
FROM            dbo.[NOC_CyberEssentials_Workstations_4_Count-Passed]