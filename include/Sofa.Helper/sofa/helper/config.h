/******************************************************************************
*                 SOFA, Simulation Open-Framework Architecture                *
*                    (c) 2006 INRIA, USTL, UJF, CNRS, MGH                     *
*                                                                             *
* This program is free software; you can redistribute it and/or modify it     *
* under the terms of the GNU Lesser General Public License as published by    *
* the Free Software Foundation; either version 2.1 of the License, or (at     *
* your option) any later version.                                             *
*                                                                             *
* This program is distributed in the hope that it will be useful, but WITHOUT *
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or       *
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License *
* for more details.                                                           *
*                                                                             *
* You should have received a copy of the GNU Lesser General Public License    *
* along with this program. If not, see <http://www.gnu.org/licenses/>.        *
*******************************************************************************
* Authors: The SOFA Team and external contributors (see Authors.txt)          *
*                                                                             *
* Contact information: contact@sofa-framework.org                             *
******************************************************************************/
#pragma once

#include <sofa/config.h>

#define SOFA_HELPER_HAVE_BOOST 0
#define SOFA_HELPER_HAVE_BOOST_THREAD 0
#define SOFA_HELPER_HAVE_BOOST_FILESYSTEM 0

// DEPRECATED since v21.06
// will be removed at v21.12
#define SOFAHELPER_HAVE_BOOST = ;
#define SOFAHELPER_HAVE_BOOST_THREAD = ;
#define SOFAHELPER_HAVE_BOOST_FILESYSTEM = ;

#ifdef SOFA_BUILD_SOFA_HELPER
#  define SOFA_TARGET Sofa.Helper
#  define SOFA_HELPER_API SOFA_EXPORT_DYNAMIC_LIBRARY
#else
#  define SOFA_HELPER_API SOFA_IMPORT_DYNAMIC_LIBRARY
#endif

#ifdef SOFA_BUILD_SOFA_HELPER
#define SOFA_PROXIMITY_CLASSES_DISABLED()
#else
#define SOFA_PROXIMITY_CLASSES_DISABLED() \
    SOFA_ATTRIBUTE_DISABLED( \
        "v23.06", "v23.12", "Use free functions in sofa::geometry::proximity instead")
#endif // SOFA_BUILD_SOFA_HELPER

#ifdef SOFA_BUILD_SOFA_HELPER
#define SOFA_MESHTOPOLOGYLOADER_LOADMESHFUNCTION_DISABLED()
#else
#define SOFA_MESHTOPOLOGYLOADER_LOADMESHFUNCTION_DISABLED() \
    SOFA_ATTRIBUTE_DISABLED( \
        "v23.12", "v24.06", "This function is not replaced.")
#endif // SOFA_BUILD_SOFA_HELPER

#ifdef SOFA_BUILD_SOFA_HELPER
#define SOFA_LCPCALC_AFFICHELCP_DISABLED()
#else
#define SOFA_LCPCALC_AFFICHELCP_DISABLED() \
SOFA_ATTRIBUTE_DISABLED( \
"v23.12", "v24.06", "This function is replaced by printLCP.")
#endif // SOFA_BUILD_SOFA_HELPER

#ifdef SOFA_BUILD_SOFA_HELPER
#define SOFA_LCPCALC_AFFICHESYST_DISABLED()
#else
#define SOFA_LCPCALC_AFFICHESYST_DISABLED() \
SOFA_ATTRIBUTE_DISABLED( \
"v23.12", "v24.06", "This function is replaced by printSyst.")
#endif // SOFA_BUILD_SOFA_HELPER

#ifdef SOFA_BUILD_SOFA_HELPER
#define SOFA_LCPCALC_RESOUDRELCP_DISABLED()
#else
#define SOFA_LCPCALC_RESOUDRELCP_DISABLED() \
SOFA_ATTRIBUTE_DISABLED( \
"v23.12", "v24.06", "This function is replaced by solveLCP.")
#endif // SOFA_BUILD_SOFA_HELPER
