-- My ClearView INSERT statements

-- address - mirage_3500
-- address, customer, cust_order, customer_address, door, account, general_retract_control, hale_door, hale_screen_model, mirage, mirage_3500;

INSERT INTO address ( address_id, address_line1, address_line2 ) 
VALUES ( 1,  );

INSERT INTO customer ( customer_id, c_fname, c_lname )
VALUES ( );

INSERT INTO cust_order ( cust_order_id, customer_id, order_id )
VALUES ( );

INSERT INTO customer_address ( customer_address_id, customer_id, address_id )
VALUES ( );

INSERT INTO door ( door_id, slide_type, slide_color, wheels_num, swing_type, swing_color, opening_side, handle_style )
VALUES ( 1, );

INSERT INTO account ( account_id, account_firstname, account_lastname, account_email, account_password, account_type??? )
VALUES ( );

INSERT INTO general_retract_control ( general_retract_control_id, door_type, door_mount, opening_side, fraction, mesh, mohair, mohair_position, top_adapter, build_out, btm_adapter, btm_adapter_color )
VALUES ( );

INSERT INTO hale_door ( hale_door_id, size, flap_config, door_color, sec_cover_load, second_ext_cover, rain_cap, flap, thickness )
VALUES ( );

INSERT INTO hale_screen_model ( hale_screen_model_id, model_size, model_color, model_thickness, model_has_flap, model_placement )
VALUES ( );

INSERT INTO mirage ( mirage_id, mirage_build_out )
VALUES ( );

INSERT INTO mirage_3500 (mirage_3500_id, mirage_3500_handle )
VALUES ( ); 