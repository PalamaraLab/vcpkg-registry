vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO PalamaraLab/PrepareDecoding
  REF 19ca4add0d3971a460578fd3deb233ead93b30bb
  SHA512 9e5acb69215c29dd1205c3e7dfb83037db75b8c9d276ce611027bd17d09d75825616facab15efd795439a41d0b3e8f847d56ae827e8f0841fbe283e207ed96a1
  HEAD_REF master
)

include(GNUInstallDirs)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH "${CMAKE_INSTALL_LIBDIR}/cmake/AsmcPrepareDecoding")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)
