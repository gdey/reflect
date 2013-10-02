package reflect;

use Dancer ':syntax';
use Data::Dumper;
use MongoDB;

our $VERSION = '0.1';


any '**' => sub {
    content_type 'text/plain';
    my $request = request();

    # mongodb://reflect:reflect123@ds049198.mongolab.com:49198/reflect-db
    MongoDB::MongoClient->new(
        host => 'mongodb://'
            . 'reflect:reflect123'
            . '@ds049198.mongolab.com:49198'
            . '/reflect-db'
    )
        ->get_database('reflect-db')
        ->get_collection('requests')
        ->insert($request);

    Data::Dumper->new([$request] => [qw(*request)])
        ->Indent(1)
        ->Useqq(1)
        ->Purity(0)
        ->Quotekeys(0)
        ->Sortkeys(1)
        ->Dump();
};

true;
