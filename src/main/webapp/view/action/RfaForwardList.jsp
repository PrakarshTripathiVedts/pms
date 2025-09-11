<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat,java.io.ByteArrayOutputStream,java.io.ObjectOutputStream"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
<title>RFA Forward List</title>
<style type="text/css">
#button {
   float: left;
   width: 80%;
   padding: 5px;
   background: #dcdfe3;
   color: black;
   font-size: 17px;
   border:none;
   border-left: none;
   cursor: pointer;
}


body{

   overflow-x: hidden; 
    overflow-y: hidden; 

}
.returnLabel{
font-weight: bolder;
}
th {
	border: 1px solid black;
	text-align: center;
	padding: 5px;
}
.btn-status {
  position: relative;
  z-index: 1; 
}

.btn-status:hover {
  transform: scale(1.05);
  z-index: 5;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
}
 .spinner {
    position: fixed;
    top: 40%;
    left: 20%;
    margin-left: -50px; /* half width of the spinner gif */
    margin-top: -50px; /* half height of the spinner gif */
    text-align:center;
    z-index:1234;
    overflow: auto;
    width: 1000px; /* width of the spinner gif */
    height: 1020px; /*hight of the spinner gif +2px to fix IE8 issue */
}
</style>
</head>
<body>
<%	
	
FormatConverter fc=new FormatConverter(); 
SimpleDateFormat sdf=fc.getRegularDateFormat();
SimpleDateFormat sdf1=fc.getSqlDateFormat();

SimpleDateFormat sdf2=new SimpleDateFormat("dd-MM-yyyy");
SimpleDateFormat sdf3=new SimpleDateFormat("yyyy-MM-dd");
	
List<Object[]> RfaForwardList=(List<Object[]>) request.getAttribute("RfaForwardList");
List<Object[]> RfaForwardApprovedList=(List<Object[]>) request.getAttribute("RfaForwardApprovedList");
List<Object[]> ModalTDList=(List<Object[]>)request.getAttribute("ModalTDList");
String EmpId=(String)request.getAttribute("EmpId");
String rfaCount=(String) request.getAttribute("rfaCount");
List<String> toAssigneRevokeStatus  = Arrays.asList("AF","AC","RFA","AX");
List<Object[]> AssigneeList=(List<Object[]>) request.getAttribute("AssigneeEmplList"); 
	 
%>
	<div id="spinner" class="spinner" style="display: none;">
		<img id="img-spinner" style="width: 200px; height: 200px;"
			src="view/images/spinner1.gif" alt="Loading" />
	</div>

	<div class="card-header page-top ">
	<div class="row">
		<div class="col-md-8">
			<h5>RFA Forward List </h5>
		</div>
			
		</div>
