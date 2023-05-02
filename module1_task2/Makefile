default: help
.PHONY: help
help: ##Displays information for each makefile commands
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: build
build: ##Generate the website from the markdown and configuration files in the directory dist/
	hugo 

.PHONY: clean
clean: ##Cleanup the content of the directory dist/
	rm -rf dist/*

.PHONY: post
post: ##Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title:"$(POST_TITLE)"/' content/posts/$(POST_NAME).md
