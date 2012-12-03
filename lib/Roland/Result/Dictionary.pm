package Roland::Result::Dictionary;
use Moose;
with 'Roland::Result';

use namespace::autoclean;

has results => (
  isa => 'ArrayRef',
  required => 1,
  traits   => [ 'Array' ],
  handles  => { _results => 'elements' },
);

sub as_text {
  my ($self, $indent) = @_;
  $indent //= 0;

  my $text = '';

  for my $slot ($self->_results) {
    $text .= sprintf '%s: %s', $slot->[0], $slot->[1]->as_text($indent+1);
  }

  return $text;
}

1;