# docker-debian-artifacts

-	[`sid`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=sid)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)
-	[`sid-slim`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=sid-slim)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)
-	[`stable`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=stable)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)
-	[`stable-slim`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=stable-slim)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)
-	[`bullseye`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=bullseye)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)
-	[`bullseye-slim`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=bullseye-slim)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)
-	[`buster`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=buster)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)
-	[`buster-slim`](https://github.com/korpx-z/docker-debian-artifacts)  [![Build Status](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=buster-slim)](https://travis-ci.com/github/korpx-z/docker-debian-artifacts)

# What is Debian?

Debian is an operating system which is composed primarily of free and open-source software, most of which is under the GNU General Public License, and developed by a group of individuals known as the Debian project. Debian is one of the most popular Linux distributions for personal computers and network servers, and has been used as a base for several other Linux distributions.

> [wikipedia.org/wiki/Debian](https://en.wikipedia.org/wiki/Debian)

![logo](https://raw.githubusercontent.com/docker-library/docs/b449be7df57e9ed9086bb5821bfb5d6cdc5d67a4/debian/logo.png)

# Tags Available
Outside of Debian 9 (Stretch) and Debian 8 (Jessie) - all variants of Debian are available here for use. 
<br />
**_debian:buster_** <br />
**_debian:sid_**<br />
**_debian:stable_** <br />
**_debian:bullseye_** <br />

## Locales

Given that it is a faithful "minbase" install of Debian, this image only includes the `C`, `C.UTF-8`, and `POSIX` locales by default. For most uses requiring a UTF-8 locale, `C.UTF-8` is likely sufficient (`-e LANG=C.UTF-8` or `ENV LANG C.UTF-8`).

For uses where that is not sufficient, other locales can be installed/generated via the `locales` package. [PostgreSQL has a good example of doing so](https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24), copied below:

```dockerfile
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
```

## How It's Made

The rootfs tarballs for this image are built using [the reproducible-Debian-rootfs tool, `debuerreotype`](https://github.com/debuerreotype/debuerreotype), with an explicit goal being that they are transparent and reproducible. Using the same toolchain, it should be possible to regenerate (clean-room!) the same tarballs used for building the official Debian images. [The `build.sh` script in that debuerreotype repository](https://github.com/debuerreotype/debuerreotype/blob/master/build.sh) (and the `build-all.sh` companion/wrapper) is the canonical entrypoint used for creating the artifacts published in this image.

Additionally, the scripts in [https://github.com/debuerreotype/docker-debian-artifacts](https://github.com/debuerreotype/docker-debian-artifacts) are used to create each tag's `Dockerfile` and collect architecture-specific tarballs into [`dist-ARCH` branches on the same repository](https://github.com/debuerreotype/docker-debian-artifacts/branches), which also contain extra metadata about the artifacts included in each build, such as explicit package versions included in the base image (`rootfs.manifest`), the exact snapshot.debian.org timestamp used for `debuerreotype` invocation (`rootfs.debuerreotype-epoch`), the `sources.list` found in the image (`rootfs.sources-list`) and the one used during image creation (`rootfs.sources-list-snapshot`), etc.

# Image Variants

## `debian:<suite>-slim`

These tags are an experiment in providing a slimmer base (removing some extra files that are normally not necessary within containers, such as man pages and documentation), and are definitely subject to change.

# License

View [license information](https://www.debian.org/social_contract#guidelines) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in [the `repo-info` repository's `debian/` directory](https://github.com/docker-library/repo-info/tree/master/repos/debian).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
