SELECT   dbo.patch.patchguid, dbo.patch.updatessupersedingthisupdate, patch2.patchguid AS guid
FROM         dbo.patch INNER JOIN
                         dbo.patch AS patch2 ON dbo.patch.updatessupersedingthisupdate LIKE '%' + CAST(patch2.patchguid AS NVARCHAR(MAX)) + '%'