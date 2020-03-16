#!/usr/bin/env python3

"""
Create a paste of one or more recent terminal commands and related output.

Dependencies:
 * Session must be running inside of tmux.
 * fzf
 * pastry

Credits: https://fb.workplace.com/groups/hack.of.the.day/permalink/1488151284566815/
"""

import subprocess
import itertools
import re
import sys
import tempfile

# Get the whole tmux scrollback
panecap = subprocess.run(
    ["tmux", "capture-pane", "-pS", "-"],
    stdout=subprocess.PIPE,
    check=True,
    encoding="utf-8",
)

scrollback = panecap.stdout.splitlines()

# NOTE: Change to match your custom prompt.
PROMPT_CMDLINE = r"^.*❯❯❯ "

cmds = []
collect = []
for line in scrollback:
    if re.match(PROMPT_CMDLINE, line):
        if len(collect):  # Save the full command.
            cmds.append(collect)
        collect = [line]  # Begin a new command.
    elif len(collect):  # Gather command output until next PROMPT_CMDLINE.
        collect.append(line)

if len(cmds):
    fzflines = [
        "{}\t{}".format(*c) for c in zip(itertools.count(), (ls[0] for ls in cmds))
    ]
    with tempfile.TemporaryDirectory() as td:
        for idx, cmd in zip(itertools.count(), cmds):
            with open(td + "/{}".format(idx), "w") as cf:
                cf.write("\n".join(cmd))
        fzf = subprocess.Popen(
            ["fzf", "--tac", "--multi", "+s", "--preview=cat {}/{}".format(td, "{1}")],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
        )
        cmdi, _ = fzf.communicate(input=("\n".join(fzflines)).encode("utf-8"))
        if fzf.returncode:
            sys.exit(0)
    paste = []
    for line in cmdi.decode("utf-8").splitlines():
        idx = int(line.split("\t")[0])
        print('Pasting output of "{}"'.format(cmds[idx][0]))
        paste += cmds[idx] + [""]

    subprocess.run(
        ["pastry", "-t", "shell output"], input="\n".join(paste), encoding="utf-8"
    )
