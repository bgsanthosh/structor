SELECT AVG(`t0`.`x_measure__0`) AS `avg_calculation_270497503505567749_ok`,
`t0`.`cd_credit_rating` AS `cd_credit_rating`,
`t0`.`cd_gender` AS `cd_gender`
FROM (
SELECT `customer_demographics`.`cd_credit_rating` AS `cd_credit_rating`,
`customer_demographics`.`cd_gender` AS `cd_gender`,
`store_sales`.`ss_ticket_number` AS `ss_ticket_number`,
SUM(`store_sales`.`ss_net_paid`) AS `x_measure__0`
FROM `${DB}`.`store_sales` `store_sales`
JOIN `${DB}`.`item` `item` ON (`store_sales`.`ss_item_sk` = `item`.`i_item_sk`)
JOIN `${DB}`.`customer` `customer` ON (`store_sales`.`ss_customer_sk` = `customer`.`c_customer_sk`)
JOIN `${DB}`.`customer_address` `customer_address` ON (`customer`.`c_current_addr_sk` = `customer_address`.`ca_address_sk`)
JOIN `${DB}`.`date_dim_date` `date_dim_date` ON (`store_sales`.`ss_sold_date_sk` = `date_dim_date`.`d_date_sk`)
JOIN `${DB}`.`store` `store` ON (`store_sales`.`ss_store_sk` = `store`.`s_store_sk`)
JOIN `${DB}`.`customer_demographics` `customer_demographics` ON (`customer`.`c_current_cdemo_sk` = `customer_demographics`.`cd_demo_sk`)
GROUP BY `customer_demographics`.`cd_credit_rating`,
`customer_demographics`.`cd_gender`,
`store_sales`.`ss_ticket_number`
) `t0`
GROUP BY `t0`.`cd_credit_rating`,
`t0`.`cd_gender` ;

