FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files:"

SRC_URI += "file://srg-imx8p.cfg \
            file://srg-imx8p.dts \
            file://srg-imx8p.dtsi \
            file://srg-imx8p-rpmsg.dts \
            file://srg-imx8p-ecspi-slave.dts \
           "

# Install DTS files into the kernel dts directory
do_configure:append() {
    install -m 0644 ${WORKDIR}/srg-imx8p.dts ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8p.dtsi ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8p-rpmsg.dts ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8p-ecspi-slave.dts ${S}/arch/arm64/boot/dts/freescale/
}

