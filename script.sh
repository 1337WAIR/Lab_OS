#!/bin/bash
read username;
if [[ -f hello.txt && "$username" = "$USER" ]];
then
   echo "Hello $username"
else 
   echo "Hello IПЗ 1.1 Грига Михайло Михайлович"
fi