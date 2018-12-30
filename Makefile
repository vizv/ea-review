.PHONY: all test clean up down

PROJNAME := ea-review

all: images/ui.tar images/api.tar

images/%.tar: $(wildcard docker/$(basename $(notdir $@))/**) \
              $(wildcard $(basename $(notdir $@))/**)
	mkdir -p images
	docker build --tag  $(PROJNAME)-$(basename $(notdir $@)) \
               --file docker/$(basename $(notdir $@))/Dockerfile .
	docker save --output $@ $(PROJNAME)-$(basename $(notdir $@))

test:
	# E2E Testing for UI
	docker build --tag  $(PROJNAME)-ui:e2e-test \
               --file docker/ui/test.Dockerfile .
	docker run $(PROJNAME)-ui:test

clean:
	rm -rf images

up: all
	docker-compose --project-name $(PROJNAME) \
                 --file docker/docker-compose.yml up --detach

down:
	docker-compose --project-name $(PROJNAME) \
                 --file docker/docker-compose.yml down
