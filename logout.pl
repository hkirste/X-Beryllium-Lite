#!C:\xampp\perl\bin\perl.exe

use CGI::Carp qw(fatalsToBrowser);
use CGI;
use strict;
use warnings;
use lib 'inc';
use lib '.';
use XKSConfig;
use Time::HiRes qw(gettimeofday);
use POSIX;
use brain; ## Shall we use our brains? Dunno? Ask Dr. Heinz

if(!$SESSION->param('LOGGED_IN') && $ENV{REQUEST_URI} ne '/account/logout_ok') {
	print "Location: http:$c->{'http_host'}/\r\n".$header;
	die;
} elsif($GET{token} and $ENV{REQUEST_URI} eq '/account/logout?token='.$GET{token} and $ENV{REQUEST_METHOD} eq 'POST') {
    $SESSION->delete();
    $SESSION->flush();
	$header = $SESSION->header(-'Cache-Control'=>'no-store, no-cache, must-revalidate, post-check=0, pre-check=0',-Pragma=>'no-cache',-Expires=>'Thu, 19 Nov 1981 08:52:00 GMT');
	print "Location: http:$c->{'http_host'}/account/logout_ok\r\n".$header;
	die;
} else {
	print $header;
}

# Variables para los templates actuales #
$template->AddVar('title', 'Reiniciar');
$template->AddVar('now_online', $Heart->getNowOnline());
$template->AddVar('logout_page', 'true');
#/ Variables para los templates actuales #
# Escribir el template #
$template->process('head-alfa');
$template->PrintSet('default');
$template->writer('<link rel="stylesheet" href="/styles/local/es.css" type="text/css" />');
$template->process('logout');
#/ Escribir el template #

(my $epochseconds,my $microseconds) = gettimeofday;
my $andSoItEnds = $epochseconds.'.'.$microseconds;

print $andSoItEnds-$andSoItBegan;