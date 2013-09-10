app.factory "Galleries", ($resource) ->
  $resource("/api/galleries")
  $resource("/api/galleries/:id", {id: "@id"},
    update:
      method: "PUT"
  )

# app.factory "Thing", ($resource) ->
#   $resource("/path/:id",
#     query:
#       method: "GET" # and other verbs. angular automatically does them all except for PUT
#   )