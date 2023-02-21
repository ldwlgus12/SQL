CREATE TABLE `online-class` (
	`id`	int	NOT NULL,
	`id2`	int	NOT NULL,
	`name`	varchar(50)	NULL
);

CREATE TABLE `assignment` (
	`id`	int	NOT NULL,
	`name`	varchar(50)	NULL,
	`as_submit_date`	datetime	NULL,
	`retouch_date`	datetime	NULL
);

CREATE TABLE `survey` (
	`id`	int	NOT NULL,
	`survey_name`	varchar(50)	NULL,
	`sur_submit_date`	datetime	NULL
);

CREATE TABLE `member` (
	`id`	int	NOT NULL,
	`name`	varchar(10)	NULL,
	`join_date`	datetime	NULL,
	`email`	varchar(50)	NULL,
	`phone_num`	varchar(20)	NULL
);

ALTER TABLE `online-class` ADD CONSTRAINT `PK_ONLINE-CLASS` PRIMARY KEY (
	`id`
);

ALTER TABLE `assignment` ADD CONSTRAINT `PK_ASSIGNMENT` PRIMARY KEY (
	`id`
);

ALTER TABLE `survey` ADD CONSTRAINT `PK_SURVEY` PRIMARY KEY (
	`id`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

ALTER TABLE `assignment` ADD CONSTRAINT `FK_member_TO_assignment_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `survey` ADD CONSTRAINT `FK_member_TO_survey_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

