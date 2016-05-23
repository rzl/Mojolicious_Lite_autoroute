package bb::Login;

sub new{belss{}, shift}

sub login {
  my ($self,$c) = @_;
  my $pwd = $c->param('password') || '';
  if ($pwd) 
  {
  $c->render(template => 'bb/Login/logined') if $c->users->check($pwd);
  } 
  else 
  { 
  $c->render();
  }
  
}



1;
