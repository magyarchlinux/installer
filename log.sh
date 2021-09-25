#!/bin/bash

#log_file=log_file.txt
#exec > >(tee -a ${log_file} )
#exec 2> >(tee -a ${log_file} >&2)

LOG_FILE=script.log
exec > >(while read -r line; do printf '%s %s\n' "$(date --rfc-3339=seconds)" "$line" | tee -a $LOG_FILE; done)
exec 2> >(while read -r line; do printf '%s %s\n' "$(date --rfc-3339=seconds)" "$line" | tee -a $LOG_FILE; done >&2)


./ayi


