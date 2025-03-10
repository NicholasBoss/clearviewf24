-- My ClearView INSERT statements

-- customer_address, door, account, general_retract_control, hale_door, hale_screen_model, mirage, mirage_3500;

INSERT INTO window ( tab_spring, color_id, frame_size_id, fastener_id, mesh_id ) -- color_id, frame_size_id, faster_id, mesh_id are foreign keys from color table, frame_size table, fastener table, and mesh table
VALUES ( );

INSERT INTO new_window_screen ( width_inch, height_inch, window_id) -- window_id is foreign key from window table.
VALUES ( "1/16''", "1/16''", SELECT window_id FROM window WHERE )
        , ("1/8''", "1/8''", SELECT ...)
        , ("3/16''", "3/16''", SELECT ...)
        , ("1/4''", "1/4;;", SELECT ...)
        , ("5/16''", "5/16''", SELECT ...)
        , ("3/8''", "3/8''", SELECT ...)
        , ("7/16''", "7/16''", SELECT ...)
        , ("1/2''", "1/2''", SELECT ...)
        , ("9/16''", "9/16''", SELECT ...)
        , ("5/8''", "5/8''", SELECT ...)
        , ("11/16''", "11/16''", SELECT ...)
        , ("3/4''", "3/4''", SELECT ...)
        , ("13/16''", "13/16''", SELECT ...)
        , ("7/8''", "7/8''", SELECT ...)
        , ("15/16''", "15/16''", SELECT ...);

INSERT INTO order_log ( order_id, employee_id, customer_id, actual_data)
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