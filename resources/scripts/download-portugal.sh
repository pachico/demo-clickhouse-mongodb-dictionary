#!/bin/bash

echo "Downloading file from geonames..."
curl http://download.geonames.org/export/dump/PT.zip --output /tmp/PT.zip
echo "decompressing..."
cd /tmp/ && unzip -o /tmp/PT.zip
echo "Importing in MongoDB..."
mongoimport --db=geonames --collection=portugal --file=/tmp/PT.txt \
    --mode=upsert --type=tsv \
    --fields=_id,name,asciiname,alternatenames,latitude,longitude,feature_class,feature_code,country_code,cc2,admin1_code,admin2_code,admin3_code,admin4_code,population,elevation,dem,timezone,modification_date