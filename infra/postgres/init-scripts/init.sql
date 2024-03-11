CREATE USER tcs_route_user PASSWORD 'secure';
CREATE DATABASE tcs_route;
GRANT ALL PRIVILEGES ON DATABASE tcs_route TO tcs_route_user;
GRANT ALL PRIVILEGES ON DATABASE tcs_route TO postgres;


CREATE USER tcs_trip_user PASSWORD 'secure';
CREATE DATABASE tcs_trip;
GRANT ALL PRIVILEGES ON DATABASE tcs_trip TO tcs_trip_user;
GRANT ALL PRIVILEGES ON DATABASE tcs_trip TO postgres;


CREATE USER tcs_trip_creator_user PASSWORD 'secure';
CREATE DATABASE tcs_trip_creator;
GRANT ALL PRIVILEGES ON DATABASE tcs_trip_creator TO tcs_trip_creator_user;
GRANT ALL PRIVILEGES ON DATABASE tcs_trip_creator TO postgres;

CREATE USER tcs_user_facade_user PASSWORD 'secure';
CREATE DATABASE tcs_user_facade;
GRANT ALL PRIVILEGES ON DATABASE tcs_user_facade_user TO tcs_trip_creator_user;
GRANT ALL PRIVILEGES ON DATABASE tcs_user_facade TO postgres;