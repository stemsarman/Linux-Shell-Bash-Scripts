#!/bin/bash

# Storing the filename in an appropriately named variable.
filename=$1
# Storing the department name in an appropriately named variable.
departmentName=$2
# Printing the number of employees working is the given department.
echo -ne "The number of employees in $departmentName is : "
grep -c "$departmentName" $filename

exec < $filename
# Reading the header line to ignore the column names.
read header
# read the file columns.
while IFS="|" read -r employeeID employeeName employeeDesignation employeeDepartment
do
    if [ $employeeDepartment == $departmentName ]; then
        echo "The details of the employee are :"
        echo "Employee ID is : $employeeID"
        echo "Employee name is : $employeeName"
        echo "Employee Designation is : $employeeDesignation"
        echo "Employee Department is : $employeeDepartment"
        break
    fi    
done

