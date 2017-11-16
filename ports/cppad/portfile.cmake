include(vcpkg_common_functions)
set(VERSION 20170000)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/CppAD-stable-${VERSION})
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/coin-or/CppAD/archive/stable/${VERSION}.zip"
    FILENAME "CppAD-stable-${VERSION}.zip"
    SHA512 6605f7c6586ee53e6a132b557d1f69d5fc124093582902f2bfe7ea939b0c19fdd0174b25e23ba5b32f81f8e96f39afa3774b4cac917666c5ce29cfd9ef26b2b8
)
vcpkg_extract_source_archive(${ARCHIVE})

#file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG
        -DINSTALL_HEADERS=OFF
)

vcpkg_install_cmake()

file(COPY ${SOURCE_PATH}/README DESTINATION ${CURRENT_PACKAGES_DIR}/share/cppad)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/cppad/README ${CURRENT_PACKAGES_DIR}/share/cppad/copyright)

vcpkg_copy_pdbs()
