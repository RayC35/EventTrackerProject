-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema booksdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `booksdb` ;

-- -----------------------------------------------------
-- Schema booksdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `booksdb` ;
USE `booksdb` ;

-- -----------------------------------------------------
-- Table `author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `author` ;

CREATE TABLE IF NOT EXISTS `author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `nationality` VARCHAR(100) NULL,
  `birth_year` INT NULL,
  `death_year` INT NULL,
  `image_url` VARCHAR(2000) NULL,
  `enabled` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book` ;

CREATE TABLE IF NOT EXISTS `book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(1000) NOT NULL,
  `author_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  `year_published` INT NULL,
  `synopsis` TEXT NULL,
  `pages` INT NULL,
  `last_update` DATETIME NULL,
  `create_date` DATETIME NULL,
  `cover_image_url` VARCHAR(2000) NULL,
  `enabled` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_author_idx` (`author_id` ASC) VISIBLE,
  INDEX `fk_book_genre1_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_author`
    FOREIGN KEY (`author_id`)
    REFERENCES `author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `review_text` TEXT NULL,
  `rating` INT NULL,
  `review_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_book1_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS student@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'student'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `author`
-- -----------------------------------------------------
START TRANSACTION;
USE `booksdb`;
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (1, 'John Steinbeck', 'American', NULL, NULL, NULL, 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (2, 'Haruki Murakami', 'Japanese', NULL, NULL, NULL, 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (3, 'Richard Yates', 'American', NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `booksdb`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'Fiction');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'Non-Fiction');

COMMIT;


-- -----------------------------------------------------
-- Data for table `book`
-- -----------------------------------------------------
START TRANSACTION;
USE `booksdb`;
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (1, 'The Winter of Our Discontent', 1, 1, 1878, 'stuff happens', NULL, '2000-04-17', '1900-03-21', 'https://www.eastendbeacon.com/wp-content/uploads/2018/04/71RNbdh69kL.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (2, 'East of Eden', 1, 1, 1924, NULL, NULL, '2025-01-01', '2024-12-12', 'https://d3525k1ryd2155.cloudfront.net/f/656/000/9780142000656.PE.0.l.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (3, 'Grapes of Wrath', 1, 1, 1910, NULL, NULL, '2025-01-01', '2024-12-12', 'https://images.penguinrandomhouse.com/cover/9780142000663', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (4, 'Colorless Tsukuru Tazaki and His Years of Pilgrimage', 2, 1, 1980, NULL, NULL, '2025-01-01', '2024-12-12', 'https://m.media-amazon.com/images/I/71yWk4eOrDL._AC_UF1000,1000_QL80_.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (5, 'The Elephant Vanishes', 2, 1, 1985, NULL, NULL, '2025-01-01', '2024-12-12', 'https://upload.wikimedia.org/wikipedia/en/1/11/Haruki_murakami_elephant_9780679750536.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (6, 'The Easter Parade', 3, 1, 1960, NULL, NULL, '2025-01-01', '2024-12-12', 'https://m.media-amazon.com/images/I/81CDquHK+gL._AC_UF1000,1000_QL80_.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (7, 'A Special Providence', 3, 1, 1962, NULL, NULL, '2025-01-01', '2024-12-12', 'https://m.media-amazon.com/images/I/61KyPHC2aHL._AC_UF1000,1000_QL80_.jpg', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `booksdb`;
INSERT INTO `review` (`id`, `book_id`, `review_text`, `rating`, `review_date`) VALUES (1, 1, 'The Winter of Our Discontent? More like the Winter of My Dissatisfaction. If I wanted to read 300 pages of a guy brooding about morality and small-town drama, I’d just scroll through my cousin’s Facebook page. Steinbeck’s writing is fine, but this one felt like a long lecture I didn’t sign up for.', NULL, NULL);
INSERT INTO `review` (`id`, `book_id`, `review_text`, `rating`, `review_date`) VALUES (2, 2, 'East of Eden? More like East of Excessive Drama. This family makes the Kardashians look well-adjusted. I didn’t sign up for biblical allegories and endless squabbling—I just wanted a nice story, not a thousand-page therapy session for fictional characters.', NULL, NULL);
INSERT INTO `review` (`id`, `book_id`, `review_text`, `rating`, `review_date`) VALUES (3, 3, 'The Grapes of Wrath is basically 500 pages of dust, misery, and despair. I get it, the Depression was rough, but do we really need this much suffering? Even the grapes sounded like they were mad at me for reading this.', NULL, NULL);
INSERT INTO `review` (`id`, `book_id`, `review_text`, `rating`, `review_date`) VALUES (4, 4, 'Colorless? More like plotless. Tsukuru wanders around brooding over his past friendships, and we get to join him for every uneventful train ride and awkward conversation. By the end, I was questioning my own life choices for sticking with it.', NULL, NULL);

COMMIT;

