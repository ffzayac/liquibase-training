--liquibase formatted sql

--changeset ffzayac:005-insert-demo-client
--comment: Инсерт тестового клиента

INSERT INTO backoffice.client
(external_client_code, full_name, inn, is_active, created_at, updated_at, status)
VALUES('ABC', 'Рога и копыта', '123123876453', true, now(), now(), 'ACTIVE'::character varying);

--rollback DELET FROM backoffice.client
--rollback where external_client_code = 'ABC';