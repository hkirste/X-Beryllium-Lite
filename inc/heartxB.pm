package heartxB;

use CGI::Carp qw(fatalsToBrowser);
use CGI (standard);
use CGI::Session ( '-ip_match' );
use warnings;
use strict;
use lib '.';
use mysqldbxB;
use Switch;

our $cache = undef;
our $db = mysqldbxB->new();
our $SESSION = CGI::Session->new();
our $allowDisplay = 1;

sub new {
  $cache = {};
  bless($cache);
  return $cache;
}

sub getNowOnline {
	if(defined($cache->{'NOW_ONLINE'})) {
		return $cache->{'NOW_ONLINE'};
	}
	$cache->{'NOW_ONLINE'} = $db->result("SELECT users_online FROM server_status LIMIT 1", "users_online");
	return $cache->{'NOW_ONLINE'};
}

sub getNAVI { # iLike NCIS :D || Ducky murio? :(
	our $outputNAVI = '<ul id="navi">';
	our ($class, $showlink, $url, $caption) = undef;
	my $vars = $_[3];
	my $sql = $MySQL->prepare("SELECT id,caption,class,url,visibility,only_vip FROM beryllium_navi WHERE parent_id = '0' ORDER BY order_id ASC");
	$sql->execute;
	while (my $data = $sql->fetchrow_hashref) {
		$allowDisplay = 1;
		switch($data->{visibility}) {
			case "0" { $allowDisplay = 0; }
			case "1" { }
			case "2" { if($SESSION->param('LOGGED_IN')) { $allowDisplay = 0; } }
			case "3" { if(!$SESSION->param('LOGGED_IN')) { $allowDisplay = 0; } }
		}
		
		if(!$allowDisplay) {
			next;
		}
		
		if($data->{class} == '') {
			$class = '';
		} elsif($data->{class} == 'tab-register-now') {
			$class = $data->{class}.'" id="tab-register-now';
		} else {
			$class = $data->{class};
		}
		
		if($_[1] == $data->{id}) { $showlink = 0; $class=$class.' selected'; } else { $showlink = 1;}
		
		$url = $data->{url};
		$url =~ s/\[\% http_host \%\]/$vars->{http_host}/;
		$url =~ s/\[\% BERYLLIUM_U_NAME \%\]/$vars->{BERYLLIUM_U_NAME}/;
		$caption = $data->{caption};
		$caption =~ s/\[\% BERYLLIUM_U_NAME \%\]/$vars->{BERYLLIUM_U_NAME}/;
		$outputNAVI = $outputNAVI . '<li class="' . $class . '">';
		if($showlink) { $outputNAVI = $outputNAVI . '<a href="'. $url .'">'; } else { $outputNAVI = $outputNAVI . '<strong>'; }
		$outputNAVI = $outputNAVI . $caption;
		if($showlink) { $outputNAVI = $outputNAVI . '</a>'; } else { $outputNAVI = $outputNAVI . '</strong>'; }
		$outputNAVI = $outputNAVI . '<span></span></li>';
	}
	$outputNAVI = $outputNAVI . '</ul>';
	return $outputNAVI;
}

sub getbottomNAVI {
	our $outputNAVI = '<ul>';
	our ($class, $showlink, $url, $numRows, $caption) = undef;
	my $vars = $_[3];
	my $i = 0;
	my $sql = $MySQL->prepare("SELECT id,caption,class,url,visibility,only_vip FROM beryllium_navi WHERE parent_id = '".$_[1]."' ORDER BY order_id ASC");
	$sql->execute;
	while (my $data = $sql->fetchrow_hashref) {
		$i++;
		$allowDisplay = 1;
		$numRows = $MySQL->do("SELECT null FROM beryllium_navi WHERE parent_id = '".$_[1]."' ORDER BY order_id ASC");
		switch($data->{visibility}) {
			case "0" { $allowDisplay = 0; }
			case "1" { }
			case "2" { if($SESSION->param('LOGGED_IN')) { $allowDisplay = 0; } }
			case "3" { if(!$SESSION->param('LOGGED_IN')) { $allowDisplay = 0; } }
		}
		
		if(!$allowDisplay) {
			next;
		}
		
		if($data->{class} == '') {
			$class = '';
		} else {
			$class = $data->{class};
		}
		
		if($i == $numRows) {
			$class = $class.' last';
		}
		
		if($_[1] == $data->{id}) { $showlink = 0; $class=$class.' selected'; } else { $showlink = 1;}
		
		$url = $data->{url};
		$url =~ s/\[\% http_host \%\]/$vars->{http_host}/;
		$url =~ s/\[\% BERYLLIUM_U_NAME \%\]/$vars->{BERYLLIUM_U_NAME}/;
		$outputNAVI = $outputNAVI . '<li class="' . $class . '">';
		if($showlink) { $outputNAVI = $outputNAVI . '<a href="'. $url .'">'; } else { $outputNAVI = $outputNAVI . '<strong>'; }
		$outputNAVI = $outputNAVI . $data->{caption};
		if($showlink) { $outputNAVI = $outputNAVI . '</a>'; } else { $outputNAVI = $outputNAVI . '</strong>'; }
		$outputNAVI = $outputNAVI . '</li>';
	}
	$outputNAVI = $outputNAVI . '</ul>';
	return $outputNAVI;
}

1;