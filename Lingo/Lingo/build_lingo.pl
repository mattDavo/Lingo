#!/usr/local/bin/perl

use warnings;
use strict;

use File::Basename;

my $root_dir = $ARGV[0];

my @strings = `find "${root_dir}" | grep "\\.strings\$"`;

my %tables = ();

for my $file (@strings) {
    chomp $file;
    my $base_filename = basename($file);
    my $table_name = $base_filename =~ s/.strings$//r;
    
    open my $f, "<", "$file" or die "$0: Failed to open $file\n";
    my @lines = <$f>;
    for my $line (@lines) {
        $line =~ s/\/\/.*//;
        if ($line =~ /\s*\"(.+)\"\s*=\s*\".+\"\s*;/) {
            $tables{$table_name} = () unless defined $tables{$table_name};
            $tables{$table_name}{$1} = 1;
        }
    }
    
    close $f;
}

my $lingo_path = $ARGV[1];
my $lingo_basename = basename($lingo_path);

open my $out, ">", "$lingo_path" or die "$0: Failed to open $lingo_path for writing\n";

my $tabs = ' ' x 4;

print $out "//\n";
print $out "//  $lingo_basename\n";
print $out "//  Auto-generated by Lingo\n";
print $out "//\n\n";
print $out "public struct Lingo {\n";
print $out "$tabs\n";

for my $table (sort keys %tables) {
    
    print $out "${tabs}public struct $table {\n";
    print $out "$tabs$tabs\n";
    print $out "$tabs${tabs}static var tableName = \"$table\"\n";
    print $out "$tabs$tabs\n";
    
    for my $key (sort keys %{$tables{$table}}) {
        $key =~ s/-/_/g;
        $key =~ s/\./_/g;
        $key =~ s/ /_/g;
        
        print $out "$tabs${tabs}public static var $key: String {\n";
        print $out "$tabs$tabs${tabs}return \"$key\".localized(tableName: Lingo.${table}.tableName)\n";
        print $out "$tabs$tabs}\n";
    }
    
    print $out "$tabs}\n";
}

print $out "}\n";

close $out;

exit 0;
