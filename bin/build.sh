#!/bin/bash

IMGNAME="folksy/tracking-proxy"
VERSION=`date --utc -u +"%Y%m%d%H%M%S"`

echo ""
echo "Building with version ${VERSION}..."

exec 3>&1

docker build --no-cache -t ${IMGNAME}:${VERSION} .
COMPILE_RESULT=$?

if [ $COMPILE_RESULT -eq 0 ]; then

  echo "Last built version: $VERSION" > ./version
  echo "" >> ./version
  echo "docker push ${IMGNAME}:${VERSION}" >> ./version

  echo ""
  echo "Completed with version: ${VERSION}"
  echo ""
  echo "Push image with:"
  echo "    docker push ${IMGNAME}:${VERSION}"
  echo ""

else

  echo ""
  echo "FAIL!"
  echo ""
  echo "The image failed to compile."
  echo ""

fi
