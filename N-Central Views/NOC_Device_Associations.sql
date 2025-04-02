SELECT   dbo.customer.customername, dbo.device.deviceid, dbo.device.longname, dbo.device.deviceclass, dbo.device.ismanagedasset, DATEADD(hh, DATEDIFF(hh, GETDATE(), GETUTCDATE()), 
                         CAST(dbo.device.warrantyexpirydate AS DATETIME)) AS WarrantyExpiryDate
FROM         dbo.device INNER JOIN
                         dbo.customer ON dbo.customer.customerid = dbo.device.customerid
WHERE     (dbo.device.deviceclass = 'Windows Server')
GROUP BY dbo.customer.customername, dbo.device.deviceid, dbo.device.longname, dbo.device.deviceclass, dbo.device.ismanagedasset, DATEADD(hh, DATEDIFF(hh, GETDATE(), GETUTCDATE()),
                          CAST(dbo.device.warrantyexpirydate AS DATETIME))