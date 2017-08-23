def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.
    :param repl: `PythonRepl` instance.
    """
    # Vi mode.
    repl.vi_mode = True

    # Enable 24bit True color. (Not all terminals support this. -- maybe check
    # $TERM before changing.)
    repl.true_color = True
