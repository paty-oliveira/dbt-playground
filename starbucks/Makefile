SCRIPT_VENV = ./scripts/python_venv.sh
SCRIPT_DBT = ./scripts/dbt.sh
DBT_PROFILES_DIR = ~/.dbt
DBT_ARTIFACTS_FOLDER = ./target

# Help command to display available targets
help:
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create-venv: ## Create a Python virtual environment
	@echo "Creating Python virtual environment..."
	@$(SCRIPT_VENV) create_venv

check-venv: ## Check if the Python virtual environment is active
	@echo "Checking your Python virtual environment..."
	@$(SCRIPT_VENV) check_venv

install-dependencies: ## Install Python dependencies
	@echo "Installing dependencies..."
	@$(SCRIPT_VENV) install_dependencies

setup-postgres-db: ## Set up PostgreSQL using Docker Compose
	@echo "Running Docker Compose..."
	@docker-compose up

stop-postgres-db: ## Stop PostgreSQL using Docker Compose
	@echo "Stopping Docker Compose..."
	@docker-compose down

dbt-debug: ## Debug dbt configuration
	@echo "Running dbt debug..."
	@dbt debug --profiles-dir ${DBT_PROFILES_DIR}

dbt-deps: ## Install dbt dependencies
	@echo "Installing dbt dependencies..."
	@dbt deps

dbt-clean: ## Clean dbt artifacts
	@echo "Cleaning dbt artifacts..."
	@dbt clean

dbt-compile: ## Compile models for the entire project
	@echo "Compiling models for the entire project..."
	@dbt compile

dbt-compile-modified-models: ## Compile only modified models
	@echo "Compiling modified models..."
	@dbt compile --select state:modified --state ${DBT_ARTIFACTS_FOLDER}

dbt-seed: ## Load seed data into the data warehouse
	@echo "Loading seed data..."
	@dbt seed

dbt-run: ## Run models for the entire project
	@echo "Running models for the entire project..."
	@dbt run

dbt-run-modified-models: ## Run only modified models
	@echo "Building modified models..."
	@dbt run --select state:modified --state ${DBT_ARTIFACTS_FOLDER}

dbt-test: ## Run tests for the entire project
	@echo "Running tests for the entire project..."
	@dbt test

dbt-test-modified-models: ## Run tests for modified models
	@echo "Running tests for modified models..."
	@dbt test --select state:modified --state ${DBT_ARTIFACTS_FOLDER}

dbt-generate-docs: ## Generate and serve dbt documentation
	@echo "Generating project's documentation..."
	@dbt docs generate
	@dbt docs serve --port 8081

run-all: dbt-deps dbt-seed dbt-run dbt-test ## Build entire dbt project
