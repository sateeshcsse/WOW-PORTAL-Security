<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Project COQ</title> 
<!-- <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" /> -->
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link href="styles/jqueryUI.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/Home.css">
<link rel="stylesheet" href="styles/metisMenu.min.css">
<link rel="stylesheet" href="styles/sideBar.css">
<link rel="stylesheet" href="styles/reportArea.css">
<link rel="stylesheet" href="styles/dataTables.bootstrap.css">
<link rel="stylesheet" href="styles/ngDialog.css">
<link rel="stylesheet" href="styles/ngDialog-theme-default.css">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.js"></script>

<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>


<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/angular-1.4.7/angular-animate.js" ></script>
<script src="js/ngDialog.js" ></script>
<script type="text/javascript" src="js/simplePagination.js"></script>
<script type="text/javascript" src="js/dirPagination.js"></script>

<script type="text/javascript" src="js/html2canvas.js"></script>
<style>

table#COQReportTableImage tbody tr td:nth-child(1){
cursor:pointer;
text-align: center;
}
.ngdialog-overlay{
font-family: "Roboto Condensed", Arial, sans-serif;
}

#COQReportTableImage{
	text-align: center;
}

</style>
<script>
var totalTable=$('.generationArea');
$(document).on({
	ajaxStart: function() { console.log('ajaxxxxxxxxxxxxxxx starteddddddddddddd');
	totalTable.addClass("loading");    
	},
    ajaxStop: function() { 
    	console.log('ajaxxxxxxxxxxxxxxx stopped');
    	totalTable.removeClass("loading"); 
    	
    }   
});




$(document).ready(function(){
	$("#sel2").val('2016');
	$("#sel1").val('ALL');
	

	});




</script>




<script>
var app1= angular.module('reportModule',['ngDialog','simplePagination','angularUtils.directives.dirPagination']);

app1.factory('ProjectPhaseService', ['$http', '$q', function($http) {

    var factory = {
        getProjectPhase: function(portfolio) {
            portfolio = angular.toJson(portfolio);
            console.log(portfolio);
            var data2 = $http({
                method: 'GET',
                url: 'getProjectforCOQReport.do',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                params: {
                    'portfolio': portfolio
                }
            }).then(function(response) {
               
                return response.data;

            });
            return data2;
        }
    };
    console.log('factory' + factory);
    return factory;
}]);

