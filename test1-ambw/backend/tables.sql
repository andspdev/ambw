CREATE TABLE IF NOT EXISTS `workouts` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `nama_workout` varchar(100) NOT NULL,
    `thumbnail` varchar(40) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `workout_excercies` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `workout_id` int unsigned NOT NULL,
    `nama_workout` varchar(100) NOT NULL,
    `thumbnail` varchar(40) NOT NULL,
    `menit` int unsigned NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`workout_id`)
        REFERENCES `workouts` (`id`)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8mb4 AUTO_INCREMENT=1;