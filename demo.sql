-- Test cases for routines

/* ad hoc test */
DO language plpgsql $$
BEGIN
  RAISE NOTICE 'hello, world!';
END
$$;

/* transient table */
(VALUES (row), (row))


-- 3
select * from customers
select * from credit_cards
select * from owns
CALL add_customer ('Chen Anqi', '3 Jurong East Street 32', '(+65) 90174780', 'anqichen@gmail.com', 'A0188533W1234', '2023-02-20', 886);

-- 4
select * from owns where cust_id=11;
select * from credit_cards;
CALL update_credit_card (11, 'A0188533119W0117', '2026-09-27', 901);
-- check correct insertions
select * from owns;
select * from credit_cards;
-- duplicate card
CALL update_credit_card (12, 'A0188533119W0117', '2021-09-27', 901);
-- expired date
CALL update_credit_card (10, 'A0188533119W0110', '2020-09-27', 901);

-- 8
-- -- first look at all rooms. in total 22 rooms
-- SELECT * FROM Rooms;
-- -- look at sessions
-- SELECT * FROM Sessions;


-- case1: no sessions are conducted on 2021-04-14, all rooms free
-- SELECT * FROM Sessions WHERE date = '2021-04-14';
-- SELECT * FROM find_rooms('2021-04-14', 9, 2);


-- case2: several sessions on that day
-- SELECT * FROM Sessions WHERE DATE = '2021-04-09';
-- SELECT * FROM find_rooms('2021-04-09', 14, 1);
-- SELECT * FROM find_rooms('2021-04-09', 14, 2);


-- input validity check 1: time not valid
-- SELECT * FROM find_rooms('2021-04-09', 18, 1);
-- SELECT * FROM find_rooms('2021-04-09', 11, 4);
-- input validity check 2: date not valid
-- SELECT * FROM find_rooms('2021-04-10', 14, 3);


-- test 20
-- SELECT * FROM Cancels;
-- SELECT * FROM Redeems;
-- SELECT * FROM Registers;
-- SELECT * FROM Owns;

-- case 1: cancel successfully(customer 12 cancels course 10, from redeem)
-- SELECT * FROM Buys;
-- CALL cancel_registration (12, 10, '2021-03-01');
-- SELECT * FROM Cancels;
-- SELECT * FROM Buys;

-- CALL register_session (1, 10, '2021-03-01', 10, 0); -- register
-- SELECT * FROM Registers;
-- case 2: cancel successfully(customer 12 cancels course 10, register directly)
-- CALL cancel_registration (1, 10, '2021-03-01');
-- SELECT * FROM Cancels;

-- case 3: the customer not register or redeem any session or canceled
-- CALL cancel_registration (1, 10, '2021-03-01');

-- case 4: Session started:
-- CALL cancel_registration (11, 10, '2021-03-01');

-- pass the deadline
-- CALL add_session (3, '2021-04-18', 3, '2021-04-20', 14, 3, 3);
-- CALL register_session (3, 10, '2021-03-01', 5, 0);
-- SELECT * FROM Registers;
-- SELECT * FROM Owns;
