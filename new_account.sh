#!/bin/bash
for i in {1..10}
do
    echo "gen account " $i
    conflux account new
done