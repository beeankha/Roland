package Roland::Roller::Random;
use Moose;
with 'Roland::Roller';

use 5.12.0;

use Games::Dice ();

use namespace::autoclean;

# TODO delegate this to a Roller
sub roll_dice {
  my ($self, $dice, $label) = @_;

  return $dice if $dice !~ /d/;

  my $result = Games::Dice::roll($dice);
  say "rolled $dice for $label: $result" if $self->hub->debug;

  return $result;
}

1;