#!/bin/bash
# Remove temporary directories for the job
SCRATCH_DIR=/scratch/jobs/$SLURM_JOB_USER/$SLURM_JOBID
SHM_DIR=/dev/shm/jobs/$SLURM_JOB_USER/$SLURM_JOBID
TMP_DIR=/tmp/jobs/$SLURM_JOB_USER/$SLURM_JOBID
rm -rf $SCRATCH_DIR 2>/dev/null >/dev/null
rm -rf $SHM_DIR 2>/dev/null >/dev/null
rm -rf $TMP_DIR 2>/dev/null >/dev/null

