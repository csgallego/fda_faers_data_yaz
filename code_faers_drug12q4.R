#We start by opening the file drug12q4 (4th quaterly report from the year 2012) that lists the number or complaints for each drug.
#The information is separated by dollar signs so we add: sep="$"
#We noticed that there was a problem with one quotation mark and we solve this problem by adding: quote=""

drug12q4 = read.csv("aers_ascii_2012q4/ascii/drug12q4.txt",sep="$",as.is=TRUE,quote="")

#We want to look at all the drugs that are a form of Yaz/Yasmin/Ocella (they might be under different names)
Yaz12q4 = grepl("(^yaz.*)|(^yasm.*)|(^ocel.*)",drug12q4$drugname,ignore.case=TRUE)

#We create a table of Yaz12q4.
table(drug12q4$drugname[Yaz12q4])

#We sum to see how many complaints there were against Yaz/Yasmin/Ocella in the 4th quarter of 2012.
sum(table(drug12q4$drugname[Yaz12q4]))

#We found 4712
[1] 4712

#We will now try to expand this search to all the quarterly files to look at the evolution of the complaints against Yaz/Yasmin since January 2006.
> system("ls",intern=TRUE)
[1] "Code_faersq1.R"    "README.md"         "aers_ascii_2006q1"
[4] "aers_ascii_2006q2" "aers_ascii_2006q3" "aers_ascii_2006q4"
[7] "aers_ascii_2007q1" "aers_ascii_2007q2" "aers_ascii_2007q3"
[10] "aers_ascii_2007q4" "aers_ascii_2008q1" "aers_ascii_2008q2"
[13] "aers_ascii_2008q3" "aers_ascii_2008q4" "aers_ascii_2009q1"
[16] "aers_ascii_2009q2" "aers_ascii_2009q3" "aers_ascii_2009q4"
[19] "aers_ascii_2010q1" "aers_ascii_2010q2" "aers_ascii_2010q3"
[22] "aers_ascii_2010q4" "aers_ascii_2011q1" "aers_ascii_2011q2"
[25] "aers_ascii_2011q3" "aers_ascii_2011q4" "aers_ascii_2012q1"
[28] "aers_ascii_2012q2" "aers_ascii_2012q3" "aers_ascii_2012q4"
[31] "faersq.Rproj"
