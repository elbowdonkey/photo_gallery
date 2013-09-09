# App Controllers
window.AppCtrl = ($route, $xhr) ->
  $xhr.defaults.headers.post["Content-Type"] = "application/json"
  $xhr.defaults.headers.put["Content-Type"] = "application/json"

  $route.when "/galleries",
    template: '<%= asset_path("galleries.html") %>'
    controller: GalleriesCtrl

  $route.when "/galleries/:gallery_id",
    template: '<%= asset_path("gallery.html") %>'
    controller: GalleryCtrl

  $route.when "/galleries/:gallery_id/photos",
    template: '<%= asset_path("photos.html") %>'
    controller: PhotosCtrl

  $route.when "/galleries/:gallery_id/photos/:photo_id",
    template: '<%= asset_path("photo.html") %>'
    controller: PhotoCtrl

  $route.otherwise redirectTo: "/galleries"

GalleriesCtrl = (Galleries, $routeParams) ->
  # gallery specific things here
  @galleries = Galleries.index(gallery_id: $routeParams.photographer_id)


PhotosCtrl = (Photos, Galleries, $routeParams) ->
  # photo specific things here

PhotoCtrl = (Photo, $routeParams) ->
  # single photograph specific things here

AppCtrl.$inject = ["$route", "$xhr"]
GalleriesCtrl.$inject = ["Galleries", "$routeParams"]
PhotosCtrl.$inject = ["Photos", "Galleries", "$routeParams"]
PhotosCtrl.$inject = ["Photo", "$routeParams"]