#!/usr/bin/env perl
use Mojolicious::Lite;
use FindBin;
use File::Find;
#add lib
BEGIN { 
unshift @INC, "$FindBin::Bin/Controllers" ; 
unshift @INC, "$FindBin::Bin/Models" ;
}
#load all pm .
my @ctls;
find(\&_to_ctls, './Controllers','./Models');
eval "use $_" foreach @ctls;

#load model
helper users => sub { state $users = M_users->new };



get '/' => sub {
  my $c = shift;
 
  $c->render(template => 'index');
};



#an example
#auto route mojo
any '/bb/*' => sub{ _auto_route(shift)};


sub _auto_route {
my @a=split('/',$_[0]->tx->req->url->path);
my $act=pop @a;
my $ctl = join('::',my @c=splice(@a,1));
my $dd="$ctl::$act";
$_[0]->stash(template =>  join('/',@c)."/$act") ;
exists &$dd ? $ctl->$act(@_) :$_[0]->render(template => 'err' , msg=>'not found'); 
}

#for load pm
sub _to_ctls { if ($File::Find::name =~ /.\/.+?\/(.+)\.pm$/) {  
my $md = $1 ;
$md =~ s/\//::/g ;
push @ctls,$md;
} }

app->start;