#!/bin/bash

######################################

#SBATCH --job-name=pd_cap_v43                    # Name of job
#SBATCH --mail-type=ALL                             # NONE, BEGIN, END, FAIL, REQUEUE, ALL, TIME_LIMIT, TIME_LIMIT_90
#SBATCH --mail-user=yi.feng@polito.it               # Email address
#SBATCH --partition=global
#SBATCH --time=00:30:00                             # Time: hh:mm:ss
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=job_name_%j.log
#SBATCH --mem=1024M


SIF=$HOME/python/py12.sif
SCRIPT_DIR=$HOME/python/emulsion/RSA
CASE_NAME=pd_capsule_case_test

cd $SCRIPT_DIR

apptainer exec \
    --bind $SCRIPT_DIR:$SCRIPT_DIR \
    $SIF \
    python packing_density_capsule_sphere_v43.py $CASE_NAME

