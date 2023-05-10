lint: ## Should be implemented and should fail when the linter catches and error
	golangci-lint run

build: ## compile the source code of the application to a binary named awesome-api
	golangci-lint run
	go build

run: ## Run the application in background by executing the binary awesome-api, and write logs into a file named awesome-api.log
	./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stop the application with the command kill XXXXX where XXXXX is the Process ID of the application.
	pkill awesome-api || true

clean: ## Stop the application. Delete the binary awesome-api and the log file awesome-api.log
	pkill awesome-api || true
	rm awesome-api awesome-api.log

test: ## ou want to test it to ensure that it behaves as expected
	go test -v -short -coverprofile=coverage-units.out
	go test -v -coverprofile=coverage-integrations.out

unit-tests: ## should be implemented and should execute (successfully) the Golang unit tests
	go test -v -short -coverprofile=coverage-units.out

integration-tests: ## should be implemented and should execute (successfully) the Golang integration tests
	go test -v -coverprofile=coverage-integrations.out

help: ## Prints out the list of targets and their usage
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
