SELECT   dbo.device.longname, dbo.device.createdon, dbo.device.deviceclass, dbo.device.warrantyexpirydate, dbo.customer.customername, dbo.supportedos.osname, 
                         dbo.device.lastupdated
FROM         dbo.device INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid INNER JOIN
                         dbo.supportedos ON dbo.device.opsysid = dbo.supportedos.opsysid
WHERE     (dbo.device.deviceclass NOT LIKE '%Server%')