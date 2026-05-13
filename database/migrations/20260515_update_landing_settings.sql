-- Update landing_settings table to support 3 separate logos

ALTER TABLE landing_settings
ADD COLUMN logo_1_filename VARCHAR(255) NULL AFTER id,
ADD COLUMN logo_1_alt_text VARCHAR(500) NOT NULL DEFAULT '' AFTER logo_1_filename,
ADD COLUMN logo_2_filename VARCHAR(255) NULL AFTER logo_1_alt_text,
ADD COLUMN logo_2_alt_text VARCHAR(500) NOT NULL DEFAULT '' AFTER logo_2_filename,
ADD COLUMN logo_3_filename VARCHAR(255) NULL AFTER logo_2_alt_text,
ADD COLUMN logo_3_alt_text VARCHAR(500) NOT NULL DEFAULT '' AFTER logo_3_filename;

-- Update existing row to have default values for new columns
UPDATE landing_settings SET
    logo_1_filename = logo_filename,
    logo_1_alt_text = logo_alt_text,
    logo_2_filename = NULL,
    logo_2_alt_text = '',
    logo_3_filename = NULL,
    logo_3_alt_text = ''
WHERE id = 1;

-- Remove old logo columns
ALTER TABLE landing_settings
DROP COLUMN logo_filename,
DROP COLUMN logo_alt_text;