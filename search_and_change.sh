#!/bin/bash

# \ -> /
find ./ -type f -name "*template_file_name" -exec  sed -i 's/\\/\//g' {} \;
# / -> \
# find ./ -type f -name "temp*me" -exec  sed -i 's/\//\\/g' {} \;
