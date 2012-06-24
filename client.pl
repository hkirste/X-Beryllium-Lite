#!C:\xampp\perl\bin\perl.exe

use CGI::Carp qw(fatalsToBrowser);
use CGI;
use strict;
use warnings;
use lib $ENV{DOCUMENT_ROOT}.'/inc';
use lib $ENV{DOCUMENT_ROOT}.'/';
use XKSConfig;
use Time::HiRes qw(gettimeofday);
use Digest::MD5 qw(md5_hex);
use brain; ## Shall we use our brains? Dunno? Ask Dr. Heinz

if(!$SESSION->param('LOGGED_IN')) {
	print "Location: http:$c->{'http_host'}/\r\n".$header;
	exit;
}

print $header;

# Escribir el template #
$template->process('head-alfa');
$template->PrintSet('client');

# Variables #
$template->AddVar('ip_server', $c->{ip_server});
$template->AddVar('port_server', $c->{port_server});
$template->AddVar('external_variables', $c->{external_variables});
$template->AddVar('external_flash_texts', $c->{external_flash_texts});
$template->AddVar('furnidata', $c->{furnidata});
$template->AddVar('productdata', $c->{productdata});
$template->AddVar('gordon_swf_release', $c->{gordon_swf_release});
# Variables #

my $ticket = 'beryllium-'.&brain::generate_random_string(5).'-'.&brain::generate_random_string(5).'-'.&brain::generate_random_string(5);
$db->query("UPDATE `users` SET `auth_ticket` = '".$ticket."' WHERE `id` = '".$SESSION->param('BERYLLIUM.ID')."' LIMIT 1");
$template->AddVar('ticket', $ticket);

$template->process('client');
#/ Escribir el template #