#!/usr/bin/perl -w

use DBI;

# MySQL database config
my $db = "DBI:mysql:test";
my $dbuser = "root";
my $dbpass = "12345";

print "Connect to mysql database 'test'\n";

# Connect to mysql database
my $dbc  = DBI->connect($db,$dbuser,$dbpass,);

print "Connected to the mysql database 'test'\n";

# Get sum values from colum sizeOfFiles in table files
my $dbs  = $dbc->selectrow_array("SELECT SUM(sizeOfFiles) FROM files");

my $limit = "5046586572.8"; # 4.7 Gb in bytes

# If $dbs more then 4.7 GB print "Size of files is more then 4.7 GB'
if ($dbs > $limit) {
print "Size of files is more then 4.7 GB\n";
$result = 1;
}
# Else print "Size of files is less then 4.7 GB" 
else {
print "Size of files is less then 4.7 GB\n";
$result = 0;
}

# Disconnect from the MySQL database
print "Disconnect from mysql database 'test'\n";
$dbc->disconnect();

exit($result);
