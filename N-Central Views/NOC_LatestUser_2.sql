SELECT   dbo.cim_custom_lastloggedinuser.username, dbo.cim_custom_lastloggedinuser.userdomain, dbo.cim_custom_lastloggedinuser.deviceid, 
                         dbo.cim_custom_lastloggedinuser.lastupdated
FROM         dbo.cim_custom_lastloggedinuser INNER JOIN
                         dbo.NOC_LatestUser ON dbo.cim_custom_lastloggedinuser.deviceid = dbo.NOC_LatestUser.deviceid AND 
                         dbo.cim_custom_lastloggedinuser.lastupdated = dbo.NOC_LatestUser.LatestUpdated