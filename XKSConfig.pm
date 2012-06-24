package XKSConfig;
use strict;
use Exporter ();
use vars qw( $c );
@XKSConfig::ISA    = qw(Exporter);
@XKSConfig::EXPORT = qw($c);

$c=
{
	# MySQL settings
	db_host => 'localhost',
	db_login => 'root',
	db_passwd => 'contraseña',
	db_name => 'base de datos',
	db_port => '3306',
	
	# Facebook APP
	fb_appid => '216788425021197',
	
	# Web Settings
	http_host => '//localhost', # //tuholo.com
	images_host => 'http://images.xukys-hotel.com',
	hotel_name => 'Beryllium',
	recaptcha_public => '6LdyotESAAAAACo7c14ygFdKznwuV4vVpvyxofY1',
	recaptcha_private => '6LdyotESAAAAAK4uFwkZByeH41Vuw_iSbjJO7AFZ',
	
	# Register
	limit_reg_age => '1', # 1 = Limita la edad. Si tienen menos de 14 años se les denegará la entrada || 0 = Lo desactiva
	limit_reg_age_year => 1998, # X año para arriba, son bloqueados si está habilitada la variable limit_reg_age
	
	register_mxcheck => 0, # Verifica el registro MX (email) del dominio entrado en el apartado "Mail". Esto puede causar sobrecarga en la web si es usado mal, o hay muchos usuarios.
	
	# Client
	ip_server => '188.165.249.196',
	port_server => '993',
	
	external_variables => 'http://images.xukys-hotel.com/gamedata/vars1.txt?',
	external_flash_texts => 'http://images.xukys-hotel.com/gamedata/flash_texts.txt?',
	furnidata => 'http://images.xukys-hotel.com/gamedata/furnidata_es.txt?',
	productdata => 'http://images.xukys-hotel.com/gamedata/productdata_es.txt?',
	
	gordon_swf_release => 'http://images.xukys-hotel.com/gordon/RELEASE63-201111301255-246708300/',
	
	# Widgets settings
	twitter => 'xukyshotel', # ID de tu twitter. Dejar en blanco para deshabilitar.
	google_analytics => '', # ID de tu Google Analytics. Ejemplo: UA-123123-1 Dejar en blanco para deshabilitar.
	
	# Advertising
	ad728x90 => '<script type="text/javascript"><!--
smowtion_size = "728x90";
smowtion_section = "2831591";
//-->
</script>
<script type="text/javascript"
src="http://ads.smowtion.com/ad.js?s=2831591&z=728x90">
</script>' # Cuidado con las comillas '
}