package Dancer::Plugin::Auth::Extensible::Provider::Rm;

use base "Dancer::Plugin::Auth::Extensible::Provider::Base";
use Dancer;


sub authenticate_user {
	#dont need to implement
}

sub get_user_details {
	my ($self, $username, $realm) = @_;

	return $username;	
}

sub get_user_roles {
    my ($self, $username) = @_;

	return session('user_roles');
}

return 1;
