#!C:\xampp\perl\bin\perl.exe

use CGI::Carp qw(fatalsToBrowser);
use CGI;
use strict;
use warnings;
use Captcha::reCAPTCHA;

use lib $ENV{DOCUMENT_ROOT}.'/inc';
use lib $ENV{DOCUMENT_ROOT}.'/';

use XKSConfig;
use Time::HiRes qw(gettimeofday);
use Digest::MD5 qw(md5_hex);
use POSIX;
use brain; ## Shall we use our brains? Dunno? Ask Dr. Heinz
use Switch;

my $top_navi_now = 1;
my $bottom_navi_now = 2;


my $paso = int(&brain::cocksec($GET{'paso'}));

if(!exists($GET{'paso'})) {
	print "Location: http:$c->{http_host}/\n".$header;
	exit;
} elsif($GET{paso} != '2' and $GET{paso} != '4' and $GET{paso} != '5') {
	print $header."\n";

# Variables para los templates actuales #
$template->AddVar('now_online', $Heart->getNowOnline());
$template->AddVar('title', '');
#/ Variables para los templates actuales #
# Escribir el template #
$template->process('head-alfa');
$template->PrintSet('register');
$template->process('head-omega');
}
if($paso == '1') {
	my $errorz = $GET{errorz} unless not exists($GET{errorz});
	$template->AddJS('[% images_host %]/web-gallery/static/js/quickregister.js');
	$template->AddVar('errorz', $errorz) unless not $errorz; # I THINK IM HIGH ON YOU TURUTURUTURU (8)
	$template->process('register-start');
} elsif($paso == '2') {
	print "Location: http:$c->{http_host}/quickregister/age_gate/e/05x\n".$header unless ($POST{'bean.gender'}) and ($POST{'bean.month'}) and ($POST{'bean.day'}) and ($POST{'bean.year'}); exit unless ($POST{'bean.gender'}) and ($POST{'bean.month'}) and ($POST{'bean.day'}) and ($POST{'bean.year'});
	
	my $errorz = 0;
	
	my $gender = &brain::cocksec($POST{'bean.gender'});
	my $mes = int(&brain::cocksec($POST{'bean.month'}));
	my $jahre = int(&brain::cocksec($POST{'bean.year'})); ## ICH BIN DEUTSCHER && HEIL MASACRE
	my $dia = int(&brain::cocksec($POST{'bean.day'}));
	
	$errorz = 2 if $jahre >= $c->{limit_reg_age_year};
	print "Location: http:$c->{http_host}/quickregister/age_limit\n".$header unless ($errorz == 0) or ($c->{limit_reg_age} == 0); exit unless ($errorz == 0) or ($c->{limit_reg_age} == 0);
	$gender = ($gender eq 'male')?'M':'F';
	$SESSION->param('reg_gender', $gender);
	$SESSION->param('reg_mes', $mes);
	$SESSION->param('reg_jahre', $jahre);
	$SESSION->param('reg_dia', $dia);
	
	print "Location: http:$c->{http_host}/quickregister/email_password\n".$header;
	exit;

} elsif($paso == '3') {
	$template->process('register-age_limit');
} elsif($paso == '4') {
	print "Location: http:$c->{http_host}/quickregister/start\n".$header unless ($SESSION->param('reg_gender') and $SESSION->param('reg_mes') and $SESSION->param('reg_jahre') and $SESSION->param('reg_dia')); exit unless ($SESSION->param('reg_gender') and $SESSION->param('reg_mes') and $SESSION->param('reg_jahre') and $SESSION->param('reg_dia'));
	if(exists($GET{errorz}) && $GET{errorz}) {
		print $header;
		my $errorz = &brain::cocksec($GET{errorz});
		my %errorz = split('x', $errorz);
		foreach my $key(%errorz){
			$template->AddVar('e0'.int($key), 'true');
		}
		$template->AddVar('errorz', 1);
	
		$template->AddVar('now_online', $Heart->getNowOnline());
		$template->AddVar('title', '');
		$template->process('head-alfa');
		$template->PrintSet('register');
		$template->process('head-omega');
		$template->process('register-email_password');
		exit;
	} elsif($GET{submit} && $GET{submit} eq '_submit' && exists($POST{'bean.email'}) && exists($POST{'bean.name'}) && exists($POST{'bean.password'})
	&& exists($POST{'bean.retypedEmail'}) && $SESSION->param('reg_gender') && $SESSION->param('reg_mes') && $SESSION->param('reg_jahre') && $SESSION->param('reg_dia')) {
		my $errorz = 'z';
		my %bean;
		
		$bean{'email'} = &brain::cocksec($POST{'bean.email'});
		$bean{'marketing'} = &brain::cocksec($POST{'bean.marketing'});
		$bean{'name'} = &brain::cocksec($POST{'bean.name'});
		$bean{'name'} =~ s/([\/"])//gi;
		$bean{'password'} = md5_hex(&brain::cocksec($POST{'bean.password'}));
		$bean{'retypedEmail'} = &brain::cocksec($POST{'bean.retypedEmail'});
		$bean{'termsOfServiceSelection'} = &brain::cocksec($POST{'bean.termsOfServiceSelection'});
		$bean{'marketing'} = (exists($POST{'bean.marketing'}))?1:0;

		$errorz = $errorz.'01x' unless $bean{name};
		$errorz = $errorz.'02x' unless (($xUsers->checkUsername($bean{name}) and !$xUsers->usernameExists($bean{name})) or $errorz =~ m/01x/);
		$errorz = $errorz.'03x' unless $bean{password};
		$errorz = $errorz.'04x' unless (length($bean{password}) > 5 or $errorz =~ m/03x/);
		$errorz = $errorz.'06x' unless $bean{email} and $xUsers->checkEmail($bean{email}, $c->{'register_mxcheck'}) and !$xUsers->emailExists($bean{email});
		$errorz = $errorz.'07x' unless $bean{retypedEmail};
		$errorz = $errorz.'08x' unless ($bean{retypedEmail} eq $bean{email} or $errorz =~ m/07x/);
		$errorz = $errorz.'09x' unless $bean{termsOfServiceSelection};

		$errorz =~ s/z//gi unless $errorz eq 'z';
		if($errorz eq 'z') {
			foreach my $key(%bean) {
				$SESSION->param('bean.'.$key, $bean{$key});
			}
		}
		print "Location: http:$c->{http_host}/quickregister/captcha\n".$header unless ($errorz ne 'z'); exit unless ($errorz ne 'z');
		print "Location: http:$c->{http_host}/quickregister/email_password/e/".$errorz."\n".$header unless (not $errorz); exit unless (not $errorz);
	}
	print $header;
	$template->AddVar('now_online', $Heart->getNowOnline());
	$template->AddVar('title', '');
	$template->process('head-alfa');
	$template->PrintSet('register');
	$template->process('head-omega');
	$template->process('register-email_password');
} elsif($paso == '5') {
	if(exists($GET{errorz}) && $GET{errorz}) {
		my $errorz = &brain::cocksec($GET{errorz});
		my %errorz = split('x', $errorz);
		foreach my $key(%errorz){
			$template->AddVar('e'.int($key), 'true');
		}
		$template->AddVar('errorz', 1);
	} elsif(exists($GET{submit}) and $GET{submit} eq '_submit' and exists($POST{'captchaResponse'}) and exists($POST{'recaptcha_challenge_field'}) and exists($POST{'bean.figure'})) {
		
		my $look= {'hr-893-39.hd-209-1.ch-877-62-62.lg-285-62.sh-3115-64-62.ea-1404-62'=>'true','hr-893-32.hd-209-1.ch-3109-64-73.lg-275-64'=>'true','hr-165-39.hd-209-28.ch-245-64.lg-270-62.sh-906-64.wa-2011'=>'true','hr-893-45.hd-180-1.ch-3109-64-64.lg-275-64'=>'true','hr-893-45.hd-190-28.ch-215-62.lg-275-64.sh-295-62.ea-1401-91.ca-1813.wa-3211-64-64'=>'true','hr-893-39.hd-209-1.ch-877-62-62.lg-270-64.sh-906-62.ca-1819.wa-2001'=>'true','hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008'=>'true','hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011'=>'true','hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64'=>'true','hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011'=>'true','hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80'=>'true','hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81'=>'true','hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008'=>'true','hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011'=>'true','hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011'=>'true','hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008'=>'true','hr-115-42.hd-205-3.ch-878-79-62.lg-280-83.sh-906-62.ca-1819.wa-2008.cp-3127-62'=>'true','hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62'=>'true','hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80'=>'true','hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81'=>'true','hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62'=>'true','hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64'=>'true','hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62'=>'true','hr-679-1316.hd-209-1.ch-255-73.lg-270-73.sh-906-73.ha-1006.wa-2002'=>'true','hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64'=>'true','hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008'=>'true','hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008'=>'true','hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011'=>'true','hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011'=>'true','hr-145-45.hd-200-28.ch-210-81.lg-281-64.sh-305-64.ha-1005-64'=>'true','hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011'=>'true','hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011'=>'true','hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62'=>'true','hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011'=>'true','hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91'=>'true','hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64'=>'true','hr-679-1316.hd-209-1.ch-255-73.lg-270-73.sh-906-73.ha-1006.wa-2002'=>'true','hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008'=>'true','hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008'=>'true','hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64'=>'true','hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62'=>'true','hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64'=>'true','hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011'=>'true','hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62'=>'true','hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011'=>'true','hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011'=>'true','hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80'=>'true','hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91'=>'true','hr-115-42.hd-205-3.ch-878-79-62.lg-280-83.sh-906-62.ca-1819.wa-2008.cp-3127-62'=>'true','hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011'=>'true','hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91'=>'true','hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011'=>'true','hr-145-45.hd-200-28.ch-210-81.lg-281-64.sh-305-64.ha-1005-64'=>'true','hr-170-42.hd-190-22.ch-3111-84-62.lg-275-85.sh-295-88.ha-1001.fa-1201'=>'true','hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62'=>'true','hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011'=>'true','hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64'=>'true','hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91'=>'true','hr-145-37.hd-190-28.ch-245-82.lg-281-64.ha-3254-64.he-1601.fa-1212.ca-1801-62.wa-3211-62-62.cp-3120-62'=>'true','hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008'=>'true','hr-170-42.hd-190-22.ch-3111-84-62.lg-275-85.sh-295-88.ha-1001.fa-1201'=>'true','hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011'=>'true','hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62'=>'true','hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64'=>'true','hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81'=>'true','hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008'=>'true'};
		print "Location: http:$c->{http_host}/quickregister/captcha/e/13x\n".$header unless exists($look->{$POST{'bean.figure'}}); exit unless exists($look->{$POST{'bean.figure'}});
		
		my $response = &brain::cocksec($POST{'captchaResponse'});
		my $challenge = &brain::cocksec($POST{'recaptcha_challenge_field'});
		
		my $reCaptcha = Captcha::reCAPTCHA->new;
		my $result = $reCaptcha->check_answer($c->{'recaptcha_private'}, $ENV{'REMOTE_ADDR'},$challenge, $response);
		
		
		if($result->{is_valid}) {
			$xUsers->create($SESSION->param('bean.name'), $SESSION->param('bean.password'), $SESSION->param('bean.email'), &brain::cocksec($POST{'bean.figure'}), $SESSION->param('reg_gender'));
			$SESSION->param('BERYLLIUM.NAME', $SESSION->param('bean.name'));
			$SESSION->param('BERYLLIUM.PASSWORD', $SESSION->param('bean.password'));
			print "Location: http:$c->{http_host}/me\n".$header;
			exit;
		} else {
			print "Location: http:$c->{http_host}/quickregister/captcha/e/12x\n".$header;
			exit;
		}
		exit;
	}
	print $header;
	$template->AddVar('now_online', $Heart->getNowOnline());
	$template->AddVar('title', '');
	$template->process('head-alfa');
	$template->PrintSet('register');
	$template->AddJS('[% images_host %]/web-gallery/static/js/quickregister.js');
	$template->AddJS('https://www.google.com/recaptcha/api/js/recaptcha_ajax.js');
	$template->process('head-omega');
	$template->process('register-captcha');
}
#/ Escribir el template #

(my $epochseconds,my $microseconds) = gettimeofday;
my $andSoItEnds = $epochseconds.'.'.$microseconds;

#print ($andSoItEnds-$andSoItBegan);