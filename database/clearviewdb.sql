-- -----------------------------------------------------
-- Drop Statements
-- -----------------------------------------------------
DROP TABLE IF EXISTS customization;
DROP TABLE IF EXISTS customer_address;
DROP TABLE IF EXISTS cust_order;
DROP TABLE IF EXISTS order_log;
DROP TABLE IF EXISTS public.order;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;
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
DROP TABLE IF EXISTS new_window_screen; -- ADD
DROP TABLE IF EXISTS phantom;
DROP TABLE IF EXISTS rainier;
DROP TABLE IF EXISTS placement; -- ADD
DROP TABLE IF EXISTS housing_series; -- ADD
DROP TABLE IF EXISTS drive_side; -- ADD
DROP TABLE IF EXISTS hembar; -- ADD
DROP TABLE IF EXISTS pilebrush; -- ADD
DROP TABLE IF EXISTS brush_location; -- ADD
DROP TABLE IF EXISTS cord_length; -- ADD
DROP TABLE IF EXISTS mount_type; -- ADD
DROP TABLE IF EXISTS top_opening; -- ADD
DROP TABLE IF EXISTS buildout; -- ADD
DROP TABLE IF EXISTS track; -- ADD
DROP TABLE IF EXISTS sunscreen;
DROP TABLE IF EXISTS viewguard; 
DROP TABLE IF EXISTS wizard_smart_screen;
DROP TABLE IF EXISTS measurement;

-- -----------------------------------------------------
-- Table address
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS address 
(
  address_id SERIAL,
  address_line1 CHARACTER VARYING NOT NULL,
  address_line2 CHARACTER VARYING NOT NULL,
  CONSTRAINT address_pk PRIMARY KEY (address_id)
);


