"use strict";
var app=angular.module('myApp',[]);
app.factory('userService', function(){
     
    var fac = [];
     
 adddata=function(jsonVal){
	 fac.push(jsonVal);
 };
 getData=function(){
	 return fac;
 };
     
    return {
    	addData:adddata,
    	getData:getData
    };
 
});
app.controller('mySec',function($scope,$rootScope,userService){
	console.log('second controller');
	var data=userService.getData();
	console.log(data);
	$rootScope.$on('Joson', function(response,err) {
		if(err){
			console.log('$$$$$$$$'+err);
		}
		console.log('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'+response);
	     
	     
	});
});