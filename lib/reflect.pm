package reflect;
use Dancer ':syntax';
use Data::Dumper;

our $VERSION = '0.1';

any '**' => sub {
    content_type 'text/plain';
    Data::Dumper->new([request()] => [qw(*request)])
        ->Indent(1)
        ->Useqq(1)
        ->Purity(0)
        ->Quotekeys(0)
        ->Sortkeys(1)
        ->Dump();
};

true;
