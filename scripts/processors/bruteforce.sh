#!/bin/bash
# Copyright crypt0rr

# Requirements
source scripts/selectors/hashtype.sh
source scripts/selectors/hashlist.sh

# Logic
$HASHCAT -O --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST -a3 '?a?a?a?a?a' --increment
$HASHCAT -O --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST -a3 '?l?l?l?l?l?l?l?l' --increment
$HASHCAT -O --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST -a3 '?u?u?u?u?u?u?u?u' --increment
$HASHCAT -O --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST -a3 '?d?d?d?d?d?d?d?d?d?d' --increment
$HASHCAT -O --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST -a3 '?1?1?1?1?1?1?1' -1 '?l?d?u' --increment
$HASHCAT -O --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST -a3 '?1?1?1?1?2?2?2?2' -1 '?l?u' -2 '?d' --increment
$HASHCAT -O --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST -a3 '?1?1?1?1?2?2?2?2' -1 '?d' -2 '?l?u' --increment
echo -e "\n\e[32mBrute force processing done\e[0m\n"