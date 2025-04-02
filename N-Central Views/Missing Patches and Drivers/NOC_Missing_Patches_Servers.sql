SELECT   customer_1.customerid, dbo.device.deviceid, dbo.device.longname, dbo.NOC_Missing_Patches_Servers_tbl.updateid, dbo.NOC_Missing_Patches_Servers_tbl.title, 
                         dbo.NOC_Missing_Patches_Servers_tbl.installationresult, dbo.NOC_Missing_Patches_Servers_tbl.InstalledSupersededCount, dbo.NOC_Missing_Patches_Servers_tbl.superseded, 
                         dbo.NOC_Missing_Patches_Servers_tbl.severity, dbo.NOC_Missing_Patches_Servers_tbl.classificationname, NEWID() AS id, customer_1.customername, 
                         CASE WHEN dbo.NOC_Missing_Patches_Servers_tbl.updateid IS NULL THEN 0 ELSE 1 END AS count
FROM         dbo.customer INNER JOIN
                         dbo.device ON dbo.customer.customerid = dbo.device.customerid INNER JOIN
                         dbo.customer AS customer_1 ON dbo.customer.parentid = customer_1.customerid LEFT OUTER JOIN
                         dbo.NOC_Missing_Patches_Servers_tbl ON dbo.device.deviceid = dbo.NOC_Missing_Patches_Servers_tbl.deviceid
WHERE     (dbo.device.deviceclass LIKE '%Server%') AND (dbo.device.deviceclass NOT LIKE '%Generic Server%')