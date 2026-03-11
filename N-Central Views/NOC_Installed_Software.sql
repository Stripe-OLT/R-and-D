SELECT   NEWID() AS id, customer_parent.customername, dbo.cim_application.deviceid, customer_parent.customerid, dbo.device.longname, dbo.device.enabled, 
                         dbo.device.deleted AS deleted_device, dbo.cim_application.displayname, dbo.cim_application.installationdate, dbo.cim_application.lastupdated, dbo.cim_application.licensekey, 
                         dbo.cim_application.productid, dbo.cim_application.publisher, dbo.cim_application.version, dbo.cim_application.licensetype, dbo.cim_application.deleted AS deleted_application, 
                         dbo.NOC_LatestUser_2.username, dbo.NOC_LatestUser_2.userdomain, dbo.NOC_LatestUser_2.lastupdated AS DeviceLastUpdated
FROM         dbo.cim_application INNER JOIN
                         dbo.device ON dbo.cim_application.deviceid = dbo.device.deviceid INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid INNER JOIN
                         dbo.customer AS customer_parent ON dbo.customer.parentid = customer_parent.customerid LEFT OUTER JOIN
                         dbo.NOC_LatestUser_2 ON dbo.device.deviceid = dbo.NOC_LatestUser_2.deviceid
WHERE     (dbo.device.deleted = 'false') AND (dbo.cim_application.deleted = 'false')