#this will hopefully allow the user to find perfect matches when running BLAST 

#usage = ./find_perfect_matches.sh <query file> <subject file> <output file>
# input types = query ($1), subject ($2), output ($3)

#! usr/bin/bash


blastn -query $1 -subject $2 -task blastn-short -outfmt "6 qseqid sseqid qlen slen pident length" -out temp_file.blast

awk '$5 == 100.000 && $3 == $6' temp_file.blast > "$3"

rm temp_file.blast

wc -l "$3"
