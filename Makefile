.PHONY: lint
lint:
	@flake8 tap_fabdb/ --count --statistics
	@black tap_fabdb/ --check
	@mypy tap_fabdb/ --ignore-missing-imports

.PHONY: test
test: lint
	@pytest --cov-report=term-missing --cov-report=xml --cov=tap_fabdb tap_fabdb/tests/ -vvv

.PHONY: fmt
fmt:
	@black tap_fabdb/
	@isort tap_fabdb/

.PHONY: clean
clean:
	@rm -rf dist/
	@rm -rf build/
	@rm -rf .mypy_cache/
	@rm -rf .pytest_cache/ **/__pycache__/
	@rm -f coverage.xml