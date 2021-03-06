defmodule Monero.Request.HttpClient do
  @moduledoc """
  Specifies expected behaviour of an http client

  Monero allows you to use your http client of choice, provided that
  it can be coerced into complying with this module's specification.

  The default is :hackney.

  ## Example
  Here for example is the code required to make HTTPotion comply with this spec.

  In your config you would do:

  ```elixir
  config :monero,
    http_client: Monero.Request.HTTPotion
  ```

  ```elixir
  defmodule Monero.Request.HTTPotion do
    @behaviour Monero.Request.HttpClient
    def request(method, url, body, headers) do
      {:ok, HTTPotion.request(method, url, [body: body, headers: headers, ibrowse: [headers_as_is: true]])}
    end
  end
  ```
  """

  @type http_method :: :get | :post | :put | :delete
  @callback request(method :: http_method, url :: binary, req_body :: binary, headers :: [{binary, binary}, ...], http_opts :: term) ::
    {:ok, %{status_code: pos_integer, body: binary}} |
    {:error, %{reason: any}}
end
