SELECT   patchguid, deviceid, updatessupersedingthisupdate, value, dbo.cim_patch.installationresult
FROM         dbo.patch CROSS APPLY STRING_SPLIT(updatessupersedingthisupdate, ',') INNER JOIN
                         dbo.cim_patch ON value = dbo.cim_patch.updateid