// Mantid Repository : https://github.com/mantidproject/mantid
//
// Copyright &copy; 2018 ISIS Rutherford Appleton Laboratory UKRI,
//   NScD Oak Ridge National Laboratory, European Spallation Source,
//   Institut Laue - Langevin & CSNS, Institute of High Energy Physics, CAS
// SPDX - License - Identifier: GPL - 3.0 +
//----------------------------------------------------------------------
// Includes
//----------------------------------------------------------------------

/********** PLEASE NOTE! THIS FILE WAS AUTO-GENERATED FROM CMAKE.  ***********************/
/********** Source = MantidVersion.cpp.in *****************************************************/

#include "MantidKernel/MantidVersion.h"

#include <sstream>

namespace Mantid::Kernel {

/**
 * See buildconfig/CMake/VersionNumber.cmake for more information on the meaning
 * of the version number elements
 */

const char* MantidVersion::version()
{
  return "6.11.20250110.1450.dev6";
}

const char* MantidVersion::versionShort()
{
  return "6.11";
}

const MantidVersion::VersionInfo MantidVersion::versionInfo() {
  return {"6", "11", "20250110.1450", ".dev6"};
}

std::string MantidVersion::versionForReleaseNotes(const VersionInfo& version) {
  // Convert here in those cases where patch number is of the form "20131022.1356".
  const unsigned long patchVersion = std::stoul(version.patch);
  // For major/minor/patch/rc/local releases we point users to a specific release-notes.
  // For dev and nightly versions we point to the next main release notes.
  // We assume that the next main release version number will be one minor version higher.

  std::stringstream versionLabel;

  if ( (patchVersion < 100 && version.tweak.empty())
      || version.tweak[0] == '+'
      || version.tweak.substr(0, 2) == "rc") {
    versionLabel << version.major << "." << version.minor;
    versionLabel << "." << patchVersion;
  }
  else {
    const unsigned long minorVersion = std::stoul(version.minor);
    versionLabel << version.major << "." << minorVersion + 1  << "." << "0";
  }

  return versionLabel.str();
}

std::string MantidVersion::releaseNotes()
{
  const std::string STEM = "qthelp://org.mantidproject/doc/release/v";
  const std::string END = "/index.html";

  std::stringstream url;

  url << STEM << versionForReleaseNotes(versionInfo()) << END;

  return url.str();
}

const char* MantidVersion::revision()
{
  return "g794f130bf20";
}

const char* MantidVersion::revisionFull()
{
  return "794f130bf20ab7ba98d67ae2799b7c87cdaff920";
}

const char* MantidVersion::releaseDate()
{
  return "Mon, 13 Jan 2025";
}

std::string MantidVersion::doi()
{
  const std::string MAIN = "http://dx.doi.org/10.5286/Software/Mantid";
  // Cast here in those cases where patch number is of the form 20131022.1356.
  const unsigned int patchVersion = static_cast<unsigned int>(20250110.1450);

  // For major/minor/patch releases we point users to a specific release-notes DOI, for
  // dev versions we just point to the main DOI.  A simple way to see whether or not
  // we're currently in a dev version is to check if the patch version is larger than
  // some arbitrarily low value.
  const std::string tweakVersion(".dev6");
  if( patchVersion > 100 || !tweakVersion.empty())
    return MAIN;

  std::stringstream doi;
  doi << MAIN << 6 << "." << 11;

  // Keep to the convention where we write a version number like "3.0.0" as "3.0".
  if( patchVersion != 0 )
    doi << "." << patchVersion;

  return doi.str();
}

std::string MantidVersion::paperCitation()
{
  return "http://dx.doi.org/10.1016/j.nima.2014.07.029";
}

} // namespace Mantid::Kernel
