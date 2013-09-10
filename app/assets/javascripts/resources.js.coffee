app.factory "Galleries", ($resource, apiPrefix) ->
  $resource("/api/",
    query:
      method: "GET"
  )