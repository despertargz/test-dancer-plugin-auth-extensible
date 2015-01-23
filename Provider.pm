package Dancer::Plugin::Auth::Extensible::Provider::Mine;

use base "Dancer::Plugin::Auth::Extensible::Provider::Base";

sub authenticate_user {
	#dont need to implement
}

sub get_user_details {
	#dont need to implement
}

sub get_user_roles {
    my ($self, $username) = @_;

	return session('user_roles');
}

return 1;
