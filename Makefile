# Makefile for building LaTeX documents with Docker

# Build the Docker image
build:
	docker build -t latex-builder .
	@echo "Docker image 'latex-builder' built successfully."

# Compile the LaTeX files to PDF
pdf:
	docker run --rm -v "`pwd`:/workspace" latex-builder
	@echo "LaTeX files compiled successfully."
	@echo "Opening the generated PDF file..."
	#open file detached (dont switch active window)
	open --background main.pdf

# Clean up the LaTeX build files
clean:
	@echo "Cleaning up LaTeX build files..."
	rm *.aux *.log *.out *.pdf
	@echo "LaTeX build files cleaned up successfully."

# Show help message
help:
	@echo "make build - build the docker image"
	@echo "make pdf - compile the latex files"
	@echo "make clean - clean up the latex build files"
	@echo "make help - show this help message"

# Declare all targets as PHONY
.PHONY: build pdf clean help
