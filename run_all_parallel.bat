#!/bin/bash

echo "Running all 4 NG cases in parallel..."

bash run_one_ng.sh 5  &
bash run_one_ng.sh 10 &
bash run_one_ng.sh 15 &
bash run_one_ng.sh 20 &

wait

echo "All jobs launched..."
