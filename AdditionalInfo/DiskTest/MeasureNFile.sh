#!/bin/bash

#Input Parameters

StartInput=1024
EndInput =2048 # Not Used
LocalFileSystem='/'
PersistenFileSystem='/eslap/volumes/durable0/'

function DiskMeasure {
#*****Parameters information ************

#** $1: Start Size to be tested
#** $2: Maximum Size to be tested
#** $3: Path where the file will be copied
#** $4 Output File 
#** $5 Number of Messages to split

#****************************************
    for (( Iter=0; Iter<$4; Iter++)); 
    do  
        starSize=$1
        for Size in "1K" "2K" "4K" "8K" "16k" "32k" "64k" "128k" "256k" "512k" "1M" "2M" "4M" "8M" "16M" "32M" "64M" "128M" "256M" "512M" "1G"
        do
            for FLAG in "sync" "dsync" 
            do
               # Dividing the size in small pieces to see the impact.
               let size1=($starSize/$6) 
               result=$(dd if=/dev/zero of=$3temp-hddwrite.tmp bs=$size1 count=$6 oflag=$FLAG conv=fdatasync |& awk '/copied/ {print $1 ";" $2 ";" $8 ";" $10 ";" $11}') 
               echo "$Iter;$starSize;$result;$FLAG;W" >> "$5StampW.csv"
               
               result=$(dd if=$3temp-hddwrite.tmp of=/dev/zero bs=$size1 count=$6 oflag=$FLAG conv=fdatasync |& awk '/copied/ { print $1 ";" $2 ";" $8 ";" $10 ";" $11}') 
               rm $3temp-hddwrite.tmp
               echo "$Iter;$starSize;$Iter;$result;$FLAG;R" >> "$5StampR.csv"
            done
            let starSize=starSize*2
        done
    done
}

#Execution

echo "Start: $StartInput End : $EndInput  File System:  $LocalFileSystem"
DiskMeasure $StartInput $EndInput $LocalFileSystem  6 'LocalNFiles' 100

echo "Start: $StartInput End : $EndInput  File System:  $PersistenFileSystem"
DiskMeasure $StartInput $EndInput $PersistenFileSystem 6 'PersistentNFiles' 100

