 /*Final Project Views 

-- Read Only View
USE NBA_Players;
GO
CREATE VIEW Stats_Read_Only
WITH ENCRYPTION
AS
SELECT PlayerID, PointsPerGame, Rebounds, Assists, Steals, AssistRate = Assists/Steals, [FG%], [3pt FG%] 
FROM Stats
GO
SELECT * FROM Stats_Read_Only;



-- Update View


USE NBA_Players;
GO
CREATE VIEW Coach_Update
WITH ENCRYPTION
AS
SELECT CoachID, FirstName, LastName
FROM Coach;
GO
SELECT * FROM Coach_Update;


-- Update the View
USE NBA_Players;
GO
SELECT * FROM Coach_Update;
GO
UPDATE Coach_Update
SET LastName = 'SkyWalker'
WHERE CoachID = 6
GO
SELECT * FROM Coach_Update;


--  Multiple Table View

USE NBA_Players;
GO
CREATE VIEW PlayerStats
AS
SELECT (FirstName + ' ' + LastName) AS Player, PointsPerGame, Rebounds, Assists, Steals, Turnovers, [FG%], [3pt FG%] 
FROM Stats JOIN Player ON Stats.PlayerID = Player.PlayerID;
GO
SELECT * FROM PlayerStats;



SELECT [name], create_date, modify_date FROM sys.views;
*/