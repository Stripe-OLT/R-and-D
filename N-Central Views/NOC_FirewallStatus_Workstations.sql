SELECT        dbo.device.deviceid AS id, dbo.task.taskstate, dbo.task.taskstatus, dbo.service.displayname, dbo.device.longname, customer_1.customername, CASE WHEN ISNULL(dbo.task.taskstate, 0) 
                         = 5 THEN 'Fail' WHEN ISNULL(dbo.task.taskstate, 0) = 3 THEN 'Pass' WHEN ISNULL(dbo.task.taskstate, 0) = 0 THEN 'Missing' ELSE 'Error' END AS FirewallStatus, dbo.device.deviceclass
FROM            dbo.customer INNER JOIN
                         dbo.device ON dbo.customer.customerid = dbo.device.customerid INNER JOIN
                         dbo.customer AS customer_1 ON dbo.customer.parentid = customer_1.customerid LEFT OUTER JOIN
                         dbo.service INNER JOIN
                         dbo.task ON dbo.service.serviceitemid = dbo.task.serviceitemid ON dbo.device.deviceid = dbo.task.deviceid
WHERE        (dbo.task.serviceitemid = 37603) AND (dbo.device.deviceclass NOT LIKE '%Server%')