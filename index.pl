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

if($SESSION->param('LOGGED_IN')) {
	print "Location: http:$c->{'http_host'}/me\r\n".$header;
	exit;
}

$template->AddVar('errorz', '');
$template->AddVar('username_inpt', '');
$template->AddVar('focus', '');

if(defined($POST{'credentials.username'}) and defined($POST{'credentials.password'})) {
	my $username = &brain::cocksec($POST{'credentials.username'});
	my $password = md5_hex(&brain::cocksec($POST{'credentials.password'}));
	if($xUsers->VUser($username, $password)) {
	
		$SESSION->param('BERYLLIUM.NAME', $username);
		$SESSION->param('BERYLLIUM.PASSWORD', $password);
		my $cocksecdhost = &brain::cocksec($c->{http_host});
		print(qq($header
<html>
<head>
  <title>Redirecting...</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <style type="text/css">body { background-color: #e3e3db; text-align: center; font: 11px Verdana, Arial, Helvetica, sans-serif; } a { color: #fc6204; }</style>
</head>
<body>

<script type="text/javascript">window.location.replace('$cocksecdhost\/me');</script><noscript><meta http-equiv="Refresh" content="0;URL=$c->{http_host}/"></noscript>

<p class="btn">If you are not automatically redirected, please <a href="$c->{http_host}/me" id="manual_redirect_link">click here</a></p>

</body>
</html>));
		
	} elsif($db->numrows("SELECT null FROM `users` WHERE `mail` = '". $username ."' AND `password` = '". $password ."' LIMIT 1")) {
		$username = $db->result("SELECT username FROM users WHERE `mail` = '".$username."' AND `password` = '".$password."' LIMIT 1", 'username');
		
		$SESSION->param('BERYLLIUM.NAME', $username);
		$SESSION->param('BERYLLIUM.PASSWORD', $password);
		my $cocksecdhost = &brain::cocksec($c->{http_host});
		print(qq($header
<html>
<head>
  <title>Redirecting...</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <style type="text/css">body { background-color: #e3e3db; text-align: center; font: 11px Verdana, Arial, Helvetica, sans-serif; } a { color: #fc6204; }</style>
</head>
<body>

<script type="text/javascript">window.location.replace('$cocksecdhost\/me');</script><noscript><meta http-equiv="Refresh" content="0;URL=$c->{http_host}/"></noscript>

<p class="btn">If you are not automatically redirected, please <a href="$c->{http_host}/me" id="manual_redirect_link">click here</a></p>

</body>
</html>));
		
	} else {
		$SESSION->param('errorz', 'notfound');
		$SESSION->expire("errorz", "5s");
		print "Location: http:$c->{'http_host'}/?username=$username&rememberme=false&focus=login-username\n".$header;
		exit;
	}
}

print $header."\r\n";

	$template->AddVar('errorz', $SESSION->param('errorz')) if ($SESSION->param('errorz') && ($SESSION->param('errorz') == 'notfound'));
	$template->AddVar('username_inpt', $GET{'username'}) if exists($GET{'username'});
	$template->AddVar('focus', $GET{'focus'}) if exists($GET{'focus'});

# Variables para el template actual #
$template->AddVar('now_online', $Heart->getNowOnline());
#/ Variables para el template actual #

# Escribir el template #
$template->process('index');
#/ Escribir el template #

(my $epochseconds,my $microseconds) = gettimeofday;
my $andSoItEnds = $epochseconds.'.'.$microseconds;

#print $andSoItEnds-$andSoItBegan;