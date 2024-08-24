#!/bin/bash
for d in /sys/kernel/iommu_groups/*/devices/*; do
    n=$(basename $(dirname $d))
    echo "IOMMU Group $n $(lspci -nns ${d##*/})"
done


shopt -s nullglob
for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;
