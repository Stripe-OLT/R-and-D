SELECT        dbo.device.deviceid AS id, dbo.device.customerid, customer_parent.customername, dbo.cim_operatingsystem.version, dbo.cim_operatingsystem.reportedos, CASE WHEN ISNULL(dbo.cim_operatingsystem.reportedos, 'Null') 
                         LIKE 'Microsoft Windows 10%' THEN 'Fail' WHEN ISNULL(dbo.cim_operatingsystem.version, 'Null') = '10.0.22621' THEN 'Fail' WHEN ISNULL(dbo.cim_operatingsystem.version, 'Null') 
                         = '10.0.22000' THEN 'Fail' WHEN ISNULL(dbo.cim_operatingsystem.version, 'Null') = 'Null' THEN 'Missing' ELSE 'Pass' END AS EndOfLife, dbo.device.longname, dbo.NOC_LatestUser_2.username, 
                         dbo.NOC_LatestUser_2.userdomain, dbo.NOC_LatestUser_2.lastupdated, dbo.device.deleted
FROM            dbo.cim_operatingsystem INNER JOIN
                         dbo.device ON dbo.cim_operatingsystem.deviceid = dbo.device.deviceid INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid INNER JOIN
                         dbo.customer AS customer_parent ON dbo.customer.parentid = customer_parent.customerid LEFT OUTER JOIN
                         dbo.NOC_LatestUser_2 ON dbo.device.deviceid = dbo.NOC_LatestUser_2.deviceid
WHERE        (dbo.device.deleted = 0)