
DECLARE 


itemid number := &iid;
itemcost number(10,2) := &icost;
null_cost_exception exception;
greater_thanhundred exception;
invalid_identifer exception;

cursor item_cursor is 
	select 
		item_id, item_cost
	from 
		pitem 
	where 
		item_id = itemid;

items item_cursor%rowtype;



BEGIN 

--If cursor is empty, identifier is invalid
OPEN item_cursor;
	LOOP
		fetch item_cursor into items;
		IF item_cursor%notfound THEN 
			RAISE invalid_identifer;
		END IF;

	END LOOP;


--If Cost is null
IF (items.item_cost is null) THEN
		RAISE null_cost_exception;
END IF;



EXCEPTION 
	--If Item ID Does not exist
	WHEN invalid_identifer THEN
		INSERT INTO 
			pitem_audit (item_id, message) 
		VALUES (itemid, 'Invalid Item Identifier.');

	--If the cost is null
	WHEN null_cost_exception THEN
		UPDATE 
			pitem
		SET 
			item_cost = (select item_cost from pitem where item_id = itemid)
		WHERE 
			item_id = itemid;
		INSERT INTO
			pitem_audit (item_id, message)
		VALUES
			(itemid, 'Null cost replaced by original cost of '||items.item_cost);
	


END;
