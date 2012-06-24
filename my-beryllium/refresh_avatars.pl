#!C:\xampp\perl\bin\perl.exe
use CGI::Carp qw(fatalsToBrowser);
use CGI::Session ( '-ip_match' );
use strict;
use warnings;
use Switch;

CGI::Session->name("X-Beryllium");
my $SESSION = CGI::Session->new();
my $CGISESSID = $SESSION->id();
my $header = $SESSION->header(-'Cache-Control'=>'no-store, no-cache, must-revalidate, post-check=0, pre-check=0',-Pragma=>'no-cache',-Expires=>'Thu, 19 Nov 1981 08:52:00 GMT');
print $header;

switch(int(rand(11))) {
	case 1 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008,s-0.g-1.d-4.h-4.a-0,9d648870baa8852241c08fc340ab38c5.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,e5535a893d700d9139d0d3e8a48d19f6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64,s-0.g-1.d-4.h-4.a-0,29ebb9e32be24c1c83542971d6b04629.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,c9172ecaafc2d7f6a17f2f61ea3d96e2.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80,s-0.g-1.d-4.h-4.a-0,5b55c0e41518778f75ee4105069651dd.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81,s-0.g-1.d-4.h-4.a-0,8ec39f1834a4c4b20818af9c14a33f79.gif" width="64" height="110"/>
    </li>	
	] }
	
	case 2 { print qq[
   <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008,s-0.g-1.d-4.h-4.a-0,9d648870baa8852241c08fc340ab38c5.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,e5535a893d700d9139d0d3e8a48d19f6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,c9172ecaafc2d7f6a17f2f61ea3d96e2.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008,s-0.g-1.d-4.h-4.a-0,9bdc6464ea425d2f697f087d304dc27f.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-115-42.hd-205-3.ch-878-79-62.lg-280-83.sh-906-62.ca-1819.wa-2008.cp-3127-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-115-42.hd-205-3.ch-878-79-62.lg-280-83.sh-906-62.ca-1819.wa-2008.cp-3127-62,s-0.g-1.d-4.h-4.a-0,fa098a02553e7bfd702c40373b56aa26.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62,s-0.g-1.d-4.h-4.a-0,d233da4a974c523017ceac3aade13d08.gif" width="64" height="110"/>
    </li>
	
	]}
	
	case 3 { print qq[
   <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80,s-0.g-1.d-4.h-4.a-0,5b55c0e41518778f75ee4105069651dd.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81,s-0.g-1.d-4.h-4.a-0,8ec39f1834a4c4b20818af9c14a33f79.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62,s-0.g-1.d-4.h-4.a-0,783874a273f9906aae959ebf4557b5e5.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64,s-0.g-1.d-4.h-4.a-0,35ef9c4b134590a3127718e52e80b93e.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62,s-0.g-1.d-4.h-4.a-0,d233da4a974c523017ceac3aade13d08.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-1316.hd-209-1.ch-255-73.lg-270-73.sh-906-73.ha-1006.wa-2002" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-1316.hd-209-1.ch-255-73.lg-270-73.sh-906-73.ha-1006.wa-2002,s-0.g-1.d-4.h-4.a-0,9335b34f92d991b8cf0a700421c4c628.gif" width="64" height="110"/>
    </li>
	]}

	case 4 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64,s-0.g-1.d-4.h-4.a-0,35ef9c4b134590a3127718e52e80b93e.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008,s-0.g-1.d-4.h-4.a-0,9d648870baa8852241c08fc340ab38c5.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008,s-0.g-1.d-4.h-4.a-0,9bdc6464ea425d2f697f087d304dc27f.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011,s-0.g-1.d-4.h-4.a-0,d3deb9388df45759af2d8aff140a43c1.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,e5535a893d700d9139d0d3e8a48d19f6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-145-45.hd-200-28.ch-210-81.lg-281-64.sh-305-64.ha-1005-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-145-45.hd-200-28.ch-210-81.lg-281-64.sh-305-64.ha-1005-64,s-0.g-1.d-4.h-4.a-0,2afa1acebb5dbb32b23ae4446cfc1e1f.gif" width="64" height="110"/>
    </li>
	]}

	case 5 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,e5535a893d700d9139d0d3e8a48d19f6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,c9172ecaafc2d7f6a17f2f61ea3d96e2.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62,s-0.g-1.d-4.h-4.a-0,d233da4a974c523017ceac3aade13d08.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011,s-0.g-1.d-4.h-4.a-0,d3deb9388df45759af2d8aff140a43c1.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91" src="http://www.habbo.com/habbo-imaging/avatar/hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91,s-0.g-1.d-4.h-4.a-0,e56856670df9113bd28b9080396299de.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64,s-0.g-1.d-4.h-4.a-0,35ef9c4b134590a3127718e52e80b93e.gif" width="64" height="110"/>
    </li>	
	]}

	case 6 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-1316.hd-209-1.ch-255-73.lg-270-73.sh-906-73.ha-1006.wa-2002" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-1316.hd-209-1.ch-255-73.lg-270-73.sh-906-73.ha-1006.wa-2002,s-0.g-1.d-4.h-4.a-0,9335b34f92d991b8cf0a700421c4c628.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008,s-0.g-1.d-4.h-4.a-0,9bdc6464ea425d2f697f087d304dc27f.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008,s-0.g-1.d-4.h-4.a-0,9d648870baa8852241c08fc340ab38c5.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-110-42.hd-209-1.ch-215-1315.lg-281-64.sh-295-64.he-1601.ea-1401-64.fa-1204.ca-1801-64,s-0.g-1.d-4.h-4.a-0,35ef9c4b134590a3127718e52e80b93e.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62,s-0.g-1.d-4.h-4.a-0,d233da4a974c523017ceac3aade13d08.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64,s-0.g-1.d-4.h-4.a-0,29ebb9e32be24c1c83542971d6b04629.gif" width="64" height="110"/>
    </li>
	]}

	case 7 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,c9172ecaafc2d7f6a17f2f61ea3d96e2.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62,s-0.g-1.d-4.h-4.a-0,783874a273f9906aae959ebf4557b5e5.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,e5535a893d700d9139d0d3e8a48d19f6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011,s-0.g-1.d-4.h-4.a-0,d3deb9388df45759af2d8aff140a43c1.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-42.hd-180-7.ch-225-70.lg-285-70.sh-300-62.ea-1404-80,s-0.g-1.d-4.h-4.a-0,5b55c0e41518778f75ee4105069651dd.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91" src="http://www.habbo.com/habbo-imaging/avatar/hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91,s-0.g-1.d-4.h-4.a-0,e56856670df9113bd28b9080396299de.gif" width="64" height="110"/>
    </li>
	]}

	case 8 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-115-42.hd-205-3.ch-878-79-62.lg-280-83.sh-906-62.ca-1819.wa-2008.cp-3127-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-115-42.hd-205-3.ch-878-79-62.lg-280-83.sh-906-62.ca-1819.wa-2008.cp-3127-62,s-0.g-1.d-4.h-4.a-0,fa098a02553e7bfd702c40373b56aa26.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-31.hd-180-1.ch-878-70-62.lg-270-64.sh-906-62.he-1608.ea-1404-64.wa-2011,s-0.g-1.d-4.h-4.a-0,d3deb9388df45759af2d8aff140a43c1.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91" src="http://www.habbo.com/habbo-imaging/avatar/hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91,s-0.g-1.d-4.h-4.a-0,e56856670df9113bd28b9080396299de.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,e5535a893d700d9139d0d3e8a48d19f6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-145-45.hd-200-28.ch-210-81.lg-281-64.sh-305-64.ha-1005-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-145-45.hd-200-28.ch-210-81.lg-281-64.sh-305-64.ha-1005-64,s-0.g-1.d-4.h-4.a-0,2afa1acebb5dbb32b23ae4446cfc1e1f.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-170-42.hd-190-22.ch-3111-84-62.lg-275-85.sh-295-88.ha-1001.fa-1201" src="http://www.habbo.com/habbo-imaging/avatar/hr-170-42.hd-190-22.ch-3111-84-62.lg-275-85.sh-295-88.ha-1001.fa-1201,s-0.g-1.d-4.h-4.a-0,5b73a76965a94b5c622d2d2972fcbba6.gif" width="64" height="110"/>
    </li>
	]}

	case 9 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-115-31.hd-209-7.ch-3030-64.lg-3116-64-62.sh-305-62,s-0.g-1.d-4.h-4.a-0,783874a273f9906aae959ebf4557b5e5.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-35.hd-209-1.ch-230-82.lg-270-64.sh-300-62.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,c9172ecaafc2d7f6a17f2f61ea3d96e2.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64,s-0.g-1.d-4.h-4.a-0,29ebb9e32be24c1c83542971d6b04629.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91" src="http://www.habbo.com/habbo-imaging/avatar/hd-195-3.ch-255-63.lg-281-82.he-1601.fa-1208-91,s-0.g-1.d-4.h-4.a-0,e56856670df9113bd28b9080396299de.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-145-37.hd-190-28.ch-245-82.lg-281-64.ha-3254-64.he-1601.fa-1212.ca-1801-62.wa-3211-62-62.cp-3120-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-145-37.hd-190-28.ch-245-82.lg-281-64.ha-3254-64.he-1601.fa-1212.ca-1801-62.wa-3211-62-62.cp-3120-62,s-0.g-1.d-4.h-4.a-0,c1455d4547c73a7f9cab9267e93334de.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-34.hd-209-8.ch-3109-82-62.lg-270-82.sh-906-64.ea-1404-62.ca-1804-82.wa-2008,s-0.g-1.d-4.h-4.a-0,9bdc6464ea425d2f697f087d304dc27f.gif" width="64" height="110"/>
    </li>
	]}

	case 10 { print qq[
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-170-42.hd-190-22.ch-3111-84-62.lg-275-85.sh-295-88.ha-1001.fa-1201" src="http://www.habbo.com/habbo-imaging/avatar/hr-170-42.hd-190-22.ch-3111-84-62.lg-275-85.sh-295-88.ha-1001.fa-1201,s-0.g-1.d-4.h-4.a-0,5b73a76965a94b5c622d2d2972fcbba6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011" src="http://www.habbo.com/habbo-imaging/avatar/hr-679-42.hd-209-1.ch-877-62-62.lg-270-62.sh-906-62.he-1608.ea-1406.fa-1201.ca-1802.wa-2011,s-0.g-1.d-4.h-4.a-0,e5535a893d700d9139d0d3e8a48d19f6.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62" src="http://www.habbo.com/habbo-imaging/avatar/hr-165-45.hd-180-7.ch-230-81.lg-285-79.sh-906-64.cp-3127-62,s-0.g-1.d-4.h-4.a-0,d233da4a974c523017ceac3aade13d08.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-39.hd-195-28.ch-3110-65-82.lg-3116-82-65.sh-3115-76-1315.ha-1006.he-1601.ea-1401-64,s-0.g-1.d-4.h-4.a-0,29ebb9e32be24c1c83542971d6b04629.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-40.hd-190-1.ch-3030-73.lg-285-78.sh-295-64.he-1601.fa-1204.wa-3211-81-81,s-0.g-1.d-4.h-4.a-0,8ec39f1834a4c4b20818af9c14a33f79.gif" width="64" height="110"/>
    </li>
    <li>
        <span class="bgtop"></span>
        <span class="bgbottom"></span>
        <img alt="hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008" src="http://www.habbo.com/habbo-imaging/avatar/hr-893-1316.hd-209-7.ch-878-1315-1315.lg-285-1315.sh-3115-1315-1315.ha-1002-1315.he-1609-1315.ea-1404-1315.ca-1812.wa-2008,s-0.g-1.d-4.h-4.a-0,9d648870baa8852241c08fc340ab38c5.gif" width="64" height="110"/>
    </li>
	]}
}