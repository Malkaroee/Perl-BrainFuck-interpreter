#!/usr/bin/perl
# BrainFuck (BrainF***) interpreter - Roee Malka

my @source_code = <STDIN>;
my $initial;
my @commands;
my $pointer;
my @values;
my $complete;
my %definition = (
	'>' => '$pointer++;',
	'<' => '$pointer--;',
	'+' => '$values[$pointer]++;',
	'-' => '$values[$pointer]--;',
	',' => '$values[$pointer] = ord(getc);',
	'.' => 'print chr($values[$pointer]);',
	'[' => 'while ($values[$pointer]) {',
	']' => '}',
);

foreach my $command (@source_code) {
	$_ =~ s/[^><\+\-,\.\[\]]//g;
	$initial .= $command;
}

@commands = split("", $initial);

foreach my $command (@commands) {
	$complete .= $definition{$command}
}

eval $complete;
