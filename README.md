## Introduction

This is an assignment uses data from Coursera Exploratory Data Analysis. Dataset is from 
<a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, In particular, "Individual household
electric power consumption Data Set" will be user and 4 plots generated in this work

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

R codes includes downloading zip data and extracting if there isn't 'household_power_consumption.txt' in your working directory.

* The original dataset has 2,075,259 rows and 9 columns. In our case we just get data between 2007-02-01 and
2007-02-02. In order to get data between the dates that i want, i used sqldf package

* For plotting I used reshape2 melt.

## Plots

* Plot 1 is Global Active Power, histogram

* Plot 2 is Global Active Power over two dates.

* Plot 3 is Energy Sub Metering over two dates.

* Plot 4 is Global Active Power, Voltage, Energ Sub Metering, Global Active Power over two dates

## R Code

Code includes comment lines. Basically, downloading, reading data, reshaping and plotting done on order.