CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @total_duration DATETIME
	SET @total_duration = GETDATE()
	BEGIN TRY
		PRINT '============================';
		PRINT 'Loading Bronze Layer';
		PRINT '============================';

		PRINT '----------------------------';
		PRINT 'Loading CRM Tables'
		PRINT '----------------------------';
		
		SET @start_time = GETDATE()
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
	
		PRINT '>> Inserting Data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_cust_info
		FROM '---CSV FILE PLACEMENT---'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		
		PRINT '-----------'
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------'

		SELECT COUNT(*) AS crm_cust FROM bronze.crm_cust_info;

		SET @start_time = GETDATE()

		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM '---CSV FILE PLACEMENT---'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SELECT COUNT(*) AS crm_prd FROM bronze.crm_prd_info;
		SET @end_time = GETDATE()
		
		PRINT '-----------'
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------'
		
		SET @start_time = GETDATE()
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM '---CSV FILE PLACEMENT---'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SELECT COUNT(*) AS crm_sales FROM bronze.crm_sales_details;
		SET @end_time = GETDATE()
		
		PRINT '-----------'
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------'

		PRINT '----------------------------';
		PRINT 'Loading ERPTables'
		PRINT '----------------------------';
		
		SET @start_time = GETDATE()
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
	
		PRINT '>> Inserting Data into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM '---CSV FILE PLACEMENT---'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SELECT COUNT(*) AS erp_cust FROM bronze.erp_cust_az12;
		SET @end_time = GETDATE()
		
		PRINT '-----------'
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------'
		
		SET @start_time = GETDATE()
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
	
		PRINT '>> Inserting Data into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM '---CSV FILE PLACEMENT---'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SELECT COUNT(*)  AS erp_loc FROM bronze.erp_loc_a101;
		SET @end_time = GETDATE()
		
		PRINT '-----------'
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------'

		SET @start_time = GETDATE()
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM '---CSV FILE PLACEMENT---'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SELECT COUNT(*)  AS erp_px_cat FROM bronze.erp_px_cat_g1v2;
		SET @end_time = GETDATE()
		
		PRINT '-----------'
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------'

		SET @end_time = GETDATE()

		PRINT '-----------'
		PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(second, @total_duration, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------'

	END TRY

	BEGIN CATCH
		PRINT '====================================';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '====================================';
	END CATCH

END;
