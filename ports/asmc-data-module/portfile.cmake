vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO PalamaraLab/DataModule
  REF a6cefc48403abfa8f6b2dba4d2bb1294a401f040
  SHA512 4195c504572277e584d5d1e755815d2c1e309a451edbed76e41a7dcd31380d29d97869ad8a604c37085b323dc628c2e9b989ab2ea62eb487b9c98c31f16e2dea
  HEAD_REF main
)

include(GNUInstallDirs)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH "${CMAKE_INSTALL_LIBDIR}/cmake/AsmcDataModule")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)