-- find references in stored procedures
SELECT name
FROM   sys.procedures
WHERE  Object_definition(object_id) LIKE '%procedurename%'

-- find references in jobs
SELECT j.name 
FROM msdb.dbo.sysjobs AS j
WHERE EXISTS 
(
  SELECT 1 FROM msdb.dbo.sysjobsteps AS s
  WHERE s.job_id = j.job_id
  AND s.command LIKE '%procedurename%'
);
