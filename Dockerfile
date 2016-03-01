FROM node:4-slim

# User management
# Make sure we switch to the correct user/group before doing anything else
RUN adduser --disabled-login --gecos "" --uid 1000 purescript
#RUN echo 'export PS1="\W\$ "' >> /home/purescript/.bashrc

RUN apt-get update && apt-get install -y curl make jq git
RUN npm install -qg bower pulp purescript

USER purescript
WORKDIR /home/purescript

CMD ["bash"]
