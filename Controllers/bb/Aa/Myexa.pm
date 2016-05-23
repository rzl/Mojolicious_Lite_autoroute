package bb::Aa::Myexa;

#use Mojo::Base 'Mojolicious::Controller';

sub new{belss{}, shift}

sub wb {
  my ($self,$c) = @_;
 
  # Render template "example/welcome.html.ep" with message
  $c->render(text => $c->tx->req->url->path);
}


1;
