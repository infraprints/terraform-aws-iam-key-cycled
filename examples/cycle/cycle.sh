#!/bin/bash

declare -a states=(0 1 2 3 4 5 0 1 2 3 4 5 );

terraform init

counter=1
echo States: ${states[@]}
for st in "${states[@]}"
do
    echo "[$counter] terraform apply -auto-approve -var phase=$st"
    terraform apply -auto-approve -var phase=$st
    terraform output
    echo "[$counter] sleep for a bit"
    counter=`expr $counter + 1`
    sleep 2
done