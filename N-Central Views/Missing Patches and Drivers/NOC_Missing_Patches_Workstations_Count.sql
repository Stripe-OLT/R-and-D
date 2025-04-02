SELECT   dbo.device.deviceid AS id, dbo.device.longname, dbo.device.deviceclass, COUNT(dbo.NOC_Missing_Patches_Workstations_tbl.updateid) AS MissingPatchesCount, 
                         COUNT(CASE dbo.NOC_Missing_Patches_Workstations_tbl.Severity WHEN 'Critical' THEN 1 ELSE NULL END) AS MissingCritical, 
                         COUNT(CASE dbo.NOC_Missing_Patches_Workstations_tbl.Severity WHEN 'Important' THEN 1 ELSE NULL END) AS MissingImportant, 
                         COUNT(CASE dbo.NOC_Missing_Patches_Workstations_tbl.Severity WHEN 'Moderate' THEN 1 ELSE NULL END) AS MissingModerate, 
                         COUNT(CASE dbo.NOC_Missing_Patches_Workstations_tbl.Severity WHEN 'Unspecified' THEN 1 ELSE NULL END) AS MissingUnspecified, dbo.customer.customerid, 
                         dbo.customer.customername, dbo.device.deleted
FROM         dbo.NOC_Missing_Patches_Workstations_tbl RIGHT OUTER JOIN
                         dbo.device ON dbo.NOC_Missing_Patches_Workstations_tbl.deviceid = dbo.device.deviceid INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid
WHERE     (dbo.device.deviceclass NOT LIKE '%Server%') AND (dbo.device.deleted <> 'True') AND (dbo.device.patchenabled = 1)
GROUP BY dbo.device.deviceid, dbo.device.longname, dbo.device.deviceclass, dbo.customer.customerid, dbo.customer.customername, dbo.device.deleted