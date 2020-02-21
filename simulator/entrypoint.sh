#!/bin/bash

for $i in {01..10}; do 
    groupadd group$i
done

for $i in {01..10}; do 
    useradd user$i -g group$i
done
