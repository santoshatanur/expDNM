# Description 
Code to calculate expected number of DNMs in genomic sequence

## Calculating expected number of DNMs

The script requires three arguments which include two input files.

1) First file is the trinucleotide mutation probability table obtained from Samocha et al (Nature Genetics, 2014).
2) The second file contaning one enhancer sequence per line in tab delimited fasta format.
3) The third argument is the cohort size.

````
perl expDNMs.pl <trinucleotide mutation probability> <input sequence in fasta format> <cohort size>

example:

perl expDNMs.pl ./data/1KG_mutation_rate_table.txt ./data/test.fasta 100 > test_out.txt

````

