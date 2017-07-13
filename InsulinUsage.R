## To calculate how much insulin of diferent kind you'll need to bring.
# rm(Amp, BloodTest, DayAmpSize, DayInUse, Dayneed, DayPackageAmpNr, DayUse, InsulinUsage, NAmp, needl, needles, NeedlesUse, NightAmpSize, NightInUse, Nightneed, NightPackageAmpNr, NightUse, NPack, NrDays, NUs, Pack, tests, teststickor, Us, Insulin)

Insulin <- function(DayInUse = 24, NightInUse = 16, NrDays, NeedlesUse = 2, BlTestUse = 4, DayIn, NightIn, Needl, BloodTest, Calc = "Day", ToFile = F) {

  # Setting sizes of the packages.
  DayAmpSize = 300
  NightAmpSize = 300
  DayPackageAmpNr = 5
  NightPackageAmpNr = 5
if(Calc == "Day"){
  # Day insulin
  Us <- DayInUse * NrDays
  Amp <- Us / DayAmpSize
  Pack <- ceiling(Amp / DayPackageAmpNr)

  DayUse <- paste("You will use", Us, "units of Day insulin during your stay of", NrDays, "days", sep = " ")
  Dayneed <- paste("You need to bring:", Pack, "packages, each with", DayPackageAmpNr, "day insulin ampuls of", DayAmpSize, "units.", sep = " ")


  #Night Insulin
  NUs <- NightInUse * NrDays
  NAmp <- NUs / NightAmpSize
  NPack <- ceiling(NAmp / NightPackageAmpNr)

  NightUse <- paste("You will use", NUs, "units of Night insulin during your stay of", NrDays, "days", sep = " ")
  Nightneed <- paste("You need to bring:", NPack, "packages, each with", NightPackageAmpNr, "day insulin ampuls of", NightAmpSize, "units.", sep = " ")


  ## Usage of Needles and Blood tests

  needl <- ceiling((NeedlesUse * NrDays) / 100)
  tests <- ceiling((BlTestUse * NrDays) /50)
  needles <- paste("You will need", needl, "packages of needles in your stay")
  teststickor <- paste("You will need", tests, "packages of blood glycos tests in your stay")

  ## Write the results

  if (ToFile == T) {
  cat("DAY INSULIN", "\n")
  cat(DayUse, "\n")
  cat(Dayneed, "\n")
  cat("\n")
  cat("NIGHT INSULIN", "\n")
  cat(NightUse, "\n")
  cat(Nightneed, "\n")
  cat("\n")
  cat("NEEDLES AND BLOOD GLYCOSE TESTS", "\n")
  cat(needles, "\n")
  cat(teststickor, "\n")

  # Skriver in det i en fil. M�ste g�ras snyggare.
  InsulinUsage <- data.frame()
  InsulinUsage <- c("DAY INSULIN", DayUse, Dayneed, "NIGHT INSULIN", NightUse,  Nightneed, "NEEDLES AND BLOOD GLYCOSE TESTS", needles, teststickor)
  names(InsulinUsage)[2] <- c("Usage") #
  write.csv2(InsulinUsage, "Use of diabetes consumables.csv")

  } else{
    cat("DAY INSULIN", "\n")
    cat(DayUse, "\n")
    cat(Dayneed, "\n")
    cat("\n")
    cat("NIGHT INSULIN", "\n")
    cat(NightUse, "\n")
    cat(Nightneed, "\n")
    cat("\n")
    cat("NEEDLES AND BLOOD GLYCOSE TESTS", "\n")
    cat(needles, "\n")
    cat(teststickor, "\n")
    }


## HERE I WILL ISTEAD CALCULATE THE NUMBER OF DAYS A CERTAIN AMOUNT OF INSULIN ETC WILL DURE
else {

# InsulinDur <- function(DayIn, NightIn, Needl, BloodTest, DayInUse = 24, NightInUse = 16, NeedlesUse = 2, BlTestUse = 4, ToFile = F) {

   # Day insulin
   DayInDays <- DayIn / DayInUse
   Days <- paste("Your stock of Day insulin will last", DayInDays, "days", sep = " ")



   #Night Insulin
   NUs <-NightIn/  NightInUse

   Nights <- paste("Your stock of  Night insulin will last", NUs, "days", sep = " ")


   ## Usage of Needles and Blood tests
   need <- Needl / NeedlesUse
   test <- BloodTest / BlTestUse
   needle <- paste("Your stock of needles will last", need, "days")
   teststicka <- paste("Your stock of glucos test sticks will last", test, "days")

   ## Write the results

   if (ToFile == T) {
   cat("DAY INSULIN", "\n")
   cat(Days, "\n")
   cat("\n")
   cat("NIGHT INSULIN", "\n")
   cat(Nights, "\n")
   cat("\n")
   cat("NEEDLES AND BLOOD GLYCOSE TESTS", "\n")
   cat(needle, "\n")
   cat(teststicka, "\n")

   # Skriver in det i en fil. M�ste g�ras snyggare.
   InsulinLast <- data.frame()
   InsulinLast <- c("DAY INSULIN", Days, "NIGHT INSULIN", Nights, "NEEDLES AND BLOOD GLYCOSE TESTS", needle, teststicka)
   names(InsulinLast)[2] <- c("Nr of days") #
   write.csv2(InsulinLast, "Days diabetes consumables will last.csv")

   } else{
      cat("DAY INSULIN", "\n")
      cat(Days, "\n")
      cat("\n")
      cat("NIGHT INSULIN", "\n")
      cat(Nights, "\n")
      cat("\n")
      cat("NEEDLES AND BLOOD GLYCOSE TESTS", "\n")
      cat(needle, "\n")
      cat(teststicka, "\n")
     }

  }
 }
}
