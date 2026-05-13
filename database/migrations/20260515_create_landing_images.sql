-- Public home page images (editable by advisor/committee)

CREATE TABLE IF NOT EXISTS landing_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    slot ENUM('hero', 'feature_1', 'feature_2') NOT NULL,
    filename VARCHAR(255) NULL,
    alt_text VARCHAR(500) NOT NULL DEFAULT '',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_landing_images_slot (slot)
);

INSERT IGNORE INTO landing_images (slot, filename, alt_text) VALUES
    ('hero', NULL, ''),
    ('feature_1', NULL, ''),
    ('feature_2', NULL, '');
