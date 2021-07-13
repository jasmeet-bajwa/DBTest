--liquibase formatted sql

--changeset JSB:0.0.1
--preconditions onFail:HALT OnError:HALT
--precondition-sql-check expectedResult:0 select count(*) from pg_namespace where nspname = 'demo'
CREATE SCHEMA "demo";
--rollback Drop Schema "demo" CASCADE;

--changeset JSB:0.0.2
--preconditions onFail:HALT OnError:HALT
--precondition-sql-check expectedResult:0 select count(*) from pg_tables where tablename = 'demo_table1' and schemaname = 'demo'
create table "demo"."demo_table1" (
    "demo_column1" varchar(150) NOT NULL,
    "demo_column2" varchar(32) NOT NULL
);
--rollback Drop table "demo"."demo_table1";

--changeset JSB:0.0.3
--preconditions onFail:HALT OnError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.table_constraints tc where constraint_name = 'PK_demo_table1' and table_name = 'demo_table1' and table_schema = 'demo'
ALTER TABLE "demo"."demo_table1" ADD CONSTRAINT "PK_demo_table1" PRIMARY KEY ("demo_column1");
--rollback Alter table "demo"."demo_table1" Drop constraint if exists "PK_demo_table1";

