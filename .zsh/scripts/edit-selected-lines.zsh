
echo $@ | \
awk '
  BEGIN {
    FS=":"
    RS=" "
  } {
    if(NR == 1) {
      print $1 " +" $2
    } else {
      print " +\"tabnew +" $2 " " $1 "\""
    }
  }
  END {
    print " +tabfirst\n"
  }
' | \
tr '\n' ' ' | \
xargs -o $EDITOR
