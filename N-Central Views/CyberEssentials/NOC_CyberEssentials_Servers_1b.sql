SELECT   dbo.device.deviceid, dbo.device.longname, dbo.NOC_CyberEssentials_Servers_1_Patches.updateid, dbo.NOC_CyberEssentials_Servers_1_Patches.title, 
                         dbo.NOC_CyberEssentials_Servers_1_Patches.installationresult, dbo.NOC_CyberEssentials_Servers_1_Patches.InstalledSupersededCount, 
                         dbo.NOC_CyberEssentials_Servers_1_Patches.superseded, dbo.NOC_CyberEssentials_Servers_1_Patches.severity, dbo.NOC_CyberEssentials_Servers_1_Patches.classificationname, 
                         NEWID() AS id, customer_1.customername, CASE WHEN dbo.NOC_CyberEssentials_Servers_1_Patches.updateid IS NULL THEN 0 ELSE 1 END AS count
FROM         dbo.customer INNER JOIN
                         dbo.device ON dbo.customer.customerid = dbo.device.customerid INNER JOIN
                         dbo.customer AS customer_1 ON dbo.customer.parentid = customer_1.customerid LEFT OUTER JOIN
                         dbo.NOC_CyberEssentials_Servers_1_Patches ON dbo.device.deviceid = dbo.NOC_CyberEssentials_Servers_1_Patches.deviceid
WHERE     (dbo.device.deviceclass LIKE '%Server%') AND (dbo.device.deviceclass NOT LIKE '%Generic Server%')