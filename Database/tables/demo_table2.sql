--liquibase formatted sql

--changeset JSB:0.0.4
--preconditions onFail:HALT OnError:HALT
--precondition-sql-check expectedResult:0 select count(*) from pg_tables where tablename = 'demo_table2' and schemaname = 'demo'
create table "demo"."demo_table2" (
    "demo_column3" varchar(150) NOT NULL,
    "demo_column4" varchar(32) NOT NULL,
    "demo_column5" Date,
    "demo_column6" varchar(50) NOT NULL,
    "demo_column7" varchar(50) NOT NULL
);
--rollback Drop table "demo"."demo_table2";

--changeset JSB:0.0.5
--preconditions onFail:HALT OnError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.table_constraints tc where constraint_name = 'PK_demo_table2' and table_name = 'demo_table2' and table_schema = 'demo'
ALTER TABLE "demo"."demo_table2" ADD CONSTRAINT "PK_demo_table2" PRIMARY KEY ("demo_column3");
--rollback Alter table "demo"."demo_table2" Drop constraint if exists "PK_demo_table2";