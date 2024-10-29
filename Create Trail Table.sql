CREATE TABLE [CW1].[Trail] (
    [Trail_ID] INT PRIMARY KEY IDENTITY(1, 1),
    [Title] VARCHAR(100) NOT NULL,
    [Rating]  DECIMAL(2,1),
    [Difficulty] VARCHAR(8) NOT NULL,
    [Distance] DECIMAL(4,1) NOT NULL,
    [Elevation_gain] INT NOT NULL,
    [Location] VARCHAR(100) NOT NULL,
    [Duration] INTEGER NOT NULL,
    [Type] VARCHAR (7) NOT NULL,
    [Description] VARCHAR(MAX) NOT NULL,
)