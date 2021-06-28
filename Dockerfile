FROM s2i-generic-data-science-notebook:v0.0.2

RUN touch iwashere && pwd && ls -la

RUN \
echo -e "[global]\n\
index=https://nexus.kela.fi/repository/pypi-group/pypi\n\
index-url=https://nexus.kela.fi/repository/pypi-group/simple\n\
extra-index-url=https://nexus.kela.fi/repository/pypi-group/simple" > /etc/pip.conf
ENV PIP_CONFIG_FILE=/etc/pip.conf
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
ENV PARALLEL = 'False'
RUN python3 -m pip install imutils
