SELECT        dbo.NOC_Missing_Patches_Workstations_Count_Top.id, dbo.NOC_LatestUser_2.username, dbo.NOC_LatestUser_2.userdomain
FROM            dbo.NOC_Missing_Patches_Workstations_Count_Top LEFT OUTER JOIN
                         dbo.NOC_LatestUser_2 ON dbo.NOC_Missing_Patches_Workstations_Count_Top.id = dbo.NOC_LatestUser_2.deviceid