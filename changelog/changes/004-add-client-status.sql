--liquibase formatted sql

--changeset ffzayac:004-add-client-status
ALTER TABLE backoffice.client
    ADD COLUMN status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE';

ALTER TABLE backoffice.client
    ADD CONSTRAINT chk_client_status
    CHECK (status IN ('ACTIVE', 'BLOCKED', 'CLOSED'));

COMMENT ON COLUMN backoffice.client.status IS
'Статус обслуживания клиента';

--rollback ALTER TABLE backoffice.client DROP CONSTRAINT IF EXISTS chk_client_status;
--rollback ALTER TABLE backoffice.client DROP COLUMN IF EXISTS status;

