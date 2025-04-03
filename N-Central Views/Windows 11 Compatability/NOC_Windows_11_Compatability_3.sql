SELECT        deviceid, serviceid, errormessage, scantime, sd377189_availdisk, sd377189_bitness, sd377189_cpucompat, sd377189_directxversion, sd377189_otpmpresent, sd377189_ram, sd377189_secureuefi, sd377189_tpmcheck, 
                         state, taskid, CASE WHEN sd377189_availdisk = 'Pass' AND sd377189_bitness = 'Pass' AND sd377189_cpucompat = 'Pass' AND sd377189_directxversion = 'Pass' AND sd377189_otpmpresent = 'Pass' AND 
                         sd377189_ram = 'Pass' AND sd377189_secureuefi = 'Pass' AND sd377189_tpmcheck = 'Pass' THEN 'Pass' ELSE 'Fail' END AS result
FROM            dbo.NOC_Windows_11_Compatability_2 AS w11
WHERE        (scantime =
                             (SELECT        MAX(scantime) AS Expr1
                               FROM            dbo.NOC_Windows_11_Compatability_2
                               WHERE        (deviceid = w11.deviceid)))