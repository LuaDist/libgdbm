# Copyright (C) 2007-2009 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

PROJECT(libgdbm C)
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
INCLUDE(dist.cmake)

# generating autoconf.h file:
	MESSAGE("Configure: GDBM - generating autoconf.h:")
	INCLUDE (CheckIncludeFiles)
	INCLUDE (CheckFunctionExists)
	INCLUDE (CheckSymbolExists)
	INCLUDE (CheckLibraryExists)
	INCLUDE (CheckTypeSize)

	CHECK_FUNCTION_EXISTS(bcopy HAVE_BCOPY)
	CHECK_INCLUDE_FILES (dlfcn.h HAVE_DLFCN_H)
	CHECK_INCLUDE_FILES (fcntl.h HAVE_FCNTL_H)
	CHECK_FUNCTION_EXISTS(flock HAVE_FLOCK)
	CHECK_FUNCTION_EXISTS(fsync HAVE_FSYNC)
	CHECK_FUNCTION_EXISTS(ftruncate HAVE_FTRUNCATE)
	CHECK_FUNCTION_EXISTS(getopt HAVE_GETOPT)
	CHECK_INCLUDE_FILES (inttypes.h HAVE_INTTYPES_H)
	CHECK_LIBRARY_EXISTS(dbm "" "" HAVE_LIBDBM)
	CHECK_LIBRARY_EXISTS(ndbm "" "" HAVE_LIBNDBM)
	CHECK_INCLUDE_FILES (memory.h HAVE_MEMORY_H)
	CHECK_FUNCTION_EXISTS(rename HAVE_RENAME)
	CHECK_INCLUDE_FILES (stdint.h HAVE_STDINT_H)
	CHECK_INCLUDE_FILES (stdlib.h HAVE_STDLIB_H)
	CHECK_INCLUDE_FILES (strings.h HAVE_STRINGS_H)
	CHECK_INCLUDE_FILES (string.h HAVE_STRING_H)
	CHECK_SYMBOL_EXISTS(st_blksize "sys/stat.h" HAVE_STRUCT_STAT_ST_BLKSIZE)

	CHECK_INCLUDE_FILES ("sys/file.h" HAVE_SYS_FILE_H)
	CHECK_INCLUDE_FILES ("sys/stat.h" HAVE_SYS_STAT_H)
	CHECK_INCLUDE_FILES ("sys/types.h" HAVE_SYS_TYPES_H)
	CHECK_INCLUDE_FILES (unistd.h HAVE_UNISTD_H)

	SET(PACKAGE_BUGREPORT "")
	SET(PACKAGE_NAME "gdbm")
	SET(PACKAGE_STRING "gdbm 1.8.3")
	SET(PACKAGE_TARNAME "gdbm")
	SET(PACKAGE_VERSION "1.8.3")

	CHECK_INCLUDE_FILES("stdlib.h;stdarg.h;string.h;float.h" STDC_HEADERS)

	#TODO:
	#/* Define to empty if `const' does not conform to ANSI C. */
	##undef const

	CHECK_TYPE_SIZE("off_t" SIZEOF_OFF_T)
	IF(HAVE_SIZEOF_OFF_T)
		SET (HAVE_OFF_T 1)
	ELSE(HAVE_SIZEOF_OFF_T)
		SET (HAVE_OFF_T 0)
		SET (off_t "long")
	ENDIF(HAVE_SIZEOF_OFF_T)

	CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/autoconf.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/autoconf.h)

	MESSAGE("Configure: GDBM - done.")
# end of generating autoconf.h file:

###########################################################################################

SET (DBM_CF dbminit.c delete.c fetch.c store.c seq.c close.c)
SET (NDBM_CF dbmopen.c dbmdelete.c dbmfetch.c dbmstore.c dbmseq.c dbmclose.c dbmdirfno.c dbmpagfno.c dbmrdonly.c)
SET (GDBM_CF gdbmopen.c gdbmdelete.c gdbmfetch.c  gdbmstore.c gdbmclose.c gdbmreorg.c gdbmseq.c gdbmsync.c gdbmerrno.c gdbmexists.c gdbmfdesc.c gdbmsetopt.c bucket.c falloc.c findkey.c global.c hash.c update.c version.c)
CONFIGURE_FILE(gdbm.proto gdbm.h COPYONLY)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})

ADD_LIBRARY(gdbm SHARED ${GDBM_CF} ${DBM_CF})
INSTALL(TARGETS gdbm DESTINATION ${INSTALL_LIB})
INSTALL(FILES gdbmdefs.h extern.h gdbmerrno.h systems.h dbm.h ndbm.h gdbmconst.h proto.h ${CMAKE_CURRENT_BINARY_DIR}/gdbm.h DESTINATION ${INSTALL_INC})
