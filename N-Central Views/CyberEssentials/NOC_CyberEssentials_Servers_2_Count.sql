SELECT   dbo.device.deviceid AS id, dbo.device.longname, dbo.device.deviceclass, COUNT(dbo.NOC_CyberEssentials_Servers_1_Patches.updateid) AS MissingPatchesCount, 
                         dbo.customer.customerid, dbo.customer.customername, dbo.device.deleted
FROM         dbo.device LEFT OUTER JOIN
                         dbo.NOC_CyberEssentials_Servers_1_Patches ON dbo.device.deviceid = dbo.NOC_CyberEssentials_Servers_1_Patches.deviceid LEFT OUTER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid
WHERE     (dbo.device.deviceclass LIKE '%Server%') AND (dbo.device.deviceclass NOT LIKE '%Generic Server%') AND (dbo.device.deleted <> 'True') AND (dbo.device.patchenabled = 1)
GROUP BY dbo.device.deviceid, dbo.device.longname, dbo.device.deviceclass, dbo.customer.customerid, dbo.customer.customername, dbo.device.deleted