ifeq ($(DEB_BUILD_ARCH),alpha)
  alphacfg := --disable-zoom
endif

config_opts := \
  $(alphacfg) \
  --enable-upgrade=no \
  --enable-hints-gnome \
  --enable-pango \
  --libdir=/usr/lib \
  --disable-esdtest \
  --disable-rpath \
  --prefix=/usr \
  --enable-dbus \
  LDFLAGS="$${LDFLAGS} -Wl,--as-needed"

