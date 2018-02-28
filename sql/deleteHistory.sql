DELETE fi
FROM civicrm_financial_item AS fi
WHERE fi.id IN
  (SELECT DISTINCT(li.id)
  FROM civicrm_line_item li
  JOIN civicrm_entity_financial_trxn ef ON ef.entity_table = li.entity_table AND ef.entity_id = li.entity_id
  JOIN civicrm_financial_trxn trx ON trx.id = ef.financial_trxn_id
  WHERE trx.check_number != "AIVL fintrxn");

DELETE FROM civicrm_entity_financial_trxn
WHERE financial_trxn_id IN
      (SELECT id
       FROM civicrm_financial_trxn WHERE check_number != "AIVL fintrxn");

DELETE FROM civicrm_financial_trxn WHERE check_number != "AIVL fintrxn";