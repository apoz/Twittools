use LWP::Simple;
use JSON;

$URL = "http://twitter.com/statuses/user_timeline/fotomaf.json?count=200";
$content = get($URL);
my @decoded_json = @{decode_json($content)};

my $conv=0;
my $NOconv=0;
foreach $tweet (@decoded_json){
  $text = $$tweet{"text"};
  if($text=~m/^@/)
  {
    $conv++;
  } else {
    $NOconv++;
  }
}
$perc=100 * ($conv / ($conv + $NOconv));

printf "%.2f%% of your tweets are conversation.\n", $perc;