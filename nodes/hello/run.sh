#!/bin/sh
# Global custom node — lives in ~/.vesslet/nodes/hello/, so it never
# prompts for approval (only project-local nodes do). Reads "name" off the
# request's state (declared in manifest.yaml's "reads") — this is what a
# launch-time --param name=... (CLI) or the dashboard's Params rows (UI)
# feeds into graph.State before any node runs. Writes "Привет {name}"
# straight into ~/.vesslet to show the process has real filesystem access,
# and also returns it as "greeting" state (declared in "writes") so it's
# visible in the dashboard timeline, not just on disk.
name=$(python3 -c "import json,sys; print(json.load(sys.stdin).get('state',{}).get('name',''))")
greeting="Привет $name"
echo "$greeting" > "$HOME/.vesslet/hello.txt"
python3 -c "import json; print(json.dumps({'ok': True, 'state': {'greeting': '$greeting'}}))"
