# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    headernorm.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juan-aga <juan_aga@student.42malaga.c      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/18 14:39:58 by juan-aga          #+#    #+#              #
#    Updated: 2022/11/22 12:05:54 by juan-aga         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#COLORS
R='\033[0;31m'
LR='\033[1;31m'
LG='\033[1;32m'
G='\033[0;32m'
B='\033[1;36m'
D='\033[0m'
W='\033[1;37m'
LGR='\033[0;37m'
Y='\033[1;33m'

# For change definition of Internal Field Separator
oldifs="$IFS"
IFS=$'$'

#Variables
CREATED=$(find . -type f \( -name "*.[ch]" \) | xargs cat | grep Created | awk '{print $6}' | sort -u | wc -l | awk '{print $1}')
USERS=(`find . -type f \( -name "*.[ch]" \) | xargs cat | grep Created | awk '{print $6}' | sort -u | cat -e`)
UPDATED=$(find . -type f \( -name "*.[ch]" \) | xargs cat | grep Updated | awk '{print $6}' | sort -u | wc -l | awk '{print $1}')
UPUSERS=(`find . -type f \( -name "*.[ch]" \) | xargs cat | grep Updated | awk '{print $6}' | sort -u | cat -e`)
NORM=$(norminette | awk '{print $2}' | uniq | wc -l | awk '{print $1}')
OK=$(norminette | awk '{print $2}' | sort -u)
KO=$(norminette | grep -v OK)

#clear the screen
clear

#Create separators
i=0
as="|"
min="-"
while [ $i -le 80 ]
do
	as=$(echo "|$as")
	min=$(echo "-$min")
	((i++))
done

#Print sepators
printf "${B}"
printf '%s\n%s\n%s\n' "${min}" "${as}" "${min}"
printf "${D}"

if [ $CREATED == 0 ]; then
	printf "${Y}No files .c or .h to check\n"
	printf "${B}"
	printf '%s\n%s\n%s\n' "${min}" "${as}" "${min}"
	printf "${D}" 
	exit
else
	if [ $CREATED == 1 ]; then
		printf "${G}All files was created by ${LG}${USERS[@]}\n${D}"
	else
		printf "${Y}It's ok if it was created by a group of $CREATED.\nCreated by:\n${W}"
		i=0
		for i in "${USERS[@]}"
		do
			printf '%s' "$i"
			((i++))
		done
		printf "\n${D}"
	fi
	printf "${B}"
	printf '%s\n%s\n%s\n' "${min}" "${as}" "${min}"
	printf "${D}" 
fi

if [ $UPDATED == 1 ]; then
	printf "${G}All files was updated by ${LG}${UPUSERS[@]}${D}\n"
else
	printf "${Y}The files was updated by $UPDATED.\nUpdated by:\n${W}"
	printf '%s' "${UPUSERS[@]}" ; printf "\n${D}"
fi

printf "${B}"
printf '%s\n%s\n%s\n' "${min}" "${as}" "${min}"
printf "${D}" 

if [ $NORM == 1 ]; then
	if [ $OK == "OK!" ]; then
		printf "${G}All the .c and .h are OK with the norm${D}\n"
	else
		printf "${R}There are some problems with the norm\n${LR}$KO\n${D}"
	fi
else
	if [ $NORM == 0 ]; then
		printf "\n"
	else
		printf "${R}There are some problems with the norm\n${LR}$KO\n${D}"
	fi
fi

printf "${B}"
printf '%s\n%s\n%s\n' "${min}" "${as}" "${min}"
printf "${D}" 
