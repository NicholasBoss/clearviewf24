-- -----------------------------------------------------
-- Drop Statements
-- -----------------------------------------------------
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS cust_order;
DROP TABLE IF EXISTS customer_address;
DROP TABLE IF EXISTS door;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS general_retract_control;
DROP TABLE IF EXISTS hale_door;
DROP TABLE IF EXISTS hale_screen_model;
DROP TABLE IF EXISTS mirage;
DROP TABLE IF EXISTS mirage_3500;
DROP TABLE IF EXISTS color;
DROP TABLE IF EXISTS frame_size;
DROP TABLE IF EXISTS fastener;
DROP TABLE IF EXISTS mesh;
DROP TABLE IF EXISTS public.window;
DROP TABLE IF EXISTS new_window_screen;
DROP TABLE IF EXISTS order_log;
DROP TABLE IF EXISTS phantom;
DROP TABLE IF EXISTS rainier;
DROP TABLE IF EXISTS sunscreen;
DROP TABLE IF EXISTS view_guard;
DROP TABLE IF EXISTS wizard_smart_screen;
DROP TABLE IF EXISTS measurement;
DROP TABLE IF EXISTS nws_measurement;
DROP TABLE IF EXISTS rainier_color;
DROP TABLE IF EXISTS mirage_3500_mesh;
DROP TABLE IF EXISTS mirage_mesh;
DROP TABLE IF EXISTS mirage_3500_color;
DROP TABLE IF EXISTS mirage_color;
DROP TABLE IF EXISTS rainier_order;
DROP TABLE IF EXISTS mirage_order;
DROP TABLE IF EXISTS mirage_3500_order;
DROP TABLE IF EXISTS nws_order;

-- -----------------------------------------------------
-- Table address
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS address 
(
  address_id SERIAL,
  address_line1 BOOLEAN NULL,
  address_line2 BOOLEAN NULL,
  CONSTRAINT address_pk PRIMARY KEY (address_id)
);


-- -----------------------------------------------------
-- Table customer
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS customer 
(
  customer_id SERIAL,
  c_fname BOOLEAN NULL,
  c_lname BOOLEAN NULL,
  CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);


-- -----------------------------------------------------
-- Table order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS public.order 
(
  order_id SERIAL,
  order_date DATE NOT NULL,
  estimated_date DATE NOT NULL,
  actual_date DATE NULL DEFAULT NULL,
  estimated_cost REAL NOT NULL,
  actual_cost REAL NULL DEFAULT NULL,
  quantity INTEGER NOT NULL,
  CONSTRAINT order_pk PRIMARY KEY (order_id)
);


