FROM node:4-slim

# User management
# Make sure we switch to the correct user/group before doing anything else
ARG user
RUN adduser --disabled-login --gecos "" --uid 1000 --home /home/purescript $user
RUN echo 'export PS1="\W\$ "' >> /home/purescript/.bashrc

RUN apt-get update && apt-get install -y curl make jq git
RUN npm install -qg bower pulp purescript

USER $user
WORKDIR /home/purescript
CMD ["bash"]
