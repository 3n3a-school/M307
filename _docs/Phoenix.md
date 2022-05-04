# Phoenix Notes

## Important Commands

* Generate MySQL Project `mix phx.new hello_phoenix --database mysql`
* Generate Containerfile `mix phx.gen.release --docker`

## Why Elixir?

* scalable -> creates a thread for each processor core
* elixir has BEAM a VM
* in VM there are processes, and it can run millions of them (up to 2m)
* if one Erlang Process dies, then the whole server doesn't feel a thing
* maintainable, less code, less problems

![Erlang with BEAM, each core gets a scheduler, that allows concurrent processes](https://miro.medium.com/max/1400/0*acC0P3hFGAGywgGz.png)

## Why Phoenix?

* easy setup with code generation
* standard naming / folder conventions `NAME.FORMAT.TEMPLATING_LANGUAGE`
* PHP isn't meant to be used with a Router ...
* [Phoenix + Vue](https://dev.to/sethcalebweeks/phoenix-16-vue-esbuild-59i0)

### A Controller

```erlang
defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
```

### A View

```erlang
defmodule HelloWeb.PageView do
  use HelloWeb, :view
end
```

### A Template

```html
<main class="container">
  <p class="alert alert-info" role="alert"
    phx-click="lv:clear-flash"
    phx-value-key="info"><%= live_flash(@flash, :info) %></p>

  <p class="alert alert-danger" role="alert"
    phx-click="lv:clear-flash"
    phx-value-key="error"><%= live_flash(@flash, :error) %></p>

  <%= @inner_content %>
</main>
```