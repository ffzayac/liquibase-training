--liquibase formatted sql

--changeset ffzayac:001-create-backoffice-schema
CREATE SCHEMA IF NOT EXISTS backoffice;

COMMENT ON SCHEMA backoffice IS
'Учебная схема объектов бэк-офисной системы';

--rollback DROP SCHEMA IF EXISTS backoffice CASCADE;

