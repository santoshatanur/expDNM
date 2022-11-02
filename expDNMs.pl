#! /usr/bin/perl

$num = @ARGV;

if($num < 3 || $num > 3)
 {
    die "Too few or many arguments\nUsage: perl expDNMs.pl <Trinucleotide mutability> <Fasta sequences> <Cohort size>"; 
 }

open(TRI,$ARGV[0]) || die "unable to open file";

while(<TRI>)
  {
     $line=$_;
     chomp $line;
     push(@tri,$line);
  }

$cohort = $ARGV[2];

open(SEQ,$ARGV[1]) || die "unable to open file";

print "Enhancer\tExpDNMsIndividual\tExpDNMsCohort\n";
while(<SEQ>)
  {
     $line=$_;
     chomp $line;
     @a=split("\t",$line);
     $id = $a[0];
     $seq= uc($a[1]);
     $seq_mut = 0;
     $l=length($seq);
     $l2 = $l-2;
     $Ncount = ($seq =~ tr/N//); 

     next if $Ncount == $l;
     
     for($i=0;$i<=$l;$i++)
      {
         $subseq = substr($seq,$i,3);
         for($j=0;$j<=$#tri;$j++)
          {
             $tr=$tri[$j];
             @b=split(" ",$tr);
             if($b[0] eq $subseq)
               {
                   $seq_mut = $seq_mut + ($b[2] * 2);
               }
          }
      }
     $cohort_mut=$seq_mut * $cohort;
     print "$id\t$seq_mut\t$cohort_mut\n";
     $tot_mut = $tot_mut + $seq_mut;
     $tot_cohort_mut=$tot_cohort_mut+$cohort_mut;
  }
print "Expected number of DNMs per individual in enhancer set: $tot_mut\n";
print "Expected number of DNMs in cohort of $cohort individuals:$tot_cohort_mut\n";
