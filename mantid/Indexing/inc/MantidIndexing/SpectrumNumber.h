// Mantid Repository : https://github.com/mantidproject/mantid
//
// Copyright &copy; 2017 ISIS Rutherford Appleton Laboratory UKRI,
//   NScD Oak Ridge National Laboratory, European Spallation Source,
//   Institut Laue - Langevin & CSNS, Institute of High Energy Physics, CAS
// SPDX - License - Identifier: GPL - 3.0 +
#pragma once

#include "MantidIndexing/DllConfig.h"
#include "MantidIndexing/IndexType.h"

#include <cstdint>

namespace Mantid {
namespace Indexing {

/** A unique identifier for a spectrum in a workspace.

  @author Simon Heybrock
  @date 2017
*/
class SpectrumNumber : public detail::IndexType<SpectrumNumber, int32_t> {
public:
  using detail::IndexType<SpectrumNumber, int32_t>::IndexType;
  using detail::IndexType<SpectrumNumber, int32_t>::operator=;
};

} // namespace Indexing
} // namespace Mantid
