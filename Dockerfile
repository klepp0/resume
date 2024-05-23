# Use an official TeX Live image as the base image
FROM texlive/texlive

# Install necessary tools
RUN apt-get update && apt-get install -y \
    make \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /workspace

# Assume the LaTeX document to build is named main.tex, adjust as necessary
CMD pdflatex -interaction=nonstopmode main.tex && \
    pdflatex -interaction=nonstopmode main.tex
