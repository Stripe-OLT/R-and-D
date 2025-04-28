SELECT   deviceid, MAX(lastupdated) AS LatestUpdated
FROM         dbo.cim_custom_lastloggedinuser
GROUP BY deviceid