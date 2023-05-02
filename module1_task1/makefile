.PHONY: build
build:
	hugo 

.PHONY: clean
clean:
	rm -rf dist/*

.PHONY: post
post:
	hugo new post/$(POST_NAME).md
	sed -i 's/title: .*/title:"$(POST_TITLE)"/' content/posts/$(POST_NAME).md
