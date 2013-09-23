package reflect;
use Dancer ':syntax';

our $VERSION = '0.1';

any '**' => sub {
    content_type 'text/plain';
    to_dumper request();
};

true;
