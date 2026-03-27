FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files:"

inherit uboot-config

SRC_URI += "file://memory-layout.cfg \  
            "

SRC_URI:append:srg-imx8p-a11-04 = " \
                file://aaeon/common \
                file://aaeon/srg-imx8p-a11-04 \
                file://srg-imx8p-a11-04_defconfig \
                file://srg-imx8p-a11-04.h \
                file://srg-imx8p-a11-04.dts \
                file://srg-imx8p-a11-04-u-boot.dtsi \
                file://0001-add-srg-imx8p-a11-04-board.patch \
                " 

do_configure_aaeon_sources() {
    :
}


do_configure_aaeon_sources:append:srg-imx8p-a11-04() {
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04_defconfig ${S}/configs/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04.dts ${S}/arch/arm/dts/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04-u-boot.dtsi ${S}/arch/arm/dts/
    install -d ${S}/board/aaeon/common
    install -d ${S}/board/aaeon/srg-imx8p-a11-04
    install -m 0644 ${WORKDIR}/aaeon/common/* ${S}/board/aaeon/common/
    install -m 0644 ${WORKDIR}/aaeon/srg-imx8p-a11-04/* ${S}/board/aaeon/srg-imx8p-a11-04/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04.h ${S}/include/configs/
}
addtask do_configure_aaeon_sources after do_patch before do_configure
