#!/bin/bash
set -eu

echo "" ## Calculates the insulin usage over a time period.
echo "Calculates the insulin usage over a time period."
echo ""
echo "OR"
echo ""
echo "The number of days left given amount of equipment."
echo ""
echo "Default values in parentesis."
echo ""
echo "Do you want to calculate how much you'll use in a nr of days - 1"
echo "Or how many days you equipment will last - 2"
read -p "1 or 2: " Calc

if [[ $Calc -ne 1 && $Calc != 2 ]]; then
	echo "You need to put in 1 or 2."
	read -p "Do you want to calculate how much you'll use in a nr of days (1) or how many days you equipment will last (2)" Calc
fi

if [[ $Calc -eq 1 ]]; then
## HERE WE CALCULATE HOW MUCH EQUIPMENT YOU WILL NEED IN A CERTAIN NR OF DAYS.

		read -p "Number of days: " NrDays
		read -p "Daily insulin use in units of rapid insulin (22): " DayInUse
		read -p "Daily insulin use in units of night insulin (12): " NightInUse
		read -p "Number of needles per day (2): " NeedlesUse
		read -p "Number of glucos teststicks per day (3): " BlTestUse
		read -p "Do you want to store in file (y/N)?: " ToFile

			if [[ $ToFile == "y" ]]; then
				read -p "Do you want to print the results (y/N)? " Pri
			fi

		## Setting some default values
			DayInUse=${DayInUse:=22}
			NightInUse=${NightInUse:=12}
			NeedlesUse=${NeedlesUse:=2}
			BlTestUse=${BlTestUse:=3}

		 ## Setting package sizes.
		  DayAmpSize=300 ## Size of day insulin ampulls
		  NightAmpSize=300 ## Size of night insulin ampulls
		  DayPackageAmpNr=5 ## Nr of ampulls ina packege for day insulin
		  NightPackageAmpNr=5 ## Nr of ampulls ina packege for night insulin
		 NeedlesPack=100 ## Nr of needles in a package
		 TestPack=50 ## Nr of test sticks in a package

		clear

		  # Day insulin
		  Us=$(( $DayInUse * $NrDays )) ## calculate the nr of units of insulin needed
		  Amp=$(( $Us / $DayAmpSize )) ## calculate nr of ampulls needed
		   if [[ $(( $Us % $DayAmpSize )) -gt 0 ]]; then ## If there is a rest in the above division we have to add another ampull to get enough.
		      Amp=$(( $Amp+1 ))
		   fi

		  Pack=$(( $Amp / $DayPackageAmpNr )) ## Calculate how many packages with ampulls we need.
		      if [[ $(( $Amp % $DayPackageAmpNr )) -gt 0 ]]; then ## If there is a rest in the above division we have to ad another package to get enough.
		            Pack=$(( $Pack+1 ))
		      fi

		## Save the numbers in an explaining string
		 DayUse=$(echo "You will use" ${Us} "units of Day insulin during your stay of" ${NrDays} "days")
		 Dayneed=$(echo "You need to bring:" ${Amp} "ampulls, or" ${Pack} "packages each with" ${DayPackageAmpNr} "day insulin ampuls of" ${DayAmpSize} "units.")


		  ## Make the same calculations for Night Insulin
		  NUs=$(( $NightInUse * $NrDays ))
		  NAmp=$(( $NUs / $NightAmpSize ))
		   if [[ $(( $NUs % $NightAmpSize )) -gt 0 ]]; then
		      NAmp=$(( $NAmp+1 ))
		   fi

		  NPack=$(( $NAmp / $NightPackageAmpNr ))
		   if [[ $(( $NAmp % $NightPackageAmpNr )) -gt 0 ]]; then
		      NPack=$(( $NPack+1 ))
		   fi

		  NightUse=$(echo "You will use" ${NUs} "units of Night insulin during your stay of" ${NrDays} "days.")
		  Nightneed=$(echo "You need to bring:" ${Amp} "ampulls, or" ${NPack} "packages each with" ${NightPackageAmpNr} "night insulin ampuls of" ${NightAmpSize} "units.")


		  ## And Usage of Needles and Blood tests

		  needl=$(( ( $NeedlesUse * $NrDays ) / $NeedlesPack ))
		  needls=$(( $NeedlesUse * $NrDays ))
		  if [[ $(( ( $NeedlesUse * $NrDays ) % $NeedlesPack )) -gt 0 ]]; then
		       needl=$(( $needl+1 ))
		  fi

		  tests=$(( ( $BlTestUse * $NrDays ) / $TestPack ))
		   if [[ $(( ( $BlTestUse * $NrDays ) % $TestPack )) -gt 0 ]]; then
		       tests=$(( $tests+1 ))
		   fi
		  needles=$(echo "You will need:" ${needls} "needles, or" ${needl} "packages of needles in your stay of " ${NrDays} "days.")
		  teststickor=$(echo "You will need" ${tests} "packages of blood glycos teststicks on your stay of " ${NrDays} "days")

		  ## Write the results

		if [[ $ToFile == "y" ]]; then ## If we chose to save it to a file print the result and save everything in a file.

			echo ""
			echo -e "DAY INSULIN \n"
			echo -e "${DayUse} \n"
			echo -e "${Dayneed} \n"
			echo ""
		    echo -e "NIGHT INSULIN \n"
		    echo -e "${NightUse} \n"
		    echo -e "${Nightneed} \n"
		    echo ""
		    echo -e "NEEDLES AND BLOOD GLYCOSE TESTS \n"
		    echo -e "${needles} \n"
		    echo -e "${teststickor} \n"

		      echo -e "DAY INSULIN \n"  "${DayUse} \n" "${Dayneed} \n"  "" "NIGHT INSULIN \n" "${NightUse} \n" "${Nightneed} \n"  ""  "NEEDLES AND BLOOD GLYCOSE TESTS \n" "${needles} \n" "${teststickor} \n" > "$HOME/Use of diabetes consumables.txt" ## save everything in one file.

			echo ""
		    echo "The results are saved in the file, Use of diabetes consumables.txt, in your HOME directory"
				 	if [[ $Pri == "y" ]]; then ## if we also chose to print the file
				 		lp "$HOME/Use of diabetes consumables.txt"  ## Print it in the default printer.
						echo "The file have also been printed on your default printer."
				 	fi

		 else
		      echo ""
		      echo -e "DAY INSULIN \n"
		      echo -e "${DayUse} \n"
		      echo -e "${Dayneed} \n"
		      echo ""
		      echo -e "NIGHT INSULIN \n"
		      echo -e "${NightUse} \n"
		      echo -e "${Nightneed} \n"
		      echo ""
		      echo -e "NEEDLES AND BLOOD GLYCOSE TESTS \n"
		      echo -e "${needles} \n"
		      echo -e "${teststickor} \n"
		fi


