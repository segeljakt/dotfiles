#!/usr/bin/zsh
file=$1; line=$2; num_lines=$3; half=$(($num_lines/2))
if [[ $line -le $half ]]; then
  start=1
else
  start=$(($line-$half))
fi
stop=$(($start+$num_lines))
/bin/cat $file | \
awk -v line=$line -v start=$start -v stop=$stop '{
  if (NR == line) {
    print "\033[41m" $0 "\033[0m"
  } else if (NR >= stop) {
    exit 1
  } else if (NR >= start && NR < stop) {
    print $0
  }
}'
