// Mantid Repository : https://github.com/mantidproject/mantid
//
// Copyright &copy; 2017 ISIS Rutherford Appleton Laboratory UKRI,
//   NScD Oak Ridge National Laboratory, European Spallation Source,
//   Institut Laue - Langevin & CSNS, Institute of High Energy Physics, CAS
// SPDX - License - Identifier: GPL - 3.0 +
#pragma once

#include "MantidIndexing/DllConfig.h"
#include "MantidIndexing/IndexType.h"

namespace Mantid {
namespace Indexing {

/** Partition index

  @author Simon Heybrock
  @date 2017
*/
class PartitionIndex : public detail::IndexType<PartitionIndex, int> {
public:
  using detail::IndexType<PartitionIndex, int>::IndexType;
  using detail::IndexType<PartitionIndex, int>::operator=;
};

} // namespace Indexing
} // namespace Mantid
