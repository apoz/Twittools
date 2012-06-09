use LWP::Simple;
use JSON;
use Getopt::Long;

my $tw_user;

$result = GetOptions ("user=s" => \$tw_user);

print "USUARIO=" . $tw_user . "\n";

if($tw_user eq "")
{
  print "Usage $0 -user twitter_user_name\n";
  exit;
}


$URL = "https://api.twitter.com/1/followers/ids.json?cursor=-1&screen_name=" . $tw_user;
$content = get($URL);
my $decoded_json = decode_json($content);

print "About to start...\n";
foreach $user (@{${$decoded_json}{"ids"}})
{
 print "Processing userid " . $user . "\n";
 $URL2= "https://api.twitter.com/1/users/show.json?user_id=" . $user. "&include_entities=true";
 $content2 = get($URL2);
 my $decoded_json2 = decode_json($content2);  
 #Reading API fields
  
 
 print "LANG=" . $lang . "\n";
 
 
}

#print @keys;