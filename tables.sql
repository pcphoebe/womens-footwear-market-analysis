CREATE TABLE items (
	item_id varchar(25),
	item_name varchar(500) NOT NULL,
	price float NOT NULL,
	PRIMARY KEY (item_id)
);

CREATE TABLE size(
	size_id varchar(25),
	size_name numeric(2,0) NOT NULL,
	PRIMARY KEY(size_id)
);

CREATE TABLE item_size(
	item_id varchar(25),
	size_id varchar(25),
	PRIMARY KEY(item_id, size_id),
	FOREIGN KEY(item_id) REFERENCES items(item_id),
	FOREIGN KEY(size_id) REFERENCES size(size_id)
);

CREATE TABLE brand(
	brand_id varchar(25),
	brand_name varchar(25) NOT NULL,
	PRIMARY KEY(brand_id)
);

CREATE TABLE item_brand(
	item_id varchar(25),
	brand_id varchar(25),
	PRIMARY KEY(item_id, brand_id),
	FOREIGN KEY(item_id) REFERENCES items(item_id),
	FOREIGN KEY(brand_id) REFERENCES brand(brand_id)
);

CREATE TABLE categories(
	category_id varchar(25),
	category_name varchar(10) NOT NULL,
	PRIMARY KEY(category_id),
	CHECK (category_name IN ('Slippers', 'Party & Occasions', 'Premium Shoes', 'Boots', 'Sandals', 'Casual Shoes', 'Athletic', 'Flats'))
);

CREATE TABLE item_category(
	item_id varchar(25),
	category_id varchar(25),
	PRIMARY KEY(item_id, category_id),
	FOREIGN KEY(item_id) REFERENCES items(item_id),
	FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

CREATE TABLE color(
	color_id varchar(25),
	color_name varchar(10) NOT NULL,
	PRIMARY KEY(color_id)
);

CREATE TABLE item_color(
	item_id varchar(25),
	color_id varchar(25),
	PRIMARY KEY(item_id, color_id),
	FOREIGN KEY(item_id) REFERENCES items(item_id),
	FOREIGN KEY(color_id) REFERENCES color(color_id)
);

CREATE TABLE manufacturer(
	manufacturer_id varchar(25),
	manufacturer_name varchar(25) NOT NULL,
	PRIMARY KEY(manufacturer_id)
);

CREATE TABLE item_manufacturer(
	item_id varchar(25),
	manufacturer_id varchar(25),
	PRIMARY KEY(item_id, manufacturer_id),
	FOREIGN KEY(item_id) REFERENCES items(item_id),
	FOREIGN KEY(manufacturer_id) REFERENCES manufacturer(manufacturer_id)
);

CREATE TABLE prices_offer(
	item_id varchar(25),
	discount_type varchar(10),
	discount_percentage int,
	PRIMARY KEY(item_id, discount_type),
	FOREIGN KEY(item_id) REFERENCES items(item_id)
);

CREATE TABLE item_sources(
	item_id varchar(25),
	URL varchar(MAX) NOT NULL,
	PRIMARY KEY(item_id, URL),
	FOREIGN KEY(item_id) REFERENCES items(item_id)
);

CREATE TABLE item_imageURL(
	item_id varchar(25),
	imageURL varchar(200),
	PRIMARY KEY(item_id, imageURL),
	FOREIGN KEY(item_id) REFERENCES items(item_id)
);

CREATE TABLE item_date(
	item_id varchar(25),
	date_added timestamp,
	date_updated timestamp,
	PRIMARY KEY(item_id, date_added),
	FOREIGN KEY(item_id) REFERENCES items(item_id)
);
