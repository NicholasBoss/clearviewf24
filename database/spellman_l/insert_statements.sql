-- My ClearView INSERT statements

-- address - mirage_3500
-- address, customer, cust_order, customer_address, door, account, general_retract_control, hale_door, hale_screen_model, mirage, mirage_3500;

-- data not available right now
INSERT INTO address ( address_id, address_line1, address_line2 ) 
VALUES ( 1,  );

-- data not available right now
INSERT INTO customer ( customer_id, c_fname, c_lname )
VALUES ( );

-- data not available right now
INSERT INTO cust_order ( cust_order_id, customer_id, order_id )
VALUES ( );

-- data not available right now
INSERT INTO customer_address ( customer_address_id, customer_id, address_id )
VALUES ( );

-- data not available right now
INSERT INTO door ( door_id, slide_type, slide_color, wheels_num, swing_type, swing_color, opening_side, handle_style )
VALUES ( 1, );

-- data not available right now
INSERT INTO account ( account_id, account_firstname, account_lastname, account_email, account_password, account_type??? )
VALUES ( );

-- data not available right now
INSERT INTO general_retract_control ( general_retract_control_id, door_type, door_mount, opening_side, fraction, mesh, mohair, mohair_position, top_adapter, build_out, btm_adapter, btm_adapter_color )
VALUES ( 1, );

-- data not available right now
INSERT INTO hale_door ( hale_door_id, size, flap_config, door_color, sec_cover_load, second_ext_cover, rain_cap, flap, thickness )
VALUES ( );

-- data not available right now
INSERT INTO hale_screen_model ( model_size, model_color, model_thickness, model_has_flap, model_placement )
VALUES ( );

-- are these escape characters correctly coded???
INSERT INTO mirage ( mirage_build_out )
VALUES ( "None")
        , ("Bug Flap Black")
        , ("Bug Flap Grey")
        , ("1\'' X 2\'' L Flap")
        , ("1' Sq")
        , ("1/2\' Sq")
        , ("Custom");

INSERT INTO mirage_3500 (mirage_3500_handle)
VALUES ("Pivot Pro")
        , ("Recessed")
        , ("Standard"); 