#!/bin/bash
# Author: crypt0rr - https://github.com/crypt0rr/

# Requirements
if [[ "$STATICCONFIG" = true ]]; then
    source hash-cracker.conf
else
    source scripts/selectors/hashtype.sh
    source scripts/selectors/hashlist.sh
fi

# Cleanup
function clean_up {
    rm $tmp analysis.rule analysis-sorted.word analysis.word analysis-sorted.rule 2>/dev/null
    exit
}

trap clean_up SIGINT SIGTERM

# Temporary Files
tmp=$(mktemp /tmp/hash-cracker-tmp.XXXX)

# Logic
cat $POTFILE | awk -F: '{print $NF}' | tee $tmp &>/dev/null
python2 scripts/extensions/pack/rulegen.py $tmp
rm analysis-sorted.word analysis.word analysis-sorted.rule

source scripts/selectors/wordlist.sh

$HASHCAT $KERNEL --bitmap-max=24 $HWMON --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST $WORDLIST -r analysis.rule $LOOPBACK
rm analysis.rule $tmp
echo -e "\nPACK rule processing done\n"