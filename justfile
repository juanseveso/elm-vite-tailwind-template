# List all available recipes
default:
    @just --list

# Install Elm packages
install *ELM_PACKAGES:
    @if [ -z "{[ELM_PACKAGES}}" ]; then \
        npm install; \
    else \
        elm-json install {{ELM_PACKAGES}}; \
    fi

# Run the development server with hot reloading
dev:
    npm run dev

# Build the project
build:
    npm run build

# Run the tests
test:
    npm run test

# Uninstall Elm packages
uninstall *ELM_PACKAGES:
    elm-json uninstall {{ELM_PACKAGES}}

# Upgrade Elm dependencies
upgrade-elm-deps:
    elm-json upgrade
