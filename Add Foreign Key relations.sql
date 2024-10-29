ALTER TABLE [CW1].[Trail_tag]
ADD FOREIGN KEY ([Tag_ID]) REFERENCES [CW1].[Tag](Tag_ID),
FOREIGN KEY ([Trail_ID]) REFERENCES [CW1].[Trail](Trail_ID);

ALTER TABLE [CW1].[Saved]
ADD FOREIGN KEY ([User_ID]) REFERENCES [CW1].[User](User_ID),
FOREIGN KEY ([Trail_ID]) REFERENCES [CW1].[Trail](Trail_ID);