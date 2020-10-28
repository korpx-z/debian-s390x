set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - debian *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW Test docker run of Debian: $ANSI_RESET"
docker run -i --rm --name version-bash quay.io/ibmz/debian:sid-slim bash --version

# expecting
# Hello World!
docker run -i --rm --name hello-bash quay.io/ibmz/debian:sid-slim echo 'Hello World!'

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
