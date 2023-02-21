CREATE TABLE `member` (
	`id`	int	NOT NULL,
	`connect_id`	int	NOT NULL,
	`locker_id`	int	NOT NULL,
	`name`	varchar(50)	NULL,
	`email`	varchar(50)	NULL,
	`birth`	varchar(10)	NULL,
	`payment`	varchar(100)	NULL,
	`join_date`	datetime	NULL
);

CREATE TABLE `youtube home` (
	`id`	int	NOT NULL,
	`name`	varchar(50)	NULL,
	`recommand`	varchar(1000)	NULL
);

CREATE TABLE `locker` (
	`id`	int	NOT NULL,
	`playrecord`	varchar(1000)	NULL,
	`playlist`	varchar(1000)	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`,
	`connect_id`,
	`locker_id`
);

ALTER TABLE `youtube home` ADD CONSTRAINT `PK_YOUTUBE HOME` PRIMARY KEY (
	`id`
);

ALTER TABLE `locker` ADD CONSTRAINT `PK_LOCKER` PRIMARY KEY (
	`id`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_youtube home_TO_member_1` FOREIGN KEY (
	`connect_id`
)
REFERENCES `youtube home` (
	`id`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_locker_TO_member_1` FOREIGN KEY (
	`locker_id`
)
REFERENCES `locker` (
	`id`
);

