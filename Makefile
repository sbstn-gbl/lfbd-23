VIRTUALENV?=env
PORT?=8888

help:
	@echo "Make targets:"
	@echo "  build          create virtualenv and install packages"
	@echo "  clean          remove *.pyc files and __pycache__ directory"
	@echo "  run            run jupyter lab (default port $(PORT))"
	@echo "Check the Makefile for more details"

build:
	virtualenv $(VIRTUALENV); \
	source $(VIRTUALENV)/bin/activate; \
	pip install --upgrade pip; \
	pip install -r requirements.txt;

clean:
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -type d | xargs rm -fr
	find . -name '.ipynb_checkpoints' -type d | xargs rm -fr
	rm -rf $(VIRTUALENV)

run:
	source $(VIRTUALENV)/bin/activate; \
	jupyter lab --no-browser --port=$(PORT)
