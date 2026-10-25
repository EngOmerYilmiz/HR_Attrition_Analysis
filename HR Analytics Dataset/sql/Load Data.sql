BULK INSERT dbo.HR_Analytics
FROM 'C:\Users\Mustafa\Desktop\Data\Portfolio\HR Analytics Dataset\hr_analytics.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    TABLOCK
);