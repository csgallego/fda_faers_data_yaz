#We start by opening the file drug12q4 (4th quaterly report from the year 2012) that lists the number or complaints for each drug.
#The information is separated by dollar signs so we add: sep="$"
#We noticed that there was a problem with one quotation mark and we solve this problem by adding quote=""

drug12q4 = read.csv("aers_ascii_2012q4/ascii/drug12q4.txt",sep="$",as.is=TRUE,quote="")

#We want to look at all the drugs that are a form of Yaz/Yasmin/Ocella (they might be under different names)
Yaz12q4 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)",drug12q4$drugname,ignore.case=TRUE)

#We create a table of Yaz12q4.
table(drug12q4$drugname[Yaz12q4])

#We sum to see how many complaints there were against Yaz/Yasmin/Ocella in the 4th quarter of 2012.
sum(table(drug12q4$drugname[Yaz12q4]))
