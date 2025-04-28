1.Calculator

Code

#!/bin/bash
echo "Enter two numbers: "
read num1
read num2
echo "Choose an operation (+, -, *, /): "
read op

case $op in
    +) echo "Result: $(($num1 + $num2))" ;;
    -) echo "Result: $(($num1 - $num2))" ;;
    \*) echo "Result: $(($num1 * $num2))" ;;
    /) if [ $num2 -ne 0 ]; then
           echo "Result: $(($num1 / $num2))"
       else
           echo "Division by zero is not allowed"
       fi
    ;;
    *) echo "Invalid operation" ;;
esac


Output



2.Simple interest calculation

Code

#!/bin/bash
echo "Enter principal amount: "
read p
echo "Enter rate of interest: "
read r
echo "Enter time (in years): "
read t

# Simple Interest
si=$(echo "scale=2; $p * $r * $t / 100" | bc)
echo "Simple Interest: $si"

# Compound Interest
ci=$(echo "scale=2; $p * (1 + $r / 100) ^ $t - $p" | bc)
echo "Compound Interest: $ci"

Output



3. Large integer finder

Code

#!/bin/bash
echo "Enter three numbers: "
read a
read b
read c

if [ $a -ge $b ] && [ $a -ge $c ]; then
    echo "$a is the largest."
elif [ $b -ge $a ] && [ $b -ge $c ]; then
    echo "$b is the largest."
else
    echo "$c is the largest."
fi

Output



4. Leap Year Calculator

Code

#!/bin/bash
echo "Enter year: "
read year

if (( $year % 400 == 0 )) || (( $year % 4 == 0 && $year % 100 != 0 )); then
    echo "$year is a leap year."
else
    echo "$year is not a leap year."
fi

Output



5. Temp converter

Code

#!/bin/bash
echo "Enter temperature in Fahrenheit: "
read f
c=$(echo "scale=2; ($f - 32) * 5 / 9" | bc)
echo "$f Fahrenheit is $c Centigrade."

Output



6.Circle Area Calculator

Code

#!/bin/bash
echo "Enter the radius of the circle: "
read r

# Area
area=$(echo "scale=2; 3.1416 * $r * $r" | bc)
echo "Area of the circle: $area"

# Circumference
circumference=$(echo "scale=2; 2 * 3.1416 * $r" | bc)
echo "Circumference of the circle: $circumference"

Output











7. Array Finder

Code

#!/bin/bash
echo "Enter elements separated by space: "
read -a arr
echo "Enter element to search: "
read elem

found="no"
for i in "${arr[@]}"; do
    if [ "$i" == "$elem" ]; then
        found="yes"
        break
    fi
done

if [ "$found" == "yes" ]; then
    echo "Element $elem is present in the list."
else
    echo "Element $elem is not found."
fi



Output



8.Str matcher

Code

#!/bin/bash
echo "Enter first string: "
read str1
echo "Enter second string: "
read str2

if [ "$str1" == "$str2" ]; then
    echo "Both strings are equal."
else
    echo "The strings are different."
fi


Output






9.Salary calculator

Code

#!/bin/bash
echo "Enter basic salary: "
read basic_salary

# Calculate DA (Dearness Allowance) as 50% of basic salary
da=$(echo "scale=2; $basic_salary * 0.50" | bc)

# Calculate HRA (House Rent Allowance) as 30% of basic salary
hra=$(echo "scale=2; $basic_salary * 0.30" | bc)

# Total pay calculation
total_pay=$(echo "scale=2; $basic_salary + $da + $hra" | bc)
echo "Employee's Total Pay: $total_pay"



Output



10. Grade calculator

Code

#!/bin/bash
echo "Enter marks obtained: "
read marks

if [ $marks -ge 90 ]; then
    echo "Grade: A"
elif [ $marks -ge 75 ]; then
    echo "Grade: B"
elif [ $marks -ge 50 ]; then
    echo "Grade: C"
else
    echo "Grade: F"
fi



Output



11.Menu caci

Code

#!/bin/bash
echo "Menu-driven Calculator"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Exit"
echo "Enter your choice: "
read choice

