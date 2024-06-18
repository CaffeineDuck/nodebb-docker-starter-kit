SHELL := /usr/bin/env bash

.DEFAULT_GOAL := help

APP_NAME := nodebb-docker
export APP_ROOT = $(shell pwd)

-include $(APP_ROOT)/env/override.mk

init: # Initialize the app and create env files
	@cp $(APP_ROOT)/env/override.example.mk $(APP_ROOT)/env/override.mk
	@echo "Update the env/override.mk file with your settings."

set-conf: # Create the configuration files from env
	@cat $(APP_ROOT)/templates/mongo-init.template.js | envsubst > $(APP_ROOT)/mongo-init.js
	@cat $(APP_ROOT)/templates/setup.template.json | envsubst > $(APP_ROOT)/setup.json
	@echo "Configuration files created."

