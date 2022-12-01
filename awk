# Only print when line number > 4
awk 'NR > 4 {print $0}'
# vim: set ft=sh
