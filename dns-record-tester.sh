#! /bin/bash
#case_study.sh
#author=shxim
#greeting
day=$(date +%A)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
reset=$(tput sgr0)
greeting()
{
  echo -e "welcome ${red} $USER ${reset} !. \n today is ${red} $day ${reset}. \n you are using ${red} $SHELL ${reset} shell"
}
#dns_enum
dns_enum()
{
  for lss in a aaaa cname mx txt; do
    echo "${yellow} $lss of $dom ${reset}"
    dig $dom $lss +short
    echo "${blue} *********************************** ${reset}"
  done
}
#menu
menu()
{
  echo " 1: to find the a record"
  echo " 2: to find the aaaa record"
  echo " 3: to find the cname record"
  echo " 4: to find the mx record"
  echo " 5: to find the txt record"
  echo " 6: to find  all"
 read -p " ${yellow}press an option from the bottom ${reset}:" opt
}
#case_stat
case_stat()
{
  case $opt in
    1 )
    ipv4=$(dig $dom a +short)
    echo "the ipv4 of the ${green} $dom ${reset} is ${green} $ipv4 ${reset}"
    echo "**************domain search is completed***************";;
    2 )
    ipv6=$(dig $dom aaaa +short)
    echo "the ipv6 of the  ${green} $dom ${reset} is ${green} $ipv6 ${reset}"
    echo "**************domain search is completed***************";;
    3 )
    cname=$(dig $dom cname +short)
    echo "the cname of the  ${green} $dom ${reset} is ${green} $cname ${reset}"
    echo "**************domain search is completed***************";;
    4 )
    mx=$(dig $dom mx +short)
    echo "the mx of the  ${green} $dom ${reset} is ${green} $mx ${reset}"
    echo "**************domain search is completed***************";;
    5 )
    txt=$(dig $dom txt +short)
    echo " the txt of  ${green} $dom ${reset} is ${green} $txt ${reset}"
    echo "**************domain search is completed***************";;
    6 )
     dns_enum
    echo "************all domain dns_enum search is completed**************"

  esac
}

#main scripting
greeting
menu
read -p "${blue} enter a domain ${reset} :" dom
case_stat
