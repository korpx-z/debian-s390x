### This image is built to run on s390x
-    [build source](https://github.com/korpx-z/docker-debian-artifacts)
-    [original source code](https://github.com/debuerreotype/docker-debian-artifacts)
# Tags
Outside of Debian 9 (Stretch) and Debian 8 (Jessie) - all variants of Debian are available here for use. 
-	[`sid`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=sid)
-	[`sid-slim`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=sid-slim)
-	[`stable`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=stable)
-	[`stable-slim`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=stable-slim)
-	[`bullseye`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=bullseye)
-	[`bullseye-slim`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=bullseye-slim)
-	[`buster`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=buster)
-	[`buster-slim`](https://travis-ci.com/korpx-z/docker-debian-artifacts.svg?branch=buster-slim)

# Debian
Debian is an operating system which is composed primarily of free and open-source software, most of which is under the GNU General Public License, and developed by a group of individuals known as the Debian project. Debian is one of the most popular Linux distributions for personal computers and network servers, and has been used as a base for several other Linux distributions.

> [wikipedia.org/wiki/Debian](https://en.wikipedia.org/wiki/Debian)




## Locales

Given that it is a faithful "minbase" install of Debian, this image only includes the `C`, `C.UTF-8`, and `POSIX` locales by default. For most uses requiring a UTF-8 locale, `C.UTF-8` is likely sufficient (`-e LANG=C.UTF-8` or `ENV LANG C.UTF-8`).

For uses where that is not sufficient, other locales can be installed/generated via the `locales` package. [PostgreSQL has a good example of doing so](https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24), copied below:

```dockerfile
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
```

# Image Variants

## `debian:<suite>-slim`

These tags are an experiment in providing a slimmer base (removing some extra files that are normally not necessary within containers, such as man pages and documentation), and are definitely subject to change.

# License

View [license information](https://www.debian.org/social_contract#guidelines) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in [the `repo-info` repository's `debian/` directory](https://github.com/docker-library/repo-info/tree/master/repos/debian).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
