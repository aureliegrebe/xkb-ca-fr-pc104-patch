#!/bin/bash

patches=( guillemet.patch degree.patch )

usage="$(basename "$0") [-h] [-f LAYOUT_FILE] [-b BACKUP_FILE]
Installs patches to X11 keyboard layout files

where:
    -h  show this help text
    -f  specify layout_file
    -b  specify bakup file location"

key_file=/usr/share/X11/xkb/symbols/ca
bak_file=$key_file.BAK

while getopts ':hfb:' option; do
  case "$option" in
    h|--help) echo "$usage"
       exit
       ;;
    f) key_file=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
    b) bak_file=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))

# Backup file
cp -i $key_file $bak_file

# Apply patches
for PATCH in "${patches[@]}"
do
	patch $key_file $PATCH
done


