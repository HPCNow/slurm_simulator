#!/bin/bash
# Create temporary directories for the job
for DIRECTORY in /scratch/jobs/$SLURM_JOB_USER /dev/shm/jobs/$SLURM_JOB_USER /tmp/jobs/$SLURM_JOB_USER
do
if [ ! -d "$DIRECTORY" ]; then
    mkdir -p $DIRECTORY
    chown $SLURM_JOB_USER $DIRECTORY
    chmod 700 $DIRECTORY
fi
TDIRECTORY=$DIRECTORY/$SLURM_JOBID

if [ ! -d "$TDIRECTORY" ]; then
    mkdir -p $TDIRECTORY
    chown $SLURM_JOB_USER $TDIRECTORY
    chmod 700 $TDIRECTORY
fi 
done

