#!/bin/bash

#Corb ALexia- Gabriela 
mkdir -p documents 
cd documents 
touch {file1.txt,file2.txt,file3.txt}
cd .. 
ls documents
ls documents | wc -l
