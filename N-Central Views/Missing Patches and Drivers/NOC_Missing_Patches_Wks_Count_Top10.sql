CREATE VIEW dbo.NOC_Missing_Patches_Wks_Count_Top10
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
    rn
FROM RankedDevices
WHERE rn <= 10;
