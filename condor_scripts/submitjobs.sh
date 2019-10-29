#!/bin/bash

#maxEvents=127
maxEvents=154
val=1

script=runjobs.sh

while((val<=maxEvents)); do
    echo "submitting  using "$script""
    echo "universe    = vanilla" > tmp.sub 
    echo "executable              = "$script >> tmp.sub
    echo "arguments               = "$val >> tmp.sub
    echo "transfer_output_files   = \"\"" >> tmp.sub
    echo "output                  = output/${PU}pu.\$(ClusterId).\$(ProcId).out" >> tmp.sub
    echo "error                   = error/${PU}pu.\$(ClusterId).\$(ProcId).err"  >> tmp.sub
    echo "log                     = log/${PU}pu.\$(ClusterId).\$(ProcId).log"                >> tmp.sub
    echo "+JobFlavour = \"nextweek\"  " >> tmp.sub
    echo "queue " >> tmp.sub
    echo $val
    condor_submit tmp.sub
    #bsub -o out.%J -q 2nd  $script $outputDir $workDir $val 
    val=$(($val+1))
done

exit 0
