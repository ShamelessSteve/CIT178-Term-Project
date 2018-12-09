/*
USE NBA_Players;
SELECT AVG (Stats.[FG%]) AS [Team Efficiency], Teams.Name AS [Team Name]
FROM Player JOIN Stats ON Player.PlayerID = Stats.PlayerID
JOIN Teams ON Teams.TeamID = Player.TeamID
GROUP BY Teams.Name;
*/

/*
USE NBA_Players;
SELECT SUM (Contracts.Salary) AS [Team Salary], Teams.Name AS [Team Name]
FROM Season JOIN Contracts ON Season.SeasonID = Contracts.SeasonID
JOIN Player ON Contracts.PlayerID = Player.PlayerID
JOIN Teams ON Player.TeamID = Teams.TeamID    
GROUP By Teams.Name;
 */

/*
USE NBA_Players;
SELECT MAX (Stats.PointsPerGame) AS [Highest Scorer] , MIN (Stats.PointsPerGame) AS [Lowest Scorer] ,   AVG (Stats.PointsPerGame) AS [Average Scorer] ,Teams.Name AS [Team Name]
FROM Player JOIN Stats ON Player.PlayerID = Stats.PlayerID
JOIN Teams ON Teams.TeamID = Player.TeamID
GROUP BY Teams.Name;
*/


/*
USE NBA_Players;
SELECT MIN (Stats.Rebounds) AS [Lowest Rebounds] ,  Teams.Name AS [Team Name]
FROM Player JOIN Stats ON Player.PlayerID = Stats.PlayerID
JOIN Teams ON Teams.TeamID = Player.TeamID
GROUP BY Teams.Name;
*/


