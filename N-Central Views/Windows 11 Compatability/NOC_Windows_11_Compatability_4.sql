SELECT        NEWID() AS id, dbo.device.deviceid, dbo.NOC_Windows_11_Compatability_3.scantime, dbo.NOC_Windows_11_Compatability_3.sd377189_availdisk, dbo.NOC_Windows_11_Compatability_3.sd377189_bitness, 
                         dbo.NOC_Windows_11_Compatability_3.sd377189_cpucompat, dbo.NOC_Windows_11_Compatability_3.sd377189_directxversion, dbo.NOC_Windows_11_Compatability_3.sd377189_otpmpresent, 
                         dbo.NOC_Windows_11_Compatability_3.sd377189_ram, dbo.NOC_Windows_11_Compatability_3.sd377189_secureuefi, dbo.NOC_Windows_11_Compatability_3.sd377189_tpmcheck, 
                         dbo.NOC_Windows_11_Compatability_3.result, customer_1.customername, dbo.device.deviceclass, dbo.device.description, dbo.device.longname, dbo.device.enabled, dbo.supportedos.osname, 
                         CASE WHEN dbo.NOC_Windows_11_Compatability_3.result = 'Fail' THEN 'Fail' WHEN dbo.NOC_Windows_11_Compatability_3.result = 'Pass' THEN 'Pass' ELSE 'Not Yet Known' END AS calculatedresult, 
                         dbo.device.lastupdated
FROM            dbo.supportedos INNER JOIN
                         dbo.customer AS customer_1 INNER JOIN
                         dbo.customer INNER JOIN
                         dbo.device ON dbo.customer.customerid = dbo.device.customerid ON customer_1.customerid = dbo.customer.parentid ON dbo.supportedos.opsysid = dbo.device.opsysid LEFT OUTER JOIN
                         dbo.NOC_Windows_11_Compatability_3 ON dbo.device.deviceid = dbo.NOC_Windows_11_Compatability_3.deviceid
WHERE        (dbo.supportedos.osname LIKE 'Microsoft Windows 10%') AND (dbo.device.deleted = 0)