-- -----------------------------------------------------
-- Table cust_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS cust_order 
(
  cust_order_id SERIAL,
  customer_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT cust_order_pk PRIMARY KEY (cust_order_id),
  INDEX fk_cust_order_customer_idx (customer_id),
  INDEX fk_cust_order_order1_idx (order_id ),
  CONSTRAINT cust_order_fk1
    FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT cust_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES public.order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table customer_address
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS customer_address 
(
  customer_address_id SERIAL,
  customer_id INTEGER NOT NULL,
  address_id INTEGER NOT NULL,
  CONSTRAINT cust_address_pk PRIMARY KEY (customer_address_id),
  INDEX fk_customer_address_customer1_idx (customer_id),
  INDEX fk_customer_address_address1_idx (address_id),
  CONSTRAINT fk_customer_address_address1
    FOREIGN KEY (address_id)
    REFERENCES address (address_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_customer_address_customer1
    FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table door
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS door 
(
  door_id SERIAL,
  slide_type BOOLEAN NULL,
  slide_color BOOLEAN NULL,
  wheels_num INTEGER NOT NULL,
  swing_type BOOLEAN NULL,
  swing_color BOOLEAN NULL,
  opening_side CHARACTER(2) NOT NULL,
  handle_style BOOLEAN NULL,
  CONSTRAINT door_pk PRIMARY KEY (door_id)
);

-- Account Type Creation
DROP TYPE IF EXISTS account_type CASCADE;
CREATE TYPE account_type AS ENUM
('Employee', 'Admin', 'DBA');

-- -----------------------------------------------------
-- Table account
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS account 
(
  account_id SERIAL,
  account_firstname BOOLEAN NULL,
  account_lastname BOOLEAN NULL,
  account_email BOOLEAN NULL,
  account_password BOOLEAN NULL,
  account_type account_type NOT NULL DEFAULT 'Employee'::account_type,
  CONSTRAINT account_pk PRIMARY KEY (account_id)
);


-- -----------------------------------------------------
-- Table general_retract_control
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS general_retract_control 
(
  general_retract_control_id SERIAL,
  door_type BOOLEAN NULL,
  door_mount BOOLEAN NULL,
  opening_side BOOLEAN NULL,
  fraction BOOLEAN NULL,
  mesh BOOLEAN NULL,
  mohair BOOLEAN NULL,
  mohair_position BOOLEAN NULL,
  top_adapter BOOLEAN NULL,
  build_out BOOLEAN NULL,
  btm_adapter BOOLEAN NULL,
  btm_adapter_color BOOLEAN NULL,
  CONSTRAINT grc_pk PRIMARY KEY (general_retract_control_id)
);


-- -----------------------------------------------------
-- Table hale_door
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS hale_door 
(
  hale_door_id SERIAL,
  size BOOLEAN NULL,
  flap_config BOOLEAN NULL,
  door_color BOOLEAN NULL,
  sec_cover_load BOOLEAN NULL,
  second_ext_cover CHARACTER(1) NOT NULL,
  rain_cap CHARACTER(1) NOT NULL,
  flap CHARACTER(1) NOT NULL,
  thickness BOOLEAN NULL,
  CONSTRAINT hale_door_pk PRIMARY KEY (table_id)
);


-- -----------------------------------------------------
-- Table hale_screen_model
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS hale_screen_model 
(
  hale_screen_model_id SERIAL,
  model_size BOOLEAN NULL,
  model_color BOOLEAN NULL,
  model_thickness BOOLEAN NULL,
  model_has_flap CHARACTER(2) NOT NULL,
  model_placement BOOLEAN NULL,
  CONSTRAINT hale_screen_model_pk PRIMARY KEY (hale_screen_model_id)
);


-- -----------------------------------------------------
-- Table mirage
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage 
(
  mirage_id SERIAL,
  mirage_build_out BOOLEAN NULL,
  CONSTRAINT mirage_pk PRIMARY KEY (mirage_id)
);


-- -----------------------------------------------------
-- Table mirage_3500
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500 
(
  mirage_3500_id SERIAL,
  mirage_3500_handle BOOLEAN NULL,
  CONSTRAINT mirage_3500_pk PRIMARY KEY (mirage_3500_id)
);


-- -----------------------------------------------------
-- Table color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS color 
(
  color_id SERIAL,
  color_name BOOLEAN NULL,
  CONSTRAINT color_pk PRIMARY KEY (color_id)
);


-- -----------------------------------------------------
-- Table frame_size
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS frame_size 
(
  frame_size_id SERIAL,
  size_type BOOLEAN NULL,
  CONSTRAINT frame_size_pk PRIMARY KEY (frame_size_id)
);


-- -----------------------------------------------------
-- Table fastener
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS fastener 
(
  fastener_id SERIAL,
  fastener_type BOOLEAN NULL,
  CONSTRAINT fastener_pk PRIMARY KEY (fastener_id)
);


-- -----------------------------------------------------
-- Table mesh
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mesh 
(
  mesh_id SERIAL,
  mesh_type BOOLEAN NULL,
  CONSTRAINT mesh_pk PRIMARY KEY (mesh_id)
);


-- -----------------------------------------------------
-- Table window
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS public.window 
(
  window_id SERIAL,
  tab_spring BOOLEAN NULL,
  color_id INTEGER NOT NULL,
  frame_size_id INTEGER NOT NULL,
  fastener_id INTEGER NOT NULL,
  mesh_id INTEGER NOT NULL,
  CONSTRAINT window_pk PRIMARY KEY (window_id),
  INDEX window_fk1_idx (color_id),
  INDEX window_fk2_idx (frame_size_id),
  INDEX window_fk3_idx (fastener_id),
  INDEX window_fk4_idx (mesh_id),
  CONSTRAINT window_fk1
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT window_fk2
    FOREIGN KEY (frame_size_id)
    REFERENCES frame_size (frame_size_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT window_fk3
    FOREIGN KEY (fastener_id)
    REFERENCES fastener (fastener_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT window_fk4
    FOREIGN KEY (mesh_id)
    REFERENCES mesh (mesh_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table new_window_screen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS new_window_screen 
(
  nws_id SERIAL,
  width_inch BOOLEAN NULL,
  height_inch BOOLEAN NULL,
  window_id INTEGER NOT NULL,
  CONSTRAINT nws_pk PRIMARY KEY (nws_id),
  INDEX nws_fk1_idx (window_id),
  CONSTRAINT nws_fk1
    FOREIGN KEY (window_id)
    REFERENCES public.window (window_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table order_log
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS order_log 
(
  order_log_id SERIAL,
  order_id INTEGER NOT NULL,
  account_id INTEGER NOT NULL,
  customer_id INTEGER NOT NULL,
  actual_date DATE NULL DEFAULT NULL,
  CONSTRAINT order_log_pk PRIMARY KEY (order_log_id),
  INDEX fk_order_log_order1_idx (order_id),
  INDEX fk_order_log_account1_idx (account_id),
  INDEX fk_order_log_customer1_idx (customer_id),
  CONSTRAINT order_log_fk1
    FOREIGN KEY (customer_id)
    REFERENCES customer (customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT order_log_fk2
    FOREIGN KEY (account_id)
    REFERENCES account (account_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT order_log_fk3
    FOREIGN KEY (order_id)
    REFERENCES public.order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table phantom
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS phantom 
(
  phantom_id SERIAL,
  phantom_color BOOLEAN NULL,
  phantom_build_out BOOLEAN NULL DEFAULT 'None',
  meshlock CHARACTER(1) NOT NULL,
  phantom_mesh CHARACTER VARYING(200) NOT NULL,
  meshlock_mesh CHARACTER VARYING(100) NOT NULL,
  type_of_screen CHARACTER VARYING(60) NOT NULL,
  screen_color BOOLEAN NULL,
  wood_type BOOLEAN NULL,
  mount BOOLEAN NULL,
  hembar BOOLEAN NULL,
  tracks BOOLEAN NULL,
  mesh BOOLEAN NULL,
  CONSTRAINT phantom_pk PRIMARY KEY (phantom_id)
);


-- -----------------------------------------------------
-- Table rainier
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table Rainier Housing
-- -----------------------------------------------------

CREATE TABLE rainier_housing
(
rainier_housing_id SERIAL,
est_housing_series BOOLEAN NOT NULL,
act_housing_series BOOLEAN NOT NULL
);

-- -----------------------------------------------------
-- Table rainier_placement
-- -----------------------------------------------------
-- 
CREATE TABLE rainier_placement
(
  rainier_placement_id SERIAL,
  est_placement BOOLEAN NOT NULL,
  act_placement BOOLEAN NOT NULL;
);


  est_drive_side BOOLEAN NULLL,
  act_drive_side BOOLEAN NULLL,
  est_hembar BOOLEAN NULLL,
  act_hembar BOOLEAN NULLL,
  est_pilebrush BOOLEAN NULLL,
  act_pilebrush BOOLEAN NULLL,
  est_brush_location BOOLEAN NULLL,
  act_brush_location BOOLEAN NULLL,
  est_cord_length BOOLEAN NULLL,
  act_cord_length BOOLEAN NULLL,
  est_mount_type BOOLEAN NULLL,
  act_mount_type BOOLEAN NULLL,
  est_top_opening_width BOOLEAN NULLL,
  act_top_opening_width BOOLEAN NULLL,
  act_top_level BOOLEAN NULLL,
  act_bottom_opening_width BOOLEAN NULLL,
  act_bottom_level BOOLEAN NULLL,
  act_left_opening_height BOOLEAN NULLL,
  act_left_plumb BOOLEAN NULLL,
  act_right_opening_height BOOLEAN NULLL,
  act_right_plumb BOOLEAN NULLL,
  est_left_buildout BOOLEAN NULLL,
  act_left_buildout BOOLEAN NULLL,
  est_right_buildout BOOLEAN NULLL,
  act_right_buildout BOOLEAN NULLL,
  est_add_buildout BOOLEAN NULLL,
  act_add_buildout BOOLEAN NULLL,
  est_left_track BOOLEAN NULLL,
  act_left_track BOOLEAN NULLL,
  est_right_track BOOLEAN NULLL,
  act_right_track BOOLEAN NULLL,
  act_starting_point BOOLEAN NULLL,
  CREATE TABLE IF NOT EXISTS rainier 
(
  rainier_id SERIAL,
  CONSTRAINT rainier_pk PRIMARY KEY (rainier_id)
);

-- -----------------------------------------------------
-- Table sunscreen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS sunscreen 
(
  sunscreen_id SERIAL,
  cast_clip CHARACTER VARYING(5) NOT NULL,
  CONSTRAINT susnscreen_pk PRIMARY KEY (sunscreen_id)
);


-- -----------------------------------------------------
-- Table view_guard
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS view_guard 
(
  viewguard_id SERIAL,
  handle_color CHARACTER VARYING(10) NOT NULL,
  door_type CHARACTER VARYING(10) NOT NULL,
  number_of_slides INTEGER NOT NULL,
  color CHARACTER VARYING(10) NOT NULL,
  handle_style BOOLEAN NULL,
  deadbolt BOOLEAN NULL,
  CONSTRAINT viewguard_pk PRIMARY KEY (viewguard_id)
);


-- -----------------------------------------------------
-- Table wizard_smart_screen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS wizard_smart_screen 
(
  wizard_smart_screen_id SERIAL,
  location_on_house BOOLEAN NULL,
  placement BOOLEAN NULL,
  color BOOLEAN NULL,
  fabric_type BOOLEAN NULL,
  housing_size BOOLEAN NULL,
  drive_side BOOLEAN NULL,
  bottom_seal BOOLEAN NULL,
  zipper_color BOOLEAN NULL,
  probe_color BOOLEAN NULL,
  cable_length BOOLEAN NULL,
  top_opening_width BOOLEAN NULL,
  top_level BOOLEAN NULL,
  bottom_opening_width BOOLEAN NULL,
  bottom_level BOOLEAN NULL,
  left_opening_height BOOLEAN NULL,
  left_plump BOOLEAN NULL,
  right_opening_height BOOLEAN NULL,
  right_plump BOOLEAN NULL,
  two_by_two_angle BOOLEAN NULL,
  track_type BOOLEAN NULL,
  track_punched BOOLEAN NULL,
  starting_poINTEGER BOOLEAN NULL,
  order_width BOOLEAN NULL,
  order_height BOOLEAN NULL,
  CONSTRAINT wss_pk PRIMARY KEY (wizard_smart_screen_id)
);


-- -----------------------------------------------------
-- Table measurement
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS measurement 
(
  measurement_id SERIAL,
  measurement_name BOOLEAN NULL,
  CONSTRAINT measurement_pk PRIMARY KEY (measurement_id)
);


-- -----------------------------------------------------
-- Table nws_measurement
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS nws_measurement 
(
  nws_measurement_id SERIAL,
  measurement_id INTEGER NOT NULL,
  nws_id INTEGER NOT NULL,
  width_fraction CHARACTER(1) NULL,
  width_plus_minus CHARACTER(1) NULL,
  height_fraction CHARACTER(1) NULL,
  height_plus_minus CHARACTER(1) NULL,
  CONSTRAINT nws_measurement_pk PRIMARY KEY (nws_measurement_id),
  INDEX nws_measurement_fk1_idx (measurement_id),
  INDEX nws_measurement_fk2_idx (nws_id),
  CONSTRAINT nws_measurement_fk1
    FOREIGN KEY (measurement_id)
    REFERENCES measurement (measurement_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT nws_measurement_fk2
    FOREIGN KEY (nws_id)
    REFERENCES new_window_screen (nws_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table rainier_color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS rainier_color 
(
  rainier_color_id SERIAL,
  rainier_id INTEGER NOT NULL,
  color_id INTEGER NOT NULL,
  est_hardware_color CHARACTER(1) NULL,
  act_hardware_color CHARACTER(1) NULL,
  est_fabric_color CHARACTER(1) NULL,
  act_fabric_color CHARACTER(1) NULL,
  est_zipper_color CHARACTER(1) NULL DEFAULT NULL,
  act_zipper_color CHARACTER(1) NULL DEFAULT NULL,
  CONSTRAINT ranier_color_pk PRIMARY KEY (rainier_color_id),
  INDEX rainier_color_fk1_idx (rainier_id),
  INDEX rainier_color_fk2_idx (color_id),
  CONSTRAINT rainier_color_fk1
    FOREIGN KEY (rainier_id)
    REFERENCES rainier (rainier_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_color_fk2
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_3500_mesh
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500_mesh 
(
  mirage_3500_mesh_id SERIAL,
  mirage_3500_id INTEGER NOT NULL,
  mesh_id INTEGER NOT NULL,
  CONSTRAINT mirage_3500_mesh_pk PRIMARY KEY (mirage_3500_mesh_id),
  INDEX mirage_3500_mesh_fk1_idx (mirage_3500_id),
  INDEX mirage_3500_mesh_fk2_idx (mesh_id),
  CONSTRAINT mirage_3500_mesh_fk1
    FOREIGN KEY (mirage_3500_id)
    REFERENCES mirage_3500 (mirage_3500_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_3500_mesh_fk2
    FOREIGN KEY (mesh_id)
    REFERENCES mesh (mesh_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_mesh
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_mesh 
(
  mirage_mesh_id SERIAL,
  mirage_id INTEGER NOT NULL,
  mesh_id INTEGER NOT NULL,
  CONSTRAINT mirage_mesh_pk PRIMARY KEY (mirage_mesh_id),
  INDEX mirage_mesh_fk1_idx (mirage_id),
  INDEX mirage_mesh_fk2_idx (mesh_id),
  CONSTRAINT mirage_mesh_fk1
    FOREIGN KEY (mirage_id)
    REFERENCES mirage (mirage_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_mesh_fk2
    FOREIGN KEY (mesh_id)
    REFERENCES mesh (mesh_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_3500_color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500_color 
(
  mirage_3500_color_id SERIAL,
  mirage_3500_id INTEGER NOT NULL,
  color_id INTEGER NOT NULL,
  CONSTRAINT mirage_3500_color_pk PRIMARY KEY (mirage_3500_color_id),
  INDEX mirage_3500_color_fk1_idx (mirage_3500_id),
  INDEX mirage_3500_color_fk2_idx (color_id),
  CONSTRAINT mirage_3500_color_fk1
    FOREIGN KEY (mirage_3500_id)
    REFERENCES mirage_3500 (mirage_3500_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_3500_color_fk2
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table mirage_color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_color 
(
  mirage_color_id SERIAL,
  mirage_id INTEGER NOT NULL,
  color_id INTEGER NOT NULL,
  mirage_color CHARACTER(1) NULL,
  pivot_pro_color CHARACTER(1) NULL,
  CONSTRAINT mirage_color_pk PRIMARY KEY (mirage_color_id),
  INDEX mirage_color_fk1_idx (mirage_id),
  INDEX mirage_color_fk2_idx (color_id),
  CONSTRAINT mirage_color_fk1
    FOREIGN KEY (mirage_id)
    REFERENCES mirage (mirage_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_color_fk2
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table rainier_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS rainier_order
(
  rainier_order_id SERIAL,
  rainier_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT rainier_order_pk PRIMARY KEY (rainier_order_id),
  INDEX fk_rainier_order_rainier1_idx (rainier_id),
  INDEX fk_rainier_order_order1_idx (order_id),
  CONSTRAINT rainier_order_fk1
    FOREIGN KEY (rainier_id)
    REFERENCES rainier (rainier_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES public.order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table mirage_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_order
(
  mirage_order_id SERIAL,
  mirage_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT mirage_order_pk PRIMARY KEY (mirage_order_id),
  INDEX fk_mirage_order_mirage1_idx (mirage_id),
  INDEX fk_mirage_order_order1_idx (order_id),
  CONSTRAINT mirage_order_fk1
    FOREIGN KEY (mirage_id)
    REFERENCES mirage (mirage_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES public.order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table mirage_3500_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500_order
(
  mirage_3500_order_id SERIAL,
  mirage_3500_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT mirage_3500_order_pk PRIMARY KEY (mirage_3500_order_id),
  INDEX fk_mirage_3500_order_mirage_35001_idx (mirage_3500_id),
  INDEX fk_mirage_3500_order_order1_idx (order_id),
  CONSTRAINT mirage_3500_order_fk1
    FOREIGN KEY (mirage_3500_id)
    REFERENCES mirage_3500 (mirage_3500_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT mirage_3500_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES public.order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table nws_order
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS nws_order
(
  nws_order_id SERIAL,
  nws_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  CONSTRAINT nws_order_pk PRIMARY KEY (nws_order_id),
  INDEX fk_nws_order_nws1_idx (nws_id),
  INDEX fk_nws_order_order1_idx (order_id),
  CONSTRAINT nws_order_fk1
    FOREIGN KEY (nws_id)
    REFERENCES new_window_screen (nws_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT nws_order_fk2
    FOREIGN KEY (order_id)
    REFERENCES public.order (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table phantom_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table view_guard_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table wizard_smart_screen_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table sunscreen_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table general_retract_control_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table hale_door_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table hale_screen_model_order
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table door_order
-- -----------------------------------------------------
