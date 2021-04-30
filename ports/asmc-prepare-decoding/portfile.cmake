vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO PalamaraLab/PrepareDecoding
  REF 61fb3ae2243f6203c30167fd465c809262f14bf0
  SHA512 e767c1fb8aa012363936853cdcd7ceea4ed8e3e802caafa66358e4333bf8e45853dbbf0df8d7bdf4c9bb7b99c374a942c83ef800d5f85b507f919c3c2b5aaaea
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
