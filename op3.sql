DECLARE
	itemid 					number := &iid;
	newitemcost 		number(10,2) := &icost;
	olditemcost 		number(10,2);
BEGIN
	SELECT item_id INTO itemid FROM pitem WHERE item_id = itemid;
	SELECT item_cost INTO olditemcost FROM pitem WHERE item_id = itemid;
	

	IF newitemcost IS NULL THEN
		INSERT INTO pitem_audit VALUES (itemid, 'Null cost replaced by original cost of '||to_char(olditemcost));
		RETURN;
	END IF;

	--Cost exceeds 00 handler 
	IF (newitemcost > 100) THEN
		INSERT INTO pitem_audit VALUES (itemid, 'New cost of  '||to_char(newitemcost)||' exceeds $100.00, changes not made');
		RETURN;
	END IF;

	UPDATE pitem SET item_cost = newitemcost WHERE item_id = itemid;
	commit;

	EXCEPTION
	WHEN NO_DATA_FOUND THEN INSERT INTO pitem_audit VALUES (itemid, 'Invalid item identifier.'); 


END;
/