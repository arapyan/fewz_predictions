#!/bin/bash
      
SECTOR=$1

cd /afs/cern.ch/work/a/arapyan/MCProd/FEWZ_3.1.rc/bin

./local_run.sh w my_wp_18012_nnpdf wp_smp18012.txt histograms.txt results.dat .. 3 $SECTOR

exit $status
