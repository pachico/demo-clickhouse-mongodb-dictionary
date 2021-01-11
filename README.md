# Demo ClickHouse: MongoDB as external dictionary source

Simple demo to show how use MongoDB as external source for ClickHouse dictionaries.
It uses GeoNames as gazetteer.

## Requirements

- `docker-compose`
- `make` (if you want to use it to easily run it, otherwise you can always run the commands by hand)

## Run it

The `Makefile` is self documented. Type `make help` to get its content:

```txt
up                             Starts all the containers required run the demo
install-tools                  Install tools required to download data
import-data                    Import data to MongoDB
create-dictionary              Creates dictionary in ClickHouse that has MongoDB as source
query-by-feature-code          Run simple query to confirm all data has been correctly imported
down                           Shuts down all the containers and removes their volume
```

Execute the commands in this order to run the demo.

It also spawns Mongo Express (simple MongoDB GUI). To access it you can open [http://localhost:8081/](http://localhost:8081/)