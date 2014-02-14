# Find the CUnit includes and library
#
# This module defines
# LibConfig_INCLUDE_DIR, where to find cppunit include files, etc.
# LibConfig_LIBRARIES, the libraries to link against to use CppUnit.
# LibConfig_STATIC_LIBRARY_PATH
# LibConfig_FOUND, If false, do not try to use CppUnit.


# also defined, but not for general use are
# LibConfig_LIBRARY, where to find the CUnit library.


#MESSAGE("Searching for libconfig library")


FIND_PATH(LibConfig_INCLUDE_DIR libconfig.h++
  /usr/local/include
  /usr/include
  ~/libs/include
  ~/include
)


FIND_LIBRARY(LibConfig_LIBRARY config++
  /usr/local/lib
  /usr/lib
  ~/libs/lib
)


FIND_LIBRARY(LibConfig_STATIC_LIBRARY "libconfig++${CMAKE_STATIC_LIBRARY_SUFFIX}"
    /usr/local/lib
    /usr/lib
    ~/libs/lib
)


IF(LibConfig_INCLUDE_DIR)
    IF(LibConfig_LIBRARY)
        SET(LibConfig_LIBRARIES ${LibConfig_LIBRARY})
        SET(LibConfig_FOUND TRUE)
        SET(LibConfig_STATIC_LIBRARY_PATH ${LibConfig_STATIC_LIBRARY})
    ENDIF(LibConfig_LIBRARY)
ENDIF(LibConfig_INCLUDE_DIR)

IF (LibConfig_FOUND)
   IF (NOT LibConfig_FIND_QUIETLY)
       MESSAGE(STATUS "Found LibConfig++: ${LibConfig_LIBRARY}" )
       MESSAGE(STATUS "static LibConfig path: ${LibConfig_STATIC_LIBRARY_PATH}")
   ENDIF (NOT LibConfig_FIND_QUIETLY)
ELSE (LibConfig_FOUND)
   IF (LibConfig_FIND_REQUIRED)
      MESSAGE(SEND_ERROR "Could NOT find LibConfig")
   ENDIF (LibConfig_FIND_REQUIRED)
ENDIF (LibConfig_FOUND)


MARK_AS_ADVANCED(LibConfig_INCLUDE_DIR LibConfig_LIBRARY)

