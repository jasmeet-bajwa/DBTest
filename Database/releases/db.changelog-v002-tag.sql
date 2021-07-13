--liquibase formatted sql

--changeset TAG:v0.0.2
select 1;
--rollback Delete from DatabaseChangeLog where Author='TAG' and ID='v0.0.2';
Update DatabaseChangeLog
Set TAG='v0.0.2'
Where DateExecuted = (Select Max(DateExecuted) from DatabaseChangeLog);