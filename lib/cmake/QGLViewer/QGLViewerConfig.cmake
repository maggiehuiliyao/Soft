# CMake package configuration file for the QGLViewer library


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was QGLViewerConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

set(QGLVIEWER_HAVE_QT5_CORE 1)
set(QGLVIEWER_HAVE_QT6_CORE )

if(QGLVIEWER_HAVE_QT6_CORE)
    find_package(Qt6 COMPONENTS Widgets OpenGLWidgets QUIET REQUIRED)
elseif(QGLVIEWER_HAVE_QT5_CORE)
    find_package(Qt5 COMPONENTS Core Gui Xml OpenGL Widgets QUIET REQUIRED)
endif()

if(NOT TARGET QGLViewer)
	include("${CMAKE_CURRENT_LIST_DIR}/QGLViewerTargets.cmake")
endif()

set(QGLViewer_LIBRARIES QGLViewer)
set(QGLViewer_INCLUDE_DIRS )

check_required_components(QGLViewer)