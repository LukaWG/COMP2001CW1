CREATE VIEW [CW1].[Overview] AS 
SELECT [CW1].[Trail].[Trail_ID], [CW1].[Trail].[Title], [CW1].[Trail].[Rating], [CW1].[Trail].[Difficulty], 
    [CW1].[Trail].[Distance], [CW1].[Trail].[Elevation_gain], [CW1].[Trail].[Location], [CW1].[Trail].[Duration],
    [CW1].[Trail].[Type], [CW1].[Trail].[Description], [CW1].[Tag].[Tag_name]

FROM [CW1].[Trail]
JOIN [CW1].[Trail_tag]
ON [CW1].[Trail].[Trail_ID] = [CW1].[Trail_tag].[Trail_ID]

JOIN [CW1].[Tag]
ON [CW1].[Trail_tag].[Tag_ID] = [CW1].[Tag].[Tag_ID];