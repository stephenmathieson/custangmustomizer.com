
BINS = node_modules/.bin
JS = $(wildcard lib/*/*.js)
CSS = $(wildcard lib/*/*.css)
META = component.json $(wildcard lib/*/component.json)

BUILD_FLAGS ?= --use plugin
INSTALL_FLAGS ?=

all: node_modules index.html build

minify: all
	@$(BINS)/uglifyjs build/build.js -o build/build.js
	@$(BINS)/cleancss build/build.css -o build/build.css

build: node_modules
build: components
build: $(META)
build: $(JS)
build: $(CSS)
	@$(BINS)/component-build $(BUILD_FLAGS)

components: $(META)
	@$(BINS)/component-install $(INSTALL_FLAGS)

%.html: %.jade
	@$(BINS)/jade $^

node_modules: package.json
	@npm install

clean:
	rm -rf *.html components build

.PHONY: build clean minify all
