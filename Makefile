.PHONY: freeze

freeze:
	pip freeze | grep -v "pkg-resources" > requirements.txt
	@# https://github.com/pypa/pip/issues/4022
	@# -> https://bugs.launchpad.net/ubuntu/+source/python-pip/+bug/1635463

