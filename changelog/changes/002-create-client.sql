--liquibase formatted sql

--changeset ffzayac:002-create-client-table
CREATE TABLE backoffice.client (
    client_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    external_client_code VARCHAR(50) NOT NULL,
    full_name VARCHAR(500) NOT NULL,
    inn VARCHAR(12),
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),

    CONSTRAINT uq_client_external_code
        UNIQUE (external_client_code),

    CONSTRAINT chk_client_inn_length
        CHECK (inn IS NULL OR length(inn) IN (10, 12))
);

COMMENT ON TABLE backoffice.client IS
'Клиенты бэк-офисной системы';

COMMENT ON COLUMN backoffice.client.external_client_code IS
'Идентификатор клиента во внешней системе';

--rollback DROP TABLE IF EXISTS backoffice.client;

