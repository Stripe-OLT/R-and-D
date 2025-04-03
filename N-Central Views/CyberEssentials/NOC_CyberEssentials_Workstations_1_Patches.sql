SELECT        longname, deviceid, updateid, title, installationresult, InstalledSupersededCount, superseded, severity, deviceclass, classificationname, publisheddate, DATEDIFF(day, publisheddate, GETDATE()) AS Age
FROM            dbo.NOC_Missing_Patches_Workstations_tbl
WHERE        (classificationname LIKE '%Security%') AND (DATEDIFF(day, publisheddate, GETDATE()) > 14) OR
                         (DATEDIFF(day, publisheddate, GETDATE()) > 14) AND (severity LIKE '%Critical%')