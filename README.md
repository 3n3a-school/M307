# M307

## Generate Project

```sh
mix phx.new —database=mysql —no-dashboard —no-live —no-mailer
```

## Start Dev

1. Start Mysql Db 

```sh
(cd _infra/dev/ && ./start.sh)
```

2. Start dev server

```sh
mix phx.server
```

## Start Prod

Run script

```sh
(cd _infra/prod/ && ./start.sh)
```