else
	## HERE WE CALCULATE THE NUMBER OF DAYS A CERTAIN AMOUNTS OF EQUIPMENT LAST.

			read -p "Number of Day insulin units (0): " NrDayIN
			read -p "Number of Night insulin units (0): " NrNightIN
			read -p "Number of Teststicks (0): " NrTestStick
			read -p "Number of Needles (0): " NrNeedles
			read -p "Daily insulin use in units of rapid insulin (22): " DayInUse
			read -p "Daily insulin use in units of night insulin (12): " NightInUse
			read -p "Number of needles per day (2): " NeedlesUse
			read -p "Number of glucos teststicks per day (3): " BlTestUse
			read -p "Do you want to store in file (y/N)?: " ToFile

				if [[ $ToFile == "y" ]]; then
					read -p "Do you want to print the results (y/N)? " Pri
				fi

			## Setting some default values
				DayInUse=${DayInUse:=22}
				NightInUse=${NightInUse:=12}
				NeedlesUse=${NeedlesUse:=2}
				BlTestUse=${BlTestUse:=3}
				NrDayIN=${NrDayIN:=0} ## we set these to 0 as that will be 0 days.
				NrNightIN=${NrNightIN:=0}
				NrTestStick=${NrTestStick:=0}
				NrNeedles=${NrNeedles:=0}

			clear

			  # Day insulin
			   NrDays=$(( $NrDayIN / $DayInUse  )) ## calculate the nr of units of insulin needed

			## Save the numbers in an explaining string
			 Dayleft=$(echo "You have  ${NrDays} Days of day insulin use.")

			  ## Make the same calculations for Night Insulin
			  NrNi=$(( $NrNightIN / $NightInUse ))
			  NrNight=$(echo "You have ${NrNi} days of Night insulin use.")


			  ## And Usage of Needles and Blood tests

			 NrneDay=$((  $NrNeedles / $NeedlesUse ))
			 NrtesDay=$((  $NrTestStick / $BlTestUse ))
			  needledays=$(echo "You have ${NrneDay} days of needle use.")
			  teststickor=$(echo "You have ${NrtesDay} days of blood glycos teststick use.")

			  ## Write the results

			if [[ $ToFile == "y" ]]; then ## If we chose to save it to a file print the result and save everything in a file.

				echo ""
				echo -e "INSULIN \n"
				echo -e "${Dayleft} \n"
				echo -e "${NrNight} \n"
				echo ""
 				echo -e "NEEDLES AND BLOOD GLYCOSE TESTS \n"
				 echo -e "${needledays} \n"
				 echo -e "${teststickor} \n"

					echo -e "INSULIN \n"  "${Dayleft} \n" "${NrNight} \n"  ""  "NEEDLES AND BLOOD GLYCOSE TESTS \n" "${needledays} \n" "${teststickor} \n" > "$HOME/Nr of days left of diabetes consumables.txt" ## save everything in one file.

				echo ""
				 echo "The results are saved in the file, Nr of days left of diabetes consumables.txt, in your HOME directory"
						if [[ $Pri == "y" ]]; then ## if we also chose to print the file
							lp "$HOME/Nr of days left ofdiabetes consumables.txt"  ## Print it in the default printer.
							echo "The file have also been printed omn your default printer."
						fi

			 else
				 echo ""
				 echo -e "INSULIN \n"
				 echo -e "${Dayleft} \n"
				 echo -e "${NrNight} \n"
				 echo ""
				 echo -e "NEEDLES AND BLOOD GLYCOSE TESTS \n"
				  echo -e "${needledays} \n"
				  echo -e "${teststickor} \n"
			fi

fi
set +eu
