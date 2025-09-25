FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files:"

SRC_URI += "file://srg-imx8mp.cfg \
            file://srg-imx8mp.dts \
            file://srg-imx8mp-rpmsg.dts \
            file://srg-imx8mp-ecspi-slave.dts \
           "

KERNEL_CONFIG_FRAGMENTS += "srg-imx8mp.cfg"

