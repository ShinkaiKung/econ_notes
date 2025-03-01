.PHONY: watch compile

ifeq ($(OS),Windows_NT)
    # Windows
    watch:
		@PowerShell -Command "typst watch notes.typ --root ."

    compile:
		@PowerShell -Command "typst compile notes.typ"
else
    # WSL or Unix-like system
    watch:
		@bash -c "typst watch notes.typ --root ."

    compile:
		@bash -c "typst compile notes.typ"
endif