package reflect;
use Dancer ':syntax';

our $VERSION = '0.1';

any '**' => sub {
    content_type 'text/plain';
    my $value = to_dumper($request);
    $value =~ s/([[:cntrl:]])/sprintf '\x%02x', ord $1/eg;
    $value;
};

true;
