SELECT 
    
    REGEXP_REPLACE(LPAD(np.cpf, 11, '0'), 
                   '([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})', 
                   '\1.\2.\3-\4') 
    AS CPF
FROM customers c
INNER JOIN natural_person np ON c.id = np.id_customers;
