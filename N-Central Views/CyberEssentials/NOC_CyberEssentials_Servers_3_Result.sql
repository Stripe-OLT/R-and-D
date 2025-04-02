SELECT   id, longname, deviceclass, MissingPatchesCount, customerid, customername, CASE WHEN MissingPatchesCount > 0 THEN 0 ELSE 1 END AS Result
FROM         dbo.NOC_CyberEssentials_Servers_2_Count