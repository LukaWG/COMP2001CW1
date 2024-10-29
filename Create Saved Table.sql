CREATE TABLE [CW1].[Saved] (
    [Trail_ID] INT NOT NULL,
    [User_ID] INT NOT NULL,
    [Owner] BIT DEFAULT 0,
    PRIMARY KEY ([Trail_ID], [User_ID]),
)