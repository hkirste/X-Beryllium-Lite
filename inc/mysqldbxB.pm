package mysqldbxB;

use CGI::Carp qw(fatalsToBrowser);
use CGI (standard);
use warnings;
use strict;
use DBI;
use lib '.';
use XKSConfig;

use Exporter ();
use vars qw( $MySQL );
@mysqldbxB::ISA    = qw(Exporter);
@mysqldbxB::EXPORT = qw($MySQL);

our ($MySQL, $querys_num);

sub new {
	# Voy a beberme hasta las copas de los árboles
	my $self = {};
	$querys_num = 0;
	$self->{CONNECTED} = undef;
	$self->{dbh} = undef;
	$self->{host} = undef;
	$self->{user} = undef;
	$self->{pass} = undef;
	$self->{db} = undef;
	bless($self); # Chicken butt
	return $self;
}

sub Connect {
	my $self = shift;
	$MySQL=DBI->connect("DBI:mysql:database=$c->{'db_name'};host=$c->{'db_host'};port=$c->{'db_port'}",$c->{'db_login'},$c->{'db_passwd'}) || die ("Can't connect to Mysql server.".$! );
	if($MySQL) { $self->{CONNECTED} = 1; } else { $self->{CONNECTED} = 0; }
	return $MySQL;
}

sub query {
	my $self = shift;
	my $query = $MySQL->prepare($_[0]);
	$query->execute;
	$querys_num++;
	return $query;
}

sub result { # Usage: print $db->result("SELECT username FROM users where id = '1'", 'username'); Devuelve: username (del usuario id 1)
	my $self = shift;
	my $sth = $MySQL->prepare($_[0]);
	$sth->execute;
	$querys_num++;
	my $row = $sth->fetchrow_hashref();
	return $row->{$_[1]};
}

sub numrows {
	my $self = shift;
	my $query = $MySQL->do($_[0]);
	$querys_num++;
	return int($query);
}
1;