while [ $choice -ne 5 ]
do
    echo "Enter two numbers: "
    read num1
    read num2

    case $choice in
        1) result=$(($num1 + $num2))
           echo "Addition: $result" ;;
        2) result=$(($num1 - $num2))
           echo "Subtraction: $result" ;;
        3) result=$(($num1 * $num2))
           echo "Multiplication: $result" ;;
        4) if [ $num2 -ne 0 ]; then
               result=$(($num1 / $num2))
               echo "Division: $result"
           else
               echo "Division by zero is not allowed"
           fi ;;
        *) echo "Invalid choice" ;;
    esac

    echo "Enter your choice again: "
    read choice
done

echo "Exiting Calculator."

Output



12.Dir info

Code

#!/bin/bash

# Display the name of the current directory
echo "Current Directory: $(pwd)"

# List the contents of the current directory
echo "Contents of the current directory:"
ls -l

# Create a new directory
echo "Creating a new directory named 'new_directory'..."
mkdir new_directory
echo "Directory 'new_directory' created."

# Create a new file inside the newly created directory and write some content
echo "Writing content to the new file..."
echo "This is a test file in the new directory" > new_directory/test_file.txt

# Display the contents of the new file
echo "Contents of 'test_file.txt':"
cat new_directory/test_file.txt

# Copy the new directory to a suitable location in your home directory
echo "Copying the 'new_directory' to the home directory..."
cp -r new_directory ~/

# Display the contents of the home directory to verify the copy
echo "Contents of the home directory after copying the 'new_directory':"
ls ~/


Output


1.Write a Shell script for a Menu Driven program to check if entered number is 
1.Even or Odd 
2.Prime 
3.Palindrome 
4.Armstrong

#!/bin/bash

echo "Enter a number:"
read num

while true; do
    echo "Choose an option:"
    echo "1. Check Even or Odd"
    echo "2. Check Prime"
    echo "3. Check Palindrome"
    echo "4. Check Armstrong"
    echo "5. Exit"
    read choice

    case $choice in
        1) if ((num % 2 == 0)); then
               echo "$num is Even"
           else
               echo "$num is Odd"
           fi ;;
        2) is_prime=1
           for ((i = 2; i < num; i++)); do
               if ((num % i == 0)); then
                   is_prime=0
                   break
               fi
           done
           [[ $is_prime -eq 1 ]] && echo "$num is Prime" || echo "$num is not Prime" ;;
        3) rev=$(echo $num | rev)
           if [[ $num == $rev ]]; then
               echo "$num is a Palindrome"
           else
               echo "$num is not a Palindrome"
           fi ;;
        4) sum=0
           temp=$num
           while ((temp > 0)); do
               digit=$((temp % 10))
               sum=$((sum + digit**3))
               temp=$((temp / 10))
           done
           [[ $sum -eq $num ]] && echo "$num is an Armstrong number" || echo "$num is not an Armstrong number" ;;
        5) echo "Exiting..."
           exit ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done








2.Write a shell script to generate a multiplication table of the given number

#!/bin/bash

echo "Enter a number:"
read num

echo "Multiplication Table of $num:"
for ((i = 1; i <= 10; i++))
do
    echo "$num x $i = $((num * i))"
done











3.Write a shell script to print sum of individual digits of a number.

#!/bin/bash

echo "Enter a number:"
read num
sum=0

while [ $num -gt 0 ]
do
    digit=$((num % 10))
    sum=$((sum + digit))
    num=$((num / 10))
done

echo "Sum of digits: $sum"





4.Write a shell script that accepts two integers as its arguments and computes the value of first number
raised to the power of the second number.

#!/bin/bash

echo "Enter base number:"
read base
echo "Enter exponent:"
read exp

result=1
for ((i = 1; i <= exp; i++))
do
    result=$((result * base))
done

echo "$base raised to the power of $exp is: $result"






5.
Write a shell script to read and check if the directory / file exists or not, if not make the directory / file.


#!/bin/bash

echo "Enter the name of the directory or file:"
read name

if [[ -d "$name" ]]; then
    echo "'$name' is a directory and already exists."
elif [[ -f "$name" ]]; then
    echo "'$name' is a file and already exists."
else
    echo "'$name' does not exist."
    echo "Do you want to create a directory (d) or a file (f)?"
    read choice
    if [[ $choice == "d" ]]; then
        mkdir "$name"
        echo "Directory '$name' created successfully."
    elif [[ $choice == "f" ]]; then
        touch "$name"
        echo "File '$name' created successfully."
    else
        echo "Invalid option. No changes made."
    fi
