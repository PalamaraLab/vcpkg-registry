vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO PalamaraLab/PrepareDecoding
  REF 1a1418a3de1dfd9ac4abd0f0fd475c557fb5ed72
  SHA512 f5a745d634acdef17ab7ea8882687f265960c7a0a76451869ab8ad34c9538d4bf3eff22e490fee7c11ac6168544618b5d9d95411832eb5e9beb7a1310e9e9e9b
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
