CREATE TABLE `professor` (
	`id`	int	NOT NULL,
	`pro_name`	varchar(10)	NULL,
	`major`	varchar(50)	NULL,
	`phone_num`	varchar(20)	NULL,
	`address`	varchar(100)	NULL
);

CREATE TABLE `GE subject` (
	`GEsubject_code`	int	NOT NULL,
	`student_id`	int	NOT NULL,
	`pro_id`	int	NOT NULL,
	`name`	varchar(50)	NULL,
	`open_date`	datetime	NULL,
	`open_semester`	varchar(50)	NULL,
	`student_num`	int	NULL
);

CREATE TABLE `major subject` (
	`majorsub_code`	int	NOT NULL,
	`student_id`	int	NOT NULL,
	`pro_id`	int	NOT NULL,
	`name`	varchar(50)	NULL,
	`open_date`	datetime	NULL,
	`open_semester`	varchar(50)	NULL,
	`student_num`	int	NULL
);

CREATE TABLE `student` (
	`id`	int	NOT NULL,
	`GEsubject_code`	int	NOT NULL,
	`majorsub_code`	int	NOT NULL,
	`student_name`	varchar(10)	NULL,
	`major`	varchar(50)	NULL,
	`grade`	int	NULL,
	`join_date`	datetime	NULL,
	`phone_num`	varchar(20)	NULL,
	`address`	varchar(100)	NULL
);

ALTER TABLE `professor` ADD CONSTRAINT `PK_PROFESSOR` PRIMARY KEY (
	`id`
);

ALTER TABLE `GE subject` ADD CONSTRAINT `PK_GE SUBJECT` PRIMARY KEY (
	`GEsubject_code`,
	`student_id`,
	`pro_id`
);

ALTER TABLE `major subject` ADD CONSTRAINT `PK_MAJOR SUBJECT` PRIMARY KEY (
	`majorsub_code`,
	`student_id`,
	`pro_id`
);

ALTER TABLE `student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
	`id`,
	`GEsubject_code`,
	`majorsub_code`
);

ALTER TABLE `GE subject` ADD CONSTRAINT `FK_student_TO_GE subject_1` FOREIGN KEY (
	`student_id`
)
REFERENCES `student` (
	`id`
);

ALTER TABLE `GE subject` ADD CONSTRAINT `FK_professor_TO_GE subject_1` FOREIGN KEY (
	`pro_id`
)
REFERENCES `professor` (
	`id`
);

ALTER TABLE `major subject` ADD CONSTRAINT `FK_student_TO_major subject_1` FOREIGN KEY (
	`student_id`
)
REFERENCES `student` (
	`id`
);

ALTER TABLE `major subject` ADD CONSTRAINT `FK_professor_TO_major subject_1` FOREIGN KEY (
	`pro_id`
)
REFERENCES `professor` (
	`id`
);

ALTER TABLE `student` ADD CONSTRAINT `FK_GE subject_TO_student_1` FOREIGN KEY (
	`GEsubject_code`
)
REFERENCES `GE subject` (
	`GEsubject_code`
);

ALTER TABLE `student` ADD CONSTRAINT `FK_major subject_TO_student_1` FOREIGN KEY (
	`majorsub_code`
)
REFERENCES `major subject` (
	`majorsub_code`
);

