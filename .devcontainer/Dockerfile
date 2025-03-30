FROM mcr.microsoft.com/devcontainers/base:ubuntu

ARG USER=vscode
ARG PYTHON_VERSION="3.12"

RUN sudo apt-get update
RUN sudo apt-get install -y unixodbc unixodbc-dev mdbtools odbcinst odbc-mdbtools sqlite3 libsqlite3-dev

USER $USER
ARG HOME="/home/$USER"

ENV DPRINT_INSTALL="/home/vscode/.dprint"
ENV PATH="$DPRINT_INSTALL/bin:$PATH"

RUN curl -fsSL https://dprint.dev/install.sh | sh

ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:$PATH"

RUN curl -fsSL https://pyenv.run | bash
RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN poetry self add poetry-plugin-shell
