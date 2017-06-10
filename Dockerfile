FROM debian:stretch


# Add components used for the GUI
RUN apt-get update && apt-get install -y \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libdatrie1 \
	libdbus-1-3 \
	libfontconfig1 \
	libfreetype6 \
	libgconf-2-4 \
	libgcrypt20 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk2.0-0 \
	libgpg-error0 \
	libgraphite2-3 \
	libnotify-bin \
	libnss3 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libxcomposite1 \
	libxcursor1 \
	libxdmcp6 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	liblzma5 \
	libxkbfile1 \
	sudo \
	gnupg

# Improve font rendering
RUN echo "deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu xenial main" >>/etc/apt/sources.list &&\
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B &&\
	apt-get update  &&\
	apt-get install -y fontconfig-infinality &&\
	bash /etc/fonts/infinality/infctl.sh setstyle infinality

#Add user for apps that do not support root
RUN useradd user && usermod -aG sudo user
RUN echo "ALL            ALL = (ALL) NOPASSWD: ALL" >>/etc/sudoers
