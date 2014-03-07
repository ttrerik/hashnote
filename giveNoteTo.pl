#!/usr/bin/perl
use strict;
use warnings;
use Term::ANSIColor;

test();

my $note =  getOctalValue(@ARGV);
print "Note: ";
print color 'red';
print "$note\n";
print color 'reset';


sub test{
        peutConvertirChaineValeur();
        peutConvertirTableauValeur();
}


sub getOctalValue{
        my $res = 0;
        foreach (@_) {
                for(my $i=0; $i < length($_); $i++){
                        $res = $res + ord(substr($_,$i));
                }
        }
        return 11+($res%10);
}


sub peutConvertirChaineValeur{
        my $chaine = "test";
        testOk("Convertir une chaine en valeur numérique") && return if (getOctalValue($chaine) =~ /^[0-9]+$/);
        testKo("Convertir une chaine en valeur numérique");
}

sub peutConvertirTableauValeur{
        my @tableau = ("test","test","test");
        testOk("Convertir un tableau en valeur numérique") && return if (getOctalValue(@tableau) =~ /^[0-9]+$/);
        testKo("Convertir un tableau en valeur numérique");
}

sub testOk{
        my ($label) = @_;
        print color 'yellow';
        print "$label ";
        print color 'green';
        print "OK\n";
        print color 'reset';
}
sub testKo{
        my ($label) = @_;
        print color 'yellow';
        print "$label ";
        print color 'red';
        print "KO\n";
        print color 'reset';
}
