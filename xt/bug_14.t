#!/usr/bin/perl -w

# https://github.com/bessarabov/Time-ETA/issues/14

use Test::More;
use Test::Warnings;

use Time::ETA;
use Time::ETA::MockTime;

sub main_in_test {

    pass('Loaded ok');

    Time::ETA::MockTime::set_mock_time(1389200452, 619014);

    my $eta = Time::ETA->new(
        milestones => 12,
    );

    $eta->pause();

    cmp_ok(
        $eta->get_elapsed_seconds(),
        '<',
        0.01,
        'get_elapsed_seconds() should return very small number',
    );

    done_testing();
}
main_in_test();
