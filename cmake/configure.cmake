# generating autoconf.h file:
include ( CheckIncludeFiles )
include ( CheckFunctionExists )
include ( CheckSymbolExists )
include ( CheckLibraryExists )
include ( CheckTypeSize )

check_function_exists ( bcopy HAVE_BCOPY )
check_include_files ( dlfcn.h HAVE_DLFCN_H )
check_include_files ( fcntl.h HAVE_FCNTL_H )
check_function_exists ( flock HAVE_FLOCK )
check_function_exists ( fsync HAVE_FSYNC )
check_function_exists ( ftruncate HAVE_FTRUNCATE )
check_function_exists ( getopt HAVE_GETOPT )
check_include_files ( inttypes.h HAVE_INTTYPES_H )
check_library_exists ( dbm "" "" HAVE_LIBDBM )
check_library_exists ( ndbm "" "" HAVE_LIBNDBM )
check_include_files ( memory.h HAVE_MEMORY_H )
check_function_exists ( rename HAVE_RENAME )
check_include_files ( stdint.h HAVE_STDINT_H )
check_include_files ( stdlib.h HAVE_STDLIB_H )
check_include_files ( strings.h HAVE_STRINGS_H )
check_include_files ( string.h HAVE_STRING_H )
check_symbol_exists ( st_blksize "sys/stat.h" HAVE_STRUCT_STAT_ST_BLKSIZE )

check_include_files ( "sys/file.h" HAVE_SYS_FILE_H )
check_include_files ( "sys/stat.h" HAVE_SYS_STAT_H )
check_include_files ( "sys/types.h" HAVE_SYS_TYPES_H )
check_include_files ( unistd.h HAVE_UNISTD_H )

set ( PACKAGE_BUGREPORT "" )
set ( PACKAGE_NAME "gdbm" )
set ( PACKAGE_STRING "gdbm 1.8.3" )
set ( PACKAGE_TARNAME "gdbm" )
set ( PACKAGE_VERSION "1.8.3" )

check_include_files ( "stdlib.h;stdarg.h;string.h;float.h" STDC_HEADERS )

#TODO:
#/* Define to empty if `const' does not conform to ANSI C. */
##undef const

check_type_size ( "off_t" SIZEOF_OFF_T )
if ( HAVE_SIZEOF_OFF_T )
  set ( HAVE_OFF_T 1 )
else ( HAVE_SIZEOF_OFF_T )
  set ( HAVE_OFF_T 0 )
  set ( off_t "long" )
endif ( HAVE_SIZEOF_OFF_T )
