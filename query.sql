-- Informações do pedido apenas com o id do pedido
SELECT 
       ped.VALOR_FRETE,
       ped.VALOR_DESCONTO,
       ped.TOTAL,
       ped.OBSERVACAO,
       pag.FORMA_PAGAMENTO,
       ender.LOGRADOURO
FROM Pedidos ped INNER JOIN FORMAS_PAGAMENTO pag
    ON ped.ID_FORMA_PAGAMENTO = pag.ID_FORMA
INNER JOIN CLIENTES c
    ON ped.id_cliente = c.id_cliente
INNER JOIN VENDEDORES v
    ON ped.id_vendedor = v.ID_VENDEDOR
INNER JOIN ENDERECOS ender
    ON c.id_endereco = ender.id_endereco
WHERE ped.ID_PEDIDO = 1;

-- Informações dos produtos dentro do pedido
SELECT 
       ped.ID_PEDIDO,
       prod.NOME_PRODUTO,
       pp.SUBTOTAL,
       pp.QUANTIDADE,
       prod.PRECO,
       prod.ESTOQUE
FROM Pedidos ped INNER JOIN PEDIDOPRODUTO pp
    ON ped.ID_PEDIDO = pp.ID_PEDIDO
INNER JOIN PRODUTOS prod 
    ON pp.ID_PRODUTO = prod.ID_PRODUTO 
WHERE ped.ID_PEDIDO = 1;
