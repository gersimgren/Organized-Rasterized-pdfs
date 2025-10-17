#!/bin/bash

#this takes an input of the number of pages and seperates it into 
#a small number of pdfs so that github can house them

read pN
read iP

#calculate how many times to do it and what is left

times=$(($pN / 50))
rest=$(($pN % 50))
startPage=1
for (( i=0; i<$times; i++ )); do
	endPage=$(($startPage + 49))
	partNum=$(($i + 1))
	qpdf "$iP" --pages . "$startPage"-"$endPage" -- "part_$partNum.pdf"
	echo "create part_$partNum.pdf pages $startPage to $endPage"	
	startPage=$(($endPage + 1))
done

lastPage=$(($startPage + $rest - 1))
partNum=$(($times + 1))
if [ $rest -ne 0 ]; then
	qpdf "$iP" --pages . "$startPage"-"$lastPage" -- "part_$partNum.pdf"
fi	

