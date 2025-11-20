FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files:"

SRC_URI += "file://srg-imx8p-a11-04.cfg \
            file://srg-imx8p-a11-04.dts \
            file://srg-imx8p-a11-04.dtsi \
            file://srg-imx8p-a11-04-rpmsg.dts \
            file://srg-imx8p-a11-04-ecspi-slave.dts \
           "

# Install DTS files into the kernel dts directory
do_patch:append() {
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04.dts ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04.dtsi ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04-rpmsg.dts ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8p-a11-04-ecspi-slave.dts ${S}/arch/arm64/boot/dts/freescale/
}

