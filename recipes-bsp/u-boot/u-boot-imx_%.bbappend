FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files:"

SRC_URI += "file://srg-imx8p-a11-04.dts \
            file://0001-add-srg-imx8p-a11-04-board.patch \
            "

SRC_URI:append:srg-imx8p-a11-04 = " \
                file://aaeon/common/mmc.c \
                file://aaeon/common/tcpc.h \
                file://aaeon/common/tcpc.c \
                file://aaeon/common/Makefile \
                file://aaeon/srg-imx8p-a11-04/ddr4_timing.c \
                file://aaeon/srg-imx8p-a11-04/srg-imx8p-a11-04.c \
                file://aaeon/srg-imx8p-a11-04/imximage-8mp-lpddr4.cfg \
                file://aaeon/srg-imx8p-a11-04/Kconfig \
                file://aaeon/srg-imx8p-a11-04/lpddr4_timing_ndm.c \
                file://aaeon/srg-imx8p-a11-04/lpddr4_timing.c \
                file://aaeon/srg-imx8p-a11-04/Makefile \
                file://aaeon/srg-imx8p-a11-04/MAINTAINERS \
                file://aaeon/srg-imx8p-a11-04/spl.c \
                file://srg-imx8p-a11_defconfig \
                file://srg-imx8p-a11-04.h \
                "


EXTRA_UBOOT_BOOTLOADER_FILE:srg-imx8p-a11-04 = " \
                             file://imx-boot-srg-imx8p-4g-sd.bin-flash_evk \
                            "
                            
UBOOT_DTB_NAME:srg-imx8p-a11-04 = "srg-imx8p-a11-04.dtb"
EXTRA_UBOOT_BOOTLOADER:srg-imx8p-a11-04 = "imx-boot-srg-imx8p-4g-sd.bin-flash_evk"

python do_patch:append() {
    bb.build.exec_func("do_install_extra_defconfig", d)
}

do_install_extra_defconfig() {
    install -m 0644 ${WORKDIR}/srg-imx8p-a11_defconfig ${S}/configs/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04.dts ${S}/arch/arm/dts/
    sed -i '/^include $(srctree)\/scripts\/Makefile.dts/i dtb-$(CONFIG_ARCH_IMX8M) += srg-imx8p-a11-04.dtb' ${S}/arch/arm/dts/Makefile
    install -d ${S}/board/aaeon/common
    install -d ${S}/board/aaeon/srg-imx8p-a11-04
    install -m 0644 ${WORKDIR}/aaeon/common/* ${S}/board/aaeon/common/
    install -m 0644 ${WORKDIR}/aaeon/srg-imx8p-a11-04/* ${S}/board/aaeon/srg-imx8p-a11-04/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04.h ${S}/include/configs/
}

addtask do_install_extra_defconfig after do_patch before do_configure