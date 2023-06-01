# headernorm-42
## Description:
"headernorm" is a bash script that checks the headers of all .c and .h files in the current directory and its subdirectories. It also passes the norminette, a code style checker used in the 42 cursus.

## Features:
Check file ownership: The script verifies if the files were created and uploaded by a single user. It displays an "OK" message if there is only one user associated with the files. If there are multiple users, it shows a warning message along with the usernames of those who created or uploaded the files.

Norminette check: The script also checks the norminette to ensure code compliance. If everything is in order, it displays a success message. In case of any issues with the norm, it shows a warning message and provides details of the norm violations.

## Usage:
Execute the script: Run the script by executing it in the desired directory.

### Alias setup: 
To simplify the usage, you can add an alias to your shell configuration file (e.g., .bashrc, .zshrc) so that you can call it like the norminette. Here's an example alias setup:

```
alias headernorm="bash /path/to/headernorm.sh"
```
Note: Replace "/path/to/headernorm-42.sh" with the actual path to the "headernorm-42.sh" script.

## Requirements:
Bash shell environment
Norminette (ensure it is installed and available in the system's PATH)

## Disclaimer:
Please note that "headernorm-42" is a personal project and not an official tool. It is intended for personal use and may not cover all possible scenarios. Use it at your own risk.

Feel free to customize and modify the script according to your needs.

 Enjoy using "headernorm-42"!
