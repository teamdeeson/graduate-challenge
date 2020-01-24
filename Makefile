# Makefile for makedocs documentation

clean:
	rm -rf site

build:
	docker run -it --rm -v ${PWD}:/docs --name mkdocs-build teamdeeson/mkdocs:latest build --clean
	@echo
	@echo "Build finished. The HTML pages are in the site directory"

start:
	docker run -it --rm -p 80:8000 -v ${PWD}:/docs --name mkdocs-serve teamdeeson/mkdocs:latest
	@echo
	@echo "Site would be available at https://localhost"

deploy:
	/opt/ci-tools/deployer.sh
