--liquibase formatted sql

--changeset ffzayac:003-create-account-table
CREATE TABLE backoffice.account (
    account_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id BIGINT NOT NULL,
    account_no VARCHAR(34) NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    opened_at DATE NOT NULL DEFAULT current_date,
    closed_at DATE,

    CONSTRAINT uq_account_account_no
        UNIQUE (account_no),

    CONSTRAINT fk_account_client
        FOREIGN KEY (client_id)
        REFERENCES backoffice.client (client_id),

    CONSTRAINT chk_account_dates
        CHECK (closed_at IS NULL OR closed_at >= opened_at)
);

CREATE INDEX ix_account_client_id
    ON backoffice.account (client_id);

--rollback DROP TABLE IF EXISTS backoffice.account;

