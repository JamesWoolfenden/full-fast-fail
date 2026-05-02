FROM node:12@sha256:01627afeb110b3054ba4a1405541ca095c8bfca1cb6f2be9479c767a2711879e # 12
RUN pwsh SOME_CMD | SOME_OTHER_CMD
SHELL [ "zsh", "-o","pipefail" ]
RUN zsh ./some_output | ./some_script
SHELL [ "/bin/bash", "-o","pipefail" ]
RUN [ "/bin/bash", "./some_output", "./some_script" ]
