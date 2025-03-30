FROM mcr.microsoft.com/devcontainers/base:ubuntu

ARG USER="vscode"
ARG PYTHON_VERSION="3.12"

# Prepare ODBC Drivers for installation
RUN curl -sSL -O https://packages.microsoft.com/config/ubuntu/$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2)/packages-microsoft-prod.deb
RUN sudo dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN sudo apt-get update

# Install dependecies
RUN sudo ACCEPT_EULA=Y apt-get install -y \
    unixodbc \
    unixodbc-dev \
    mdbtools \
    odbcinst \
    odbc-mdbtools \
    sqlite3 \
    libsqlite3-dev \
    msodbcsql18

USER $USER
ARG HOME="/home/$USER"
WORKDIR /home/vscode

ENV DPRINT_INSTALL="/home/vscode/.dprint"
ENV PATH="$DPRINT_INSTALL/bin:$PATH"

# Install dprint
RUN curl -fsSL https://dprint.dev/install.sh | sh

ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:$PATH"

# Install and configure pyenv
RUN curl -fsSL https://pyenv.run | bash
RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN poetry self add poetry-plugin-shell
