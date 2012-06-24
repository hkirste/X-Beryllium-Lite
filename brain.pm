package brain;
use lib $ENV{DOCUMENT_ROOT}.'/inc';
use lib $ENV{DOCUMENT_ROOT}.'/';
use Exporter ();
use vars qw( $IP $CGISESSID $template $SESSION %POST %GET $db $Heart $andSoItBegan $header $xUsers $MySQL );
@ISA    = qw(Exporter);
@EXPORT = qw( $IP $CGISESSID $template $SESSION %POST %GET $db $Heart $andSoItBegan $header $xUsers $MySQL );
use CGI::Carp qw(fatalsToBrowser);
use CGI::Session ( '-ip_match' );
use strict;
use warnings;
use mysqldbxB;
use heartxB;
use XKSConfig;
use usersxB;
use Digest::MD5 qw(md5_hex);

use getnpost;

use templatexB;

use HTML::Entities;
use Time::HiRes qw(gettimeofday);

(my $epochseconds, my $microseconds) = gettimeofday;
$andSoItBegan = $epochseconds.'.'.$microseconds;


## Funciones ##
sub cocksec {
    my $text = shift;
    $text =~ s/([\\\'\"])/\\$1/gi;
    return $text;
}

sub generate_random_string {
	my $length_of_randomstring=shift;

	my @chars=('a'..'z','0'..'9');
	my $random_string;
	foreach (1..$length_of_randomstring) 
	{
		$random_string.=$chars[rand @chars];
	}
	return $random_string;
}

sub SERVER {
	my (%datos1, $buffers, @pairs, $pair, $name, $value, $metodo);
	$metodo=$_[1] || $_[0];
    if (($metodo eq "p") or ($metodo eq "P") or ($metodo eq 'POST') or ($metodo eq 'post')) {
		read(STDIN, $buffers, $ENV{'CONTENT_LENGTH'});

	} else {
		if (($metodo eq "g") or ($metodo eq "G") or ($metodo eq 'GET') or ($metodo eq 'get')) {
			$buffers = $ENV{'QUERY_STRING'};
		} else {
			return 0;
		}
	}
    @pairs = split(/&/, $buffers);
 
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
## Funciones ##

## Init classes teach. ##
$template = templatexB->new();
$Heart = heartxB->new();
$xUsers = usersxB->new();
## Init classes teach. ##


## Variables importantes ##
$IP = $ENV{REMOTE_ADDR};
$template->AddVar('http_host', $c->{'http_host'});
$template->AddVar('images_host', $c->{'images_host'});
$template->AddVar('hotel_name', $c->{'hotel_name'});
$template->AddVar('fb_appid', $c->{'fb_appid'});
$template->AddVar('twitter', $c->{'twitter'});
$template->AddVar('GA', $c->{'google_analytics'});
$template->AddVar('REQUEST_URI', $ENV{'REQUEST_URI'});
$template->AddVar('body_id', '');
$template->AddVar('ad728x90', $c->{'ad728x90'});
$template->AddVar('recaptcha_public', $c->{'recaptcha_public'});
$template->AddVar('recaptcha_private', $c->{'recaptcha_private'});

my $CGI = CGI->new;
for ($CGI->param()) { $POST{$_} = $CGI->param($_); }

%GET = &SERVER('get'); # USO  $GET{'variable'}
## Variables importantes ##

## CGI SESSION + Enviar header con cookie. Mmmm galletaa ##
CGI::Session->name("X-Beryllium");
$SESSION = CGI::Session->new();
$CGISESSID = $SESSION->id();
$header = $SESSION->header(-'Cache-Control'=>'no-store, no-cache, must-revalidate, post-check=0, pre-check=0',-Pragma=>'no-cache',-Expires=>'Thu, 19 Nov 1981 08:52:00 GMT',-Application=>'X-Beryllium',-"Created-By"=>'Heinz K. AKA masacre');
if(!$header) {
	die 'Error con $session header';
}
$SESSION->expire('+1h');
## CGI SESSION + Enviar header con cookie. Mmmm galletaa ##

## Mysql Connect ##
$db = mysqldbxB->new();
my $MySQL = $db->Connect;
## Mysql Connect ##

foreach my $key (keys(%GET)) {
	$GET{$key} = cocksec(encode_entities($GET{$key}));
}
foreach my $key (keys(%POST)) {
	$POST{$key} = cocksec(encode_entities($POST{$key}));
}
## Controlar usuario ##
if(($SESSION->param('BERYLLIUM.NAME')) and ($SESSION->param('BERYLLIUM.PASSWORD'))) {
	my $username = $SESSION->param('BERYLLIUM.NAME');
	my $password = $SESSION->param('BERYLLIUM.PASSWORD');
	
	if($xUsers->VUser($username, $password)) {
		my $sql = $MySQL->prepare("SELECT id,username,rank,vip,online FROM users WHERE username = '".$username."' AND password = '".$password."' LIMIT 1"); $sql->execute;
		my $data = $sql->fetchrow_hashref;
	
		$template->AddVar('BERYLLIUM_U_ID', $data->{'id'});
		$SESSION->param('BERYLLIUM.ID', $data->{'id'});
		$template->AddVar('BERYLLIUM_U_NAME', $data->{'username'});
		$template->AddVar('LOGGED_IN', 1);
		$SESSION->param('LOGGED_IN', 1);
		$template->AddVar('USER_ONLINE', $data->{'online'});
		$template->AddVar('USER_RANK', $data->{'rank'});
		$template->AddVar('IS_VIP', $data->{'vip'});
		if(length($SESSION->param('BERYLLIUM.PASSWORD')) != 32) {
			$SESSION->delete();
			$SESSION->flush();
			print "Location: http:$c->{'http_host'}/?\n".$header;
			exit;
		}
	} else {
		$SESSION->delete();
		$SESSION->flush();
		print "Location: http:$c->{'http_host'}/?\n".$header;
		exit;
	}
} else {
	$template->AddVar('BERYLLIUM_U_ID', 'null');
	$SESSION->param('BERYLLIUM.ID', 0);
	$template->AddVar('BERYLLIUM_U_NAME', 'Visitante');
	$template->AddVar('LOGGED_IN', 0);
	$SESSION->param('LOGGED_IN', 0);
	$template->AddVar('USER_ONLINE', 0);
	$template->AddVar('USER_RANK', 0);
	$template->AddVar('IS_VIP', 0);	
}

$template->AddVar('ANTI_CSRF', md5_hex(int(rand(1000))));
## Controlar usuario ##

1;