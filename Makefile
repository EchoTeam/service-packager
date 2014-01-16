.PHONY: all rpm clean prebuild rpm-upload fpm install

# make file always starts in the current dir
INSTALL_DIR=${CURDIR}

prefix="/usr/local"
epoch=$(shell date +%s)
year=$(shell date +%Y)

vendor="Jacknyfe"
license="Copyright ${year} by Jacknyfe Inc. All Rights Reserved"
url="http://aboutecho.com/"

project_name="echo-service-packager"
project_version=$(shell git describe --always --tags)

commit_hash=$(shell git log -n 1 --format="%H")

rpm: clean prebuild fpm clean

tag:
	@git tag
	@read -p "New tag: " TAG && [ -n "$$TAG" ] && git tag $$TAG
	git push --tags

prebuild:
	mkdir -p bin
	find ./  -maxdepth 1 -executable -type f | xargs -I{} ln -s /usr/local/lib/echo-service-packager/{} bin/{}
	mkdir -p lib/echo-service-packager
	find ./  -maxdepth 1 -executable -type f | xargs -I{} cp {} lib/echo-service-packager
	cp -rvf internals/ rpm/ lib/echo-service-packager

clean:
	rm -rf bin
	rm -rf lib

fpm:
	fpm -s dir \
		-t rpm \
		-a all \
		-d coreutils -d util-linux-ng -d net-tools \
		-d grep -d gawk -d sed -d rpm -d git \
		-d ruby -d erlang \
		-d libffi-devel -d rpm-build \
		--prefix=${prefix} \
		--vendor=${vendor} \
		--license=${license} \
		--url=${url} \
		--epoch=${epoch} \
		--name=${project_name} \
		--version=${project_version} \
		--provides=${project_name} \
		./lib ./bin
