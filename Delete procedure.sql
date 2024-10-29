CREATE PROCEDURE [CW1].[delete_trail] @trailID INT AS

-- Delete all trail-tag relationships relating to this trail

DELETE FROM [CW1].[Trail_tag] WHERE [CW1].[Trail_tag].[Trail_ID] = @trailID;

-- Delete all saved trails where trail ID matches

DELETE FROM [CW1].[Saved] WHERE [CW1].[Saved].[Trail_ID] = @trailID;

-- Delete trail from trail table

DELETE FROM [CW1].[Trail] WHERE [CW1].[Trail].[Trail_ID] = @trailID;