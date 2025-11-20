SUMMARY = "BSP runtime service utilities"
DESCRIPTION = "Service scripts and utilities required for proper BSP operation, including watchdog and GPIO setup."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "\ 
    file://gpio.service \
    file://watchdog.service \
    file://setup_gpios.sh \
    file://watchdog.sh \
    file://m0cli \
"

inherit systemd

SYSTEMD_SERVICE:${PN} = "\
    gpio.service \
    watchdog.service \
"

SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_install() {
    # Install systemd service units
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/gpio.service     ${D}${systemd_system_unitdir}/
    install -m 0644 ${WORKDIR}/watchdog.service ${D}${systemd_system_unitdir}/

    # Install scripts and tools
    install -d ${D}${sbindir}
    install -m 0755 ${WORKDIR}/m0cli           ${D}${sbindir}/
    install -m 0755 ${WORKDIR}/setup_gpios.sh  ${D}${sbindir}/
    install -m 0755 ${WORKDIR}/watchdog.sh     ${D}${sbindir}/
}
