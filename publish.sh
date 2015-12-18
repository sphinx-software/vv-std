#!/usr/bin/env bash

packages=("utils")
currDir=$(pwd)
version=$@

echo "Bumping all packages version"

for i in "${packages[@]}"
do :
   echo "Switch to ${currDir}/src/${i}"
   cd "${currDir}/src/${i}"
   echo "Running npm version ${version}"
   npm version ${version}
   echo "Done."
done

cd currDir

echo "Publishing packages"

for i in "${packages[@]}"
do :
   echo "Switch to ${currDir}/src/${i}"
   cd "${currDir}/src/${i}"
   echo "Running npm publish"
   npm publish
   echo "Done."
done

exit 0
