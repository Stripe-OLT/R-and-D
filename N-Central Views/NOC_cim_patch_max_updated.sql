SELECT        updateid, deviceid, title, installeddate, MAX(ISNULL(lastupdated, '01/01/1900')) AS lastupdated, installationresult, kbarticleids, description
FROM            dbo.cim_patch
WHERE        (installationresult = 'Installed')
GROUP BY updateid, deviceid, title, installeddate, installationresult, kbarticleids, description