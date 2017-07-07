## To calculate how much insulin of diferent kind you'll need to bring.
# rm(Amp, BloodTest, DayAmpSize, DayInUse, Dayneed, DayPackageAmpNr, DayUse, InsulinUsage, NAmp, needl, needles, NeedlesUse, NightAmpSize, NightInUse, Nightneed, NightPackageAmpNr, NightUse, NPack, NrDays, NUs, Pack, tests, teststickor, Us, Insulin)

Insulin <- function(DayInUse, NightInUse, NrDays, NeedlesUse = 2, BloodTest = 4, ToFile = F) {
  
  # Setting sizes of the packages.
  DayAmpSize = 300
  NightAmpSize = 300
  DayPackageAmpNr = 5
  NightPackageAmpNr = 5
  
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
  tests <- ceiling((BloodTest * NrDays) /50)
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
  
  # Skriver in det i en fil. Måste göras snyggare.
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
}

