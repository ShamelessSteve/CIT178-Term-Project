/*Final Project Procedures 

---Create a stored procedure that retrieves and displays data

USE NBA_Players;
GO
CREATE PROC spTeamSalaries
AS
SELECT SUM (Contracts.Salary) AS [Team Salary], Teams.Name AS [Team Name]
FROM Season JOIN Contracts ON Season.SeasonID = Contracts.SeasonID
JOIN Player ON Contracts.PlayerID = Player.PlayerID
JOIN Teams ON Player.TeamID = Teams.TeamID    
GROUP By Teams.Name;
GO
EXEC spTeamSalaries;



USE NBA_Players;
GO
CREATE PROC spFindPlayer
	@PlayerName nvarchar(50) = '%'
AS
SELECT PlayerID, FirstName, LastName
FROM Player
WHERE FirstName LIKE @PlayerName;
GO
EXEC spFindPlayer 'Reggie';


USE NBA_Players;
GO
CREATE PROC sp_PlayerProfile
    @ID nchar(1),
    @Name nvarchar(40) OUTPUT,
    @Points decimal(4,1) OUTPUT,
	@Rebounds decimal(3,1) OUTPUT,
	@Assists decimal(3,1) OUTPUT

AS
BEGIN
    SELECT      @Name = (Player.FirstName + ' ' + Player.LastName),
                @Points = PointsPerGame,
				@Rebounds = Rebounds,
				@Assists = Assists
    FROM Player JOIN Stats ON Player.PlayerID = Stats.PlayerID
    WHERE Player.PlayerID = @ID
END
GO
DECLARE     @ID nchar(1),
			@Name nvarchar(40),
			@Points decimal(4,1),
			@Rebounds decimal(3,1),
			@Assists decimal(3,1)
EXEC sp_PlayerProfile '4', @Name OUTPUT, @Points OUTPUT, @Rebounds OUTPUT, @Assists OUTPUT
SELECT @Name as 'Name', @Points as 'Points Per Game', @Rebounds as Rebounds, @Assists as Assists;



USE NBA_Players;
GO
CREATE PROC spPlayerCount
	@TeamID int
as
DECLARE @IDCount int;
SELECT @IDCount = COUNT(PlayerID)
FROM Player
WHERE TeamID = @TeamID
RETURN @IDCount
GO
DECLARE @IDCount int;
EXEC @IDCount = spPlayerCount '1'
PRINT 'Players on Team: ' + CONVERT(varchar, @IDCount);



--- Final Project User Defined Functions 


USE NBA_Players
GO
CREATE FUNCTION fnFindPlayerID(@PlayerName varchar(50))
Returns int
BEGIN
RETURN (SELECT PlayerID FROM Player WHERE LastName = @PlayerName);
END;
go
SELECT PlayerID
FROM Player
WHERE PlayerID = dbo.fnFindPlayerID('Drummond');


USE NBA_Players;
GO
CREATE FUNCTION fnPlayerStats(@PlayerID int)
RETURNS TABLE
RETURN (SELECT * FROM Stats WHERE @PlayerID = Stats.PlayerID);
GO
SELECT * FROM dbo.fnPlayerStats(5);


USE NBA_Players;
GO
CREATE FUNCTION fnTeamInfo(@TeamID int)
RETURNS TABLE
RETURN (SELECT * FROM Teams WHERE @TeamID = Teams.TeamID);
GO
SELECT * FROM dbo.fnTeamInfo(2);

--- Final Project Triggers 


USE NBA_Players;
CREATE TABLE CoachArchive
(CoachID int not null,
 FirstName varchar(30) null,
 LastName varchar(30) null);


CREATE Trigger Coach_Archive
	ON Coach
	AFTER Delete
AS
INSERT INTO CoachArchive
	(CoachID, FirstName, LastName)
SELECT CoachID, FirstName, LastName
FROM Deleted


Delete Coach
WHERE CoachID = 6;


USE NBA_Players;
Alter TABLE CoachArchive 
	ADD status varchar(30) null;


USE NBA_Players;
GO
CREATE TRIGGER Coach_Insert ON Coach
    AFTER INSERT
AS
INSERT INTO CoachArchive
    (CoachId, FirstName, LastName, status)
	Select CoachID, FirstName, LastName, 'Inserted'
	FROM Inserted

Insert Coach
Values (6, 'Luke', 'Walton')


USE NBA_Players;
GO
CREATE TRIGGER Coach_Update ON Coach
    AFTER INSERT, UPDATE
AS
	UPDATE Coach
	SET LastName = Upper(LastName)
	WHERE CoachID IN (SELECT CoachID FROM Inserted);
*/