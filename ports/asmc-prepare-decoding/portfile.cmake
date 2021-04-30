vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO PalamaraLab/PrepareDecoding
  REF ac2c292133091f965042185e318cdc60528d0ad0
  SHA512 55e3fc75e2719118e5a516ee53e4ab6b6f21a90706d6bb46c38fe45d5d01146894ebd736eca316e431c4f5d8ae84c492205aaf5d1fc963c1710e0a588c6dd007
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
