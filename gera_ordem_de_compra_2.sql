/*

Gerar uma ordem de compra de todos os produtos com baixa no estoque atendendo as quantidades mínimas de estoque
Para testar: coloca um produto abaixo da quantidade minima e CALL gera_ordem_de_compra(45678901234567)

*/

CREATE PROCEDURE gera_ordem_de_compra (IN cnpj VARCHAR(18))
BEGIN
    DECLARE descr VARCHAR(100);
    DECLARE qt_minima INT; 
    DECLARE qt_atual INT;
    DECLARE acabou TINYINT;

    DECLARE verifica_qtd CURSOR FOR
        SELECT descricao, qtd_minima, quant_atual FROM produto;
       
    DECLARE CONTINUE HANDLER
    FOR NOT FOUND SET acabou = 1;

    OPEN verifica_qtd;
   
    pega_produto: LOOP
    
	    FETCH verifica_qtd INTO descr, qt_minima, qt_atual;
        IF (acabou = 1) THEN 
        	LEAVE pega_produto;
        END IF;

        IF (qt_atual < qt_minima) THEN
            INSERT INTO ordem_de_compra (cod_compra, descricao, total_consolidado, foi_cancelada,
            cnpj_filial, dt_realiza) 
            VALUES (NULL, descr, qt_minima, NULL, cnpj, NOW());       
        END IF;        
        
    END LOOP pega_produto;

    CLOSE verifica_qtd;
END