console.log("gallery controller is included")

GalleryCtrl = ($scope) ->
  $scope.photos = {}
  console.log("gallery controller is here")

  $scope.doAThing = ->
    console.log('done')

  $scope.addPhoto = ->
    $scope.photos.push
      filepicker_url: $scope.filepicker_url