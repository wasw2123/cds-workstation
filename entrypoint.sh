#!/bin/sh
set -e

exec uv run fastapi run main.py --host 0.0.0.0 --port 8000
