# Testing in the Software Development Methodology

## Prerequisites
* Golang in v1.15.*
* NPM v7+ with NodeJS v14.* (stable)
* Python 3 with pip module
* golangci-lint

## Lifecycle
* lint: Should be implemented and should fail when the linter catches and error.
* build: Compile the source code of the application to a binary named awesome-api.
* run: Run the application in background by executing the binary awesome-api, and write logs into a file named awesome-api.log.
* stop: Stop the application with the command kill XXXXX where XXXXX is the Process ID of the application.
* clean: Stop the application. Delete the binary awesome-api and the log file awesome-api.log.
* test: You want to test it to ensure that it behaves as expected.
* unit-tests: Should be implemented and should execute (successfully) the Golang unit tests
* integration-tests: Should be implemented and should execute (successfully) the Golang integration tests.
* help: Prints out the list of targets and their usage.
