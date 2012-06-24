package usersxB;

use CGI::Carp qw(fatalsToBrowser);
use CGI (standard);
use CGI::Session ( '-ip_match' );
use warnings;
use strict;
use lib '.';
use mysqldbxB;
use Switch;
use Email::Valid;
use Time::HiRes qw(gettimeofday);

our $cache = undef;
our $db = mysqldbxB->new();
our $SESSION = CGI::Session->new();

sub new {
  $cache = {};
  bless($cache);
  return $cache;
}

sub VUser {
	return $db->numrows("SELECT null FROM `users` WHERE `username` = '".$_[1]."' AND `password` = '".$_[2]."' LIMIT 1");
}

sub checkUsername {
	if($_[1] =~ m/^[a-z0-9-.-@-,-]+$/i && length($_[1]) >= 5 && length($_[1]) <= 32) {return 1} else {return 0}
}

sub usernameExists {
	return $db->result("SELECT count(`id`) as count FROM `users` WHERE `username` = '".$_[1]."' LIMIT 1", "count");
}

sub checkEmail {
	if (Email::Valid->address(-address  => $_[1], -tldcheck => 1, -mxcheck => $_[2])) {
		return 1
	} else {
		return 0
	}
}

sub emailExists {
	return $db->result("SELECT count(`id`) as count FROM `users` WHERE `mail` = '".$_[1]."' LIMIT 1", "count");
}

sub create {
	#$username = '', $passwordHash = '', $email = 'default@localhost', $rank = 1, $figure = '', $sex = 'M', $country = ''
	my $count = $db->result("SELECT count(`id`) FROM `users` WHERE `username` = '".$_[1]."' LIMIT 1", "count");
	if(!$count) {
		my $query = "INSERT INTO users ";
		$query = $query."(username,password,mail,auth_ticket,rank,look,gender,motto,credits,activity_points,last_online,account_created,";
		$query = $query."ip_last,ip_reg) ";
		$query = $query."VALUES ('" . $_[1] . "','" . $_[2] . "','" . $_[3] . "','','1','" . $_[4] . "','" . $_[5] . "'";
		$query = $query.",'','10000','1000','" . int(gettimeofday) . "','" . int(gettimeofday) . "','" . $ENV{'REMOTE_ADDR'} . "',";
		$query = $query."'" . $ENV{'REMOTE_ADDR'} . "')";
		
		$db->query($query);
	}
	my $id = $db->result("SELECT id FROM users WHERE username = '" . $_[1] . "' ORDER BY id DESC LIMIT 1", "id");
	$db->query("INSERT INTO user_info (user_id,bans,cautions,reg_timestamp,login_timestamp,cfhs,cfhs_abusive) VALUES ('".$id."','0','0','".int(gettimeofday)."','".int(gettimeofday)."','0','0')");
	return $id;
}

1;