-- Empty group shells: participants get group_code only at check-in (round-robin per language pool).

CREATE TABLE IF NOT EXISTS event_groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_code VARCHAR(20) NOT NULL,
    language_pool ENUM('english', 'mandarin') NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    UNIQUE KEY uq_event_groups_code (group_code)
);

CREATE TABLE IF NOT EXISTS event_group_settings (
    id TINYINT UNSIGNED PRIMARY KEY DEFAULT 1,
    max_per_group INT NOT NULL DEFAULT 0
);

INSERT IGNORE INTO event_group_settings (id, max_per_group) VALUES (1, 0);
