vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO PalamaraLab/DataModule
  REF c83cf0659e42c21494479f66214514c504c1837d
  SHA512 9080c1fd4c2f581b1b51b235ede90d147c463183fc14f0284e0144a309a4b7e0f94b101d6178f47304b005f683da3a2719f98746741faf3e97a71f3457c5875a
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