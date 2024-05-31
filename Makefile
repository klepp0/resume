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
	open --background src/main.pdf

# Convert the first page of the PDF to PNG
png:
	@echo "Converting the first page of the PDF to PNG..."
	docker run --rm -v "`pwd`:/workspace" -w /workspace latex-builder sh -c "pdftoppm -png -singlefile src/main.pdf main"
	@echo "PNG image of the first page of the PDF created successfully."

# Clean up the LaTeX build files
clean:
	@echo "Cleaning up LaTeX build files..."
	find . -type f \( -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.pdf" \) -exec rm -f {} +
	@echo "LaTeX build files cleaned up successfully."

# Show help message
help:
	@echo "make build - build the docker image"
	@echo "make pdf - compile the latex files"
	@echo "make png - convert the first page of the pdf to png"
	cv_image@echo "make clean - clean up the latex build files"
	@echo "make help - show this help message"

# Declare all targets as PHONY
.PHONY: build pdf clean help
