package templatexB;

use CGI::Carp qw(fatalsToBrowser);
use CGI (standard);
use warnings;
use strict;
use Template;
use Switch;

our $template = undef; 
our $config = undef;
our $tmppath = $ENV{DOCUMENT_ROOT}.'/';
my $vars = {};

sub new {
	$config={};
	$template = Template->new({
	INCLUDE_PATH => $tmppath."templates/default",
	INTERPOLATE => 1,
	POST_CHOMP => 1,
	ABSOLUTE => 1,
	EVAL_PERL => 1
	}) or die $Template::ERROR, "\n";
	bless($config);
	return $config;
}

sub AddVar {
	my $vars = shift;
	$vars->{$_[0]} = $_[1];
	if(($vars->{$_[0]} == $_[1])) { return 1; } else { return 0; } # So serious, why
}

sub process {
	my $vars = shift;
	$template->process($tmppath.'templates/default/'.$_[0].'.xks', $vars) or die $template->error();
}

sub writer {
	my $vars = shift;
	$template->process(\$_[0], $vars) or die $template->error();
}

sub AddJS {
	my $vars = shift;
	$config->writer('<script type="text/javascript" src="'.$_[0].'"></script>', $vars) or die $template->error();
}

sub PrintSet {
	switch ($_[1]) {
		case "default" {
			$config->writer('
<link rel="stylesheet" href="[% images_host %]/web-gallery/static/styles/common.css" type="text/css"/>
<link rel="stylesheet" href="[% images_host %]/web-gallery/static/styles/process.css" type="text/css"/>
<script src="[% images_host %]/web-gallery/static/js/libs2.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/visual.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/libs.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/common.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/fullcontent.js" type="text/javascript"></script>
			');
		}
		case "me" {
			$config->writer('
<link rel="stylesheet" href="[% images_host %]/web-gallery/static/styles/common.css" type="text/css"/>
<script src="[% images_host %]/web-gallery/static/js/libs2.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/visual.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/libs.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/common.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/fullcontent.js" type="text/javascript"></script>
<link rel="stylesheet" href="[% images_host %]/web-gallery/v2/styles/personal.css" type="text/css"/>
<script src="[% images_host %]/web-gallery/static/js/habboclub.js" type="text/javascript"></script>
<link rel="stylesheet" href="[% images_host %]/web-gallery/v2/styles/minimail.css" type="text/css"/>
<link rel="stylesheet" href="[% images_host %]/web-gallery/styles/myhabbo/control.textarea.css" type="text/css"/>
<script src="[% images_host %]/web-gallery/static/js/minimail.js" type="text/javascript"></script>
			');
		}		
		case "register" {
			$config->writer('
<link rel="stylesheet" href="[% images_host %]/web-gallery/static/styles/common.css" type="text/css"/>
<script src="[% images_host %]/web-gallery/static/js/libs2.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/visual.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/libs.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/common.js" type="text/javascript"></script>
<link rel="stylesheet" href="[% images_host %]/web-gallery/static/styles/quickregister.css" type="text/css"/>');
		}
		
		case "client" {
			$config->writer('
<link rel="stylesheet" href="[% images_host %]/web-gallery/static/styles/common.css" type="text/css" />
<script src="[% images_host %]/web-gallery/static/js/libs2.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/visual.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/libs.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/common.js" type="text/javascript"></script>
<link rel="stylesheet" href="[% images_host %]/web-gallery/static/styles/habboflashclient.css" type="text/css" />
<script src="[% images_host %]/web-gallery/static/js/habboflashclient.js" type="text/javascript"></script>
<script src="[% images_host %]/web-gallery/static/js/identity.js" type="text/javascript"></script>');
		}
	}
}

sub getVars {
	my $vars = shift;
	return $vars;
}
1;