-- -----------------------------------------------------
-- Table customer
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS customer 
(
  customer_id SERIAL,
  c_fname CHARACTER VARYING NOT NULL,
  c_lname CHARACTER VARYING NOT NULL,
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
  account_firstname CHARACTER VARYING NOT NULL,
  account_lastname CHARACTER VARYING NOT NULL,
  account_email CHARACTER VARYING NOT NULL,
  account_password CHARACTER VARYING NOT NULL,
  account_type account_type NOT NULL DEFAULT 'Employee'::account_type,
  CONSTRAINT account_pk PRIMARY KEY (account_id)
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
-- Table product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product
(
  product_id SERIAL,
  product_name CHARACTER VARYING NOT NULL,
  CONSTRAINT product_pk PRIMARY KEY (product_id)
);

-- -----------------------------------------------------
-- Table door
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS door 
(
  door_id SERIAL,
  slide_type CHARACTER VARYING NOT NULL,
  slide_color CHARACTER VARYING NOT NULL,
  wheels_num INTEGER NOT NULL,
  swing_type CHARACTER VARYING NOT NULL,
  swing_color CHARACTER VARYING NOT NULL,
  opening_side CHARACTER(2) NOT NULL,
  handle_style CHARACTER VARYING NOT NULL,
  CONSTRAINT door_pk PRIMARY KEY (door_id)
);


-- -----------------------------------------------------
-- Table general_retract_control
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS general_retract_control 
(
  general_retract_control_id SERIAL,
  door_type CHARACTER VARYING NOT NULL,
  door_mount CHARACTER VARYING NOT NULL,
  opening_side CHARACTER VARYING NOT NULL,
  fraction CHARACTER VARYING NOT NULL,
  mesh CHARACTER VARYING NOT NULL,
  mohair CHARACTER VARYING NOT NULL,
  mohair_position CHARACTER VARYING NOT NULL,
  top_adapter CHARACTER VARYING NOT NULL,
  build_out CHARACTER VARYING NOT NULL,
  btm_adapter CHARACTER VARYING NOT NULL,
  btm_adapter_color CHARACTER VARYING NOT NULL,
  CONSTRAINT grc_pk PRIMARY KEY (general_retract_control_id)
);


-- -----------------------------------------------------
-- Table hale_door
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS hale_door 
(
  hale_door_id SERIAL,
  size CHARACTER VARYING NOT NULL,
  flap_config CHARACTER VARYING NOT NULL,
  door_color CHARACTER VARYING NOT NULL,
  sec_cover_load CHARACTER VARYING NOT NULL,
  second_ext_cover CHARACTER(1) NOT NULL,
  rain_cap CHARACTER(1) NOT NULL,
  flap CHARACTER(1) NOT NULL,
  thickness CHARACTER VARYING NOT NULL,
  CONSTRAINT hale_door_pk PRIMARY KEY (hale_door_id)
);


-- -----------------------------------------------------
-- Table hale_screen_model
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS hale_screen_model 
(
  hale_screen_model_id SERIAL,
  model_size CHARACTER VARYING NOT NULL,
  model_color CHARACTER VARYING NOT NULL,
  model_thickness CHARACTER VARYING NOT NULL,
  model_has_flap CHARACTER(2) NOT NULL,
  model_placement CHARACTER VARYING NOT NULL,
  CONSTRAINT hale_screen_model_pk PRIMARY KEY (hale_screen_model_id)
);


-- -----------------------------------------------------
-- Table mirage
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage 
(
  mirage_id SERIAL,
  mirage_build_out CHARACTER VARYING NOT NULL,
  CONSTRAINT mirage_pk PRIMARY KEY (mirage_id)
);


-- -----------------------------------------------------
-- Table mirage_3500
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mirage_3500 
(
  mirage_3500_id SERIAL,
  mirage_3500_handle CHARACTER VARYING NOT NULL,
  CONSTRAINT mirage_3500_pk PRIMARY KEY (mirage_3500_id)
);


-- -----------------------------------------------------
-- Table color
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS color 
(
  color_id SERIAL,
  color_name CHARACTER VARYING NOT NULL,
  CONSTRAINT color_pk PRIMARY KEY (color_id)
);


-- -----------------------------------------------------
-- Table frame_size
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS frame_size 
(
  frame_size_id SERIAL,
  size_type CHARACTER VARYING NOT NULL,
  CONSTRAINT frame_size_pk PRIMARY KEY (frame_size_id)
);


-- -----------------------------------------------------
-- Table fastener
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS fastener 
(
  fastener_id SERIAL,
  fastener_type CHARACTER VARYING NOT NULL,
  CONSTRAINT fastener_pk PRIMARY KEY (fastener_id)
);


-- -----------------------------------------------------
-- Table mesh
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS mesh 
(
  mesh_id SERIAL,
  mesh_type CHARACTER VARYING NOT NULL,
  CONSTRAINT mesh_pk PRIMARY KEY (mesh_id)
);


-- -----------------------------------------------------
-- Table new_window_screen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS new_window_screen 
(
  nws_id SERIAL,
  est_width_inch CHARACTER VARYING NOT NULL,
  act_width_inch CHARACTER VARYING NOT NULL,
  est_height_inch CHARACTER VARYING NOT NULL,
  act_height_inch CHARACTER VARYING NOT NULL,
  est_tab_spring CHARACTER VARYING NOT NULL,
  act_tab_spring CHARACTER VARYING NOT NULL,
  est_width_fraction CHARACTER,
  act_width_fraction CHARACTER,
  est_width_plus_minus CHARACTER,
  act_width_plus_minus CHARACTER,
  est_height_fraction CHARACTER,
  act_height_fraction CHARACTER,
  est_height_plus_minus CHARACTER,
  act_height_plus_minus CHARACTER,
  CONSTRAINT nws_pk PRIMARY KEY (nws_id)
);


-- -----------------------------------------------------
-- Table phantom
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS phantom 
(
  phantom_id SERIAL,
  phantom_color CHARACTER VARYING NOT NULL,
  phantom_build_out CHARACTER VARYING NOT NULL DEFAULT 'None',
  meshlock CHARACTER(1) NOT NULL,
  phantom_mesh CHARACTER VARYING(200) NOT NULL,
  meshlock_mesh CHARACTER VARYING(100) NOT NULL,
  type_of_screen CHARACTER VARYING(60) NOT NULL,
  screen_color CHARACTER VARYING NOT NULL,
  wood_type CHARACTER VARYING NOT NULL,
  mount CHARACTER VARYING NOT NULL,
  hembar CHARACTER VARYING NOT NULL,
  tracks CHARACTER VARYING NOT NULL,
  mesh CHARACTER VARYING NOT NULL,
  CONSTRAINT phantom_pk PRIMARY KEY (phantom_id)
);

-- -----------------------------------------------------
-- Table placement
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS placement
(
  placement_id SERIAL,
  est_placement CHARACTER VARYING NULL DEFAULT NULL,
  act_placement CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT placement_pk PRIMARY KEY (placement_id)
);

-- -----------------------------------------------------
-- Table housing_series
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS housing_series
(
  housing_series_id SERIAL,
  est_housing_series CHARACTER VARYING NULL DEFAULT NULL,
  act_housing_series CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT housing_series_pk PRIMARY KEY (housing_series_id)
);

-- -----------------------------------------------------
-- Table drive_side
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS drive_side
(
  drive_side_id SERIAL,
  est_drive_side CHARACTER VARYING NULL DEFAULT NULL,
  act_drive_side CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT drive_side_pk PRIMARY KEY (drive_side_id)
);

-- -----------------------------------------------------
-- Table hembar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS hembar
(
  hembar_id SERIAL,
  est_hembar CHARACTER VARYING NULL DEFAULT NULL,
  act_hembar CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT hembar_pk PRIMARY KEY (hembar_id)
);

-- -----------------------------------------------------
-- Table pilebrush
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pilebrush
(
  pilebrush_id SERIAL,
  est_pilebrush CHARACTER VARYING NULL DEFAULT NULL,
  act_pilebrush CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT pilebrush_pk PRIMARY KEY (pilebrush_id)
);

-- -----------------------------------------------------
-- Table brush_location
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS brush_location
(
  brush_location_id SERIAL,
  est_brush_location CHARACTER VARYING NULL DEFAULT NULL,
  act_brush_location CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT brush_location_pk PRIMARY KEY (brush_location_id)
);

-- -----------------------------------------------------
-- Table cord_length
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cord_length
(
  cord_length_id SERIAL,
  est_cord_length CHARACTER VARYING NULL DEFAULT NULL,
  act_cord_length CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT cord_length_pk PRIMARY KEY (cord_length_id)
);

-- -----------------------------------------------------
-- Table mount_type
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mount_type
(
  mount_type_id SERIAL,
  est_mount_type CHARACTER VARYING NULL DEFAULT NULL,
  act_mount_type CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT mount_type_pk PRIMARY KEY (mount_type_id)
);

-- -----------------------------------------------------
-- Table top_opening
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS top_opening
(
  top_opening_id SERIAL,
  est_top_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  act_top_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  act_top_level CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT top_opening_pk PRIMARY KEY (top_opening_id)
);

-- -----------------------------------------------------
-- Table buildout
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS buildout
(
  buildout_id SERIAL,
  est_left_buildout CHARACTER VARYING NULL DEFAULT NULL,
  act_left_buildout CHARACTER VARYING NULL DEFAULT NULL,
  est_right_buildout CHARACTER VARYING NULL DEFAULT NULL,
  act_right_buildout CHARACTER VARYING NULL DEFAULT NULL,
  est_add_buildout CHARACTER VARYING NULL DEFAULT NULL,
  act_add_buildout CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT buildout_pk PRIMARY KEY (buildout_id)
);

-- -----------------------------------------------------
-- Table track
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS track
(
  track_id SERIAL,
  est_left_track CHARACTER VARYING NULL DEFAULT NULL,
  act_left_track CHARACTER VARYING NULL DEFAULT NULL,
  est_right_track CHARACTER VARYING NULL DEFAULT NULL,
  act_right_track CHARACTER VARYING NULL DEFAULT NULL,
  CONSTRAINT track_pk PRIMARY KEY (track_id)
);


-- -----------------------------------------------------
-- Table rainier
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS rainier 
(
  rainier_id SERIAL,
  act_bottom_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  act_bottom_level CHARACTER VARYING NULL DEFAULT NULL,
  act_left_opening_height CHARACTER VARYING NULL DEFAULT NULL,
  act_left_plumb CHARACTER VARYING NULL DEFAULT NULL,
  act_right_opening_height CHARACTER VARYING NULL DEFAULT NULL,
  act_right_plumb CHARACTER VARYING NULL DEFAULT NULL,
  act_starting_point CHARACTER VARYING NULL DEFAULT NULL,
  placement_id INTEGER NOT NULL,
  housing_series_id INTEGER NOT NULL,
  drive_side_id INTEGER NOT NULL,
  hembar_id INTEGER NOT NULL,
  pilebrush_id INTEGER NOT NULL,
  brush_location_id INTEGER NOT NULL,
  cord_length_id INTEGER NOT NULL,
  mount_type_id INTEGER NOT NULL,
  top_opening_id INTEGER NOT NULL,
  buildout_id INTEGER NOT NULL,
  track_id INTEGER NOT NULL,
  
  CONSTRAINT rainier_pk PRIMARY KEY (rainier_id),
  CONSTRAINT rainier_fk1
    FOREIGN KEY (placement_id)
    REFERENCES placement (placement_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk2
    FOREIGN KEY (housing_series_id)
    REFERENCES housing_series (housing_series_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk3
    FOREIGN KEY (drive_side_id)
    REFERENCES drive_side (drive_side_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk4
    FOREIGN KEY (hembar_id)
    REFERENCES hembar (hembar_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk5
    FOREIGN KEY (pilebrush_id)
    REFERENCES pilebrush (pilebrush_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk6
    FOREIGN KEY (brush_location_id)
    REFERENCES brush_location (brush_location_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk7
    FOREIGN KEY (cord_length_id)
    REFERENCES cord_length (cord_length_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk8
    FOREIGN KEY (mount_type_id)
    REFERENCES mount_type (mount_type_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk9
    FOREIGN KEY (top_opening_id)
    REFERENCES top_opening (top_opening_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk10
    FOREIGN KEY (buildout_id)
    REFERENCES buildout (buildout_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT rainier_fk11
    FOREIGN KEY (track_id)
    REFERENCES track (track_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
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

CREATE TABLE IF NOT EXISTS viewguard 
(
  viewguard_id SERIAL,
  handle_color CHARACTER VARYING(10) NOT NULL,
  door_type CHARACTER VARYING(10) NOT NULL,
  number_of_slides INTEGER NOT NULL,
  color CHARACTER VARYING(10) NOT NULL,
  handle_style CHARACTER VARYING NOT NULL,
  deadbolt CHARACTER VARYING NOT NULL,
  CONSTRAINT viewguard_pk PRIMARY KEY (viewguard_id)
);


-- -----------------------------------------------------
-- Table wizard_smart_screen
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS wizard_smart_screen 
(
  wizard_smart_screen_id SERIAL,
  location_on_house CHARACTER VARYING NOT NULL,
  placement CHARACTER VARYING NOT NULL,
  color CHARACTER VARYING NOT NULL,
  fabric_type CHARACTER VARYING NOT NULL,
  housing_size CHARACTER VARYING NOT NULL,
  drive_side CHARACTER VARYING NOT NULL,
  bottom_seal CHARACTER VARYING NOT NULL,
  zipper_color CHARACTER VARYING NOT NULL,
  probe_color CHARACTER VARYING NOT NULL,
  cable_length CHARACTER VARYING NOT NULL,
  top_opening_width CHARACTER VARYING NULL DEFAULT NULL,
  top_level CHARACTER VARYING NOT NULL,
  bottom_opening_width CHARACTER VARYING NOT NULL,
  bottom_level CHARACTER VARYING NOT NULL,
  left_opening_height CHARACTER VARYING NOT NULL,
  left_plump CHARACTER VARYING NOT NULL,
  right_opening_height CHARACTER VARYING NOT NULL,
  right_plump CHARACTER VARYING NOT NULL,
  two_by_two_angle CHARACTER VARYING NOT NULL,
  track_type CHARACTER VARYING NOT NULL,
  track_punched CHARACTER VARYING NOT NULL,
  starting_poINTEGER CHARACTER VARYING NULL DEFAULT NULL,
  order_width CHARACTER VARYING NOT NULL,
  order_height CHARACTER VARYING NOT NULL,
  CONSTRAINT wss_pk PRIMARY KEY (wizard_smart_screen_id)
);


-- -----------------------------------------------------
-- Table measurement
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS measurement 
(
  measurement_id SERIAL,
  measurement_name CHARACTER VARYING NOT NULL,
  CONSTRAINT measurement_pk PRIMARY KEY (measurement_id)
);


-- -----------------------------------------------------
-- Table customization
-- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS customization
  (
    customization_id SERIAL,
    product_id INTEGER NOT NULL,
    measurement_id INTEGER NOT NULL,
    frame_size_id INTEGER NOT NULL,
    fastener_id INTEGER NOT NULL,
    color_id INTEGER NOT NULL,
    mesh_id INTEGER NOT NULL,
    mirage_3500_id INTEGER NULL,
    mirage_id INTEGER NULL,
    rainier_id INTEGER NULL,
    door_id INTEGER NULL,
    hale_screen_model_id INTEGER NULL,
    phantom_id INTEGER NULL,
    wizard_smart_screen_id INTEGER NULL,
    viewguard_id INTEGER NULL,
    sunscreen_id INTEGER NULL,
    hale_door_id INTEGER NULL,
    general_retract_control_id INTEGER NULL,
    nws_id INTEGER NULL,
    CONSTRAINT customization_pk PRIMARY KEY (customization_id),
    CONSTRAINT customization_fk1
    FOREIGN KEY (product_id)
    REFERENCES product (product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk2
    FOREIGN KEY (measurement_id)
    REFERENCES measurement (measurement_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk3
    FOREIGN KEY (frame_size_id)
    REFERENCES frame_size (frame_size_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk4
    FOREIGN KEY (fastener_id)
    REFERENCES fastener (fastener_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk5
    FOREIGN KEY (color_id)
    REFERENCES color (color_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk6
    FOREIGN KEY (mesh_id)
    REFERENCES mesh (mesh_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk7
    FOREIGN KEY (mirage_3500_id)
    REFERENCES mirage_3500 (mirage_3500_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk8
    FOREIGN KEY (mirage_id)
    REFERENCES mirage (mirage_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk9
    FOREIGN KEY (rainier_id)
    REFERENCES rainier (rainier_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk10
    FOREIGN KEY (door_id)
    REFERENCES door (door_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk11
    FOREIGN KEY (hale_screen_model_id)
    REFERENCES hale_screen_model (hale_screen_model_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk12
    FOREIGN KEY (phantom_id)
    REFERENCES phantom (phantom_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk13
    FOREIGN KEY (wizard_smart_screen_id)
    REFERENCES wizard_smart_screen (wizard_smart_screen_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk14
    FOREIGN KEY (viewguard_id)
    REFERENCES viewguard (viewguard_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk15
    FOREIGN KEY (hale_door_id)
    REFERENCES hale_door (hale_door_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk16
    FOREIGN KEY (general_retract_control_id)
    REFERENCES general_retract_control (general_retract_control_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT customization_fk17
    FOREIGN KEY (nws_id)
    REFERENCES new_window_screen (nws_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );

