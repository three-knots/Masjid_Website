# Use Ubuntu Linux as base image
FROM ubuntu:latest
#SHELL ["/bin/bash", "-c"]

# Expose port 4000
EXPOSE 4000

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    musl-dev \
    git \
    dirmngr\
    gpg \
    curl \
    gawk \
    build-essential \
    zlib1g-dev \
    libffi-dev \
#    openssl \
    dh-autoreconf \
    nano \
    vim \
    wget



# Set working directory
WORKDIR /$HOME



# Install ruby
#RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

#RUN wget https://raw.githubusercontent.com/three-knots/Masjid_Website/Staging-Resources/.bashrc >> .bashrc

# Add asdf to PATH
#ENV PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

# Set ASDF_DIR
#ENV ASDF_DIR="$HOME/.asdf"

# Source asdf.sh and ensure ASDF_DIR is set before sourcing
#RUN /bin/bash -c "export ASDF_DIR=$HOME/.asdf && source $HOME/.asdf/asdf.sh"

# Add asdf executables to PATH
#ENV PATH="$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH"

# Source asdf bash completions
#RUN /bin/bash -c "source $HOME/.asdf/completions/asdf.bash"

# Set environment variables
#ENV CC=clang
#ENV GEM_HOME="$HOME/gems"
#ENV PATH="$HOME/gems/bin:$PATH"

#new attempt to get ruby a different way
# Check out ruby-build and install
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/ruby-build
RUN /usr/local/ruby-build/install.sh

# Install the version of Ruby we want and add to the path
RUN ruby-build 3.3.0 /usr/local/ruby-3.3.0
ENV PATH="/usr/local/ruby-3.3.0/bin:${PATH}"

#fix .bashrc
RUN ["/bin/sh", "-c", "/bin/bash", "-c", "source .bashrc"]
#RUN . .bashrc 

# .bashrc additions were not working due to embedded quotation marks.  
# Uploaded file to github for download via next line below these
#RUN echo ". "$HOME/.asdf/asdf.sh" " >> .bashrc && echo ". "$HOME/.asdf/completions/asdf.bash" " >> .bashrc 
#RUN echo "export CC=clang " >> .bashrc 
#RUN echo "export GEM_HOME="$HOME/gems"" >>.bashrc 
#RUN echo "export PATH="$HOME/gems/bin:$PATH"" >> .bashrc 



#asdf ruby installation
#RUN /bin/bash -c ". $HOME/.asdf/asdf.sh && asdf plugin-add ruby && asdf plugin-update ruby && asdf install ruby latest"
#RUN asdf plugin add ruby 
#RUN asdf plugin update ruby 
#RUN asdf install ruby latest 
#RUN asdf global ruby latest 
#   asdf install ruby-dev


# Clone git repository (replace <repository_link> with your actual link)
RUN git clone https://github.com/three-knots/Masjid_Website.git

# Set working directory
WORKDIR /~/Masjid_Website

# Check available branches and checkout to the desired branch
#RUN git branch -a && \
#   git checkout Contact_Page


# Install Jekyll
RUN gem install jekyll bundler

# Initialize a new Gemfile
RUN bundle init

#Problems with this section completing reliably, so changing the way I handle this.
# Modify Gemfile to add necessary gems
#RUN echo "source "https://rubygems.org"" >> Gemfile && \
#    echo "gem 'github-pages', group: :jekyll_plugins" >> Gemfile \
#    echo "gem 'webrick'" >> Gemfile  \
#    echo "gem "wdm", "~> 0.1.1", :install_if => Gem.win_platform?" >> Gemfile
# echo "gem 'jekyll-remote-theme'" >> Gemfile\
# echo "gem 'jekyll-theme-cayman', '~> 0.2.0'" >> Gemfile

# wget -O flag overrides existing Gemfile.  
RUN wget https://raw.githubusercontent.com/three-knots/Masjid_Website/Staging-Resources/Gemfile -O Gemfile

# Update and install gems
RUN bundle update && \
    bundle install \
    gem update \
    gem csv

# Add DNS resolution
# RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"] 
