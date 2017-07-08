# Diabetestools

Some scripts, in Bash and R, to help calculate use of diabetes medicins and how long they last.

  ### Bash script

Copy file to for example the ` $HOME/bin` directory. Then make the file executable, e.g.:

`chmod +x $HOME/bin/InsulinUse.sh`

If `$HOME/bin` is in your `$PATH` varable you, just run `InsulinUse.sh`


----------------------------------
### R script

The R script contains two functions.:
-  `Insulin` calculates how much you need to bring for a certain amount of days.

- `InsulinDur` calculates how many days the current stock will last.

Source the script

`source("$HOME/InsulinUsage.R")`

The **first function** is `Insulin()`
You need to specify in:

- DayInUse = *The amount of fast insulin you use in units per day, **default to 24.***.
- NightInUse = *The amount night insulin you use in units per day, **default to 16.***
- NrDays = *How many days you are going to be away.*
- NeedlesUse = *The number of needles you use per day, **default to 2***
- BlTestUse = *How many blood sugar test sticks you use per day, **default to 4***
- ToFile = FALSE *or* TRUE (F/T) *If you wanty to save the info to a ; separated csv file, defaults to* F.


The **second function** is `InsulinDur `
You need to specify in:

- DayIn = *The amount of Insulin you have left.*
- NightIn = *The amount of Night in sulin you have left.*
- Needl = *The amouunt of Needles you have left.*
- BloodTest = *The amount of glucos test sticks you have left.*
- ToFile = FALSE *or* TRUE (F/T) *If you wanty to save the info to a ; separated csv file, defaults to F.*

The amount used per day defaults to the same as in the above function `Insulin` but you can change them to by stating the same variables as above with the correct value.
