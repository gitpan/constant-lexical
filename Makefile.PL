BEGIN { require 5.008 } # 5.6.[12] %^H scoping bug

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'constant::lexical',
    AUTHOR              => 'Father Chrysostomos <sprout [hat] cpan . org>',
    VERSION_FROM        => 'lib/constant/lexical.pm',
    ABSTRACT_FROM       => 'lib/constant/lexical.pm',
    PL_FILES            => {},
    PREREQ_PM => {
         $] >= 5.011002 ? (
          Carp        => 0,
          Lexical'Sub => 0,
         ) : (
          constant    => 1.03, # multiple
          Sub::Delete =>
              0+$] eq 5.01
           && eval {require Sub::Delete }
           && VERSION Sub::Delete >= .03
                       ? 1.00001 # %^H scoping bug
                       : 0,
         ),
# for testing:
	Test::More => 0,
    },
    dist               => { COMPRESS => 'gzip -9f', SUFFIX => 'gz',
                            TAR => 'COPYFILE_DISABLE=1 tar' },
    clean              => { FILES => 'constant-lexical-*' },
);
