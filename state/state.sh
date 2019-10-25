#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
STATE=$(jo storage=$($DIR/storage.sh));
echo $STATE;

