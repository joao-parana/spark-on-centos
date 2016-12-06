# jupyter-scala

> Jupyter Notebook with jupyter-scala kernal running on Java 8 and Python 3 

# Usage

## Qucik start

```bash
docker run --rm -i -t -p 8888:8888 parana/jupyter-scala
```

## Using Volume and setting Password

```bash
docker run --rm -i -t -p 8888:8888 \
  -v "$(pwd)/notebooks:/notebooks" \
  -e JUPYTER_PASSWORD=my-passwd-123 \
  parana/jupyter-scala
```

## About jupyter-scala Jupyter kernel

jupyter-scala is based on a slightly modified version of **Ammonite**, so allows to

* add dependencies / repositories,
* manage pretty-printing,
* load external scripts, etc.

the same way Ammonite does, with the same API, described in
[its documentation](http://www.lihaoyi.com/Ammonite/#Ammonite-REPL).

For editing scala code conveniently, see how to [configure notebook frontend](http://jupyter-notebook.readthedocs.io/en/latest/frontend_config.html#persisting-configuration-settings).

Example of attributes : `indentUnit:2`, `smartIndent:false`


