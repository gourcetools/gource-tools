#!/usr/bin/perl
# fetch Gravatars for Git commit authors in parallel
use strict;
use warnings;

use LWP::Simple;
use Digest::MD5 qw(md5_hex);
use Getopt::Long;
use Parallel::ForkManager;

my $size       = 90;
my $output_dir = '../../avatars/raw';
GetOptions(
    "size=i"       => \$size,
    "output-dir=s" => \$output_dir,
) or die("Error in command line arguments\n");

die("No .git/ directory found in current path\n") unless -d '.git';

mkdir($output_dir) unless -d $output_dir;

open(GITLOG, q/git log --pretty=format:"%ae|%an" |/) or die("Failed to read git-log: $!\n");

my %processed_authors;
my @authors;

while (<GITLOG>) {
    chomp;
    my ($email, $author) = split(/\|/, $_);

    next if $processed_authors{$author}++;

    push @authors, {email => $email, author => $author};
}

close GITLOG;

my $fork_manager = Parallel::ForkManager->new(10); # Adjust this number based on the number of parallel downloads you want

foreach my $author_info (@authors) {
    my $author = $author_info->{author};
    my $email = $author_info->{email};

    $fork_manager->start and next;

    my $author_image_file = $output_dir . '/' . $author . '.png';

    # Skip images we have
    if (-e $author_image_file) {
        $fork_manager->finish;
        next;
    }

    # Try and fetch image
    my $grav_url = "http://www.gravatar.com/avatar/" . md5_hex(lc $email) . "?d=404&size=" . $size;

    warn "Downloading '$author' avatar...\n";

    my $rc = getstore($grav_url, $author_image_file);

    if ($rc != 200) {
        unlink($author_image_file);
    }

    $fork_manager->finish;
}

$fork_manager->wait_all_children;

