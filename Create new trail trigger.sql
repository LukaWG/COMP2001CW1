CREATE TRIGGER [CW1].[new_trail_created] ON [CW1].[Trail] AFTER INSERT AS
BEGIN
    -- TODO update Create procedure to add owner into saved table. Will need another parameter
    -- Get the owner from Saved table