use strict;
use warnings;

use Dancer;
use Dancer::Logger;
use Data::Dumper;
use Dancer::Plugin::Auth::Extensible;
use Carp::Always;
use lib '.';

set logger => 'console';

any '/notauthenticated' => sub {
	status 401;
	return to_json({ success => 0, message => "You are not authenticated"});
};
	
any '/notauthorized' => sub {
	status 403;
	return to_json({ success => 0, message => "You are not authorized!"});
};
	
get '/test' => require_any_role ['admin'] => sub {
	return "hey, world";
};

get '/hey' => require_login sub {
	return "hello, world";
};


get '/logmein' => sub {
	session('logged_in_user', 'chris');
	session('logged_in_user_realm', 'rm');
};

get '/logmeinadmin' => sub {
	session('logged_in_user', 'chris');
	session('logged_in_user_realm', 'rm');
	session('user_roles', ['admin']);
};


#hook 'before' => sub {
#	debug 'pattern: ', request->{_route_pattern};
#	my $route = request->{_route_pattern};
#	my $route_roles = Auth->get($route);
#	if ($route_roles eq 'none') {
#		return;
#	}
#	
#	debug 'session: ', session;
# 	my $user_roles = session 'roles';
#
#
#	my $is_authorized = 0;
#	foreach my $route_role (@$route_roles) {
#		if (grep { $_ eq $route_role } @$user_roles) {
#			$is_authorized = 1;
#			last;
#		}
#	}
#	
#	if (!$is_authorized) {
#		debug(session('username') . "is not authorized to access $route");
#		status 403;
#		halt 'You are not authorized';
#	}
#};




dance;   	
