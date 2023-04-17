/*

Gerar as n_faturas de todas as ordens de compra concluidas

Para testar CALL gera_fatura(5, 200.55, '20230529') 

*/

CREATE PROCEDURE gera_fatura(IN cd_ordem INT, vlr_total DECIMAL(10,2),d_venc DATE)

BEGIN

    DECLARE n_faturas INT;

    IF ((SELECT 1 FROM ordem_de_compra WHERE cod_compra = cd_ordem) IS TRUE) THEN
        SET n_faturas = 1;
    END IF;
    
    START TRANSACTION;
    
        IF (n_faturas > 0) THEN
    	    INSERT INTO fatura (cod_fatura, valor_total, data_pag, status, dt_venc, dt_geracao, cod_ordem)
            VALUES (NULL, vlr_total, d_venc, 'GERADA', d_venc, NOW(), cd_ordem);
        END IF;

    COMMIT;
    
END;