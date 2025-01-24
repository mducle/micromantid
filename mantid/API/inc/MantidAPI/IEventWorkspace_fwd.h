// Mantid Repository : https://github.com/mantidproject/mantid
//
// Copyright &copy; 2015 ISIS Rutherford Appleton Laboratory UKRI,
//   NScD Oak Ridge National Laboratory, European Spallation Source,
//   Institut Laue - Langevin & CSNS, Institute of High Energy Physics, CAS
// SPDX - License - Identifier: GPL - 3.0 +
#pragma once

#include <memory>

namespace Mantid {
namespace API {
/**
  This file provides forward declarations for Mantid::API::IEventWorkspace
*/

/// forward declare of Mantid::API::IEventWorkspace
class IEventWorkspace;
/// shared pointer to Mantid::API::IEventWorkspace
using IEventWorkspace_sptr = std::shared_ptr<IEventWorkspace>;
/// shared pointer to Mantid::API::IEventWorkspace (const version)
using IEventWorkspace_const_sptr = std::shared_ptr<const IEventWorkspace>;
/// unique pointer to Mantid::API::IEventWorkspace
using IEventWorkspace_uptr = std::unique_ptr<IEventWorkspace>;
/// unique pointer to Mantid::API::IEventWorkspace (const version)
using IEventWorkspace_const_uptr = std::unique_ptr<const IEventWorkspace>;

} // namespace API
} // namespace Mantid
