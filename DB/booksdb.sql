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
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (1, 'John Steinbeck', 'American', 1902, 1968, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/John_Steinbeck_1939_%28cropped%29.jpg/800px-John_Steinbeck_1939_%28cropped%29.jpg', 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (2, 'Haruki Murakami', 'Japanese', 1949, NULL, 'https://media.npr.org/assets/img/2021/04/05/haruki-murakami-author-photo-elena-seibert_custom-9e3a7329c65ac6de0d108d8bd0511e9a35d98522.jpg', 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (3, 'Richard Yates', 'American', 1926, 1992, 'https://anokatony.blog/wp-content/uploads/2019/09/yatesbeardrichard_yates.jpg', 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (4, 'Barry Burd', 'American', 1951, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6MmlSOzy7XOfRjG4vcNGCH8WtwYrXeq-03g&s', 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (5, 'Donald McCunn', 'American', NULL, NULL, NULL, 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (6, 'Jacob Batchelor', 'American', NULL, NULL, 'https://pbs.twimg.com/profile_images/1098665191364009986/KDPBSYZa_400x400.png', 1);
INSERT INTO `author` (`id`, `name`, `nationality`, `birth_year`, `death_year`, `image_url`, `enabled`) VALUES (7, 'Nikhil Abraham', NULL, NULL, NULL, 'https://m.media-amazon.com/images/S/amzn-author-media-prod/jur2hd2m6m9da61cut19ar1erf.jpg', 1);

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
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (1, 'The Winter of Our Discontent', 1, 1, 1961, 'The Winter of Our Discontent by John Steinbeck follows Ethan Hawley, a once-wealthy man now working as a grocery clerk, as he struggles with moral dilemmas in his pursuit of financial success. Pressured by his family and society’s expectations, he faces ethical compromises that challenge his integrity. The novel explores themes of greed, honor, and the cost of the American Dream.', 336, '2000-04-17', '1900-03-21', 'https://www.eastendbeacon.com/wp-content/uploads/2018/04/71RNbdh69kL.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (2, 'East of Eden', 1, 1, 1952, 'East of Eden by John Steinbeck is a multigenerational saga set in California’s Salinas Valley, following the intertwined lives of the Trask and Hamilton families. At its core, the novel explores the struggle between good and evil, particularly through the rivalry of brothers Caleb and Aron Trask, echoing the biblical story of Cain and Abel. Through complex characters and deep moral questions, Steinbeck examines the nature of free will, redemption, and the human capacity for both darkness and light.', 600, '2025-01-01', '2024-12-12', 'https://d3525k1ryd2155.cloudfront.net/f/656/000/9780142000656.PE.0.l.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (3, 'The Grapes Of Wrath', 1, 1, 1939, 'The Grapes of Wrath by John Steinbeck follows the Joad family, tenant farmers forced to leave their Oklahoma home during the Dust Bowl and journey to California in search of work and a better life. Facing poverty, exploitation, and hardship, they struggle to maintain their dignity and hope in a world that seems stacked against them. The novel is a powerful critique of economic inequality and a testament to human resilience and solidarity.', 464, '2025-02-01', '2025-02-01', 'https://images.penguinrandomhouse.com/cover/9780142000663', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (4, 'Colorless Tsukuru Tazaki and His Years of Pilgrimage', 2, 1, 2013, 'Colorless Tsukuru Tazaki and His Years of Pilgrimage by Haruki Murakami follows Tsukuru Tazaki, a man haunted by the sudden and unexplained rejection of his close-knit group of friends during his youth. Years later, urged by a new romantic interest, he embarks on a journey to uncover the truth behind their abandonment. As he revisits his past and confronts long-buried emotions, Tsukuru grapples with themes of identity, loneliness, and the search for meaning in his life.', 336, '2025-01-01', '2024-12-12', 'https://m.media-amazon.com/images/I/71yWk4eOrDL._AC_UF1000,1000_QL80_.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (5, 'The Elephant Vanishes', 2, 1, 1993, 'The Elephant Vanishes is a collection of surreal and introspective short stories by Haruki Murakami, blending the mundane with the bizarre. The stories explore themes of isolation, longing, and the absurdity of modern life, featuring characters who encounter strange occurrences—like a town obsessed with perfect hamburgers, a woman who suddenly stops sleeping, and the mysterious disappearance of an elephant. Each tale captures Murakami\'s signature blend of melancholy, whimsy, and existential curiosity.', 300, '2025-01-01', '2024-12-12', 'https://upload.wikimedia.org/wikipedia/en/1/11/Haruki_murakami_elephant_9780679750536.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (6, 'The Easter Parade', 3, 1, 1976, 'The Easter Parade by Richard Yates is a poignant novel that follows the lives of two sisters, Sarah and Emily Grimes, from childhood to adulthood, exploring their contrasting paths and struggles with love, ambition, and personal fulfillment. While Sarah seems to find traditional success in marriage and family, Emily pursues independence but grapples with loneliness and failed relationships. Through their journeys, Yates paints a devastating portrait of disappointment and the elusive nature of happiness.', 220, '2025-01-01', '2024-12-12', 'https://m.media-amazon.com/images/I/81CDquHK+gL._AC_UF1000,1000_QL80_.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (7, 'A Special Providence', 3, 1, 1969, 'A Special Providence by Richard Yates follows Bobby, a young, insecure soldier navigating the brutal realities of World War II, and his mother, Alice, a struggling artist with grand but unrealistic ambitions. As Bobby endures the traumas of war and self-doubt, Alice clings to her fading dreams in postwar America. The novel poignantly explores themes of disillusionment, the gap between aspiration and reality, and the deep yet often painful bond between mother and son.', 350, '2025-01-01', '2024-12-12', 'https://m.media-amazon.com/images/I/61KyPHC2aHL._AC_UF1000,1000_QL80_.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (8, 'Beginning Programming with Java For Dummies', 4, 2, 2003, 'Ready to jump into the exciting world of Java? With easy-to-follow instructions and numerous examples, Barry Burd provides you with a firm foundation in programming basics and great strategies for writing solid code. Before you know it, you\'ll be making methods, using classes, working with arrays, and creating your own powerful programs. The Dummies Way.', 408, '2025-02-01', '2025-02-01', 'https://m.media-amazon.com/images/I/61Ea7Jrh76L._SY342_.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (9, 'Computer Programming for the Complete Idiot', 5, 2, 1979, 'Introduces the novice to the functioning of micro-computers, the way computer programs work, and the skills necessary to write programs in BASIC for the Radio Shack TRS-80.', 126, '2025-02-01', '2025-02-01', 'https://pictures.abebooks.com/isbn/9780932538048-us.jpg', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (10, 'A True Book: Think Like A Computer', 6, 2, 2008, 'A True Book: Get Ready to Code series allows readers to discover the power of computer programming. Readers will be inspired to dive into the science and skills around many of their favorite activities, and learn core coding knowledge along the way. ', 48, '2025-02-01', '2025-02-01', 'https://embed.cdn.pais.scholastic.com/v1/channels/sso/products/identifiers/isbn/9780531135402/primary/renditions/700', 1);
INSERT INTO `book` (`id`, `title`, `author_id`, `genre_id`, `year_published`, `synopsis`, `pages`, `last_update`, `create_date`, `cover_image_url`, `enabled`) VALUES (11, 'Getting a Coding Job For Dummies', 7, 2, 2015, 'Explains how a coder works in (or out of) an organization, the key skills any job requires, the basics of the technologies a coding pro will encounter, and how to find formal or informal ways to build your skills.', 300, '2025-02-01', '2025-02-01', 'https://covers.vitalsource.com/vbid/9781119121022/width/720', 1);

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