</div>	
<% 
    String ses = (String) request.getParameter("result");
    String ses1 = (String) request.getParameter("resultfail");
    if (ses1 != null) { %>
    <div align="center">
        <div class="alert alert-danger" role="alert">
            <%=StringEscapeUtils.escapeHtml4(ses1) %>
        </div>
    </div>
<% }if (ses != null) { %>
    <div align="center">
        <div class="alert alert-success" role="alert">
            <%=StringEscapeUtils.escapeHtml4(ses) %>
        </div>
    </div>
<% } %>

                
  	<div class="page card dashboard-card" id="main1">
 <div class="card-body" >	
   <div align="center">	
  
	<div class="row w-100" style="margin-bottom: 10px;">
		<div class="col-12">
         <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="background-color: #E1E5E8;padding:0px;">
		  <li class="nav-item" style="width: 50%;"  >
		    <div class="nav-link active" style="text-align: center;" id="pills-mov-property-tab" data-toggle="pill" data-target="#pills-mov-property" role="tab" aria-controls="pills-mov-property" aria-selected="true">
			   <span>Pending</span> 
				<span class="badge badge-danger badge-counter count-badge" style="margin-left: 0px;">
				   		 <%if(RfaForwardList.size()>99){ %>
				   			99+
				   		<%}else{ %>
				   			<%=RfaForwardList.size() %>
						<%} %>			   			
				  </span>  
		    </div>
		  </li>
		  <li class="nav-item"  style="width: 50%;">
		    <div class="nav-link " style="text-align: center;" id="pills-imm-property-tab" data-toggle="pill" data-target="#pills-imm-property" role="tab" aria-controls="pills-imm-property" aria-selected="false">
		    	 <span>Approved</span> 
		    	  <span class="badge badge-danger badge-counter count-badge" style="margin-left: 0px;">
				   		 <%if(RfaForwardApprovedList.size()>99){ %>
				   			99+
				   		<%}else{ %>
				   			<%=RfaForwardApprovedList.size() %>
						<%} %>			   			
				  </span>  
		    </div>
		  </li>
		</ul>
	   </div>
	</div>
	</div>
	
	
	
	<div class="card">					
		<div class="card-body">
		<div class="container-fluid" >
           <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-mov-property" role="tabpanel" aria-labelledby="pills-mov-property-tab">
		    <form action="#" method="POST" id="">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
             <div class="table-responsive">
              <table class="table table-hover  table-striped table-condensed table-bordered table-fixed" id="myTable1">
				<thead>
										<tr>
											<th>Select</th>
											<th>RFA No</th>
											<th>RFA Date</th>
											<th>Project</th>
											<th>Priority</th>
											<th>Forwarded By</th>
											<th>Status</th>
											<th style="width: 14%">Action</th>
										</tr>
									</thead>
									<tbody>
									
										<%if(RfaForwardList!=null){
										int count=0;
										for(Object[] obj:RfaForwardList) {%>
										<tr>
											<td style="text-align: center;"><%=++count%></td>
											<td><%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()):" - " %></td>
											<td style="text-align: center;"><%=obj[4]!=null?sdf.format(obj[4]):" - "%></td>
											<td style="text-align: center;"><%=obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()):" - " %></td>
											<td style="text-align: center;"><%=obj[5]!=null?StringEscapeUtils.escapeHtml4(obj[5].toString()):" - " %></td>
											<td><%=obj[11]!=null?StringEscapeUtils.escapeHtml4(obj[11].toString()):" - " %></td>
											<td style="text-align: center;">
	                                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                                       	  	<button type="submit" class="btn btn-sm btn-link btn-status" formaction="RfaTransStatus.htm" value="<%=obj[0] %>" name="rfaTransId"  data-toggle="tooltip" data-placement="top" title="Transaction History" 
	                                       	  	style=" color: #E65100; font-weight: 600;" formtarget="_blank"><%=obj[15]!=null?StringEscapeUtils.escapeHtml4(obj[15].toString()):" - " %> 
								    			</button>
	                                       </td>
											<td class="left width" style="text-align: center;">
												<button class="editable-click bg-transparent"
													formaction="RfaActionPrint.htm" formmethod="get"
													 data-toggle="tooltip" data-placement="top" title="VIEW DOCUMENT"
													formnovalidate="formnovalidate" name="rfaid"
													value="<%=obj[0] %>,<%=obj[3] %>,<%=obj[2] %>"
													formtarget="_blank">
													<div class="cc-rockmenu">
														<div class="rolling">
															<figure class="rolling_icon">
																<img src="view/images/preview3.png">
															</figure>
														</div>
													</div>

												</button> <input type="hidden" /> <input type="hidden"
												name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
												type="hidden" name="projectid"
												value="<%=obj[12].toString() %>"> <input
												type="hidden" name="RfaStatus"
												value="<%=obj[10].toString()%>">
											<%%>
											<%if(obj[10].toString().equalsIgnoreCase("AC") || obj[10].toString().equalsIgnoreCase("AX")){%>
												     <button class="editable-click mail" type="submit" formaction="RfaActionForward.htm" formmethod="POST"
													 style="background-color: transparent;"
													 data-toggle="tooltip" data-placement="top" title="RFA FORWARD" name="RFAID"
													 value="<%=obj[0]%>"
													 >
													<div class="cc-rockmenu">
														<figure class="rolling_icon">
															<img src="view/images/forward1.png">
														</figure>
													</div>
												
												</button>
													<input type="hidden" value="AV" name="rfaoptionby">
													<input type="hidden" value="<%=obj[17] %>" name="TypeOfRfa">
												  <%--  <input type="hidden" value="<%=obj[9]%>" name="rfaEmpModal"> --%>
											  <%}else{ %>
											  
											  		<button class="editable-click" type="button"
													 style="background-color: transparent;"
													 data-toggle="tooltip" data-placement="top" title="RFA FORWARD"
													 value="<%=obj[0]%>"
													 onclick="forwardmodal('<%=obj[3]%>','<%=obj[0]%>')">
													<div class="cc-rockmenu">
														<figure class="rolling_icon">
															<img src="view/images/forward1.png">
														</figure>
													</div>
												    </button>
												
											  <%} %>
												 <input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> 
											
												 <%if(toAssigneRevokeStatus.contains(obj[10])){%> 
												<button class="editable-click" name="sub" type="button"
													value="" style="background-color: transparent;"
													formaction="#" formmethod="POST"
													formnovalidate="formnovalidate" name="rfa"
													value="<%=obj[0]%>" id="rfaReturnBtn"
													onclick="return returnRfa(<%=obj[0]%>,'<%=obj[10]%>','<%=obj[16]%>');">
														<i class="fa fa-backward" aria-hidden="true" style="color: red; font-size: 24px; position: relative; top: 5px;"></i>
												</button> 
												 <%} %> 
											</td>
										</tr>
										<%}} %>
									</tbody>
   
            </table>
          </div>
          <input type="hidden" name="isApproval" value="Y">
         </form>
				
			  </div>
 
	<!---------------------------------------------- Approved List ----------------------------------------------------->	
	
		<div class="tab-pane fade" id="pills-imm-property" role="tabpanel" aria-labelledby="pills-imm-property-tab">
		
			    <form action="#" method="POST" id="">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
             <div class="table-responsive">
              <table class="table table-hover  table-striped table-condensed table-bordered table-fixed" id="myTable2">
				<thead>
										<tr>
											<th>Select</th>
											<th>RFA No</th>
											<th>RFA Date</th>
											<th>Project</th>
											<th>Priority</th>
											<th>Forwarded By</th>
											<th>Status</th>
											<th style="width: 14%">Action</th>
										</tr>
									</thead>
									<tbody>
									
										<%if(RfaForwardApprovedList!=null){
										int count=0;
										for(Object[] obj:RfaForwardApprovedList) {%>
										<tr>
											<td style="text-align: center;"><%=++count%></td>
											<td><%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()):" - " %></td>
											<td style="text-align: center;"><%=obj[4]!=null?sdf.format(obj[4]):" - "%></td>
											<td style="text-align: center;"><%=obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()):" - " %></td>
											<td style="text-align: center;"><%=obj[5]!=null?StringEscapeUtils.escapeHtml4(obj[5].toString()):" - " %></td>
											<td><%=obj[11]!=null?StringEscapeUtils.escapeHtml4(obj[11].toString()):" - " %></td>
											<td style="text-align: center;">
	                                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                                       	  	<button type="submit" class="btn btn-sm btn-link btn-status" formaction="RfaTransStatus.htm" value="<%=obj[0] %>" name="rfaTransId"  data-toggle="tooltip" data-placement="top" title="Transaction History" 
	                                       	  	style=" color: #E65100; font-weight: 600;" formtarget="_blank"><%=obj[14]!=null?StringEscapeUtils.escapeHtml4(obj[14].toString()):" - " %> 
								    			</button>
	                                        </td>
											<td class="left width" style="text-align: center;">

												<button class="editable-click bg-transparent"
													formaction="RfaActionPrint.htm" formmethod="get"
													formnovalidate="formnovalidate" name="rfaid"
													value="<%=obj[0]%>,<%=obj[3]%>,<%=obj[2] %>"
													formtarget="_blank">
													<div class="cc-rockmenu">
														<div class="rolling">
															<figure class="rolling_icon">
																<img src="view/images/preview3.png">
															</figure>
														</div>

													</div>

												</button> <input type="hidden" /> <input type="hidden"
												name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
												type="hidden" name="projectid"
												value="<%=obj[12].toString() %>"> <input
												type="hidden" name="RfaStatus"
												value="<%=obj[10].toString()%>">
											
												 <input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> 
									
											
											</td>
										</tr>
										<%}} %>
									</tbody>
   
            </table>
          </div>
          <input type="hidden" name="isApproval" value="Y">
         </form>
               </div>
               </div>
               </div>				
			  </div>
		   </div>
		</div>
     </div>

 	<!-- -- ******************************************************************Assign  Model Start ***********************************************************************************-->
 		<form class="form-horizontal" role="form"
			action="#" method="POST" id="myform1" autocomplete="off">
			<div class="modal fade bd-example-modal-lg" id="rfamodal"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content addreq" style="width: 120%;">
						<div class="modal-header" id="modalreqheader">
							<h5 class="modal-title" id="exampleModalLabel">RFA Add</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" style="color: white">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div style="height: 550px; overflow: auto;">
							<div class="modal-body">
							
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-5">
											<label style="font-size: 17px; margin-top: 5%; margin-left: 4%; color: #07689f; font-weight: bold;" >RFA No. </label>
				                            <label><input type="text" class="form-control" name="RfaNo" id="RfaNo" readonly="readonly"></label>
										</div>
										
										<div class="col-md-7">
											<label style="font-size: 17px; margin-top: 4%; margin-left: 5%; color: #07689f; font-weight: bold;" >Date of Completion : </label><span class="mandatory" style="color: red;">*</span>
				                            <label><input type="text"  id="fdate" name="fdate" value=""class="form-control"></label>
										</div>
										</div>
									</div>
                                 
									<div class=col-md-12>
										<div class="row">
											<div class="col-md-5">
												<label style="font-size: 17px; margin-top: 5%; color: #07689f; margin-left: 0.1rem; font-weight: bold;">Visual Inspection and Observation<span class="mandatory" style="color: red;">*</span></label>
											</div>
											<div class="col-md-7" style="margin-top: 10px">
												<div class="form-group">
													<input type="text" name="observation" class="form-control"
														id="observation" maxlength="255" required="required"
														placeholder="Maximum 250 Chararcters"
														style="line-height: 4rem !important">
												</div>
											</div>
										</div>
									</div>
									
									<div class=col-md-12>
										<div class="row">
											<div class="col-md-6">
												<label style="margin: 0px; font-size: 17px; color: #07689f; font-weight: bold;">Clarification <span class="mandatory" style="color: red;">*</span></label>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-12" id="textarea" >
												<div class="form-group">
													<textarea required="required" name="clarification"
														class="form-control" maxlength="1000" id="clarification"
														rows="5" cols="53" placeholder="Maximum 1000 Chararcters"></textarea>
												</div>
											</div>
										</div>
									</div>
									
									<div class=col-md-12>
										<div class="row">
											<div class="col-md-3">
												<label style="font-size: 18px; margin-top: 5%; color: #07689f; margin-left: 0.1rem ; font-weight: bold;">Action Required<span class="mandatory" style="color: red;">*</span></label>
											</div>
											<div class="col-md-8" style="margin-top: 10px">
												<div class="form-group" style="width: 113%">
													<input type="text" class="form-control" name="Rfaaction"
														id="action" maxlength="255" required="required"
														placeholder="Maximum 250 Chararcters"
														style="line-height: 3rem !important">
												</div>
											</div>
										</div>
									</div>
									

									<input type="hidden" name="rfaid" id="rfaidvalue"
										value="" />
									<div class="form-group" align="center" style="margin-top: 3%;">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<span id="btnsub"><button type="button" id="assignSubBtn" class="btn btn-primary btn-sm submit" id="submit" formaction="RfaAssignFormSubmit.htm"  value="SUBMIT" onclick="return assignSub()">SUBMIT</button></span>
									</div>
	
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>
		
		<!-- -- ******************************************************************Assign  Model End ***********************************************************************************-->
	<form class="form-horizontal" role="form"
		action="RfaActionReturnList.htm" method="POST" id="returnFrm"
		autocomplete="off">
		<div class="modal fade bd-example-modal-lg" id="rfaReturnmodal"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content addreq">
					<div class="modal-header" id="modalreqheader"
						style="background-color: #021B79">
						<h5 class="modal-title" id="exampleModalLabel" style="color: #fff">RFA Return</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" style="color: white">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
						<div class="modal-body">
							<div class="row" id="mainrow">
								<div class="col-md-12">
									<label class="control-label returnLabel"
										style="font-weight: 600; font-size: 16px;"> Reply <span
										class="mandatory" style="color: #cd0a0a;">*</span>
									</label>
									<textarea class="form-control" rows="3" cols="30"
										placeholder="Max 500 Characters" name="replyMsg" id="replyMsg"
										maxlength="500" required></textarea>
								</div>

								<div class="col-md-12 form-group mt-3 d-flex justify-content-center">
										<button type="submit" class="btn btn-primary btn-sm submit"
											id="submit" value="SUBMIT"
											onclick="return confirm('Are you sure to return?')">
											SUBMIT</button>
								</div>


								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="rfa"
									id="rfaHidden"> <input type="hidden" name="RfaStatus"
									id="RfaStatusHidden"> <input type="hidden"
									name="assignor" id="userIdHidden">
							</div>
						</div>
				</div>

			</div>
		</div>

	</form>


	<div class="modal fade  bd-example-modal-lg" tabindex="-1" role="dialog" id="ActionAssignfilemodal">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">RFA No : <b id="rfamodalval" ></b></h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" >
							<form name="specadd" id="specadd" action="RfaActionForward.htm" method="POST">
				   			<div class="row">
									  <div class="col-1"></div>
			                          <div class="col-3">
				                             <div class="form-group">
				                                     <b><label> RFA By : <span class="mandatory" style="color: red;">* </span></label></b> 
				                                       <br>
				                                       <select class=" form-control selectdee" onchange="return rfaOptionFunc()" style="width: 100%;" name="rfaoptionby" id="rfaoptionby" required="required" style="margin-top:-5px" >
															<option disabled="disabled"  selected value="" >Choose...</option>
											                  <option value="AC" >Approved By</option>
														</select>	
				                              </div>
			                         </div>
			
			                         
									   <div class="col-6" id="selectClassModal2" style="display:none;">
			                               <div class="form-group">
											    <b><label>RFA Forward To : </label><br></b>
											
												<select class="form-control selectdee " style="width: 100%;" name="rfaEmpModal" id="modalEmpList2" required="required"  data-live-search="true"  data-placeholder="Select Assignee" >
												    <%if(ModalTDList!=null){
												    	for(Object[] obj : ModalTDList){
												     %>
												     <option value="<%= obj[0] %>"><%= obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()):" - "%>,<%= obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()):" - "%></option>
												     <%}} %>
												</select>
											</div>
									</div>
			 				</div>  
			 				<div  align="center">
			 				          		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"  />         				
											<input type="hidden" name="rfano1" id="rfanomodal" value="">
			 								<input type="submit" name="sub" class="btn  btn-sm submit" form="specadd"  id="rfaforwarding" value="SUBMIT"  onclick="return confirm('Are you sure To Submit?')"/>
											<input type="hidden" name="RFAID" id="RFAID"> 
							</div>	
 	<!-- Form End -->			
							</form>
						</div>
					</div>
				</div>
			</div><!-- model end -->
		
		
		

