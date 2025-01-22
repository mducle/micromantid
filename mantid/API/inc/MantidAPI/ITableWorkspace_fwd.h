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
  This file provides forward declarations for Mantid::API::ITableWorkspace
*/

/// forward declare of Mantid::API::ITableWorkspace
class ITableWorkspace;
/// shared pointer to Mantid::API::ITableWorkspace
using ITableWorkspace_sptr = std::shared_ptr<ITableWorkspace>;
/// shared pointer to Mantid::API::ITableWorkspace (const version)
using ITableWorkspace_const_sptr = std::shared_ptr<const ITableWorkspace>;
/// unique pointer to Mantid::API::ITableWorkspace
using ITableWorkspace_uptr = std::unique_ptr<ITableWorkspace>;
/// unique pointer to Mantid::API::ITableWorkspace (const version)
using ITableWorkspace_const_uptr = std::unique_ptr<const ITableWorkspace>;

} // namespace API
} // Namespace Mantid
