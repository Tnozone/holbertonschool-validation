GO=go
TARGET=awesome-api
RM=rm -rf
MAKE=make
COVERAGE=coverage
HUGO=hugo
DOCKER_OPTIONS=--rm --tty --volume=`pwd`:/app --workdir=/app
DOCKER=docker run $(DOCKER_OPTIONS)
DOCKER_IMAGE=golang:1.15.8-buster
DOCKER_IMAGE_BUILD_NAME=awesome:build

build:	## Generate the source code of the application to a binary.
	$(MAKE) lint
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) $(GO) mod tidy
	$(MAKE) check
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) $(HUGO)
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) $(GO) build -o $(TARGET)

run:	## Run the application in background by executing the binary.
	./$(TARGET) >./$(TARGET).log 2>&1 &

post:	## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

stop:	## Stop the application.
	@pkill $(TARGET)

clean:	## Stop the application. Delete the binary and the log file.
	@if pgrep -x $(TARGET) > /dev/null; then \
		pkill $(TARGET); \
	fi
	@$(RM) $(TARGET) $(TARGET).log $(COVERAGE)-units.out $(COVERAGE)-integrations.out dist/ *~

test:	## Test the application.
	$(MAKE) unit-tests
	$(MAKE) integration-tests

unit-tests: ## Run unit tests
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) sh -c "$(GO) test -v -short -coverprofile=$(COVERAGE)-units.out"

integration-tests: ## Run integration tests
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) sh -c "$(GO) test -v -coverprofile=$(COVERAGE)-integrations.out"

lint:	## Lint go lang code
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) golangci-lint run
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) markdownlint DEPLOY.md

check:	## Lint markdonw source, check dead links
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) markdownlint content/**/*.md
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) sh -c "find content -name \*.md -print0 | xargs -0 -n1 markdown-link-check"

package:   ## Produces a file awesome-website.zip, containing the binary awesome-api and the directory dist/ directory
	zip -r awesome-website.zip awesome-api dist

build-docker: ## Build docker images for the project
	docker build -t $(DOCKER_IMAGE_BUILD_NAME) ./.build

help:	## Show this help usage.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
