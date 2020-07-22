CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL,
  "last_name" text,
  "cpf" text NOT NULL,
  "phone" text,
  "city" text
);

CREATE TABLE "agencies" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL,
  "phone" text
);

CREATE TABLE "addresses" (
  "id" SERIAL PRIMARY KEY,
  "street" text NOT NULL,
  "number" int,
  "neighborhood" text NOT NULL,
  "city" text NOT NULL,
  "agencie_id" int UNIQUE
);

CREATE TABLE "cars" (
  "id" SERIAL PRIMARY KEY,
  "license_plate" text NOT NULL,
  "color" text,
  "ports" int
);

CREATE TABLE "models" (
  "id" SERIAL PRIMARY KEY,
  "brand" text NOT NULL,
  "model" text NOT NULL,
  "year" int NOT NULL,
  "cars_id" int UNIQUE
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "price" int,
  "customers_id" int UNIQUE,
  "agencie_id" int UNIQUE
);

CREATE TABLE "cars_orders" (
  "id" SERIAL PRIMARY KEY,
  "cars_id" [unique],
  "orders_id" int UNIQUE
);

ALTER TABLE "agencies" ADD FOREIGN KEY ("id") REFERENCES "addresses" ("agencie_id");

ALTER TABLE "models" ADD FOREIGN KEY ("cars_id") REFERENCES "cars" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customers_id") REFERENCES "customers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("agencie_id") REFERENCES "agencies" ("id");

COMMENT ON TABLE "customers" IS 'RentCar clients';

COMMENT ON TABLE "agencies" IS 'Car rental agencies';

COMMENT ON TABLE "addresses" IS 'Agencies addresses';

COMMENT ON TABLE "cars" IS 'Specific cars informations';

COMMENT ON TABLE "models" IS 'General cars informations (model, brand, etc)';

COMMENT ON TABLE "orders" IS 'rental orders';

COMMENT ON TABLE "cars_orders" IS 'Cars orders';
