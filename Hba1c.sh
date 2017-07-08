#!/bin/bash

## A script that converts between Hba1c values and estimated average blood sugar levels.
## References:
## Nathan DM, Kuenen J, Borg R, Zheng H, Schoenfeld D, Heine RJ. Translating the A1C assay into estimated average glucose values. Diabetes Care 2008; 31(8):1473-8.
# AGmg/dl = 28.7 × A1C − 46.7, R2 = 0.84, P < 0.0001), allowing calculation of an estimated average glucose (eAG) for A1C values.
set -eu

clear

echo "Converts between different Hba1c values (IFCC, NGSP) and average glucose levels (mm/L, mg/L)"

echo "What do you want to convert from?"
read -p "IFCC, NGSP, mm/L, mg/L" FVal

echo "What do you want to convert to?"
read -p "IFCC, NGSP, mm/L, mg/L" FVal

case $FVal in
	IFCC)
		if [[ TVal == "" ]]; then
			#statements
			elif [[ condition ]]; then
			#statements
			else
			 #statements
		fi ;;
	prefix) command ;;
	prefix) command ;;
esac
