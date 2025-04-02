SELECT   dbo.device.deviceid, dbo.device.deviceclass, dbo.device.longname, dbo.deviceproperty.value, customer_1.customername
FROM         dbo.device INNER JOIN
                         dbo.deviceproperty ON dbo.device.deviceid = dbo.deviceproperty.deviceid INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid INNER JOIN
                         dbo.customer AS customer_1 ON dbo.customer.parentid = customer_1.customerid
WHERE     (dbo.deviceproperty.label = 'Patch Management Schedule') AND (dbo.device.deviceclass LIKE '%Server%') AND (dbo.device.deleted <> 'True')