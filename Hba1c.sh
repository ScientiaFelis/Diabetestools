#!/bin/bash

## A script that converts between Hba1c values and estimated average blood sugar levels.
## References:
## Nathan DM, Kuenen J, Borg R, Zheng H, Schoenfeld D, Heine RJ. Translating the A1C assay into estimated average glucose values. Diabetes Care 2008; 31(8):1473-8.
# AGmg/dl = 28.7 × A1C − 46.7, R2 = 0.84, P < 0.0001), allowing calculation of an estimated average glucose (eAG) for A1C values.
set -eu

clear

echo "Converts between different Hba1c values (IFCC, NGSP) and average glucose levels (mm/L, mg/dL)"

echo "What do you want to convert from?"
read -p "IFCC, NGSP, mm/L, mg/dL" FVal

case $FVal in
	IFCC)
		echo "What do you want to convert to?"
		read -p "NGSP; mm/L; mg/dL" TVal

		if [[ TVal == "NGSP" ]]; then
			#statements
		elif [[ TVal == "mm/L" ]]; then
			#statements
		elif [[ TVal == "mg/dL" ]]; then
			#statements
		else
			 echo "You need to specify one of the values in the list."
		fi ;;

	NGSP)
		echo "What do you want to convert to?"
	 	read -p "IFCC; mm/L; mg/dL" TVal

	  if [[ TVal == "IFCC" ]]; then
		  #statements
	  elif [[ TVal == "mm/L" ]]; then
		  #statements
	  elif [[ TVal == "mg/dL" ]]; then
		  read -p "What is your NGSP value %: " NG
		  mg=$( echo "scale=3;  (28.7 * $NG) - 46.7" | bc )
		  echo "Your average blood sugare is ${mg} mg/dL"
	  else
			echo "You need to specify one of the values in the list."
	  fi ;;
	mm/L)
		echo "What do you want to convert to?"
		read -p "IFCC, NGSP;  mg/dL" TVal

		if [[ TVal == "NGSP" ]]; then
			#statements
		elif [[ TVal == "IFCC" ]]; then
			#statements
		elif [[ TVal == "mg/dL" ]]; then
			#statements
		else
			 echo "You need to specify one of the values in the list."
		fi ;;

	mg/dL)
		echo "What do you want to convert to?"
		read -p "IFCC; NGSP; mm/L" TVal

		if [[ TVal == "NGSP" ]]; then
			#statements
		elif [[ TVal == "mm/L" ]]; then
			#statements
		elif [[ TVal == "IFCC" ]]; then
			#statements
		else
			 echo "You need to specify one of the values in the list."
		fi		;;
*) echo "You need to specify one of the values in the list." ;;
esac
