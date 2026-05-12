default: build

# Build the binary
build:
    go build -o spmonitor ./cmd/spmonitor

# Run tests
test:
    go test ./...

# Run tests with verbose output
test-verbose:
    go test -v ./...

# Run the simulator with default settings (localhost:1883)
run *args:
    go run ./cmd/spmonitor {{args}}

# Run against a custom broker
run-broker broker *args:
    go run ./cmd/spmonitor --broker {{broker}} {{args}}

# Regenerate protobuf bindings (requires protoc + protoc-gen-go)
generate:
    go generate ./cmd/spmonitor

# Tidy go.mod / go.sum
tidy:
    go mod tidy

# Vet and staticcheck
lint:
    go vet ./...

# Format source files
fmt:
    gofmt -w -s .

# Remove build artefacts
clean:
    rm -f spmonitor
    rm -rf dist/

# Build release binaries locally via goreleaser (requires goreleaser)
release-snapshot:
    goreleaser release --snapshot --clean
