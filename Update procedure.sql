ALTER PROCEDURE [CW1].[update_trail] @trailID INT, @title VARCHAR(100)=NULL, @rating DECIMAL(2, 1)=NULL, 
    @difficulty VARCHAR(8)=NULL, @distance DECIMAL(4, 1)=NULL, @elevation_gain INT=NULL, 
    @location VARCHAR(100)=NULL, @duration INT=NULL, @type VARCHAR(10)=NULL, @description VARCHAR(MAX)=NULL 
AS

-- Alter record with ID @trailID with any data that is not NULL
BEGIN TRANSACTION [updateTransaction]
    BEGIN TRY
        IF (@title IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Title]=@title WHERE [CW1].[Trail].[Trail_ID] = @trailID;

        IF (@rating IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Rating]=rating WHERE [CW1].[Trail].[Trail_ID] = @trailID;
            
        IF (@difficulty IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Difficulty]=@difficulty WHERE [CW1].[Trail].[Trail_ID] = @trailID;
            
        IF (@distance IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Distance]=@distance WHERE [CW1].[Trail].[Trail_ID] = @trailID;
            
        IF (@elevation_gain IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Elevation_gain]=@elevation_gain WHERE [CW1].[Trail].[Trail_ID] = @trailID;
            
        IF (@location IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Location]=@location WHERE [CW1].[Trail].[Trail_ID] = @trailID;
            
        IF (@duration IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Duration]=@duration WHERE [CW1].[Trail].[Trail_ID] = @trailID;
            
        IF (@type IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Type]=@type WHERE [CW1].[Trail].[Trail_ID] = @trailID;
            
        IF (@description IS NOT NULL)
            UPDATE [CW1].[Trail] SET [Description]=@description WHERE [CW1].[Trail].[Trail_ID] = @trailID;
        
        COMMIT TRANSACTION [updateTransaction]

    END TRY

    BEGIN CATCH 
        ROLLBACK TRANSACTION [updateTransaction];
        THROW;
    END CATCH