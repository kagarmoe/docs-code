#!/bin/bash
# Download and extract binary (note maybe use latest and forget check?)
curl -LOf https://github.com/errata-ai/vale/releases/download/v2.10.2/vale_2.10.2_macOS_64-bit.tar.gz
echo "d585f2ff2e577f83eb21d9271dbade317c87e0dd45945417ea8652d4fb94dc0ad45403e96b55bcab8590a012d292194dbeac719b65c95d5bc54231d6698be3d9  vale_2.10.2_macOS_64-bit.tar.gz" |
    sha512sum --check
tar -C ~/bin/ -xf vale_2.10.2_macOS_64-bit.tar.gz --no-anchored 'vale'
# Download style guides and extract (you could ask the user which ones?)
curl -LOf https://github.com/errata-ai/Microsoft/releases/latest/download/Microsoft.zip
curl -LOf https://github.com/errata-ai/write-good/releases/latest/download/write-good.zip
unzip Microsoft.zip -d ~/bin/styles
unzip write-good.zip -d ~/bin/styles
# Create dirs and settings files
mkdir -p ~/bin/styles/Vocab/tech-blogging && touch ~/bin/styles/Vocab/tech-blogging/{accept.txt,reject.txt}
# Clean up
rm Microsoft.zip write-good.zip vale_2.10.2_macOS_64-bit.tar.gz