fi

1. Write a script using grep command to find the number of words character, words and lines in a file.

file="$1"
word_count=$(grep -o '\w\+' "$file" | wc -l)
char_count=$(grep -o . "$file" | wc -l)
line_count=$(grep -c '' "$file")
echo "Number of words: $word_count"
echo "Number of characters: $char_count"
echo "Number of lines: $line_count"


2.  Write a script using egrep command to display a list of specific types of files in the directory.

directory="$1"
types="\.txt$|\.sh$|\.png$"
egrep -l "$types" "$directory"/*


3.  Write a script using sed command to replace all occurrences of a particular word in a given file.
file="$1"
old_word="$2"
new_word="$3"
sed -i "s/$old_word/$new_word/g" "$file"
echo "Replaced all occurrences of '$old_word' with '$new_word'."

4.  Write a script using sed command to print duplicate lines in input.

file="$1"
sed 's/\(.*\)/\1\n\1/' "$file" | sort | uniq -d


5. Write a script using grep that searches for a specific pattern (word or regex) in a given file and prints the matching lines.

file="$1"
pattern="$2"
grep "$pattern" "$file"


6. Write a script using egrep to display lines from a file lines that contain any of the specified patterns.  

file="$1"
patterns="$2"
egrep "$patterns" "$file"


7.  Write a script using sed to remove all blank lines from a file.
file="$1"
sed -i '/^$/d' "$file"
echo "Removed all blank lines from '$file'."








1.Calculator

Code

#!/bin/bash
echo "Enter two numbers: "
read num1
read num2
echo "Choose an operation (+, -, *, /): "
read op

case $op in
    +) echo "Result: $(($num1 + $num2))" ;;
    -) echo "Result: $(($num1 - $num2))" ;;
    \*) echo "Result: $(($num1 * $num2))" ;;
    /) if [ $num2 -ne 0 ]; then
           echo "Result: $(($num1 / $num2))"
       else
           echo "Division by zero is not allowed"
       fi
    ;;
    *) echo "Invalid operation" ;;
esac


Output



2.Simple interest calculation

Code

#!/bin/bash
echo "Enter principal amount: "
read p
echo "Enter rate of interest: "
read r
echo "Enter time (in years): "
read t

# Simple Interest
si=$(echo "scale=2; $p * $r * $t / 100" | bc)
echo "Simple Interest: $si"

# Compound Interest
ci=$(echo "scale=2; $p * (1 + $r / 100) ^ $t - $p" | bc)
echo "Compound Interest: $ci"

Output



3. Large integer finder

Code

#!/bin/bash
echo "Enter three numbers: "
read a
read b
read c

if [ $a -ge $b ] && [ $a -ge $c ]; then
    echo "$a is the largest."
elif [ $b -ge $a ] && [ $b -ge $c ]; then
    echo "$b is the largest."
else
    echo "$c is the largest."
fi

Output



4. Leap Year Calculator

Code

#!/bin/bash
echo "Enter year: "
read year

if (( $year % 400 == 0 )) || (( $year % 4 == 0 && $year % 100 != 0 )); then
    echo "$year is a leap year."
else
    echo "$year is not a leap year."
fi

Output



5. Temp converter

Code

#!/bin/bash
echo "Enter temperature in Fahrenheit: "
read f
c=$(echo "scale=2; ($f - 32) * 5 / 9" | bc)
echo "$f Fahrenheit is $c Centigrade."

Output



6.Circle Area Calculator

Code

#!/bin/bash
echo "Enter the radius of the circle: "
read r

# Area
area=$(echo "scale=2; 3.1416 * $r * $r" | bc)
echo "Area of the circle: $area"

# Circumference
circumference=$(echo "scale=2; 2 * 3.1416 * $r" | bc)
echo "Circumference of the circle: $circumference"

Output











7. Array Finder

Code

#!/bin/bash
echo "Enter elements separated by space: "
read -a arr
echo "Enter element to search: "
read elem

found="no"
for i in "${arr[@]}"; do
    if [ "$i" == "$elem" ]; then
        found="yes"
        break
    fi
done

if [ "$found" == "yes" ]; then
    echo "Element $elem is present in the list."
else
    echo "Element $elem is not found."
fi



Output



8.Str matcher

Code

#!/bin/bash
echo "Enter first string: "
read str1
echo "Enter second string: "
read str2

if [ "$str1" == "$str2" ]; then
    echo "Both strings are equal."
else
    echo "The strings are different."
fi


Output






9.Salary calculator

Code

#!/bin/bash
echo "Enter basic salary: "
read basic_salary

# Calculate DA (Dearness Allowance) as 50% of basic salary
da=$(echo "scale=2; $basic_salary * 0.50" | bc)

# Calculate HRA (House Rent Allowance) as 30% of basic salary
hra=$(echo "scale=2; $basic_salary * 0.30" | bc)

# Total pay calculation
total_pay=$(echo "scale=2; $basic_salary + $da + $hra" | bc)
echo "Employee's Total Pay: $total_pay"



Output



10. Grade calculator

Code

#!/bin/bash
echo "Enter marks obtained: "
read marks

if [ $marks -ge 90 ]; then
    echo "Grade: A"
elif [ $marks -ge 75 ]; then
    echo "Grade: B"
elif [ $marks -ge 50 ]; then
    echo "Grade: C"
else
    echo "Grade: F"
fi



Output



11.Menu caci

Code

#!/bin/bash
echo "Menu-driven Calculator"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Exit"
echo "Enter your choice: "
read choice

while [ $choice -ne 5 ]
do
    echo "Enter two numbers: "
    read num1
    read num2

    case $choice in
        1) result=$(($num1 + $num2))
           echo "Addition: $result" ;;
        2) result=$(($num1 - $num2))
           echo "Subtraction: $result" ;;
        3) result=$(($num1 * $num2))
           echo "Multiplication: $result" ;;
        4) if [ $num2 -ne 0 ]; then
               result=$(($num1 / $num2))
               echo "Division: $result"
           else
               echo "Division by zero is not allowed"
           fi ;;
        *) echo "Invalid choice" ;;
    esac

    echo "Enter your choice again: "
    read choice
done

echo "Exiting Calculator."

Output



12.Dir info

Code

#!/bin/bash

# Display the name of the current directory
echo "Current Directory: $(pwd)"

# List the contents of the current directory
echo "Contents of the current directory:"
ls -l

# Create a new directory
echo "Creating a new directory named 'new_directory'..."
mkdir new_directory
echo "Directory 'new_directory' created."

# Create a new file inside the newly created directory and write some content
echo "Writing content to the new file..."
echo "This is a test file in the new directory" > new_directory/test_file.txt

# Display the contents of the new file
echo "Contents of 'test_file.txt':"
cat new_directory/test_file.txt

# Copy the new directory to a suitable location in your home directory
echo "Copying the 'new_directory' to the home directory..."
cp -r new_directory ~/

# Display the contents of the home directory to verify the copy
echo "Contents of the home directory after copying the 'new_directory':"
ls ~/


Output


1.Write a Shell script for a Menu Driven program to check if entered number is 
1.Even or Odd 
2.Prime 
3.Palindrome 
4.Armstrong

#!/bin/bash

echo "Enter a number:"
read num

while true; do
    echo "Choose an option:"
    echo "1. Check Even or Odd"
    echo "2. Check Prime"
    echo "3. Check Palindrome"
    echo "4. Check Armstrong"
    echo "5. Exit"
    read choice

    case $choice in
        1) if ((num % 2 == 0)); then
               echo "$num is Even"
           else
               echo "$num is Odd"
           fi ;;
        2) is_prime=1
           for ((i = 2; i < num; i++)); do
               if ((num % i == 0)); then
                   is_prime=0
                   break
               fi
           done
           [[ $is_prime -eq 1 ]] && echo "$num is Prime" || echo "$num is not Prime" ;;
        3) rev=$(echo $num | rev)
           if [[ $num == $rev ]]; then
               echo "$num is a Palindrome"
           else
               echo "$num is not a Palindrome"
           fi ;;
        4) sum=0
           temp=$num
           while ((temp > 0)); do
               digit=$((temp % 10))
               sum=$((sum + digit**3))
               temp=$((temp / 10))
           done
           [[ $sum -eq $num ]] && echo "$num is an Armstrong number" || echo "$num is not an Armstrong number" ;;
        5) echo "Exiting..."
           exit ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done








2.Write a shell script to generate a multiplication table of the given number

#!/bin/bash

echo "Enter a number:"
read num

echo "Multiplication Table of $num:"
for ((i = 1; i <= 10; i++))
do
    echo "$num x $i = $((num * i))"
done











3.Write a shell script to print sum of individual digits of a number.

#!/bin/bash

echo "Enter a number:"
read num
sum=0

while [ $num -gt 0 ]
do
    digit=$((num % 10))
    sum=$((sum + digit))
    num=$((num / 10))
done

echo "Sum of digits: $sum"





4.Write a shell script that accepts two integers as its arguments and computes the value of first number
raised to the power of the second number.

#!/bin/bash

echo "Enter base number:"
read base
echo "Enter exponent:"
read exp

result=1
for ((i = 1; i <= exp; i++))
do
    result=$((result * base))
done

echo "$base raised to the power of $exp is: $result"






5.
Write a shell script to read and check if the directory / file exists or not, if not make the directory / file.


#!/bin/bash

echo "Enter the name of the directory or file:"
read name

if [[ -d "$name" ]]; then
    echo "'$name' is a directory and already exists."
elif [[ -f "$name" ]]; then
    echo "'$name' is a file and already exists."
else
    echo "'$name' does not exist."
    echo "Do you want to create a directory (d) or a file (f)?"
    read choice
    if [[ $choice == "d" ]]; then
        mkdir "$name"
        echo "Directory '$name' created successfully."
    elif [[ $choice == "f" ]]; then
        touch "$name"
        echo "File '$name' created successfully."
    else
        echo "Invalid option. No changes made."
    fi
fi

1. Write a script using grep command to find the number of words character, words and lines in a file.

file="$1"
word_count=$(grep -o '\w\+' "$file" | wc -l)
char_count=$(grep -o . "$file" | wc -l)
line_count=$(grep -c '' "$file")
echo "Number of words: $word_count"
echo "Number of characters: $char_count"
echo "Number of lines: $line_count"


2.  Write a script using egrep command to display a list of specific types of files in the directory.

directory="$1"
types="\.txt$|\.sh$|\.png$"
egrep -l "$types" "$directory"/*


3.  Write a script using sed command to replace all occurrences of a particular word in a given file.
file="$1"
old_word="$2"
new_word="$3"
sed -i "s/$old_word/$new_word/g" "$file"
echo "Replaced all occurrences of '$old_word' with '$new_word'."

4.  Write a script using sed command to print duplicate lines in input.

file="$1"
sed 's/\(.*\)/\1\n\1/' "$file" | sort | uniq -d


5. Write a script using grep that searches for a specific pattern (word or regex) in a given file and prints the matching lines.

file="$1"
pattern="$2"
grep "$pattern" "$file"


6. Write a script using egrep to display lines from a file lines that contain any of the specified patterns.  

file="$1"
patterns="$2"
egrep "$patterns" "$file"


7.  Write a script using sed to remove all blank lines from a file.
file="$1"
sed -i '/^$/d' "$file"
echo "Removed all blank lines from '$file'."






1.Calculator

Code

#!/bin/bash
echo "Enter two numbers: "
read num1
read num2
echo "Choose an operation (+, -, *, /): "
read op

case $op in
    +) echo "Result: $(($num1 + $num2))" ;;
    -) echo "Result: $(($num1 - $num2))" ;;
    \*) echo "Result: $(($num1 * $num2))" ;;
    /) if [ $num2 -ne 0 ]; then
           echo "Result: $(($num1 / $num2))"
       else
           echo "Division by zero is not allowed"
       fi
    ;;
    *) echo "Invalid operation" ;;
esac


Output



2.Simple interest calculation

Code

#!/bin/bash
echo "Enter principal amount: "
read p
echo "Enter rate of interest: "
read r
echo "Enter time (in years): "
read t

# Simple Interest
si=$(echo "scale=2; $p * $r * $t / 100" | bc)
echo "Simple Interest: $si"

# Compound Interest
ci=$(echo "scale=2; $p * (1 + $r / 100) ^ $t - $p" | bc)
echo "Compound Interest: $ci"

Output



3. Large integer finder

Code

#!/bin/bash
echo "Enter three numbers: "
read a
read b
read c

if [ $a -ge $b ] && [ $a -ge $c ]; then
    echo "$a is the largest."
elif [ $b -ge $a ] && [ $b -ge $c ]; then
    echo "$b is the largest."
else
    echo "$c is the largest."
fi

Output



4. Leap Year Calculator

Code

#!/bin/bash
echo "Enter year: "
read year

if (( $year % 400 == 0 )) || (( $year % 4 == 0 && $year % 100 != 0 )); then
    echo "$year is a leap year."
else
    echo "$year is not a leap year."
fi

Output



5. Temp converter

Code

#!/bin/bash
echo "Enter temperature in Fahrenheit: "
read f
c=$(echo "scale=2; ($f - 32) * 5 / 9" | bc)
echo "$f Fahrenheit is $c Centigrade."

Output



6.Circle Area Calculator

Code

#!/bin/bash
echo "Enter the radius of the circle: "
read r

# Area
area=$(echo "scale=2; 3.1416 * $r * $r" | bc)
echo "Area of the circle: $area"

# Circumference
circumference=$(echo "scale=2; 2 * 3.1416 * $r" | bc)
echo "Circumference of the circle: $circumference"

Output











7. Array Finder

Code

#!/bin/bash
echo "Enter elements separated by space: "
read -a arr
echo "Enter element to search: "
read elem

found="no"
for i in "${arr[@]}"; do
    if [ "$i" == "$elem" ]; then
        found="yes"
        break
    fi
done

if [ "$found" == "yes" ]; then
    echo "Element $elem is present in the list."
else
    echo "Element $elem is not found."
fi



Output



8.Str matcher

Code

#!/bin/bash
echo "Enter first string: "
read str1
echo "Enter second string: "
read str2

if [ "$str1" == "$str2" ]; then
    echo "Both strings are equal."
else
    echo "The strings are different."
fi


Output






9.Salary calculator

Code

#!/bin/bash
echo "Enter basic salary: "
read basic_salary

# Calculate DA (Dearness Allowance) as 50% of basic salary
da=$(echo "scale=2; $basic_salary * 0.50" | bc)

# Calculate HRA (House Rent Allowance) as 30% of basic salary
hra=$(echo "scale=2; $basic_salary * 0.30" | bc)

# Total pay calculation
total_pay=$(echo "scale=2; $basic_salary + $da + $hra" | bc)
echo "Employee's Total Pay: $total_pay"



Output



10. Grade calculator

Code

#!/bin/bash
echo "Enter marks obtained: "
read marks

if [ $marks -ge 90 ]; then
    echo "Grade: A"
elif [ $marks -ge 75 ]; then
    echo "Grade: B"
elif [ $marks -ge 50 ]; then
    echo "Grade: C"
else
    echo "Grade: F"
fi



Output



11.Menu caci

Code

#!/bin/bash
echo "Menu-driven Calculator"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Exit"
echo "Enter your choice: "
read choice

while [ $choice -ne 5 ]
do
    echo "Enter two numbers: "
    read num1
    read num2

    case $choice in
        1) result=$(($num1 + $num2))
           echo "Addition: $result" ;;
        2) result=$(($num1 - $num2))
           echo "Subtraction: $result" ;;
        3) result=$(($num1 * $num2))
           echo "Multiplication: $result" ;;
        4) if [ $num2 -ne 0 ]; then
               result=$(($num1 / $num2))
               echo "Division: $result"
           else
               echo "Division by zero is not allowed"
           fi ;;
        *) echo "Invalid choice" ;;
    esac

    echo "Enter your choice again: "
    read choice
done

echo "Exiting Calculator."

Output



12.Dir info

Code

#!/bin/bash

# Display the name of the current directory
echo "Current Directory: $(pwd)"

# List the contents of the current directory
echo "Contents of the current directory:"
ls -l

# Create a new directory
echo "Creating a new directory named 'new_directory'..."
mkdir new_directory
echo "Directory 'new_directory' created."

# Create a new file inside the newly created directory and write some content
echo "Writing content to the new file..."
echo "This is a test file in the new directory" > new_directory/test_file.txt

# Display the contents of the new file
echo "Contents of 'test_file.txt':"
cat new_directory/test_file.txt

# Copy the new directory to a suitable location in your home directory
echo "Copying the 'new_directory' to the home directory..."
cp -r new_directory ~/

# Display the contents of the home directory to verify the copy
echo "Contents of the home directory after copying the 'new_directory':"
ls ~/


Output


1.Write a Shell script for a Menu Driven program to check if entered number is 
1.Even or Odd 
2.Prime 
3.Palindrome 
4.Armstrong

#!/bin/bash

echo "Enter a number:"
read num

while true; do
    echo "Choose an option:"
    echo "1. Check Even or Odd"
    echo "2. Check Prime"
    echo "3. Check Palindrome"
    echo "4. Check Armstrong"
    echo "5. Exit"
    read choice

    case $choice in
        1) if ((num % 2 == 0)); then
               echo "$num is Even"
           else
               echo "$num is Odd"
           fi ;;
        2) is_prime=1
           for ((i = 2; i < num; i++)); do
               if ((num % i == 0)); then
                   is_prime=0
                   break
               fi
           done
           [[ $is_prime -eq 1 ]] && echo "$num is Prime" || echo "$num is not Prime" ;;
        3) rev=$(echo $num | rev)
           if [[ $num == $rev ]]; then
               echo "$num is a Palindrome"
           else
               echo "$num is not a Palindrome"
           fi ;;
        4) sum=0
           temp=$num
           while ((temp > 0)); do
               digit=$((temp % 10))
               sum=$((sum + digit**3))
               temp=$((temp / 10))
           done
           [[ $sum -eq $num ]] && echo "$num is an Armstrong number" || echo "$num is not an Armstrong number" ;;
        5) echo "Exiting..."
           exit ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done








2.Write a shell script to generate a multiplication table of the given number

#!/bin/bash

echo "Enter a number:"
read num

echo "Multiplication Table of $num:"
for ((i = 1; i <= 10; i++))
do
    echo "$num x $i = $((num * i))"
done











3.Write a shell script to print sum of individual digits of a number.

#!/bin/bash

echo "Enter a number:"
read num
sum=0

while [ $num -gt 0 ]
do
    digit=$((num % 10))
    sum=$((sum + digit))
    num=$((num / 10))
done

echo "Sum of digits: $sum"





4.Write a shell script that accepts two integers as its arguments and computes the value of first number
raised to the power of the second number.

#!/bin/bash

echo "Enter base number:"
read base
echo "Enter exponent:"
read exp

result=1
for ((i = 1; i <= exp; i++))
do
    result=$((result * base))
done

echo "$base raised to the power of $exp is: $result"






5.
Write a shell script to read and check if the directory / file exists or not, if not make the directory / file.


#!/bin/bash

echo "Enter the name of the directory or file:"
read name

if [[ -d "$name" ]]; then
    echo "'$name' is a directory and already exists."
elif [[ -f "$name" ]]; then
    echo "'$name' is a file and already exists."
else
    echo "'$name' does not exist."
    echo "Do you want to create a directory (d) or a file (f)?"
    read choice
    if [[ $choice == "d" ]]; then
        mkdir "$name"
        echo "Directory '$name' created successfully."
    elif [[ $choice == "f" ]]; then
        touch "$name"
        echo "File '$name' created successfully."
    else
        echo "Invalid option. No changes made."
    fi
fi

1. Write a script using grep command to find the number of words character, words and lines in a file.

file="$1"
word_count=$(grep -o '\w\+' "$file" | wc -l)
char_count=$(grep -o . "$file" | wc -l)
line_count=$(grep -c '' "$file")
echo "Number of words: $word_count"
echo "Number of characters: $char_count"
echo "Number of lines: $line_count"


2.  Write a script using egrep command to display a list of specific types of files in the directory.

directory="$1"
types="\.txt$|\.sh$|\.png$"
egrep -l "$types" "$directory"/*


3.  Write a script using sed command to replace all occurrences of a particular word in a given file.
file="$1"
old_word="$2"
new_word="$3"
sed -i "s/$old_word/$new_word/g" "$file"
echo "Replaced all occurrences of '$old_word' with '$new_word'."

4.  Write a script using sed command to print duplicate lines in input.

file="$1"
sed 's/\(.*\)/\1\n\1/' "$file" | sort | uniq -d


5. Write a script using grep that searches for a specific pattern (word or regex) in a given file and prints the matching lines.

file="$1"
pattern="$2"
grep "$pattern" "$file"


6. Write a script using egrep to display lines from a file lines that contain any of the specified patterns.  

file="$1"
patterns="$2"
egrep "$patterns" "$file"


7.  Write a script using sed to remove all blank lines from a file.
file="$1"
sed -i '/^$/d' "$file"
echo "Removed all blank lines from '$file'."










