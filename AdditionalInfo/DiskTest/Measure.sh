#!/bin/bash

#Input Parameters

StartInput=2048
EndInput=1048577
LocalFileSystem='/'
PersistenFileSystem='/eslap/volumes/durable0/'

#Clean csv files
rm -f *.csv



function DiskMeasure {
#*****Parameters information ************

#** $1: Start Size to be tested
#** $2: Maximum Size to be tested
#** $3: Path where the file will be copied
#** $4: Samples: number of time to repeat the process in order to get some stadistics
#** $5: flag to identify if the file will be split in a set of smallest files. This parameter is set up with the $7
#** $6 Output File 
#** $7 Number of Messages to split

#****************************************
    for (( Iter=0; Iter<$4; Iter++)); 
    do  
        starSize=$1
        while [ $starSize -lt $2 ]
        do
            for FLAG in "sync" "dsync" "direct" 
            do
                if [ $5 -eq 1 ] # 1 = A file by time 0: will define that the size will be split in small messajes
                then
                    result=$(dd if=/dev/zero of=$3temp-hddwrite.tmp bs=$starSize count=$7 oflag=$FLAG |& awk '/copied/ { print  $2 ";" $8 ";" $10 ";" $11}') 
                else
                    # Dividing the size in small pieces to see the impact.
                    let size=($starSize/$7) 
                    if [ "$FLAG" == "direct" ]
                    then
                        result=$(dd if=/dev/zero of=$3temp-hddwrite.tmp bs=$size count=$7 |& awk '/copied/ {print $2 ";" $8 ";" $10 ";" $11}')
                    else
                        result=$(dd if=/dev/zero of=$3temp-hddwrite.tmp bs=$size count=$7 oflag=$FLAG |& awk '/copied/ {print  $2 ";" $8 ";" $10 ";" $11}') 
                    fi
                fi
                echo "$Iter;$starSize;$result;$FLAG;$5;$7" >> $6
            done
            let starSize=starSize*2
        done
    done
}

#Execution

echo "Start: $StartInput End : $EndInput  File System:  $LocalFileSystem"
DiskMeasure $StartInput $EndInput $LocalFileSystem 3 1 'LocalVolumen1PaqbySize.csv' 1

echo "Start: $StartInput End : $EndInput  File System:  $PersistenFileSystem"
DiskMeasure $StartInput $EndInput $PersistenFileSystem 3 1 'PersistentVolumen1PaqbySize.csv' 1

echo "Start: $StartInput End : $EndInput  File System:  $LocalFileSystem"
DiskMeasure $StartInput $EndInput $LocalFileSystem  3 0 'LocalVolumenNPaqbySize.csv' 100

echo "Start: $StartInput End : $EndInput  File System:  $PersistenFileSystem"
DiskMeasure $StartInput $EndInput $PersistenFileSystem 3 0 'PersistentVolumenNPaqbySize.csv' 100

#Cleaning File System 

rm -rf temp-hdwrite.tmp
