#!/bin/sh
# Distribution list
email_addr=z@quadramed.com

sitename=Arnot

instance5_1=""                  # enter multiple QCPR 5.0.x 5.1 domains seperated by a space
                                # i.e "FGHDEV1 FGHTRN1" if no domains exist, leave blank ""

instance5_2="AOMPROD1"          # enter multiple QCPR 5.2 domains seperated by a space
                                # i.e "FGHTST1 FGHPMAN1" if no domains exist, leave blank ""
script_path=/usr/local/bin

###

# Parse Function
f_parse()
{

linecount=$(sed -n '$=' $script_path/freecnt.tmp)
curline=1

if [ -f $script_path/freecnt.csv ]
then
rm $script_path/freecnt.csv
fi

# CSV conversion loop
while [ $curline -le $linecount ]
do

# Concat broken lines
if [[ "$(sed -n $curline,$curline'p' $script_path/freecnt.tmp | sed -n '$s/.*\(.\)$/\1/p')" = "/" && "$(sed -n $((curline+1)),$((curline+1))'p' $script_path/freecnt.tmp | awk '{print $1}')" = "Unlimited" ]]
then
echo "$(sed -n $curline,$curline'p' $script_path/freecnt.tmp) $(sed -n $((curline+1)),$((curline+1))'p' $script_path/freecnt.tmp)" | awk '{ gsub(/ /,","); print }' >> $script_path/freecnt.csv
curline=$((curline+2))
continue
fi

# Process heading lines
if [[ $curline = 1 || $curline = 2 ]]
then
sed -n $curline,$curline'p' $script_path/freecnt.tmp >> $script_path/freecnt.csv
curline=$((curline+1))
continue
fi

# Replace category row
if [ $curline = 3 ]
then
echo "Database,Max Size,Size,Available,%Free,Disk Free" >> $script_path/freecnt.csv
curline=$((curline+1))
continue
fi

# Parse remaining results
sed -n $curline,$curline'p' $script_path/freecnt.tmp | awk '{ gsub(/ /,","); print }' >> $script_path/freecnt.csv
curline=$((curline+1))

done

if [ -f $script_path/freecnt.tmp ]
then
rm $script_path/freecnt.tmp
fi

}

###

# 5.1 instance loop
for instance_x in $instance5_1
do
status=`/usr/bin/ccontrol list $instance_x | grep status | sed 's/,//g' | awk '{print $2}'`
if [ "$status" = "running" ]
then
        if [ -f $script_path/freecnt.tmp ]
        then
                rm $script_path/freecnt.tmp
        fi
cat <<-'!' | csession $instance_x
zn "%SYS"
d ^%FREECNT
*
/usr/local/bin/freecnt.tmp

h
!
fi

# First parse
sed 's/^[ \t]*//;s/[ \t]*$//;s/\/Unlimited/,Unlimited/;s/<-//;s/^[ \t]*//;s/[ \t]*$//;s/  */\ /g' $script_path/freecnt.tmp | awk '$0!~/^$/ { print }' > $script_path/freecnt.new
mv $script_path/freecnt.new $script_path/freecnt.tmp

# Call database space parse function
f_parse

# Email result and remove temporary files
(echo "Attached";uuencode $script_path/freecnt.csv "$instance_x"_space_`date +"%D"`.csv) | mailx -s "$sitename: $instance_x `date +"%D"` Free Database Space Check" "$email_addr"
rm $script_path/freecnt.csv

done

###

# 5.2 normal security instance loop
for instance_y in $instance5_2
do
status=`/usr/bin/ccontrol list $instance_y | grep status | sed 's/,//g' | awk '{print $2}'`
if [ "$status" = "running" ]
then
        if [ -f $script_path/freecnt.tmp ]
        then
                rm $script_path/freecnt.tmp
        fi
cat <<-'!' | csession $instance_y -BV


d ^%FREECNT
*
/usr/local/bin/freecnt.tmp

h
!
fi

# First parse
sed 's/^[ \t]*//;s/[ \t]*$//;s/\/Unlimited/,Unlimited/;s/<-//;s/^[ \t]*//;s/[ \t]*$//;s/  */\ /g' $script_path/freecnt.tmp | awk '$0!~/^$/ { print }' > $script_path/freecnt.new
mv $script_path/freecnt.new $script_path/freecnt.tmp

# Call database space parse function
f_parse

# Email result and remove temporary files
(echo "Attached";uuencode $script_path/freecnt.csv "$instance_y"_space_`date +"%D"`.csv) | mailx -s "$sitename: $instance_y `date +"%D"` Free Database Space Check" "$email_addr"
rm $script_path/freecnt.csv

done

###
