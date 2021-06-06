.PHONY: help
help: ## Print this help message and exit
	@echo Usage:
	@echo "  make [target]"
	@echo
	@echo Targets:
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "  %-30s %s\n", $$1, $$NF \
		 }' $(MAKEFILE_LIST)

.PHONY: bd
bd: ## Build the docker service
	@docker-compose \
		-f devstack/docker-compose.yml \
		build --force-rm jira-resolver

.PHONY: run
run: ## Run the service in the foreground
	@docker-compose \
		-f devstack/docker-compose.yml \
		run --rm jira-resolver

.PHONY: run-d
run-d: ## Run the service in detached mode (background)
	@docker-compose \
		-f devstack/docker-compose.yml \
		run --rm -d jira-resolver

.PHONY: teardown
teardown: ## Teardown the docker service
	@docker-compose \
		-f devstack/docker-compose.yml \
		down --rmi all

.PHONY: rebuild
rebuild: ## Teardown then Build
	@make teardown && make build

.PHONY: activate
activate: ## Teardown, build, run, then teardown again
	@make teardown ; (make build && make run) ; make teardown
