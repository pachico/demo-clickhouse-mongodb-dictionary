CREATE DATABASE IF NOT EXISTS geonames;

USE geonames;

CREATE DICTIONARY portugal
(
    _id UInt32,
    name String,
    feature_class String,
    feature_code String,
    latitude Float32,
    longitude Float32
)
PRIMARY KEY _id
SOURCE(MONGODB(
    host 'mongo'
    port 27017
    user ''
    password ''
    db 'geonames'
    collection 'portugal'
))
LAYOUT(DIRECT());