.PHONY: flake test freeze docker

all: flake test freeze docker

python: flake test

flake:
	flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics

test:
	mkdir -p dist
	pytest --doctest-modules --junitxml=junit/test-results.xml --cov=com --cov-report=xml --cov-report=html | tee dist/pytest.log

freeze:
	pip freeze | grep -v "pkg-resources" > requirements.txt
	@# https://github.com/pypa/pip/issues/4022
	@# -> https://bugs.launchpad.net/ubuntu/+source/python-pip/+bug/1635463

docker:
	docker build . -t apprentissage-flask:latest
