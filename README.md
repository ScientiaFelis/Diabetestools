# Diabetestools
Some scripts, mostly bash, to help with diabetes

##-------------------##

  Bash script

Copy file to the for example the $HOME/bin directory.
The make the file executable, e.g.:

`chmod 755 $HOME/bin/InsulinUse.sh`


###------------------###

R script

The R script contains two functions. `Insulin` calculates how much you need to bring for a certain amount of days.

`InsulinDur` calculates how many days the current stock will last.

Source the script

`source("$HOME/InsulinUse.R")`

The first function is  `Insulin()`
You need to put in:

DayInUse = The amount of fast insulin you use in units per day, default to 24.

NightInUse = The amount night insulin you use in units per day, default to 16

NrDays = How many days you are going to be away.

NeedlesUse = the number of needles you use per day, default to 2

BlTestUse = how many blood sugar test sticks you use per day, dafault to 4

ToFile = FALSE or TRUE (F/T) If you wanty to save the info to a ; separated csv file, defaults to F.


The second function is `InsulinDur `
You need to put in:

DayIn = The amount of Insulin you have left.

NightIn = The amount of Night in sulin you have left.

Needl = The amouunt of Needles you have left.

BloodTest = The amount of glucos test sticks you have left.

ToFile = FALSE or TRUE (F/T) If you wanty to save the info to a ; separated csv file, defaults to F.

The amount used per day defaults to the same as in the above function `Insulin` but you can change them to by stating the same variables as above with the correct value.
