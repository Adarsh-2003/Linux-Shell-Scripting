# creates an Ascii art text file with the word "Hello"
figlet "Hello" > welcome.txt
cat welcome.txt

# wildcards
touch file1.txt file2.txt file3.txt
ls *.txt # List all .txt files , * is a wildcard
ls file* # List all files starting with "file"

# Create note_1.txt to note_5.txt
touch note_{1..5}.txt
ls note_*.txt # List all note files

# ctrl + L to clear the terminal

