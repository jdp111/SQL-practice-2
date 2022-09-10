
CREATE TABLE "regions" (
    "id" SERIAL PRIMARY KEY, 
    "region_name" text   NOT NULL
);

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "username" text   NOT NULL,
    "user_region" int REFERENCES regions(id)
);

CREATE TABLE "categories" (
    "id" SERIAL PRIMARY KEY,
    "cat_name" text   NOT NULL
);

CREATE TABLE "posts" (
    "id" SERIAL PRIMARY KEY,
    "title" text   NOT NULL,
    "summary" text   NOT NULL,
    "user_id" int REFERENCES users(id),
    "region_id" int REFERENCES regions(id),
    "category_id" int REFERENCES categories(id)
);

