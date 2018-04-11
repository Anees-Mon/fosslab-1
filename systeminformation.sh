#Gives Linux Standard Base and distribution specific system
x=$(lsb_release -a)

#Show all Available shells
cat /etc/shells

#show mouse settings
echo $(xinput --list --short)

#Show Computer CPU information

echo $(sudo dmidecode -t4)

#Show memory Information
echo $(free -m)

#Show hard disk

echo $(sudo dmidecode -t memory)

#File system(Mounted)
echo $(sudo fdisk -l)
