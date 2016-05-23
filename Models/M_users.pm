package M_users;

my $USERS = '123';

sub new { bless {}, shift }

sub check {

  my ($self, $pass) = @_;
	
  # Success
  return 1 if $USERS eq $pass;

  # Fail
  return 0;
}

1;