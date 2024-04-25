#########
# Tasks #
#########

# Setup the local development environment with expo and detox
#
#   make dev/setup
#
dev/setup:
    npm i
	npm install detox-cli --global
	brew tap wix/brew
	brew install applesimutils


# Prints the list of targets from this file
.PHONY: help test
help:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

###############
# Definitions #
###############

PROJECT_NAME ?= justeats
PYTHON ?= python
PYTHON_MAJOR_VERSION ?= 3.9
PYTHON_MINOR_VERSION ?= 9
PYTHON_VERSION ?= $(PYTHON_MAJOR_VERSION).$(PYTHON_MINOR_VERSION)
PYTHON_VENV ?= `pyenv root`/versions/$(PROJECT_NAME)-$(PYTHON_VERSION)
PYTHON_BIN ?= $(PYTHON_VENV)/bin

DB_USER ?= postgres
DB_PASSWORD ?= postgres
DB_HOST ?= localhost
DB_PORT ?= 5432
DB_NAME ?= justeats
MIGRATE_DB_URL := postgresql://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/$(DB_NAME)
TEST_MIGRATE_DB_URL := postgresql://postgres:postgres@localhost:5432/justeats

LAYERS_PATH := layers
DEPENDENCY_LAYER_PATH := $(LAYERS_PATH)/dependenciesLayer
PYTHON_DEPENDENCY_PATH := python/lib/python$(PYTHON_MAJOR_VERSION)/site-packages
PYTHON_SITE_PACKAGES_PATH := $(DEPENDENCY_LAYER_PATH)/$(PYTHON_DEPENDENCY_PATH)
