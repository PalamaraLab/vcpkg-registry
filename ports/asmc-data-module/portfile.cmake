vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO PalamaraLab/DataModule
  REF 0a94bc032e4e12bacf3e9a1a0c9f5b6b74991cdb
  SHA512 ecd107d097949f4e976182cf0ad10b52c5629bd749c8c106d6456dcc197543ed7e829295bb736ea2e63e00759bcd9f77bb04242f119a7841cbbce3924f567191
  HEAD_REF main
)

include(GNUInstallDirs)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH "${CMAKE_INSTALL_LIBDIR}/cmake/asmc-data-module")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)
