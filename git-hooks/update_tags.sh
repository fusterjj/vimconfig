#!/bin/sh
ROOT=/c/Project_files/project
INDEX_ROOT=/c/Project_files/project/.git
PATHS="
   $ROOT/path1
   $ROOT/path2"

(
   echo
   for P in $PATHS
   do
#TODO check for system type here
      #echo find $P -iname "*.[chs]" -o -iname "*.[ppc]"
      find $P -iname "*.[chs]" -o -iname "*.[ppc]" | cygpath -w -f -
   done
) > $INDEX_ROOT/cscope.files

cd $INDEX_ROOT && cscope -b -q -k
cd $INDEX_ROOT && ctags -L cscope.files
