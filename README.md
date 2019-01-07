# EA Take-home Testing - Game Review Site [![Build Status](https://travis-ci.com/vizv/ea-review.svg?branch=develop)](https://travis-ci.com/vizv/ea-review)

## Live Demo

https://ea-review-demo.viz.software/posts

## Deployment Guide

### Requirements

#### Build-time

- Docker (>= 17.12.0, recommended: 18.09.0)
- Docker Compose (>= 1.21.0, recommended: 1.23.1)
- GNU Make

#### Run-time

- Docker (>= 17.12.0)

### Running in local machine

Just run with `make up`.

### Build the Docker images and run on another host

1. run `make`
2. copy generated images from `images` directory to the remote host
3. use `docker load` to load these images
4. run both containers within the same Docker network

### Pull from Docker Hub

You may pull images from [vizv/ea-review](https://cloud.docker.com/repository/docker/vizv/ea-review)

* Use tag `ui-latest` or `ui-{tagref}` (such as `ui-1.0.0`) for front-end
* Use tag `api-latest` or `api-{tagref}` (such as `api-1.0.0`) for back-end

### Note

* Source for front-end can be found in `ui` directory
* Source for back-end can be found in `api` directory
* All Docker-related files (Dockerfile, Docker Compose file, and other supported files) can be found in `docker` directory
* As requested, a in-memory database (SQLite) will start along with the API server, and fake data will be generated for demo purpose.

## Acceptance Criteria

- [X] ~~A blog post will show a title, article text (plain text) and an author name~~
- [X] ~~Comments are made on blog posts and show comment text (plain text) and an author name~~

## Non-functional Requirements

- [X] ~~The code should be production ready and could be supported by a team~~
- [X] ~~The application must have a build system~~
  - [X] ~~The application build should be built or compiled in a docker container~~
  - [X] ~~The application build should produce a docker container image as an artifact~~
  - [X] ~~The application should not have any runtime dependencies~~

## Testing

Just run `make test`.

Note: only E2E testing is currectly available.

## Tasks

### Stage 0 - Preparation

- [X] ~~Clarify requirements~~
- [X] ~~Define data schema~~
- [X] ~~Design API for the Stage 1~~
- [X] ~~Skeleton for front-end and back-end~~

### Stage 1 - MVP

- [X] ~~Feature: post display~~
  - [X] ~~View for post display with mocked data~~
  - [X] ~~Endpoint for post display with mocked data~~
  - [X] ~~Integration of post display~~
- [X] ~~Feature: post listing~~
  - [X] ~~View for post listing with mocked data~~
  - [X] ~~Endpoint for post listing with mocked data~~
  - [X] ~~Integration of post listing~~
- [X] ~~Database integration & mocking~~
- [X] ~~E2E testing~~
- [ ] Update data schema for the Stage 2
- [ ] Design API for the Stage 2

### Stage 2 - Improvements

- [ ] Feature: post listing & authorization
  - [ ] Authentication integration
  - [ ] View for login
  - [ ] Endpoint for login
  - [ ] Authorization integration
- [ ] Feature: post creation
  - [ ] View for post creation
  - [ ] Endpoint for post creation
- [ ] Feature: post editing
  - [ ] View for post editing
  - [ ] Endpoint for post editing
- [ ] Feature: comment creation
  - [ ] View for comment creation
  - [ ] Endpoint for comment creation
- [ ] Feature: comment editing
  - [ ] View for comment editing
  - [ ] Endpoint for comment editing
- [ ] Feature: comment deletion
- [ ] Feature: post deletion
- [ ] Design API for the Stage 3

### Stage 3 - Bonus

- [ ] Feature: registration
  - [ ] View for registration
  - [ ] Endpoint for registration
- [ ] Unit tests
- [ ] Code Coverage
- [ ] Integration Test
- [ ] Continuous Deployment
