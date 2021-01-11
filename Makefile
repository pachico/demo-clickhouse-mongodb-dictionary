.PHONY: help

help:
	@grep -E '^[a-zA-Z1-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Starts all the containers required run the demo
	docker-compose up -d

install-tools: ## Install tools required to download data
	docker-compose exec mongo bash -c "/opt/resources/scripts/install-tools.sh"

import-data: ## Import data to MongoDB
	docker-compose exec mongo bash -c "/opt/resources/scripts/download-portugal.sh"

create-dictionary: ## Creates dictionary in ClickHouse that has MongoDB as source
	docker-compose exec clickhouse bash -c "cat /opt/queries/create-dictionary.sql | clickhouse-client -m -n"

query-by-feature-code: ## Run simple query to confirm all data has been correctly imported
	docker-compose exec clickhouse bash -c "clickhouse-client --query=\"SELECT count() AS count, feature_class AS class FROM geonames.portugal GROUP BY feature_class ORDER BY count DESC FORMAT PrettyCompactMonoBlock\""

down: ## Shuts down all the containers and removes their volume
	docker-compose down --volumes --remove-orphans
