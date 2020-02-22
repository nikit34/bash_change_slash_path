#!/bin/bash

# \ -> /
find ./ -type f -name "Makefile1.*" -exec  sed -i 's/\\/\//g' {} \;
# / -> \
# find ./ -type f -name "Makefile1.*" -exec  sed -i 's/\//\\/g' {} \;