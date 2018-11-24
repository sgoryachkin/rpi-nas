#!/bin/bash

STORAGE_TEMPLATE[0]=$(jo name="System" mp="/" used=TMP_USED size=TMP_SIZE);
STORAGE_TEMPLATE[1]=$(jo name="Data" mp="/mnt/storage1" used=TMP_USED size=TMP_SIZE);

RESULT=$(for VAR in ${STORAGE_TEMPLATE[@]}; do \
    LINE=$(df --output=target,used,size --block-size=1M | grep "$(echo $VAR | jq '.mp' | xargs) "); \
    USED=$(echo $LINE | awk '{ print $2 "\t" }'); \
    SIZE=$(echo $LINE | awk '{ print $3 "\t" }'); \
    VAR=${VAR/\"TMP_USED\"/$USED}; \
    VAR=${VAR/\"TMP_SIZE\"/$SIZE}; \
    echo $VAR; \
done | jo -a)

echo $RESULT;

