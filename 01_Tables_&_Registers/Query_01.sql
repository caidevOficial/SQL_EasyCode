DROP DATABASE IF EXISTS library_ff;
CREATE DATABASE IF NOT EXISTS library_ff;

USE library_ff;

CREATE TABLE authors(
  `author_id` INT,
  `name` VARCHAR(25),
  `surname` VARCHAR(25),
  `gender` CHAR(1), -- M or F
  `birthday` DATE,
  `origin_country` VARCHAR(40)
);

INSERT INTO authors(`author_id`, `name`, `surname`, `gender`, `birthday`, `origin_country`)
VALUES  (1, 'Facu', 'Falcone', 'M', '2022-06-03', 'Argentina'),
        (2, 'Facu', 'Falcone', 'M', '2022-06-03', 'Argentina'),
        (3, 'Facu', 'Falcone', 'M', '2022-06-03', 'Argentina'),
        (4, 'Facu', 'Falcone', 'M', '2022-06-03', 'Argentina'),
        (5, 'Facu', 'Falcone', 'M', '2022-06-03', 'Argentina');

SELECT * FROM authors;
