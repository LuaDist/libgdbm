# Copyright (C) 2007-2012 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( libgdbm C )
cmake_minimum_required ( VERSION 2.8 )
include ( cmake/dist.cmake )
include ( configure )

configure_file ( ${CMAKE_CURRENT_SOURCE_DIR}/autoconf.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/autoconf.h )

set ( DBM_CF dbminit.c delete.c fetch.c store.c seq.c close.c )
set ( NDBM_CF dbmopen.c dbmdelete.c dbmfetch.c dbmstore.c dbmseq.c dbmclose.c dbmdirfno.c 
  dbmpagfno.c dbmrdonly.c )
set ( GDBM_CF gdbmopen.c gdbmdelete.c gdbmfetch.c gdbmstore.c gdbmclose.c gdbmreorg.c 
  gdbmseq.c gdbmsync.c gdbmerrno.c gdbmexists.c gdbmfdesc.c gdbmsetopt.c bucket.c 
  falloc.c findkey.c global.c hash.c update.c version.c )
configure_file ( gdbm.proto gdbm.h COPYONLY )

include_directories ( ${CMAKE_CURRENT_BINARY_DIR} )
add_library ( gdbm ${GDBM_CF} ${DBM_CF} ${NDBM_CF} )

install_library ( gdbm )
install_header ( gdbmdefs.h extern.h gdbmerrno.h systems.h dbm.h ndbm.h gdbmconst.h proto.h 
  ${CMAKE_CURRENT_BINARY_DIR}/gdbm.h )
install_data ( COPYING README )