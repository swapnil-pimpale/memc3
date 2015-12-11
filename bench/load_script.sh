sh ycsb_small_workload_gen.sh
./bench_trace_gen kv_small_workload_zipf.load.memc3 < kv_small_workload_zipf.load
./bench_trace_gen kv_small_workload_zipf.run.memc3 < kv_small_workload_zipf.run
