#! /bin/bash

DIR=$1;

echo "Sample $DIR ""Duplicated Files:" $(rfdir $DIR|rev|cut -d '_' -f 3-|rev|awk '{print $9}'|sort|uniq -c|grep -vP '^\s*1'|wc -l)  "Zero Size Files: " $(rfdir $DIR|grep -c ' 0 ')
#echo "Duplicated Files:" $(rfdir $DIR|rev|cut -d '_' -f 3-|rev|awk '{print $9}'|sort|uniq -c|grep -vP '^\s*1'|wc -l)
rfdir $DIR|rev|cut -d '_' -f 3-|rev|awk '{print $9}'|sort|uniq -c|grep -vP '^\s*1'|awk '{print "'$DIR'/"$2" has "$1" replicas"}'
#echo "Zero Size Files: " $(rfdir $DIR|grep -c ' 0 ')
rfdir $DIR|grep ' 0 '|awk '{print "'$DIR'/"$9" has zero size"}';

