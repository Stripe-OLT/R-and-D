CREATE VIEW dbo.NOC_Missing_Patches_Workstations_Count_Top
AS
WITH RankedDevices AS (
    SELECT
		id,
		customername,
		customerid,
		longname,
		MissingPatchesCount,
		MissingCritical,
		MissingImportant,
		MissingModerate,
		MissingUnspecified,
        lastupdated,
        ROW_NUMBER() OVER (
            PARTITION BY customername
            ORDER BY MissingCritical DESC
        ) AS rn
    FROM dbo.NOC_Missing_Patches_Workstations_Count
)
SELECT
	id,
    customername,
    customerid,
    longname,
    MissingPatchesCount,
    MissingCritical,
    MissingImportant,
    MissingModerate,
    MissingUnspecified,
    lastupdated,
    rn
FROM RankedDevices
ORDER BY customername ASC, rn DESC;
WHERE rn <= 5;
