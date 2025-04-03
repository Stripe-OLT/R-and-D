SELECT        dbo.device.deviceid AS id, dbo.device.longname, dbo.device.deviceclass, COUNT(dbo.NOC_CyberEssentials_Workstations_1_Patches.updateid) AS MissingPatchesCount, dbo.customer.customerid, 
                         dbo.customer.customername, dbo.device.deleted, dbo.device.lastupdated
FROM            dbo.NOC_CyberEssentials_Workstations_1_Patches RIGHT OUTER JOIN
                         dbo.device ON dbo.NOC_CyberEssentials_Workstations_1_Patches.deviceid = dbo.device.deviceid INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid
WHERE        (dbo.device.deviceclass NOT LIKE '%Server%') AND (dbo.device.deleted <> 'True') AND (DATEDIFF(day, dbo.device.lastupdated, GETDATE()) < 14) AND (dbo.device.patchenabled = 1)
GROUP BY dbo.device.deviceid, dbo.device.longname, dbo.device.deviceclass, dbo.customer.customerid, dbo.customer.customername, dbo.device.deleted, dbo.device.lastupdated