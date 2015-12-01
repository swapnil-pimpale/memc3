#!/bin/bash
# Please change this according to your ycsb installation
# so that, ${YCSB_HOME}/bin/ycsb is the binary 
YCSB_HOME=/Users/udbhav/Code/ycsb-0.5.0

for setting in `ls ycsb_small_workload_settings`
do
    echo using predefined workloadb to create transaction records for $setting with 5% updates
    echo generateing $setting.load, the insertions used before benchmark
    ${YCSB_HOME}/bin/ycsb load basic -P ${YCSB_HOME}/workloads/workloadb -P ./ycsb_small_workload_settings/$setting > $setting.load
    echo generateing $setting.run, the lookup queries used before benchmark
    ${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadb -P ./ycsb_small_workload_settings/$setting > $setting.run

    echo using predefined workloadc to create transaction records for $setting with reads only 
    echo generateing $setting.load, the insertions used before benchmark
    ${YCSB_HOME}/bin/ycsb load basic -P ${YCSB_HOME}/workloads/workloadc -P ./ycsb_small_workload_settings/$setting > $setting.load
    echo generateing $setting.run, the lookup queries used before benchmark
    ${YCSB_HOME}/bin/ycsb run basic -P ${YCSB_HOME}/workloads/workloadc -P ./ycsb_small_workload_settings/$setting > $setting.run
done
