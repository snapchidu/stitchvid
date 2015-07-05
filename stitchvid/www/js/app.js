// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
var Stitch = angular.module('Stitch', ['ionic'])

Stitch.controller('StitchCtrl', function() {
  var self = this;

  // self.takePicture = function() {


  //     function OnDeviceReady(){

  //       Camera.sourceType = Camera.PictureSourceType.CAMERA;

  //       navigator.camera.getPicture(onSuccess, onFail, {
  //           quality: 50,
  //           destinationType: Camera.DestinationType.DATA_URL
  //       });

  //       function onSuccess(){
  //         alert('success');
  //       }

  //       function onFail(){

  //         alert('fail');
  //       }
  //       }

   });

Stitch.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})
