SELECT   deviceid, serviceid, errormessage, scantime, sd377189_availdisk, sd377189_bitness, sd377189_cpucompat, sd377189_directxversion, sd377189_otpmpresent, sd377189_ram, 
                         sd377189_secureuefi, sd377189_tpmcheck, state, taskid
FROM         dbo.NOC_Windows_11_Compatability
WHERE     (sd377189_availdisk IS NOT NULL)