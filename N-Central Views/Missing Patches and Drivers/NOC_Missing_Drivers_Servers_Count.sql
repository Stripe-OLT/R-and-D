SELECT   dbo.device.deviceid AS id, dbo.device.longname, dbo.device.deviceclass, COUNT(dbo.NOC_Missing_Drivers_Servers_tbl.updateid) AS MissingPatchesCount, dbo.customer.customerid, 
                         dbo.customer.customername, COUNT(CASE dbo.NOC_Missing_Drivers_Servers_tbl.Severity WHEN 'Critical' THEN 1 ELSE NULL END) AS MissingCritical, 
                         COUNT(CASE dbo.NOC_Missing_Drivers_Servers_tbl.Severity WHEN 'Important' THEN 1 ELSE NULL END) AS MissingImportant, 
                         COUNT(CASE dbo.NOC_Missing_Drivers_Servers_tbl.Severity WHEN 'Moderate' THEN 1 ELSE NULL END) AS MissingModerate, 
                         COUNT(CASE dbo.NOC_Missing_Drivers_Servers_tbl.Severity WHEN 'Unspecified' THEN 1 ELSE NULL END) AS MissingUnspecified
FROM         dbo.NOC_Missing_Drivers_Servers_tbl RIGHT OUTER JOIN
                         dbo.device ON dbo.NOC_Missing_Drivers_Servers_tbl.deviceid = dbo.device.deviceid LEFT OUTER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid
WHERE     (dbo.device.deviceclass LIKE '%Server%') AND (dbo.device.deviceclass NOT LIKE '%Generic Server%') AND (dbo.device.patchenabled = 1)
GROUP BY dbo.NOC_Missing_Drivers_Servers_tbl.deviceid, dbo.device.deviceid, dbo.device.longname, dbo.device.deviceclass, dbo.customer.customerid, dbo.customer.customername