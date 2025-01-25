# Define variables
VENV_DIR = .venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip

# Default target
all: help

# Create virtual environment
$(VENV_DIR):
	python3 -m venv $(VENV_DIR)

# Install dependencies
install: $(VENV_DIR)
	$(PIP) install -r requirements.txt

# Run tests
test: $(VENV_DIR)
	$(PYTHON) -m unittest discover -s tests

# Clean up
clean:
	rm -rf $(VENV_DIR)
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete

# Help
help:
	@echo "Makefile for Python project"
	@echo "Usage:"
	@echo "  make install    - Create virtual environment and install dependencies"
	@echo "  make test       - Run tests"
	@echo "  make clean      - Clean up"
	@echo "  make help       - Show this help message"
