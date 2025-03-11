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
  This file provides forward declarations for Mantid::API::MatrixWorkspace
*/

/// forward declare of Mantid::API::MatrixWorkspace
class MatrixWorkspace;
/// shared pointer to Mantid::API::MatrixWorkspace
using MatrixWorkspace_sptr = std::shared_ptr<MatrixWorkspace>;
/// shared pointer to Mantid::API::MatrixWorkspace (const version)
using MatrixWorkspace_const_sptr = std::shared_ptr<const MatrixWorkspace>;
/// unique pointer to Mantid::API::MatrixWorkspace
using MatrixWorkspace_uptr = std::unique_ptr<MatrixWorkspace>;
/// unique pointer to Mantid::API::MatrixWorkspace (const version)
using MatrixWorkspace_const_uptr = std::unique_ptr<const MatrixWorkspace>;

} // namespace API
} // namespace Mantid
