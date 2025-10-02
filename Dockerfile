FROM domjudge/judgehost:8.3.1

LABEL modified_by="Borworntat Dendumrongkul"
LABEL github="github.com/MasterIceZ/domjudge-judgehost"

ENV CHROOT_DIR /opt/domjudge/judgehost/chroot

COPY install_kotlin.sh ${CHROOT_DIR}/tmp/install_kotlin.sh

RUN chmod +x ${CHROOT_DIR}/tmp/install_kotlin.sh
RUN /opt/domjudge/judgehost/bin/dj_run_chroot /tmp/install_kotlin.sh ${KOTLIN_VERSION}