package getnpost;
use CGI::Carp qw(fatalsToBrowser);
use CGI (standard);
use warnings;
use strict;

sub new {
	my $this = {};
	bless($this);
	return $this;
}

sub SERVER {
	my (%datos1, $buffer, @pairs, $pair, $name, $value, $metodo);
	$metodo=$_[1] || $_[0];
    if (($metodo eq "p") or ($metodo eq "P") or ($metodo eq 'POST') or ($metodo eq 'post')) {
		read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
	} else {
		if (($metodo eq "g") or ($metodo eq "G") or ($metodo eq 'GET') or ($metodo eq 'get')) {
			$buffer = $ENV{'QUERY_STRING'};
		} else {
			return 0;
		}
	}
    @pairs = split(/&/, $buffer);
 
    foreach $pair (@pairs) {
        ($name, $value) = split(/=/, $pair);
        $name =~ tr/+/ /;
        $name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
        $value =~ tr/+/ /;
        $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

        $datos1{$name} = $value;
    }
    return %datos1;
}
1;