# Diabetestools
Some scripts, mostly bash, to help with diabetes

##-------------------##
  
  Bash script 

Copy file to the for example the $HOME/bin directory.
The make the file executable, e.g.:

`chmod 755 $HOME/bin/InsulinUse.sh`


###------------------###

R script

The R script at the moment jsut calculate how much you need to bring for a certain amount of days.

Source the script

`source("$HOME/InsulinUse.R")`

the function to call is `Insulin()`
You need to put in:
DayInUse = The amount of fast insulin you use in units per day.
NightInUse = The amount night insulin you use in units per day
NrDays = How many days you are going to be away.
NeedlesUse = the number of needles you use per day, default is 2
BloodTest = how many blood sugar test sticks you use per day, dafault is 4
ToFile = FALSE or TRUE (F/T) If you wanty to save the info to a ; separated csv file.
