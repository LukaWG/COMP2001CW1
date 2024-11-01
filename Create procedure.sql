CREATE PROCEDURE [CW1].[create_trail] @title VARCHAR(100), @rating DECIMAL(2, 1) = NULL, @difficulty VARCHAR(8), @distance DECIMAL(4, 1), 
@elevation_gain INT, @location VARCHAR(100), @duration INT, @type VARCHAR(10), @description VARCHAR(MAX), @tags VARCHAR(MAX), @ownerID INT
AS

BEGIN TRANSACTION [create];
        BEGIN TRY;

        INSERT INTO [CW1].[Trail] ([Title], [Rating], [Difficulty], [Distance], [Elevation_gain], [Location], [Duration], [Type], [Description]) VALUES (
            @ownerID, @rating, @difficulty, @distance, @elevation_gain, @location, @duration, @type, @description
        )

        UPDATE [CW1].[Trail] SET [Title] = @title WHERE
        [Rating] = @rating AND [Difficulty] = @difficulty AND [Distance] = @distance AND [Elevation_gain] = @elevation_gain AND [Location] = @location AND [Duration] = @duration AND [Type] = @type;

        declare @index INT=1;
        declare @tag VARCHAR(20);
        declare @runagain tinyint=1;
        declare @tagID INT;
        declare @trailID INT;

        while CHARINDEX(',', @tags) != 0 BEGIN

        SET @tag = TRIM(', ' FROM SUBSTRING(@tags, @index, CHARINDEX(',', @tags)-1)); -- Get first tag and remove and trailing whitespace and any commas
        SET @tag = UPPER(SUBSTRING(@tag, 0, 2)) + LOWER(SUBSTRING(@tag, 2, len(@tag))); -- Capitalise first letter and leave rest lowercase
        SET @tags = SUBSTRING(@tags, CHARINDEX(',', @tags)+1, LEN(@tags));

        -- Check if tag exists
        IF NOT EXISTS (SELECT [CW1].[Tag].[Tag_name] FROM [CW1].[Tag] WHERE [CW1].[Tag].[Tag_name] = @tag)
            -- Create new tag
            INSERT INTO [CW1].[Tag] (Tag_name) VALUES (@tag);

        -- Find tag ID
        SET @tagID =(SELECT [CW1].[Tag].[Tag_ID] FROM [CW1].[Tag] WHERE [CW1].[Tag].[Tag_name] = @tag);

        -- Find trail ID
        SET @trailID =(SELECT [CW1].[Trail].[Trail_ID] FROM [CW1].[Trail] WHERE [Title]=@title AND [Distance]=@distance AND [Elevation_gain]=@elevation_gain);

        -- Add tag ID and new trail ID to Trail_tag table
        INSERT INTO [CW1].[Trail_tag] (Tag_ID, Trail_ID) VALUES (@tagID, @trailID);

        END;

        -- Repeat while loop once more, however there are no more commas left. The last item is one tag

        SET @tag = TRIM(', ' FROM @tags); -- Get first tag and remove and trailing whitespace and any commas
        SET @tag = UPPER(SUBSTRING(@tag, 0, 2)) + LOWER(SUBSTRING(@tag, 2, len(@tag))); -- Capitalise first letter and leave rest lowercase
        -- Check if tag exists
        IF NOT EXISTS (SELECT [CW1].[Tag].[Tag_name] FROM [CW1].[Tag] WHERE [CW1].[Tag].[Tag_name] = @tag)
            -- Create new tag
            INSERT INTO [CW1].[Tag] (Tag_name) VALUES (@tag);

        -- Find tag ID
        SET @tagID =(SELECT [CW1].[Tag].[Tag_ID] FROM [CW1].[Tag] WHERE [CW1].[Tag].[Tag_name] = @tag);

        -- Find trail ID
        SET @trailID =(SELECT [CW1].[Trail].[Trail_ID] FROM [CW1].[Trail] WHERE [Title]=@title AND [Distance]=@distance AND [Elevation_gain]=@elevation_gain);

        -- Add tag ID and new trail ID to Trail_tag table
        INSERT INTO [CW1].[Trail_tag] (Tag_ID, Trail_ID) VALUES (@tagID, @trailID);

        INSERT INTO [CW1].[Saved] ([Trail_ID], [User_ID], [Owner]) VALUES
        (@trailID, @ownerID, 1);

        COMMIT TRANSACTION [create]
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION [create]
    END CATCH;