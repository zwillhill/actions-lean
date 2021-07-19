include $(TOPDIR)/rules.mk

PKG_NAME:=nodejs
PKG_VERSION:=0.10.25
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/node-v$(PKG_VERSION)
PKG_SOURCE:=node-v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nodejs.org/dist/v$(PKG_VERSION)/
PKG_MD5SUM:=153bdbf77b4473df2600b8ce123ef331
PKG_CAT:=zcat

PKG_LICENSE:=MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/node-v$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/nodejs
  SECTION:=lang
  CATEGORY:=Languages
  DEFAULT:=y
  TITLE:=Javascript environment based on V8
  URL:=http://nodejs.org/
  DEPENDS:=+libpthread +librt +libstdcpp +libcryptoxx +libopenssl
# HOST_NODEJS_DEPENDENCIES = host-python
  MENU:=1
endef

define Package/nodejs/description
 Event-driven I/O server-side JavaScript environment based on V8.
endef

define Package/node/config
	source "$(SOURCE)/Config.in"
endef

define Package/npm
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Nodejs Package Manager
  URL:=http://nodejs.org/
  DEPENDS:=nodejs
endef

define Package/npm/description
 Nodejs Package Manager
endef


PKG_INSTALL=1

ifeq ($(ARCH),i386)
  NODEJS_CPU=ia32
else ifeq ($(ARCH),x86_64)
  NODEJS_CPU=x64
else ifeq ($(ARCH),arm)
  NODEJS_CPU=arm
  # V8 needs to know what floating point ABI the target is using.  There's also
  # a 'hard' option which we're not exposing here at the moment, because
  # buildroot itself doesn't really support it at present.
  ifeq ($(HAS_FPU),y)
    NODEJS_ARM_FP=soft
  else
    NODEJS_ARM_FP=softfp
  endif
endif

# need to override the whole CONFIGURE_ARGS, since it's not autotools, but a custom python script
CONFIGURE_ARGS = \
	--prefix=/usr \
	--without-dtrace  \
	--without-snapshot \
	--without-etw \
	--dest-cpu=$(ARCH) \
	$(if $(CONFIG_PACKAGE_libopenssl),--shared-openssl,--without-ssl) \
	$(if $(CONFIG_PACKAGE_npm),,--without-npm) \
	$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
	--dest-os=linux

HOST_CONFIGURE_ARGS = \
	--prefix=$(STAGING_DIR_HOST)/usr \
	--without-snapshot \
	--without-dtrace  \
	--without-etw \
	$(if $(CONFIG_PACKAGE_libopenssl),--shared-openssl,--without-ssl)

# for some reason this newer ld for arm does not have -rpath option (or at least they aren't taking) so go to g++
TARGET_CONFIGURE_OPTS += \
	LD=$(TARGET_CROSS)g++

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Host/Configure
          (cd $(HOST_BUILD_DIR); \
	  ./configure $(HOST_CONFIGURE_VARS) $(HOST_CONFIGURE_ARGS); \)
endef

define Host/Compile
	$(call Host/Compile/Default)
endef

define Host/Install
	$(call Host/Install/Default)
endef

CONFIG_NODEJS_MODULE_express=y
CONFIG_NODEJS_MODULE_semaphore=y
CONFIG_NODEJS_MODULE_sqlite=y
CONFIG_NODEJS_MODULE_imagemagick=y
CONFIG_NODEJS_MODULE_locale=y
CONFIG_NODEJS_MODULE_request=y

#
# Build the list of modules to install based on the booleans for
# popular modules, as well as the "additional modules" list.
#
NODEJS_MODULES_LIST= $(call qstrip,\
	$(if $(CONFIG_NODEJS_MODULE_express),express) \
	$(if $(CONFIG_NODEJS_MODULE_semaphore),semaphore) \
	$(if $(CONFIG_NODEJS_MODULE_sqlite3),sqlite3) \
	$(if $(CONFIG_NODEJS_MODULE_imagemagick),imagemagick) \
	$(if $(CONFIG_NODEJS_MODULE_locale),locale) \
	$(if $(CONFIG_NODEJS_MODULE_request),request) \
	$(if $(CONFIG_NODEJS_MODULE_forever),forever) \
	$(if $(CONFIG_NODEJS_MODULE_coffeescript),coffee-script) \
	$(CONFIG_NODEJS_MODULE_ADDITIONAL))

#
# We can only call NPM if there's something to install.
#
ifneq ($(NODEJS_MODULES_LIST),)
define NODEJS_INSTALL_MODULES
	# If you're having trouble with module installation, adding -d to the
	# npm install call below and setting npm_config_rollback=false can both
	# help in diagnosing the problem.
	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
		$(TARGET_CONFIGURE_OPTS) \
		LD="$(TARGET_CXX)" \
		npm_config_arch=$(NODEJS_CPU) \
		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(PKG_VERSION) \
		$(STAGING_DIR_HOST)/usr/bin/npm install \
		$(NODEJS_MODULES_LIST) \
	)
endef
endif

define Package/nodejs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/node $(1)/usr/bin/
	echo "****"
	$(NODEJS_INSTALL_MODULES)
endef

define Package/npm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/npm $(1)/usr/bin/
endef

#$(eval $(call BuildPackage,nodejs))
$(eval $(call HostBuild))
$(eval $(call BuildPackage,nodejs))