<script>

$("#myTable1,#myTable2").DataTable({
    "lengthMenu": [ 5,10,20,50,75,100],
    "pagingType": "simple"
    	
});

$(document).ready(function(){
	  $("#myTable").DataTable({
	 "lengthMenu": [  5,10,25, 50, 75, 100 ],
	 "pagingType": "simple"
	
});
});


$('#fdate').daterangepicker({
	
	"singleDatePicker": true,
	"showDropdowns": true,
	"cancelClass": "btn-default",
	/* "minDate":new Date(), */
	"startDate":new Date(), 
	locale: {
  	format: 'DD-MM-YYYY'
		}
});

function showModel(RfaNo,rfaId) {
	  document.getElementById('RfaNo').value=RfaNo;
	  document.getElementById('rfaidvalue').value=rfaId;
	  $('#rfamodal').modal('show');
	 
}
function showdata(a,b){
	console.log(a+ " "+b);
	document.getElementById('RfaNo').value=b;
	document.getElementById('rfaidvalue').value=a;
	
	$.ajax({
		
		type:'GET',
		url:'RfaAssignAjax.htm',
		datatype:'json',
		data:{
			rfaId:a,
		},
		success:function(result){
			var ajaxresult = JSON.parse(result);
			console.log(result)
			  const date = new Date(ajaxresult[4]);
						   const formattedDate = date.toLocaleDateString('en-GB', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        }).replace(/\//g, '-');
						   console.log(formattedDate)
			$('#fdate').val(formattedDate);
			$('#clarification').val(ajaxresult[6]);
			$('#observation').val(ajaxresult[5]);
			$('#action').val(ajaxresult[7]);
		}
	})
	 
  $('#rfamodal').modal('show');
}
function submitform(){
	if(!confirm("Are you sure to Update")){
		
		event.preventDefault();
		return false;
	}else{
		
		$('#myform1').submit();
		return true;
	}
}

