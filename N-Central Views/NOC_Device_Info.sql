SELECT   dbo.device.deviceid AS id, dbo.device.deviceclass, dbo.device.enabled, dbo.device.ismanagedasset, dbo.device.longname, dbo.customer.customername AS site, dbo.supportedos.osname,
                          dbo.device.patchenabled, customer_parent.customername, customer_parent.customerid
FROM         dbo.device INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid INNER JOIN
                         dbo.supportedos ON dbo.device.opsysid = dbo.supportedos.opsysid INNER JOIN
                         dbo.customer AS customer_parent ON dbo.customer.parentid = customer_parent.customerid
WHERE     (dbo.device.ismanagedasset = '1')