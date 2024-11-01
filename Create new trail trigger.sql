CREATE TRIGGER [CW1].[new_trail_created] ON [CW1].[Trail] AFTER INSERT AS
BEGIN
    -- Get the owner from Saved table
    declare @ownerID INT;
    declare @trailID INT;
    declare @date DATETIME;

    SET @trailID = (SELECT [Trail_ID] FROM inserted);
    SET @ownerID = (SELECT [Title] FROM inserted); -- User ID temporarily stored in Title until end of trigger
    SET @date = (SELECT CURRENT_TIMESTAMP);

    INSERT INTO [CW1].[Log] ([User_ID], [Time_added], [Trail_ID]) VALUES
    (@ownerID, @date, @trailID);

END;