app1.config(["ngDialogProvider", function (ngDialogProvider) {
    ngDialogProvider.setDefaults({
        className: "ngdialog-theme-default",
        plain: false,
        showClose: true,
        closeByDocument: true,
        closeByEscape: true,
        appendTo: false,
        cache :true
      
       
    });
}]); 

 app1.directive('tableValue',function($q, $http, $templateCache,$compile,Pagination){
	return{
		restrict:'A',
		replace:true,
		scope:{
			results:'=bindingFoo'			
		},
		template:'<tr align="right" ng-repeat="result in results" ng-class="{ \'fa-slide-up\': !showMe, \'fa-slide-down\': showMe }" ><div ><td ng-click="openDialog(result.projname)" id="greenBackground"> {{result.projname}} </td><td>{{result.prevCost | currency:undefined:2}}</td><td>{{result.appraisalCost| currency:undefined:2}}</td><td>{{result.intFailureCost| currency:undefined:2}}</td><td>{{result.extFailureCost| currency:undefined:2}}</td><td>{{result.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{result.totalCost | currency:undefined:2}}</td><td id="greenBackground">{{result.COTper}}%</td><td align="center" id="greenBackground">{{result.COQper}}%</td></div></tr>',

	};
}); 
 
 app1.directive('tableValueEnter',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforEnter:'=bindingEnterprise'			
			},
			template:'<tr align="right" ng-repeat="resultforEnter in resultsforEnter" ng-class="{ \'fa-slide-up\': !showMeEnter, \'fa-slide-down\': showMeEnter }" ><div ><td ng-click="openDialog(resultforEnter.projname)" id="greenBackground"> {{resultforEnter.projname}} </td><td>{{resultforEnter.prevCost| currency:undefined:2}}</td><td>{{resultforEnter.appraisalCost| currency:undefined:2}}</td><td>{{resultforEnter.intFailureCost| currency:undefined:2}}</td><td>{{resultforEnter.extFailureCost|  currency:undefined:2}}</td><td>{{resultforEnter.perfCost|  currency:undefined:2}}</td><td id="greenBackground">{{resultforEnter.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforEnter.COTper}}%</td><td align="center" id="greenBackground">{{resultforEnter.COQper}}%</td></div></tr>',
			

		};
	}); 

 app1.directive('tableValueGfs',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforGFS:'=bindingGfs'			
			},
			template:'<tr align="right" ng-repeat="resultsforGFSS in resultsforGFS" ng-class="{ \'fa-slide-up\': !showMeGFS, \'fa-slide-down\': showMeGFS }" ><div ><td ng-click="openDialog(resultsforGFSS.projname)" id="greenBackground"> {{resultsforGFSS.projname}} </td><td>{{resultsforGFSS.prevCost| currency:undefined:2}}</td><td>{{resultsforGFSS.appraisalCost| currency:undefined:2}}</td><td>{{resultsforGFSS.intFailureCost| currency:undefined:2}}</td><td>{{resultsforGFSS.extFailureCost| currency:undefined:2}}</td><td>{{resultsforGFSS.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultsforGFSS.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultsforGFSS.COTper}}%</td><td align="center" id="greenBackground">{{resultsforGFSS.COQper}}%</td></div></tr>',
			
		};
	}); 
 
 app1.directive('tableValueInfra',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforInfra:'=bindingInfra'			
			},
			template:'<tr align="right" ng-repeat="resultsforInf in resultsforInfra" ng-class="{ \'fa-slide-up\': !showMeInfra, \'fa-slide-down\': showMeInfra }" ><div ><td ng-click="openDialog(resultsforInf.projname)" id="greenBackground"> {{resultsforInf.projname}} </td><td>{{resultsforInf.prevCost| currency:undefined:2}}</td><td>{{resultsforInf.appraisalCost| currency:undefined:2}}</td><td>{{resultsforInf.intFailureCost| currency:undefined:2}}</td><td>{{resultsforInf.extFailureCost| currency:undefined:2}}</td><td>{{resultsforInf.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultsforInf.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultsforInf.COTper}}%</td><td align="center" id="greenBackground">{{resultsforInf.COQper}}%</td></div></tr>',
			
		};
	}); 

 app1.directive('tableValueMaster',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforMasters:'=bindingMaster'			
			},
			template:'<tr align="right" ng-repeat="resultsforMaster in resultsforMasters" ng-class="{ \'fa-slide-up\': !showMeMaster, \'fa-slide-down\': showMeMaster }" ><div ><td ng-click="openDialog(resultsforMaster.projname)" id="greenBackground"> {{resultsforMaster.projname| currency:undefined:2}} </td><td>{{resultsforMaster.prevCost| currency:undefined:2}}</td><td>{{resultsforMaster.appraisalCost| currency:undefined:2}}</td><td>{{resultsforMaster.intFailureCost| currency:undefined:2}}</td><td>{{resultsforMaster.extFailureCost| currency:undefined:2}}</td><td>{{resultsforMaster.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultsforMaster.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultsforMaster.COTper}}%</td><td align="center" id="greenBackground">{{resultsforMaster.COQper}}%</td></div></tr>',
			
		};
	}); 
 
 app1.directive('tableValueRunit',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforRunit:'=bindingRunit'			
			},
			template:'<tr align="right" ng-repeat="resultforRunit in resultsforRunit" ng-class="{ \'fa-slide-up\': !showMeRunit, \'fa-slide-down\': showMeRunit }" ><div ><td ng-click="openDialog(resultforRunit.projname)" id="greenBackground"> {{resultforRunit.projname}} </td><td>{{resultforRunit.prevCost| currency:undefined:2}}</td><td>{{resultforRunit.appraisalCost| currency:undefined:2}}</td><td>{{resultforRunit.intFailureCost| currency:undefined:2}}</td><td>{{resultforRunit.extFailureCost| currency:undefined:2}}</td><td>{{resultforRunit.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforRunit.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforRunit.COTper}}%</td><td align="center" id="greenBackground">{{resultforRunit.COQper}}%</td></div></tr>',
			
		};
	}); 
 
 app1.directive('tableValueSap',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforSAP:'=bindingSap'			
			},
			template:'<tr align="right" ng-repeat="resultforSAP in resultsforSAP" ng-class="{ \'fa-slide-up\': !showMeSap, \'fa-slide-down\': showMeSap }" ><div ><td ng-click="openDialog(resultforSAP.projname)" id="greenBackground"> {{resultforSAP.projname}} </td><td>{{resultforSAP.prevCost| currency:undefined:2}}</td><td>{{resultforSAP.appraisalCost| currency:undefined:2}}</td><td>{{resultforSAP.intFailureCost| currency:undefined:2}}</td><td>{{resultforSAP.extFailureCost| currency:undefined:2}}</td><td>{{resultforSAP.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforSAP.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforSAP.COTper}}%</td><td align="center" id="greenBackground">{{resultforSAP.COQper}}%</td></div></tr>',
			
		};
	}); 
 
 app1.directive('tableValueStores',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforStores:'=bindingStores'			
			},
			template:'<tr align="right" ng-repeat="resultforStores in resultsforStores" ng-class="{ \'fa-slide-up\': !showMeStores, \'fa-slide-down\': showMeStores }" ><div ><td ng-click="openDialog(resultforStores.projname)" id="greenBackground"> {{resultforStores.projname}} </td><td>{{resultforStores.prevCost| currency:undefined:2}}</td><td>{{resultforStores.appraisalCost| currency:undefined:2}}</td><td>{{resultforStores.intFailureCost| currency:undefined:2}}</td><td>{{resultforStores.extFailureCost| currency:undefined:2}}</td><td>{{resultforStores.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforStores.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforStores.COTper}}%</td><td align="center" id="greenBackground">{{resultforStores.COQper}}%</td></div></tr>',
			
		};
	}); 
	
	 app1.directive('tableValueSecurity',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforSecurity:'=bindingSecurity'			
			},
			template:'<tr align="right" ng-repeat="resultforSecurity in resultsforSecurity" ng-class="{ \'fa-slide-up\': !showMeSecurity, \'fa-slide-down\': showMeSecurity }" ><div ><td ng-click="openDialog(resultforSecurity.projname)" id="greenBackground"> {{resultforSecurity.projname}} </td><td>{{resultforSecurity.prevCost| currency:undefined:2}}</td><td>{{resultforSecurity.appraisalCost| currency:undefined:2}}</td><td>{{resultforSecurity.intFailureCost | currency:undefined:2}}</td><td>{{resultforSecurity.extFailureCost| currency:undefined:2}}</td><td>{{resultforSecurity.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforSecurity.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforSecurity.COTper}}%</td><td align="center" id="greenBackground">{{resultforSecurity.COQper}}%</td></div></tr>',
			
		};
	});
 
 
 app1.directive('tableValueSupply',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforSupply:'=bindingSupply'			
			},
			template:'<tr align="right" ng-repeat="resultforSupply in resultsforSupply" ng-class="{ \'fa-slide-up\': !showMeSupply, \'fa-slide-down\': showMeSupply }" ><div ><td ng-click="openDialog(resultforSupply.projname)" id="greenBackground"> {{resultforSupply.projname}} </td><td>{{resultforSupply.prevCost| currency:undefined:2}}</td><td>{{resultforSupply.appraisalCost| currency:undefined:2}}</td><td>{{resultforSupply.intFailureCost| currency:undefined:2}}</td><td>{{resultforSupply.extFailureCost| currency:undefined:2}}</td><td>{{resultforSupply.perfCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforSupply.totalCost| currency:undefined:2}}</td><td id="greenBackground">{{resultforSupply.COTper}}%</td><td align="center" id="greenBackground">{{resultforSupply.COQper}}%</td></div></tr>',
			
		};
	});

 app1.factory('TableDataServiceforPartial', ['$http', '$q', function($http) {

     var factory = {
     		getProjectData: function(title) {
     			project=angular.toJson(title);
             console.log(title);
             var data2 = $http({
                 method: 'GET',
                 url: 'getTableDataForPrjectReport.do',
                 headers: {
                     'Content-Type': 'application/json; charset=UTF-8'
                 },
                 params: {
                     
                     'project':project
                     
                 }
             }).then(function(response) {
                
                 return response.data;

             });
             return data2;
         }
     };
     console.log('factory'+factory);
     return factory;
 }]);

 app1.controller('tableQuery',function($scope,$http,ngDialog,TableDataServiceforPartial,Pagination,ProjectPhaseService){
	 
	 
	 
	 
	 var getCoQReportData = function(e) {
		 $scope.showMe=false;
			$scope.showMeGFS=false;
			$scope.showMeEnter=false;
			$scope.showMeInfra=false;
			$scope.showMeMaster=false;
			$scope.showMeRunit=false;
			$scope.showMeSap=false;
			$scope.showMeStores=false;
			$scope.showMeSupply=false;
			$scope.showMeRunit=false;
			$scope.showMeSecurity=false;
			$('#COQReportTableImage tr td:not(:first-child)').text('');
			var year;
			if(e==undefined) {
				year = '2016';
			} else {
				year = e;
			}
			//alert(year)
			$.ajax({ url: "getDataForTable.do",
				type:'get',
				data:'year='+year,
		        context: document.body,
		        success: function(data){
		         
		           var data2=JSON.parse(data);
		       
		           /* for (var key in data2) {
		        	   if (data2.hasOwnProperty(key)) {
		        		   for (var i = 0; i < data2[key].length; i++) {
		        			   $('table .'+key+' td').text(data2[key][i]);
		        		   }
		        		  
		        	      console.log(key, data2[key]);
		        	   }
		        	} */
		        	var values=[];
		        	var keys=[];
		           $.each( data2, function( key, value ) {
		        	   keys.push(key);
		        	   values.push(value);
		        	 });
		           
		           for(var i=0;i<keys.length;i++){
		        	   var trVal=keys[i];
		        	   if(trVal==='ENTERPRISE APPLICATION'){
		        		   trVal='EnterpriseApplication';
		        	   }
		        	   else if(trVal==='SUPPLY CHAIN'){
		        		   trVal='SUPPLYCHAIN';
		        	   }
					    else if(trVal==='RUN IT'){
		        		   trVal='RUNIT';
		        	   }
		        	   var tdVals=values[i];
		        	   var temp=2;
		        	   for(var j=0;j<tdVals.length;j++){ 
					   if(j===6) {
						   
					   } else {
							if(tdVals[j]=="null") {
								tdVals[j]='0';
							}
						   var value = parseFloat(tdVals[j]);
		        		   
		        		   var num =  value.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
		        		   if(j<=tdVals.length-4) {
		        			   $('table .'+trVal+' td:nth-child('+temp+')').text('$'+num);
			        		   	$('table .'+trVal+' td:nth-child('+temp+')').css("text-align","right");   
		        		   }
		        		   else {
		        			   $('table .'+trVal+' td:nth-child('+temp+')').text(num+'%');
		        			   $('table .'+trVal+' td:nth-child('+temp+')').css("text-align","center");
		        		   }
		        			  temp++; 
		        		   
					   }
					   
					   
		        	   }
		        	   
		           }
		           
		          
		           $( "#COQReportTableImage" ).reload( );
		        }});
		}
	 
	 $scope.getCoQReportDataAng=function(data){
		// alert(data);
		 getCoQReportData(data);
	 }
	 
	 $scope.init=function(){

			
			getCoQReportData();
			
	
			
			
			$('.reportJpg').click(function(){
				  saveAsJpeg();
			 });
			function saveAsJpeg()
			{

			html2canvas($("#COQReportTableImage"), {
				
			onrendered: function(canvas) {
			var myImage = canvas.toDataURL("image/jpeg");
			  window.open(myImage);
			  }
			});
			}
			$('#coqDefinitionLabels').click(function(){
				window.open('COQDefinitions.jsp','_blank');
			});
	 }
	 
	 
	 
	 
	 
	 
	 $scope.getProjectPhase = function(portfolio) {
		  $scope.year='2016';
	        console.log("getProjectPhase" + portfolio);
	        ProjectPhaseService.getProjectPhase(portfolio).
	        then(function(result) {
	            console.log('yyyyyyyyyyyyyyy' + result);
	            $scope.selectOptions = result;
	        },function(error){
	        	toastr.error('Returned following error',error, {
	        		  closeButton: true
	        		});
	        });
	        /* function(result) {
	            console.log("Error: No data returned"+result);
	        }); */
	    };
		
		 $scope.submit=function(data){
			 	$scope.showMe=false;
		$scope.showMeGFS=false;
		$scope.showMeEnter=false;
		$scope.showMeInfra=false;
		$scope.showMeMaster=false;
		$scope.showMeRunit=false;
		$scope.showMeSap=false;
		$scope.showMeStores=false;
		$scope.showMeSupply=false;
		$scope.showMeRunit=false;
		$scope.showMeSecurity=false;
			 //alert(data);
		 if(data ){
			 $scope.openDialog(data);
		 }else{
			 var portfolioSelected = $(".portfolioSelect").val(); // selected in drop down
				
				
				$("#COQReportTable tbody tr:not(:first-child) td:first-child").each(function() {
				if(portfolioSelected=="ALL") {
				location.reload();
				} 
				else if(portfolioSelected==$(this).text()) {
				   	$(this).parent().show();
				   }
				   else {
				   	$(this).parent().hide();
				   }
				});
			 
		 }
	 };
	 
		
	    $scope.tableVal = {};
	 $scope.resultdata;
	 $scope.results;
	$scope.showMe=false;
	$scope.showMeGFS=false;
	$scope.showMeEnter=false;
	$scope.showMeInfra=false;
	$scope.showMeMaster=false;
	$scope.showMeRunit=false;
	$scope.showMeSap=false;
	$scope.showMeStores=false;
	$scope.showMeSupply=false;
		$scope.showMeSecurity=false;
	$scope.pagination = Pagination.getNew(2);
	$scope.getProjectList=function(portfolio,project){
	
		console.log(portfolio+'   '+typeof project);
		if(project)
		{
			$scope.openDialog(project);
		}
		$scope.showMe=false;
		$scope.showMeGFS=false;
		$scope.showMeEnter=false;
		$scope.showMeInfra=false;
		$scope.showMeMaster=false;
		$scope.showMeRunit=false;
		$scope.showMeSap=false;
		$scope.showMeStores=false;
		$scope.showMeSupply=false;
		$scope.showMeRunit=false;
		$scope.showMeSecurity=false;
		console.log($scope.selectedValue);
	};
	$scope.openDialog=function(data){
		console.log(data);
		var ScopeTitle=$scope.$new();
		ScopeTitle=data;
		 ngDialog.open({ template: 'partialTable.html',
			 
			 scope:ScopeTitle,
			   
			    controller: ['$scope', 'TableDataServiceforPartial', function($scope, TableDataServiceforPartial) {
			    	console.log(ScopeTitle);
			    	TableDataServiceforPartial.getProjectData(ScopeTitle).then(function(data){
			    		for (var key in data) {
			        		   if (data.hasOwnProperty(key)) {
							   if(key==='lastUpdated' || key==='portfolio' || key==='project' || key==='testRelatedComments' || key==='nontestRelatedComments'|| key==='overAllCostComments'|| key==='projectEndDate'){
			        				   data[key]=data[key];
			        			   }
			        			   else{
			        				   if( data[key].length===0 || data[key]===null  || data[key]==='' ){
			        					   data[key]=0;
			        				   }
			        				   data[key]=parseFloat(data[key]);
			        			   }
			        			   
			        		   }
			        		}
			    		$scope.tableVal=data;
			    		$scope.tableVal.title=ScopeTitle;
			    	});
			    	
			    }],
			    cache :true
		 });
	};
	
	
	 $scope.clickme=function(dataToSend){
		 
		 var year=$scope.year;
 if(year==undefined || year=="" || year==null){
	 year = "2016";
 }
		// alert(year);
		 function commonFN( bigarray){
			 
			  bigarray.map(function(i){if(i===''){console.log('$$$$$'); return 0;} else{return i;}});
			  console.log('GGGGGGGGGGGGGG'+bigarray);
			 var size = 10;
			 var jsonObj = [];
			 for (var i=0; i<bigarray.length; i+=size) {
				 var rowItem = {};
				    var smallarray = bigarray.slice(i,i+size);
				     rowItem["projname"] = smallarray[0];
				    rowItem["prevCost"] = parseFloat(smallarray[1]);
				    rowItem["appraisalCost"] = parseFloat(smallarray[2]);
				    rowItem["intFailureCost"] = parseFloat(smallarray[3]);
				    rowItem["extFailureCost"] = parseFloat(smallarray[4]);
				    rowItem["perfCost"] = parseFloat(smallarray[5]);
				    rowItem["totalCost"] = +(parseFloat(smallarray[6]));
				    
				    rowItem["COTper"] = +(parseFloat(smallarray[8]).toFixed(2));
					
					
					if(smallarray[9] === null || smallarray[9].length<=0){
						smallarray[9]='0.0';
					}
				    rowItem["COQper"] = +(parseFloat(smallarray[9]).toFixed(2));
				  
				  
				    
				    jsonObj.push(rowItem);
				    
				 } 
			 return jsonObj;
		 }
	 if(dataToSend==='DIGITAL'){
		 $scope.showMe=!$scope.showMe;
	 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
		 $scope.resultdata=[];
		 $scope.results={};
		 $scope.results.resultdata= [];
		 var jsonObj = [];
		 
		 var bigarray=result.data;
		 jsonObj=commonFN(bigarray);
		
		 console.log(JSON.stringify(jsonObj));
		
		   $scope.pagination = Pagination.getNew(2);
		   $scope.results = jsonObj;
		   console.log(jsonObj);
		  
          });
	 }
	 else if(dataToSend==='Enterprise Application'){
		 $scope.showMeEnter=!$scope.showMeEnter;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
			 var jsonObj = [];
			 
			 var bigarray=result.data;
			 jsonObj=commonFN(bigarray);
			 
			   $scope.resultsforEnter =jsonObj;
			   console.log(jsonObj);
			   
	          });
	 }
	 else if(dataToSend==='GFS'){
		 $scope.showMeGFS=!$scope.showMeGFS;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
                 var jsonObj = [];
			 
			 var bigarray=result.data;
			 jsonObj=commonFN(bigarray);
			   $scope.resultsforGFS = jsonObj;
			   console.log(jsonObj);
			
	          });
	 }
	 else if(dataToSend==='INFRASTRUCTURE'){
		 $scope.showMeInfra=!$scope.showMeInfra;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
			
			  var jsonObj = [];
				 
				 var bigarray=result.data;
				 jsonObj=commonFN(bigarray);
			   $scope.resultsforInfra = jsonObj;
			   console.log(jsonObj);
			  
	          });
	 }
	 else if(dataToSend==='MASTER'){
		 $scope.showMeMaster=!$scope.showMeMaster;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
			 var jsonObj = [];
			 
			 var bigarray=result.data;
			 jsonObj=commonFN(bigarray);
			   $scope.resultsforMasters = jsonObj;
			   console.log(jsonObj);
			  
	          });
	 }
	 else if(dataToSend==='RUN IT'){
		 $scope.showMeRunit=!$scope.showMeRunit;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
                     var jsonObj = [];
			 
			 var bigarray=result.data;
			 jsonObj=commonFN(bigarray);
			   $scope.resultsforRunit =jsonObj;
			 
	          });
	 }
	 else if(dataToSend==='SAP'){
		 $scope.showMeSap=!$scope.showMeSap;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
			  var jsonObj = [];
				 
				 var bigarray=result.data;
				 jsonObj=commonFN(bigarray);
			   $scope.resultsforSAP =jsonObj;
			 
	          });
	 }
	 else if(dataToSend==='STORES'){
		 $scope.showMeStores=!$scope.showMeStores;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
			 var jsonObj = [];
			 
			 var bigarray=result.data;
			 jsonObj=commonFN(bigarray);
			   $scope.resultsforStores = jsonObj;
			   
	          });
	 }
	 else if(dataToSend==='SUPPLY CHAIN'){
		 $scope.showMeSupply=!$scope.showMeSupply;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
              var jsonObj = [];
			 
			 var bigarray=result.data;
			 jsonObj=commonFN(bigarray);
			   $scope.resultsforSupply = jsonObj;
			 
			  
	          });
	 } 
	 
	  else if(dataToSend==='SECURITY'){
		 $scope.showMeSecurity=!$scope.showMeSecurity;
		 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectforCOQ.do', cache: true}).then(function(result) {
              var jsonObj = [];
			 
			 var bigarray=result.data;
			 jsonObj=commonFN(bigarray);
			   $scope.resultsforSecurity = jsonObj;
			 
			  
	          });
	 } 
	 };
	 
	 
 });
	
