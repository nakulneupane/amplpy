#!/bin/bash

NG=$1
AMPL_EXE="$HOME/ampl.linux-intel64/ampl"
WORKDIR="$HOME/Nakul/AMPL"

cd "$WORKDIR" || exit

mkdir -p results/NG_${NG}

echo "Running NG = ${NG}"

TEMPFILE="temp_${NG}.mod"

for A in 1000 1500 2000 2500 3000 3500 4000
do
for B in 2030 2033 2036 2039 2042 2045
do
for C in 25 50 75 100 125
do
for D in 0.04 0.05 0.06 0.07 0.08
do

    LABEL="h2end${A}_yr${B}_ccs${C}_scrap${D}"
    OUTFILE="results/NG_${NG}/${LABEL}.txt"

    echo "Running ${LABEL}"

    cp template.mod "$TEMPFILE"

    sed -e "s/NGVAL/${NG}/g" \
        -e "s/H2ENDVAL/${A}/g" \
        -e "s/H2YEARVAL/${B}/g" \
        -e "s/CCSVAL/${C}/g" \
        -e "s/SCRAPVAL/${D}/g" \
        "$TEMPFILE" > tmpfile && mv tmpfile "$TEMPFILE"

    "$AMPL_EXE" "$TEMPFILE" > "$OUTFILE" 2>&1

done
done
done
done

echo "DONE NG = ${NG}"
