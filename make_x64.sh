#!/bin/sh -e

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <X64.zip>" >&2
	exit 1
fi

OUTPUT_DIR="${OUTPUT_DIR:-x64_build}"
X64_ARCHIVE="$1"
ARM64_ARCHIVE="$2"

rm -fr "${OUTPUT_DIR}" && mkdir "${OUTPUT_DIR}"

unzip -p "${X64_ARCHIVE}" amd64/ftd2xx64.dll >"${OUTPUT_DIR}/usbblstr64.dll"
unzip -p "${X64_ARCHIVE}" i386/ftd2xx.dll >"${OUTPUT_DIR}/usbblstr32.dll"
unzip -p "${X64_ARCHIVE}" amd64/ftlang.dll >"${OUTPUT_DIR}/usbblstrlang.dll"
unzip -p "${X64_ARCHIVE}" amd64/ftbusui.dll >"${OUTPUT_DIR}/usbblstrui.dll"
unzip -p "${X64_ARCHIVE}" ftdibus.cat >"${OUTPUT_DIR}/usbblstr.cat"

cp usbblstr.inf.x64 "${OUTPUT_DIR}/usbblstr.inf"