</script>
<style>
.reportJpg {
position: absolute;
width: 27px;
top: 10px;
/* right: 9px; */
left: 30px;
cursor: pointer;
}
#coqDefinitionLabels{
  color: #FF4500;
  font-size: 11px;
  font-weight: bold;
  cursor: pointer;
  top: 1px;
  position: relative;
  z-index: 30;
  font-size: small;
  margin-left: 2.5%;
  margin-bottom: 10px;
}
</style>
</head>
<body ng-app="reportModule" ng-controller="tableQuery" ng-init="init()">
<div class="container-fluid">
<div id="header">
	<section>
		<header class="headerSection">
			<%@include file="header.jsp"%>
		</header>
	</section>
	<section>
	<nav class="homeMenu header">
		<%@include file="homeMenu.jsp" %>
	</nav>
	</section>
</div>
<div id="content">
	<form name="DailyStatusReport" id="DailyStatusReport" method="post">
	<div class="workArea container-fluid">
	<div class="sideBarArea">
	<div class="col-sm-2 col-md-2 col-lg-2">
	 <div class="sideBar">
    <ul class="metismenu" id="menu">
    <li class="pageNameMenu sideMenu">
		<a href="COQReport.jsp">
			<img src="images/icons/Reports Menu Icon Black.png" class="img2">
			COQ Report
		</a>
	</li>
    </ul>
    </div> 
		</div>
		</div>
    <div class="col-sm-10 col-md-10 col-lg-10">
	<div class="selectionArea">
					<div class="row1">
					<div class="col-sm-3 col-md-3 col-lg-3">
							<label for="sel1" class="control-label">Portfolio</label>
						</div>
						<div class="col-sm-5 col-md-5 col-lg-5">
								<label for="sel1">Project</label>
						</div>
					</div>
					<div class="row2">
					<div class="col-sm-3 col-md-3 col-lg-3">
				      <select ng-model="tableVal.portfolio" ng-change="getProjectPhase(tableVal.portfolio)" class="form-control portfolioSelect" id="sel1" style="margin-top: -3px;">
                                    <option selected value="">-select-</option>
                                    <option >ALL</option>
                                    <option>DIGITAL</option>
                                    <option>ENTERPRISE APPLICATION</option>
                                    <option>GFS</option>
                                    <option>SAP</option>
                                    <option>SUPPLY CHAIN</option>
                                    <option>STORES</option>
                                    <option>RUN IT</option>
                                    <option>SECURITY</option>
                                </select>
							</div>
							<div class="col-sm-5 col-md-5 col-lg-5">
							     <select  ng-model="tableVal.project" ng-options="v as v for (k,v) in selectOptions" class="form-control projectPhaseSelect" id="sel3" style="margin-top: -3px;">
									<option value="">ALL</option>
                                </select>
						</div>
						<div class="col-sm-1 col-md-1 col-lg-1">
							  <button type="button" class="btn btn-primary submitBtn" ng-click="submit(tableVal.project)" style="margin-top: -17px;">SUBMIT</button>
						</div>
						<div class="col-sm-1 col-md-1 col-lg-1">
						<div >
							<img class="reportJpg" src="images/quizReportJpg.png" style="margin-top: -21px;">
							</div>
						</div>
						<div class="col-sm-1 col-md-1 col-lg-1">
						</div>
					</div>
				</div>
	</div>
	
	</div>
	<div class="col-sm-12 col-md-12 col-lg-12 generationArea" id="generationArea" style="padding-bottom: 50px; margin-left: 0.5%;">
	<div class="col-sm-12 col-md-12 col-lg-12">
	<div class="col-sm-4 col-md-4 col-lg-4">
							  <div id="coqDefinitionLabels" style="float:left; color: #FF4500; margin-right:36px; margin-top: 16px;"> 
							COQ DEFINITION
                        </div>
                        </div>	
                        <div class="col-sm-8 col-md-8 col-lg-8">
                        <div class="col-sm-3 col-md-3 col-lg-3 pull-right">
				      		<select ng-change="getCoQReportDataAng(year)" ng-model="year" class="form-control yearSelect" id="sel2" style="margin-top: -3px;">
                                    <option value="overall">Overall</option>
                                    <option value="2016" selected>2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                </select>
							</div>
                        <div class="col-sm-1 col-md-1 col-lg-1 pull-right">
								<label for="sel2">Year:</label>
						</div>
						
						</div>
						</div>
						<div class="col-sm-12 col-md-12 col-lg-12 COQReportTable" id ="COQReportTable">
							<table class="table table-bordered" style="background-color: rgb(242,242,242);" id="COQReportTableImage">
								    <thead>
								      <tr class="TestingPart">
								        <th>PORTFOLIO / PROJECT</th>
								         <th>PREVENTION COST</th>
								        <th>APPRAISAL COST</th>
								        <th>INTERNAL FAILURE COST</th>
								        <th>EXTERNAL FAILURE COST</th>
								        <th>PERFORMANCE COST</th>
								        <th>TOTAL PROJECT COST</th>
								        <th>COT</th>
								        <th>COQ</th>
								        
								      </tr>
								    </thead>
								    <tbody>
								    	<tr class="Total">
								    		<td  id="orangeBackground">OVERALL</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="orangeBackground"></td>
								    		<td id="orangeBackground"></td>
								    		<td id="orangeBackground"></td>
								    	</tr>
								    	<tr ng-click="clickme('DIGITAL')" class="DIGITAL">
								    		<td id="blueBackground">DIGITAL</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr>
								    	<tr table-value binding-foo="results"></tr>								
								    	<tr ng-click="clickme('Enterprise Application')" class="EnterpriseApplication" >
								    		<td id="blueBackground" >ENTERPRISE APPLICATION</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr>
								    	<tr table-value-enter binding-enterprise="resultsforEnter"></tr>		
								    	
								    	<tr ng-click="clickme('GFS')" class="GFS">
								    		<td id="blueBackground" >GFS</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr >
								    <tr table-value-gfs binding-gfs="resultsforGFS"></tr>	
								   <!--  
								    	<tr ng-click="clickme('INFRASTRUCTURE')" class="INFRASTRUCTURE">
								    		<td id="blueBackground" >INFRASTRUCTURE</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr>
								    	
								    	 <tr table-value-infra binding-infra="resultsforInfra"></tr>
								    	 
								    	  -->
								    	<!-- <tr ng-click="clickme('MASTER')" class="MASTER">
								    		<td id="blueBackground" >MASTER</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr>
								    	 <tr table-value-master binding-master="resultsforMasters"></tr>-->
								     	<tr ng-click="clickme('RUN IT')" class="RUNIT"> 
								    		<td id="blueBackground" >RUN IT</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		
								    	</tr>
								    	 <tr table-value-runit binding-runit="resultsforRunit"></tr> 
								    	<tr ng-click="clickme('SAP')" class="SAP">
								    		<td id="blueBackground" >SAP</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr>
								    	<tr table-value-sap binding-sap="resultsforSAP"></tr>
										<tr ng-click="clickme('SECURITY')" class="SECURITY" >
								    		<td id="blueBackground" >SECURITY</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		
								    	</tr>
								    	<tr table-value-security binding-security="resultsforSecurity"></tr>
								    	
								    	<tr ng-click="clickme('STORES')" class="Stores">
								    		<td id="blueBackground" >STORES</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr >
								    	<tr table-value-stores binding-stores="resultsforStores"></tr>
								    	<tr ng-click="clickme('SUPPLY CHAIN')" class="SUPPLYCHAIN">
								    		<td id="blueBackground" >SUPPLY CHAIN</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    		<td id="blueBackground"></td>
								    	</tr>
								    	<tr table-value-supply binding-supply="resultsforSupply"></tr>
								    </tbody>
								  </table>
						</div>
						<div class="modal"><!-- Place at bottom of page --></div>
						
				</div>
		</div>
	</div>
	</div>
	</div>
	</form>
	</div>
	<section class="footerSection">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
</div>
</body>
<script src='js/css3-animate-it.js'></script>
</html>

