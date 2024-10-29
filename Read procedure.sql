CREATE PROCEDURE [CW1].[read] @trailID INT AS
SELECT [Title], [Rating], [Difficulty], [Distance], [Elevation_gain], [Location], [Duration], [Type], [Description], [Tag_name]
FROM [CW1].[Overview]
WHERE [Trail_ID] = @trailID;