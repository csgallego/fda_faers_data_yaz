#We start by opening the file drug12q4 (4th quaterly report from the year 2012) that lists the number or complaints for each drug. The information is separated by dollar signs so we add a separator. We noticed that there was a problem with one quotation mark and we solve this problem by adding quote.
drug12q4 = read.csv("aers_ascii_2012q4/ascii/drug12q4.txt",sep="$",as.is=TRUE,quote="")

#We want to look at all the drugs that are a form of Yaz/Yasmin/Ocella (they might be under different names)
Yaz12q4 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)|(^safy*)|(beyaz)",drug12q4$DRUGNAME,ignore.case=TRUE)

#We create a table of Yaz12q4.
table(drug12q4$DRUGNAME[Yaz12q4])

#We sum to see how many complaints there were against Yaz/Yasmin/Ocella in the 4th quarter of 2012.
sum(table(drug12q4$DRUGNAME[Yaz12q4]))

#We found 4924
[1] 4924

#We will now try to replicate the findings for all the files starting at the first quarter of 2006
# list files
na = system("ls",intern=TRUE)

# keep those that have aers_ in their name
na = na[grepl("aers_",na)]

# now create vectors to hold count, year and quarter
l = length(na)
counts = rep(NA,l)
years = rep(NA,l)
quarters = rep(NA,l)

# and iterate over each file, reading in the data
# and counting references to yaz etc

for(i in 1:l){
  n = na[i]
  years[i] = as.numeric(substr(n,12,15))
  quarters[i] = as.numeric(substr(n,17,18))
  n = paste(n,"/ascii/DRUG",substr(n,14,18),".TXT",sep="")
  x = read.csv(n,sep="$",as.is=TRUE,quote="",row.names=NULL)
  l2 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)|(^safy*)|(beyaz)",x$DRUGNAME,ignore.case=TRUE)
  counts[i] = sum(table(x$DRUGNAME[l2]))
  print(i)
}

# make a data frame
yaz = data.frame(year=years,quarter=quarters,count=counts)

#Merge the year and the quarters together
Yquarter=paste(years,quarters)

#make a data frame
Yazyear=data.frame(quarter=Yquarter,count=counts)

#create X and Y for the plot
Yazquarter=Yazyear$quarter
Yazcount=Yazyear$count

#plot
plot(Yazquarter,Yazcount,type="n",main="Complaints Against Yaz (2006-2012)",sub="Source: FDA Quarterly Data Files")

#add a line
lines(Yazquarter,Yazcount,type="n",main="Complaints Against Yaz (2006-2012)",sub="Source: FDA Quarterly Data Files")

#We now want to compare the results to another contraceptive pill for the same period. To have a market share similar to Yaz/Yasmin we look at Trinessa,Tri-Sprintec and Ortho-Tri-Cyclen Lo altogether. We start with the 4th quarter of 2012.
otherdrug = grepl("(trinessa)|(^ortho tri.*)|(^tri-spri.*)",drug12q4$DRUGNAME,ignore.case=TRUE)
table(drug12q4$DRUGNAME[otherdrug])
sum(table(drug12q4$DRUGNAME[otherdrug]))

#We found 102
[1] 102

#We now want to look at all the complaints between 2006 and 2012
for(i in 1:l){
  n = na[i]
  years[i] = as.numeric(substr(n,12,15))
  quarters[i] = as.numeric(substr(n,17,18))
  n = paste(n,"/ascii/DRUG",substr(n,14,18),".TXT",sep="")
  x = read.csv(n,sep="$",as.is=TRUE,quote="",row.names=NULL)
  l3 = grepl("(trinessa)|(^ortho tri.*)|(^tri-spri.*)",x$DRUGNAME,ignore.case=TRUE)
  counts[i] = sum(table(x$DRUGNAME[l3]))
  print(i)
}

#We make a new data frame
drugs = data.frame(year=years,quarter=quarters,count=counts)
Dquarter=paste(years,quarters)
Drugyear=data.frame(quarter=Dquarter,count=counts)
Drugquarter=Drugyear$quarter
Drugcount=Drugyear$count
plot(Drugquarter,Drugcount)
plot(Drugquarter,Drugcount,type="l",main="Complaints Against Trinessa/Tri-Sprintec/Ortho-Tri-Cliclen Lo (2006-2012)",sub="Source: FDA Quarterly Data Files")
lines(Drugquarter,Drugcount,type="l",main="Complaints Against Trinessa/Tri-Sprintec/Ortho-Tri-Cliclen Lo (2006-2012)",sub="Source: FDA Quarterly Data Files")
