.PHONY: build
build:
	docker-compose \
		-f devstack/docker-compose.yml \
		build --force-rm jira-resolver

.PHONY: run
run:
	docker-compose \
		-f devstack/docker-compose.yml \
		run --rm jira-resolver


.PHONY: run-d
run-d:
	docker-compose \
		-f devstack/docker-compose.yml \
		run --rm -d jira-resolver


.PHONY: teardown
teardown:
	docker-compose \
		-f devstack/docker-compose.yml \
		down --rmi all

.PHONY: rebuild
rebuild:
	make teardown && make build

.PHONY: activate
activate:
	make teardown ; (make build && make run) ; make teardown
