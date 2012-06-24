#!C:\xampp\perl\bin\perl.exe

use CGI::Carp qw(fatalsToBrowser);
use CGI;
use strict;
use warnings;
use lib 'inc';
use lib '.';
use XKSConfig;
use Time::HiRes qw(gettimeofday);
use Digest::MD5 qw(md5_hex);
use POSIX;
use brain; ## Shall we use our brains? Dunno? Ask Dr. Heinz

my $top_navi_now = 1;
my $bottom_navi_now = 2;

if(!$SESSION->param('LOGGED_IN')) {
	print "Location: http:$c->{'http_host'}/\r\n".$header;
	die;
} else {
	print $header;
}

# Variables para los templates actuales #
$template->AddVar('now_online', $Heart->getNowOnline());
$template->AddVar('title', 'Home');
#/ Variables para los templates actuales #
# Escribir el template #
$template->AddVar('alfa_navi', $Heart->getNAVI($top_navi_now, $bottom_navi_now, $template->getVars));
$template->AddVar('omega_navi', $Heart->getbottomNAVI($top_navi_now, $bottom_navi_now, $template->getVars));
$template->process('head-alfa');
$template->PrintSet('me');
$template->process('head-omega');
$template->process('body-alfa');

# ME #
my $sql = $MySQL->prepare("SELECT look,motto,last_online FROM users WHERE id = '".$SESSION->param('BERYLLIUM.ID')."' LIMIT 1;");
$sql->execute;
my $data = $sql->fetchrow_hashref;

$template->AddVar('look', $data->{'look'});
$template->AddVar('motto', $data->{'motto'});
$template->AddVar('last_online', POSIX::strftime("%d-%m-%Y %H:%M:%S", localtime($data->{'last_online'})));
$template->process('me');
# ME #

$template->process('twitter-c1');
$template->process('publicidad-c2');
$template->process('publicidad-c3');
$template->process('footer');

#/ Escribir el template #

(my $epochseconds,my $microseconds) = gettimeofday;
my $andSoItEnds = $epochseconds.'.'.$microseconds;

print $andSoItEnds-$andSoItBegan;