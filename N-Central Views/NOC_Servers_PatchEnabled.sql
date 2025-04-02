SELECT   dbo.device.assettag, dbo.device.backupmanagerlicensestart, dbo.device.backupmanagerlicensetype, dbo.device.cost, dbo.device.createdon, dbo.device.customerid, dbo.device.deleted, 
                         dbo.device.description, dbo.device.deviceclass, dbo.device.deviceclassid, dbo.device.deviceclasslabel, dbo.device.deviceid, dbo.device.discoverednameon, dbo.device.discovering_wsp, 
                         dbo.device.dynamicuri, dbo.device.edfenabled, dbo.device.enabled, dbo.device.expectedreplacementdate, dbo.device.explicitlyunmanaged, dbo.device.firstsample, dbo.device.founddate, 
                         dbo.device.installing_wsp, dbo.device.isautoinstalled, dbo.device.isdisconnectable, dbo.device.isdiscoveredasset, dbo.device.ismanagedasset, dbo.device.isprobe, dbo.device.lastsample, 
                         dbo.device.lastupdated, dbo.device.leaseexpirydate, dbo.device.licensemode, dbo.device.location, dbo.device.longname, dbo.device.lost, dbo.device.lostdate, 
                         dbo.device.mobilelicensestart, dbo.device.monitorwarrantyexpiryenabled, dbo.device.ncentralassettag, dbo.device.netpathenabled, dbo.device.opsysid, dbo.device.osid, 
                         dbo.device.owner, dbo.device.ownershiptype, dbo.device.patchenabled, dbo.device.phonenumber, dbo.device.professionallicensestart, dbo.device.purchasedate, 
                         dbo.device.reactiveenabled, dbo.device.remotecontroluri, dbo.device.remotemanagementenabled, dbo.device.remotemanagementinstalldate, dbo.device.remotemanagementinstalled, 
                         dbo.device.remotemanagementversion, dbo.device.scheduledtasksenabled, dbo.device.securitymanagerenabled, dbo.device.securitymanagerstart, dbo.device.snmpenabled, 
                         dbo.device.sourceuri, dbo.device.supportedos, dbo.device.synchlongname, dbo.device.system, dbo.device.thirdpartypatchenabled, dbo.device.tracking, dbo.device.uri, 
                         dbo.device.veritasenabled, dbo.device.virtualizationenabled, dbo.device.warrantyexpirydate, dbo.device.xabackupenabled, parent_customer.customername
FROM         dbo.device INNER JOIN
                         dbo.customer ON dbo.device.customerid = dbo.customer.customerid INNER JOIN
                         dbo.customer AS parent_customer ON dbo.customer.parentid = parent_customer.customerid
WHERE     (dbo.device.deviceclass LIKE '%Server%') AND (dbo.device.patchenabled = '0') AND (dbo.device.deviceid NOT IN (1, 2)) AND (dbo.device.deleted <> 'True') OR
                         (dbo.device.deviceclass LIKE '%Server%') AND (dbo.device.deviceid NOT IN (1, 2)) AND (dbo.device.deleted <> 'True') AND (dbo.device.thirdpartypatchenabled = '0')