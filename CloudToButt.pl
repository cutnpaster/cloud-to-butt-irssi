use strict;
use vars qw($VERSION %IRSSI);
use Irssi qw(settings_get_str settings_add_str);

$VERSION = '0.1';
%IRSSI = (
	authors     => 'cut',
	contact     => 'cutnpaster@github/cloud-to-butt-irssi',
	name        => 'Cloud To Butt Irssi',
	description => 'Convert all cloud to butt',
	license     => 'Public Domain'
	    );

sub CloudToButt {
	my ($server, $data, $nick, $host, $target, $text, $channel) = @_;
	$data =~ s/cloud/butt/gi;
	Irssi::signal_continue($server, $data, $nick, $host, $channel);
}

sub dispatch {
	my ($server, $data, $nick, $host, $channel) = @_;
	my ($target, $text) = split(/ :/, $data, 2);
	CloudToButt $server, $data, $nick, $host, $target, $text, $channel;
}

Irssi::signal_add ('message public', \&dispatch);
