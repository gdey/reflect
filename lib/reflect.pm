package reflect;
use Dancer ':syntax';
use Data::Dumper;

our $VERSION = '0.1';

get '/' => sub {
    Dumper(request())
};

true;
