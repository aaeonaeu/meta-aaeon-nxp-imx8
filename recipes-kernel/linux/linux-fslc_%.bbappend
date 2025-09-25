FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files:"

SRC_URI += "file://srg-imx8mp.cfg \
            file://srg-imx8mp.dts \
            file://srg-imx8mp.dtsi \
            file://srg-imx8mp-rpmsg.dts \
            file://srg-imx8mp-ecspi-slave.dts \
           "

# Install DTS files into the kernel dts directory
do_configure:append() {
    install -m 0644 ${WORKDIR}/srg-imx8mp.dts ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8mp.dtsi ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8mp-rpmsg.dts ${S}/arch/arm64/boot/dts/freescale/
    install -m 0644 ${WORKDIR}/srg-imx8mp-ecspi-slave.dts ${S}/arch/arm64/boot/dts/freescale/
}

KERNEL_CONFIG_FRAGMENTS += "srg-imx8mp.cfg"

