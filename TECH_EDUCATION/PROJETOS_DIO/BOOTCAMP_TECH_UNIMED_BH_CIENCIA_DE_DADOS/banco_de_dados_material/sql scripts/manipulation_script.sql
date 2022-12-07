SELECT now() AS TIMESTAMP;
CREATE DATABASE IF NOT EXISTS manipulation;
USE manipulation;

CREATE TABLE bank_accounts(
	id_account INT auto_increment PRIMARY KEY,
    ag_number INT NOT NULL,
	acc_number INT NOT NULL,
    saldo FLOAT,
    CONSTRAINT identification_account_constraint UNIQUE (ag_number, acc_number)    
);

CREATE TABLE bankClient(
	id_client INT auto_increment,
    client_account INT,
    cpf_client CHAR(11) NOT NULL,
    rg_client CHAR(9) NOT NULL,
    nome_cli VARCHAR(60) NOT NULL,
    end_cli VARCHAR(250) NOT NULL,
    renda_mensal_cli FLOAT,
    PRIMARY KEY (id_client, client_account),
    CONSTRAINT fk_account_client FOREIGN KEY(client_account) REFERENCES bank_accounts (id_account),
    ON UPDATE CASCASDE
);

