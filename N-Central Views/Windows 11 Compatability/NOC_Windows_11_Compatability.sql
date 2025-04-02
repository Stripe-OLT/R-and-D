SELECT   dbo.task.deviceid, dbo.task.serviceid, dbo.data377189_detailed.errormessage, MAX(dbo.data377189_detailed.scantime) AS scantime, dbo.data377189_detailed.sd377189_availdisk, 
                         dbo.data377189_detailed.sd377189_bitness, dbo.data377189_detailed.sd377189_cpucompat, dbo.data377189_detailed.sd377189_directxversion, 
                         dbo.data377189_detailed.sd377189_otpmpresent, dbo.data377189_detailed.sd377189_ram, dbo.data377189_detailed.sd377189_secureuefi, dbo.data377189_detailed.sd377189_tpmcheck, 
                         dbo.data377189_detailed.state, dbo.data377189_detailed.taskid
FROM         dbo.task INNER JOIN
                         dbo.data377189_detailed ON dbo.task.taskid = dbo.data377189_detailed.taskid
GROUP BY dbo.task.deviceid, dbo.task.serviceid, dbo.data377189_detailed.errormessage, dbo.data377189_detailed.sd377189_availdisk, dbo.data377189_detailed.sd377189_bitness, 
                         dbo.data377189_detailed.sd377189_cpucompat, dbo.data377189_detailed.sd377189_directxversion, dbo.data377189_detailed.sd377189_otpmpresent, 
                         dbo.data377189_detailed.sd377189_ram, dbo.data377189_detailed.sd377189_secureuefi, dbo.data377189_detailed.sd377189_tpmcheck, dbo.data377189_detailed.state, 
                         dbo.data377189_detailed.taskid