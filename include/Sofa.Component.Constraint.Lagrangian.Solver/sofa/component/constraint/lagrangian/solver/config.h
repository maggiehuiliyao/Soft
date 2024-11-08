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
#include <sofa/config/sharedlibrary_defines.h>

#ifdef SOFA_BUILD_SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER
#  define SOFA_TARGET Sofa.Component.Constraint.Lagrangian.Solver
#  define SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER_API SOFA_EXPORT_DYNAMIC_LIBRARY
#else
#  define SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER_API SOFA_IMPORT_DYNAMIC_LIBRARY
#endif

namespace sofa::component::constraint::lagrangian::solver
{
	constexpr const char* MODULE_NAME = "Sofa.Component.Constraint.Lagrangian.Solver";
	constexpr const char* MODULE_VERSION = "24.06.00";
} // namespace sofa::component::constraint::lagrangian::solver


// deprecate _mu as member
#ifdef SOFA_BUILD_SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER
#define SOFA_ATTRIBUTE_DEPRECATED__LCPCONSTRAINTSOLVERMUMEMBER()
#else
#define SOFA_ATTRIBUTE_DEPRECATED__LCPCONSTRAINTSOLVERMUMEMBER() \
    SOFA_ATTRIBUTE_DISABLED( \
        "v23.12", "v24.06", "_mu is not a member anymore. Use the Data \"mu\" to get the friction value.")
#endif // SOFA_BUILD_SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER

#ifdef SOFA_BUILD_SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER
#define SOFA_ATTRIBUTE_DISABLED__GENERICCONSTRAINTSOLVER_CONSTRAINTCORRECTIONS()
#else
#define SOFA_ATTRIBUTE_DISABLED__GENERICCONSTRAINTSOLVER_CONSTRAINTCORRECTIONS() \
    SOFA_ATTRIBUTE_DISABLED( \
        "v23.12", "v23.12", "Use ConstraintSolverImpl::l_constraintCorrections instead")
#endif // SOFA_BUILD_SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER

#ifdef SOFA_BUILD_SOFA_COMPONENT_CONSTRAINT_LAGRANGIAN_SOLVER
#define SOFA_ATTRIBUTE_DEPRECATED__RENAME_DATA_IN_CONSTRAINT_LAGRANGIAN_SOLVER()
#else
#define SOFA_ATTRIBUTE_DEPRECATED__RENAME_DATA_IN_CONSTRAINT_LAGRANGIAN_SOLVER() \
    SOFA_ATTRIBUTE_DEPRECATED( \
        "v24.06", "v24.12", \
        "Data renamed according to the guidelines")
#endif
