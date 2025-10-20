TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM '---CSV FILE PLACEMENT---'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*) AS crm_cust FROM bronze.crm_cust_info;

TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info
FROM '---CSV FILE PLACEMENT---'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*) AS crm_prd FROM bronze.crm_prd_info;

TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM '---CSV FILE PLACEMENT---'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*) AS crm_sales FROM bronze.crm_sales_details;

TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM '---CSV FILE PLACEMENT---'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*) AS erp_cust FROM bronze.erp_cust_az12;

TRUNCATE TABLE bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
FROM '---CSV FILE PLACEMENT---'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*)  AS erp_loc FROM bronze.erp_loc_a101;

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
BULK INSERT bronze.erp_px_cat_g1v2
FROM '---CSV FILE PLACEMENT---'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT COUNT(*)  AS erp_px_cat FROM bronze.erp_px_cat_g1v2;
