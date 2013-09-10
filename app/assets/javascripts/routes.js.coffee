app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider
    .otherwise("/")

  # Define 'app' states
  $stateProvider
    .state "default",
      abstract: true
      views:
        "":
          controller: "ApplicationController"
          templateUrl: "/assets/layouts/default.html"

    # Galleries
    .state "galleries",
      parent: "default"
      url: "/galleries"
      views:
        "":
          controller: "GalleriesController"
          templateUrl: "/assets/galleries/index.html"

    .state "new",
      parent: "galleries"
      url: "/new"
      views:
        "@default":
          controller: "GalleriesController"
          templateUrl: "/assets/galleries/new.html"

    .state "edit",
      parent: "galleries"
      url: "/:id/edit"
      views:
        "@default":
          controller: "GalleriesController"
          templateUrl: "/assets/galleries/edit.html"