function assignSub() {
	
	  var observation=$('#observation').val();
	  var clarification=$('#clarification').val();
	  var action=$('#action').val();
	  
		if(observation==""||observation==null ||observation=="null" ){
			   alert('Please Enter observation');
			   return false;
		   }else if(clarification==""||clarification==null || clarification=="null"){
				 alert('Please Enter clarification');
				   return false;
		   }else if(action==""||action==null || action=="null"){
				 alert('Please Enter action');
				   return false;
		   }
	  var confirmation = confirm('Are you sure you want to add the Assign/Update Details?');
	  if(confirmation){
		  var form = document.getElementById("myform1");
		   
        if (form) {
         var assignSubBtn = document.getElementById("assignSubBtn");
            if (assignSubBtn) {
                var formactionValue = assignSubBtn.getAttribute("formaction");
                
                 form.setAttribute("action", formactionValue);
                  form.submit();
              }
         }
	  } else{
  	  return false;
	  }
	
}
$('#observation,#clarification,#action').keyup(function (){
	  $('#observation,#clarification,#action').css({'-webkit-box-shadow' : 'none', '-moz-box-shadow' : 'none','background-color' : 'none', 'box-shadow' : 'none'});
		  });

function returnRfa(rfaId,rfaStatus,userId) {
	$('#rfaReturnmodal').modal('show');
	$('#rfaHidden').val(rfaId);
	$('#RfaStatusHidden').val(rfaStatus);
	$('#userIdHidden').val(userId);
	
/* 	$.ajax({
		
		type:'GET',
		url:'getRfaAddData.htm',
		datatype:'json',
		data:{
			rfaId:rfaId,
		},
		success:function(result){
			var ajaxresult = JSON.parse(result);
			  const date = new Date(ajaxresult[2]);
						   const formattedDate = date.toLocaleDateString('en-GB', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        }).replace(/\//g, '-');
						   
						   $('#rfanoreturn').val(ajaxresult[3]);
						   $('#projectname').val(ajaxresult[0]);
						   $('#priority').val(ajaxresult[1]);
						   $('#datepicker1').val(formattedDate);   
						   $('#statement').val(ajaxresult[4]);
						   $('#description').val(ajaxresult[5]);
						   $('#reference').val(ajaxresult[6]);
		}
	}) */
	  
}

