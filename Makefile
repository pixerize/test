install:
	pip install -r requirements.txt
	bundle install

build: build.data build.site

build.data:
	python scripts/build_data.py

build.site:
	bundle exec jekyll build --config=config_site.yml

serve:
	bundle exec jekyll serve --config=config_site.yml --skip-initial-build

test: test.data test.site

test.data:
	python scripts/check_data.py

test.site: build
	sh scripts/check_site.sh
