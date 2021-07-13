--liquibase formatted sql

/* Add base tag */

--changeset TAG:v0.0.1
Update DatabaseChangeLog
Set TAG='v0.0.1'
Where DateExecuted = (Select Max(DateExecuted) from DatabaseChangeLog);
--rollback Delete from DatabaseChangeLog where Author='TAG' and ID='v0.0.1';