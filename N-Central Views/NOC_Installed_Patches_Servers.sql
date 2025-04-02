SELECT   dbo.device.longname, dbo.device.deviceclass, dbo.device.customerid, dbo.device.deviceid, dbo.customer.customername, dbo.NOC_cim_patch_max_updated.installeddate, 
                         dbo.NOC_cim_patch_max_updated.title, dbo.NOC_cim_patch_max_updated.kbarticleids, dbo.NOC_cim_patch_max_updated.description, dbo.NOC_cim_patch_max_updated.updateid, 
                         CONCAT_ws('_', dbo.device.longname, COALESCE (dbo.NOC_cim_patch_max_updated.kbarticleids, dbo.NOC_cim_patch_max_updated.title), CONVERT(varchar(19), 
                         dbo.NOC_cim_patch_max_updated.installeddate, 126)) AS alt_id, NEWID() AS id
FROM         dbo.device INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid INNER JOIN
                         dbo.NOC_cim_patch_max_updated ON dbo.device.deviceid = dbo.NOC_cim_patch_max_updated.deviceid
WHERE     (dbo.device.deviceclass LIKE '%Server%')