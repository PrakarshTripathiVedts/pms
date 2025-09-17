<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
<%
String projectid=(String)request.getAttribute("projectid");
String committeeid=(String)request.getAttribute("committeeid");
%>
<div class="modal fade" id="overallfinace" >
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header bg-primary text-light"  >
        <h5 class="modal-title" id="exampleModalLabel">Upload Overall Finance</h5>
        <div >
      <form action="#">
      <input type="hidden" id="mainprojectidDownload" name="mainprojectid" value="<%=projectid%>">
      <input type="hidden" name="committeeid" value="1">
      <input type="hidden" name="_csrf" value="ec4f5ad7-8aa0-4cfc-abf5-a08beb4c43a7">
       <button class="btn display-none" id="downloadExcelBtn"  type="submit" formaction="excelSheetWithFinanceData.htm"    data-toggle="tooltip"  data-toggle="tooltip" data-placement="top"  title="Download Excel Sheet with Data" ><i class="fa fa-download" aria-hidden="true"></i></button>
      </form>
      </div>
		<form action="OverallFinanceExcel.htm" method="post">
		<button class="btn btn-sm"  data-toggle="tooltip" type="submit" data-toggle="tooltip" data-placement="top"  title="Download Format" ><i class="fa fa-download fa-lg" aria-hidden="true"></i>
		&nbsp; Sample Format
		</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
      </div>
       <form action="OverAllFinaceSubmit.htm" method="post" id="excelForm" enctype="multipart/form-data">
      <div class="modal-body">
      <div class="col-md-4 mb-4">
      <input class="form-control" type="file" id="excel_file" name="filename" required="required"  accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">						
      </div>
      <table class="table table-bordered table-hover">
      <thead>
      <tr>
      <th colspan="2" class="width150">Head</th>
      <th colspan="2" class="width120">Sanction</th>
      <th colspan="2" class="width120">Expenditure</th>
      <th colspan="2" class="width120">Out Commitment</th>
      <th colspan="2" class="width120">Balance</th>
      <th colspan="2" class="width120">Dipl</th>
      <th colspan="2" class="width120">Notional Balance</th>
      </tr>
      <tr>
      <th>SN</th>
      <th>Head</th>
      <th>RE</th>
      <th>FE</th>
      <th>RE</th>
      <th>FE</th>
      <th>RE</th>
      <th>FE</th>
      <th>RE</th>
      <th>FE</th>
      <th>RE</th>
      <th>FE</th>
      <th>RE</th>
      <th>FE</th>
      
      </tr>
      </thead>
      <tbody id="overalltbody">
      <tr>
      <td colspan="14" class="text-center">No Data Available!</td>
      </tr>
      </tbody>
      </table>
      </div>
      <hr>
      <div align="center" class="m-2">
      <input type="hidden" id="financeprojectid" name="projectid" value="<%=projectid%>">
      <input type="hidden" id="mainprojectid" name="mainprojectid" value="<%=projectid%>">
      <input type="hidden" name="committeeid" value="<%=committeeid%>">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <button type="submit" class="btn btn-sm submit" onclick="return confirm('Are you sure to submit?')">Submit</button>
      <button type="button" class="btn btn-sm btn-secondary text-transform" data-dismiss="modal" >Close</button>
    
      </div>
      </form>

    </div>
  </div>
</div>
<script type="text/javascript">
function showModal(projectid,mainprojectid,a){
	$('#overallfinace').modal('show');
	$('#financeprojectid').val(projectid)
	$('#mainprojectid').val(mainprojectid)

	$('#exampleModalLabel').html('Upload Overall Finance( '+ a+' )');
	
	var data=$("#tbody"+mainprojectid).html();
	var trCount = $("#tbody" + mainprojectid).find("tr").length;
	excel_file.value = '';
	if(trCount>2){
		console.log("Hiii")
		$('#downloadExcelBtn').show();
		$('#mainprojectidDownload').val(mainprojectid)
		$('#overalltbody').html(data)
	}
}