function returnSub() {
	var reply=$('#replyMsg').val();
	if(reply==null || reply=="" || reply=="null"){
		alert("Please enter Reply");
		document.getElementById("replyMsg").style.boxShadow = "rgb(239, 7, 7) 0px 0px 1px 1px";
		return false;
	}else{
	
	 var confirmation = confirm('Are You Sure To Return this RFA ?');
	  if(confirmation){
		  var form = document.getElementById("returnFrm");
		   
	       if (form) {
	        var returnSubBtn = document.getElementById("returnSubBtn");
	           if (returnSubBtn) {
	               var formactionValue = returnSubBtn.getAttribute("formaction");
	               
	                form.setAttribute("action", formactionValue);
	                 form.submit();
	             }
	        }
	
	  } else{
	  return false;
	  }
	}
}
$('#replyMsg').keyup(function (){
	  $('#replyMsg').css({'-webkit-box-shadow' : 'none', '-moz-box-shadow' : 'none','background-color' : 'none', 'box-shadow' : 'none'});
		  });

$(function () {
	$('[data-toggle="tooltip"]').tooltip()
	});
	
	
function rfaOptionFunc(){
	
	 var selectValue = $("#rfaoptionby").val();
	 
	 document.getElementById("selectClassModal2").style.display = "block";
}

function forwardmodal(rfanomodal,RFAID){
    $('#rfamodalval').html(rfanomodal);
    $('#RFAID').val(RFAID);

    $('#ActionAssignfilemodal').modal('show');
    		
}

$(document).ready(function() {
    $('#main1').show();
    $('#spinner').hide();
    $('body').css("filter", "none");

    $(".mail").click(function(event) {
        // Display confirmation dialog
        var confirmation = confirm('Are you sure want to submit?');

        // Proceed only if the user confirms
        if (!confirmation) {
            // If user cancels, prevent the default action
            event.preventDefault();
        }
        else {
            $('body').css("filter", "blur(1.0px)");
            $('#spinner').show();
            $('#main1').hide();
        }
    });
});

 </script>

</body>


</html>