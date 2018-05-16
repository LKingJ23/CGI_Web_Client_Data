#!/usr/bin/perl

#use CGI;
use utf8;

#$perlcgi = new CGI;

# print $perlcgi->header(-charset => 'utf-8');
# print $perlcgi->start_html('Accesos');
print "Content-Type: text/html\n\n";
open F, '>>/tmp/acces.txt' or die "Imposible abrir el fichero:$!";

if($ENV{'REQUEST_METHOD'} eq 'GET'){
  print F $ENV{'HTTP_USER_AGENT'} .  ':' . $ENV{'REMOTE_ADDR'} . ':' . $ENV{'REQUEST_METHOD'} .  ':' . $ENV{'QUERY_STRING'} . "\n";
}
else {
  #$datosPost = '';
  #read(STDIN, $datosPost, $ENV{'CONTENT_LENGTH'});
  $datosPost = <STDIN>;
  print "*---------" . $datosPost . "---------*";
  print F $ENV{'HTTP_USER_AGENT'} . ':' . $ENV{'REMOTE_ADDR'}. ':' . $ENV{'REQUEST_METHOD'} . ':' . $datosPost . "\n";
}

close F;
open F, '/tmp/acces.txt' or die "Imposible abrir el fichero:$!";

while(<F>) {
  print "$_ <br>";
}

close F;