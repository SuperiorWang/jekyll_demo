#! bin/bash
find . -type f -maxdepth 1|grep -v "\.\/\." |cut -d / -f2 | tr "_" "-"