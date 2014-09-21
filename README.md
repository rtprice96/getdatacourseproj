Getting and Cleaning Data
=================

Course project from Getting and Cleaning Data Coursera Course.

Changes Made from Raw Data 
=================

This script changes the raw data in a few ways.  It collects both the train and test sets, discards all columns except for mean and std, adds columns for subject ID and activity, and restyles columns for better consistency.  

I decided to keep the meanFreq data as well, since it does describe a mean, which the problem description asks for.  Since we don't have a specific problem to analyze, I decided to avoid excessive re-organizaiton of the data, focusing instead on simplifying (no mergeing or melting).  I also corrected a typo, changing a series of feature names that included the string "bodybody".

How to Use the Script
=======================

The script defines a holder function, main().  Just load the script from the root directory of the data set, run the main() function, and main will output a .txt file ("tidy.txt") with the polished dataset.

Thanks for reviewing!  :)