var excel_file = document.getElementById('excel_file');

excel_file.addEventListener('change', (event) => {
	
	
	
	var reader = new FileReader();
    reader.readAsArrayBuffer(event.target.files[0]);

    reader.onload = function (event){
    
    	var data = new Uint8Array(reader.result);
    	
    	var work_book = XLSX.read(data, {type:'array'});
    	
    	 var sheet_name = work_book.SheetNames;
    	
    	var sheet_data = XLSX.utils.sheet_to_json(work_book.Sheets[sheet_name[0]],{header:1});
    	
    	console.log(sheet_data)
    	
    	const code = [];
    	const gname = [];
    	const abbreviationname1 = [];
    	var checkExcel = 0;
    	table_output = '';
    	var html="";
    	var duplicate=[];
    	if(sheet_data.length > 0){
    		for(var row = 0; row < sheet_data.length ; row ++){
    			if(row>1){
    				table_output += '<tr>'
    					duplicate.push(sheet_data[row][1])
    			}
    			var html="";
    			
    		

    				for(var cell =0;cell<=13;cell++){
    					if(row==0){
    					
    					if(cell==0 && !sheet_data[row][cell].startsWith("Head")){checkExcel++;}
    					if(cell==2 && !sheet_data[row][cell].startsWith("Sanction")){checkExcel++;}
    					if(cell==4 && !sheet_data[row][cell].startsWith("Expenditure") ){checkExcel++;}
    					if(cell==6 && !sheet_data[row][cell].startsWith("Out Commitment") ){checkExcel++;}
    					if(cell==8 && !sheet_data[row][cell].startsWith("Balance")){checkExcel++;}
    					if(cell==10 && !sheet_data[row][cell].startsWith("DIPL") ){checkExcel++;}
    					if(cell==12 && !sheet_data[row][cell].startsWith("Notional") ){checkExcel++;}
    					}
    					
    					if(checkExcel>0){
    		    			
    		    			alert("Please Download the Financial format and upload it.");
    		    		
    		    			$('#overalltbody').html('<tr><td colspan="14" class="text-center">No Data Available!</td></tr>');
    		     			excel_file.value = '';
    		  				return;
    		    		}
    					
    					if(row>1 ){
    						if(cell==1){
    							if(sheet_data[row][cell]==undefined||sheet_data[row][cell].length==0 ){
    								alert("Head name at row "+(row+1) +" is blank!")
    								excel_file.value = '';
    								return false;
    							}
    						}
    						
    						if(sheet_data[row][cell]==undefined||sheet_data[row][cell].length==0 ){
    						html=html+'<td class="text-right">'+'0.00'+'</td>';
    					}else{
    						if(cell>1){
    						html=html+'<td class="text-right">'+parseFloat(sheet_data[row][cell]).toFixed(2)+'</td>'
    						}else{
    							html=html+'<td class="text-justify">'+sheet_data[row][cell]+'</td>'
    						}
    					}
    					}
    					
    				}
    				if(row>1){
    					table_output =table_output+html+'</tr>';
    				}
    		}
    		
    		   var map = {};
    		   var duplicates = [];
    		
    		   for (let i = 0; i < duplicate.length; i++) {
    		        if (map[duplicate[i]]) {
    		            duplicates.push(duplicate[i]);
    		        } else {
    		            map[duplicate[i]] = true;
    		        }
    		    }
    
    	
    		
    		if(duplicates.length>0){
    			alert("Duplicates values are there ("+duplicates+ ")");
    			excel_file.value = '';
    			return;
    		}
    		   
    		   
    		
    	 	if(table_output.length>0){
    			$('#overalltbody').html(table_output)
    		} else{
    			$('#overalltbody').html('<tr><td colspan="14" class="text-center">No Data is their in Excel Sheet</td></tr>');
    			excel_file.value = '';
    		}
    		
    	}
    	
    	
    }
});
</script>
</body>
</html>