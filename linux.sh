# ========== ⚙️ SYSTEM MONITORING ==========

whoami                                       # Current user
id                                           # User and group IDs
ls                                           # List files in current directory
htop                                         # System monitor
pwd                                          # Prints present working directory

ps aux                                       # All running processes
kill 1234                                    # Kill by PID (process ID)
cal 2025                                     #show calendar for entire 2025
expr 2 + 3                                   # Basic arithmetic
figlet "Interstellar"                        # Display text in large ASCII art

sudo apt update                              # Update packages
sudo apt install htop                        # Install htop system monitor
# apt is a package manager for Debian-based systems
# dnf is a package manager for Fedora-based systems
# yum is a package manager for older versions of Fedora and CentOS

# List contents
ls
ls -l                   # List with details
ls -a                   # List all files (including hidden)
ls -la                  # List all files with details
ls -ld ~/test-dir       # List directory itself
ls -l testdir           # List directory contents

# ========== 🧑‍💻 USER ACCOUNT MANAGEMENT ==========

# sudo: Stands for "SuperUser DO"
# bash: Bourne Again SHell
# su: Switch User

# Create users
sudo useradd joker
sudo useradd -d /home/gotham batman # Create user with custom directory (here it is home)
sudo useradd -m bob # Create user with custom directory

sudo usermod -aG sudo joker 
# usermod is the command to modify user accounts
# -aG means "append to Group" (add to a group without removing from other groups)
# sudo is the group we're adding the user to
# joker is the user we're modifying

# Set user passwords
sudo passwd joker
sudo passwd batman

# Lock and unlock user accounts
sudo passwd -l joker   # Lock account
sudo passwd -u joker   # Unlock account

# Modify user details
sudo usermod -d /home/arkham joker           # Change home directory
sudo usermod -s /bin/bash batman             # Change shell
sudo usermod -aG sudo joker                  # Add user to sudo group

# Delete users
sudo userdel joker                           # Delete user (keep home)
sudo userdel -r batman                       # Delete user and home directory
sudo userdel -r bob                          # Example with full deletion

# Check user info
sudo grep -w 'joker' /etc/passwd             # Check user details
sudo passwd -S joker                         # Check password status
id joker                                     # View UID, GID, groups
groups joker                                 # View group membership

# Switch user
su - joker
exit

# ========== 📂 FILE AND DIRECTORY OPERATIONS ==========

# Create files and directories

cd ~                    # The ~ is a shortcut for your home directory.
cd ~/project            # /home/project
touch example.txt       # Create empty file
mkdir test-dir
mkdir -p new-dir/subdir

# Write content to files
echo "this is file1" > file1

# Copy files and directories
cp file1.txt file1_copy.txt # Copy file
cp -r testdir testdir_copy # Copy directory and its contents
cp ~/.zshrc ~/Desktop/zshrc-copy # Copy hidden file
cp -r ~/Code ~/Desktop # Copy directory to Desktop

# Move and rename
mv file1.txt newname.txt # Rename file
mv newname.txt testdir/ # Move newname to testdir directory
mv testdir_copy new_testdir # Move testdir_copy directory to new_testdir directory
mv testdir/newname.txt ./original_file1.txt  # Move file to current directory
mv ~/Desktop/Code ~/Desktop/Code-move

# Remove files and directories
rm file2.txt
rm -i file3.txt # Interactive remove (ask before deleting)
rm -rf some_dir # Force remove directory and its contents (use mindefully)
rm -rf /        # Force remove everything ( wont work )
sudo rm -rf --no-preserve-root /* # 💀 iykyk
rmdir emptydir  # Only works if empty

# ========== 🧭 NAVIGATION ==========

pwd                                          # Show current directory
cd ~                                         # Go to home directory
cd /home/labex/project                       # Go to project directory
cd ..                                        # Go up one level
cd ~/Desktop && ls                           # Chain commands

# ========== 🔍 VIEW AND COMPARE FILES ==========

cat file.txt                                 # Show file content , -n for line numbers
head file.txt                                # First 10 lines
tail file.txt                                # Last 10 lines
diff file1 file2                             # Compare files
diff -r ~/Desktop ~/Code                     # Compare directories recursively

# ========== 🔐 FILE PERMISSIONS AND OWNERSHIP ==========

# Check file permissions
ls -l example.txt


# Permssions using numeric notation :

# 700 is a numeric representation of permissions:
# 7 - represents the owner's permissions.
# 0 - represents the group's permissions.
# 0 - represents the others' permissions.

# Each digit is a number from 0 to 7, calculated by adding the values 
# for read (4), write (2), and execute (1) permissions:

# So, 
# 7 (first digit) gives the owner read (4), write (2), and execute (1) permissions: 4+2+1=7
# 0 (second digit) gives the group no permissions (0+0+0=0).
# 0 (third digit) gives others no permissions (0+0+0=0).

# Therefore, 700 means: Owner: read, write, execute - Group: none - Others: none

# Change permissions (numeric)
chmod 700 example.txt                        # Owner full access, others none
chmod -R 755 ~/test-dir                      # Owner full access, group/others read+execute


# Permssions using symbolic notation :

u = user (owner)
g = group
o = others
a = all (user, group, others)
+ = add permission
- = remove permission

eg. u+x = add execute permission to user
eg. g-w = remove write permission from group
eg. ug+rwx = add read write and execute permission to user and group
eg. a+rw = add read and write permission to all

# Change permissions (symbolic)
chmod u+x script.sh                          # Add execute to owner
chmod g-w file.txt                           # Remove write from group
chmod o+r file.txt                           # Add read to others

# Change ownership
sudo chown user1:group1 target_file          # Change file owner & group
sudo chown root:root example.txt             # Set file to root ownership
sudo chown -R root:root new-dir              # Recursively change dir ownership