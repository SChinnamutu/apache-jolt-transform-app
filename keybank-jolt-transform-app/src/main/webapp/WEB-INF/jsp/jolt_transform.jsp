<!DOCTYPE html>

<html lang="en">

<head>
    <title>KEYBANK Jolt Transform</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* This makes the panels have some padding from the edge of the screen. */
        @media (min-width: 600px) {
                body {
                    padding-right:25px;
                    padding-left:25px;
                }
            }
        @media (max-width: 599px) {
                body {
                    padding-right:2px;
                    padding-left:2px;
                }
            }

        /* This makes the textAreas flush with the containing panels. */
        .panel-body {
            padding: 0px;
        }
    </style>

</head>


<script type="text/javascript">

	$(document).ready(function() {
	  $("#add_campaign_error_div").hide();
	  $("#input_json_success").hide();
	  $("#input_json_error").hide();
	  $("#spec_json_success").hide();
	  $("#spec_json_error").hide();
	});
	
	function hideErrorDiv(){
		 $("#add_campaign_error_div").hide();
		 $("#input_json_success").hide();
		 $("#input_json_error").hide();
		 $("#spec_json_success").hide();
		 $("#spec_json_error").hide();
	}
	
	function processJoltTransform(){
		var input_json = $("#input").val();
		if(input_json == null || input_json == '' || input_json == ""){
			document.getElementById('add_campaign_error_tag').innerHTML = "Please enter input_json.";
			$("#add_campaign_error_div").show();
			$('#outputJson').val("");
			return false;
		}
		var input_flag = false;
		$.ajax({
		     type: "POST",
			 url : "validate.html",
			 data:{input:input_json},
			 cache: false,
	         success: function (response) 
	         {
	        	 if(response == 'ERROR' ){
					 $("#input_json_error").show();
					 input_flag =  true;
	        	 }
	         } 
	    });
		if(input_flag){
			return false;
		}
		
		var spec_json = $("#spec").val();
		if(spec_json == null || spec_json == '' || spec_json == ""){
			document.getElementById('add_campaign_error_tag').innerHTML = "Please enter spec_json.";
			$("#add_campaign_error_div").show();
			$('#outputJson').val("");
			return false;
		}
		var spec_flag = false;
		$.ajax({
		     type: "POST",
			 url : "validate.html",
			 data:{input:spec_json},
			 cache: false,
	         success: function (response) 
	         {
	        	 if(response == 'ERROR' ){
					 $("#spec_json_error").show();
					 spec_flag = true;
	        	 }
	         } 
	    });
		if(spec_flag){
			return false;
		}
		
		$.ajax({
		     type: "POST",
			 url : "transform.html",
			 data:{input_json:input_json,spec_json:spec_json},
			 cache: false,
	         success: function (response) 
	         {
	        	//$('#outputJson').append(response);
	        	 $('#outputJson').val(response);
	         } 
	    });
	}

	function processValidateInputJson(){
		var input_json = $("#spec").val();
		if(input_json == null || input_json == '' || input_json == ""){
			document.getElementById('add_campaign_error_tag').innerHTML = "Please enter input_json.";
			$("#add_campaign_error_div").show();
			return false;
		}
		$.ajax({
		     type: "POST",
			 url : "validate.html",
			 data:{input:input_json},
			 cache: false,
	         success: function (response) 
	         {
	        	 if(response == 'ERROR' ){
					 $("#input_json_error").show();
	        	 }
	         } 
	    });
	}
	
	function processValidateSpecJson(){
		var spec_json = $("#spec").val();
		if(spec_json == null || spec_json == '' || spec_json == ""){
			document.getElementById('add_campaign_error_tag').innerHTML = "Please enter spec_json.";
			$("#add_campaign_error_div").show();
			return false;
		}
		$.ajax({
		     type: "POST",
			 url : "validate.html",
			 data:{input:spec_json},
			 cache: false,
	         success: function (response) 
	         {
				 if(response == 'ERROR' ){
					 $("#spec_json_error").show();
	        	 }
	         } 
	    });
	}

</script>

<body>


<div class="row"> <!-- row 1 -->
	<div class="col-lg-12">
	<h1>KEYBANK Jolt Transform</h1>
	</div>
	
</div> <!-- row 1 -->

<br><br>

<div class="row"> <!-- row 2 -->

		<div class="col-lg-4 col-md-6 col-sm-12">
		
		        <div id="inputPanel" class="panel panel-default">
		        <div class="panel-heading">
		            <label for="input">Json Input</label>
		            <button type="button" id="inputValidateButton" class="btn btn-default">JSON Validate</button>
		        </div>
		        <div class="panel-body">
		            <textarea form="transformForm" class="form-control" name="input" id="input" rows="20" oninput="hideErrorDiv()"></textarea>
		        </div>
		    </div>
		</div> <!-- column 1 -->
		
		<div class="col-lg-4 col-md-6 col-sm-12">
		
		    <div id="specPanel" class="panel panel-default">
		        <div class="panel-heading">
		            <label for="spec">Jolt Spec</label>
		            <button type="button" id="specValidateButton" class="btn btn-default" onclick="">JSON Validate</button>
		        </div>
		        <div class="panel-body">
		            <textarea form="transformForm" class="form-control" id="spec" rows="20" oninput="hideErrorDiv()"></textarea>
		        </div>
		    </div>
		</div> <!-- column 2 -->
		
		<div class="col-lg-4 col-md-6 col-sm-12">
		
		    <div id="outputPanel" class="panel panel-default">
		
		        <div class="panel-heading">
		            <label for="outputJson">Output / Errors</label>
		            <button id="processButton" name="processButton" type="submit" class="btn btn-default" onclick="processJoltTransform()">Transform</button>
		        </div>
		        <div class="panel-body">
		            <textarea form="transformForm" class="form-control" id="outputJson" rows="20"></textarea>
		        </div>
		    </div>
		</div> <!-- column 3 -->
		
		
					
</div> <!-- row 2 -->

<div class="alert alert-danger" id="add_campaign_error_div" style="width: 45%;margin: 15px auto;">
				 <p id="add_campaign_error_tag"> </p>
</div>

 <div class="alert alert-success" id="input_json_success" style="width: 45%;margin: 15px auto;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Input Json validated successfully.
 </div>
	
<div class="alert alert-danger" id="input_json_error" style="width: 45%;margin: 15px auto;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Invalid input json. Please enter data in json structure.
 </div>
	 
 <div class="alert alert-success" id="spec_json_success" style="width: 45%;margin: 15px auto;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Spec Json validated successfully.
 </div>

 <div class="alert alert-danger" id="spec_json_error" style="width: 45%;margin: 15px auto;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Invalid spec json. Please enter data in json structure.
 </div>									

</html>