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

<title>Assignee List</title>
<style type="text/css">
label{
font-weight: bold;
  font-size: 13px;
}
body{
background-color: #f2edfa;
overflow-x:hidden !important; 
}
h6{
	text-decoration: none !important;
}
.table button{
	
	background-color: white !important;
	border: 3px solid #17a2b8;
	padding: .275rem .5rem !important;
}

.table button:hover {
	color: black !important;
	
}
#table tbody tr td {

	    padding: 4px 3px !important;

}

</style>
</head>
 
<body>
  <%
  FormatConverter fc=new FormatConverter(); 
  SimpleDateFormat sdf=fc.getRegularDateFormat();
  List<Object[]> AssigneeList=(List<Object[]>)request.getAttribute("StatusList");
  List<Object[]> ProjectList=(List<Object[]>)request.getAttribute("ProjectList");
  String Term=(String)request.getAttribute("Term");
  String Project=(String)request.getAttribute("Project");
  String Type=(String)request.getAttribute("Type");

 %>



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

    <br/>


<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow-nohover">
					<div class="card-header ">  

					<div class="row">
						<h4 class="col-md-4">Action Reports</h4>  
							<div class="col-md-8" style="float: right; margin-top: -8px;" >
					   			<form method="post" action="ActionReportSubmit.htm" name="dateform" id="dateform">
					   				<table>
					   					<tr>
					   						<td>
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Project: </label>
					   						</td>
					   						<td style="max-width: 300px; padding-right: 50px">
                                                <select class="form-control selectdee " name="Project" id="Project" required="required"  data-live-search="true" onchange="submitForm('dateform');" >
                                                        <option value="A"  <%if(Project.equalsIgnoreCase("A")){%> selected="selected" <%}%>>ALL</option>	
<%--                                                         <option value="0"  <%if(Project.equalsIgnoreCase("0")){%> selected="selected" <%}%>>General</option>	
 --%>                                                    <%for(Object[] obj:ProjectList){
                                                    String projectShortName=(obj[17]!=null)?"("+obj[17].toString()+")":"";
                                                    %>
													<option value="<%=obj[0] %>" <%if(Project.equalsIgnoreCase(obj[0].toString())){%> selected="selected" <%}%>><%=obj[4]!=null?StringEscapeUtils.escapeHtml4(obj[4].toString()):" - "%> <%= projectShortName!=null?StringEscapeUtils.escapeHtml4(projectShortName):" - " %></option>	
													<%}%>
												</select>	        
											</td>
											<td>
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Type: </label>
					   						</td>
					   						<td style="max-width: 300px; padding-right: 50px">
                                                <select class="form-control selectdee " name="Type" id="Type" required="required"  data-live-search="true" onchange="submitForm('dateform');" >
                                                    <option value="A" <%if("A".equalsIgnoreCase(Type)){%> selected="selected" <%}%>>ALL</option>
													<option value="N" <%if("N".equalsIgnoreCase(Type)){%> selected="selected" <%}%>>Action</option>	
													<option value="S" <%if("S".equalsIgnoreCase(Type)){%> selected="selected" <%}%>>Meeting</option>	
													<option value="M" <%if("M".equalsIgnoreCase(Type)){%> selected="selected" <%}%>>Milestone</option>		
												</select>
											</td>
					   						 <td>
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Status: </label>
					   						</td>
					   						<td style="max-width: 300px; padding-right: 50px">
                                                        <select class="form-control selectdee " name="Term" id="Assignee" required="required"  data-live-search="true" onchange="submitForm('dateform');" >
                                                           <option value="N" <%if("N".equalsIgnoreCase(Term)){ %> selected="selected" <%} %>>All</option>
														   <option value="A" <%if("A".equalsIgnoreCase(Term)){ %> selected="selected" <%} %>>Active</option>	
															<option value="I" <%if("I".equalsIgnoreCase(Term)){ %> selected="selected" <%} %>>In-Progress</option>	
															<option value="C" <%if("C".equalsIgnoreCase(Term)){ %> selected="selected" <%} %> >Closed</option>		
															</select>					   						
											</td> 	   									
					   					</tr>   					   				
					   				</table>
					   				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					   			</form>
		   					</div>
		   				</div>	   							

					</div>
						
					
    					<div class="data-table-area mg-b-15">
							<div class="container-fluid">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="sparkline13-list">
										<div class="sparkline13-graph">
											<div class="datatable-dashv1-list custom-datatable-overright">
												<div id="toolbar">
													
												</div>
												<table id="table" data-toggle="table" data-pagination="true"
													data-search="true" data-show-columns="true"
													data-show-pagination-switch="true" data-show-refresh="true"
													data-key-events="true" data-show-toggle="true"
													data-resizable="true" data-cookie="true"
													data-cookie-id-table="saveId" data-show-export="true"
													data-click-to-select="true" data-toolbar="#toolbar">
													<thead>

														<tr>
															<th>SN</th>
															<th>Action Id</th>	
															<th >PDC</th>																							
														 	<th >Assignee</th>					 	
														 	<th >Mob No</th>
														 	<th class="width-115px">Progress</th>
														</tr>
													</thead>
													<tbody>
														<%int count=1;
															if(AssigneeList!=null&&AssigneeList.size()>0)
															{
												   					for (Object[] obj :AssigneeList) 
												   					{ 
												   					
												   					%>
												   					
																	<tr>
																		<td><%=count %></td>
																		<td>
																		<form action="ActionDetails.htm" method="POST" >
																				<button  type="submit" class="btn btn-outline-info"   ><%=obj[0]!=null?StringEscapeUtils.escapeHtml4(obj[0].toString()):" - " %></button>
																			   <input type="hidden" name="ActionLinkId" value="<%=obj[11]%>"/>
																	           <input type="hidden" name="Assignee" value="<%=obj[1]%>,<%=obj[2]%>"/>
																	           <input type="hidden" name="ActionMainId" value="<%=obj[10]%>"/>
																	           <input type="hidden" name="ActionAssignId" value="<%=obj[14]%>"/>
																	           <input type="hidden" name="ActionNo" value="<%=obj[0]%>"/>
																	           <input type="hidden" name="text" value="P">
 																			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
																			
																			</form> 
                                                                        </td>
																		<td><%= obj[6]!=null?sdf.format(obj[6]):""%></td>																		
																		<td><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()):" - "%>, <%=obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()):" - "%></td>
																	  	<td>Ext: <%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()):" - "%>, Mob: <%=obj[4]!=null?StringEscapeUtils.escapeHtml4(obj[4].toString()):" - "%></td>
																		<td style="width:8% !important; "><%if(obj[12]!=null && !obj[12].toString().equalsIgnoreCase("0")){ %>
															            <div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															            <div class="progress-bar progress-bar-striped" role="progressbar" style=" width: <%=obj[12]%>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															            <%=StringEscapeUtils.escapeHtml4(obj[12].toString()) %>
															            </div> 
															            </div> <%}else{ %>
															            <div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															            <div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															             Not Yet Started .
															            </div>
															            </div> <%} %></td>				
																	</tr>
																<% count++;
																	}									   					
															}%>
													</tbody>
												</table>												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="card-footer" align="right">&nbsp;</div>
					</div>
				</div>
			</div>
		</div>

	
			
		

	
<script type='text/javascript'> 
function submitForm(frmid)
{ 
  document.getElementById(frmid).submit(); 
} 




$('#fdate').daterangepicker({
	"singleDatePicker" : true,
	"linkedCalendars" : false,
	"showCustomRangeLabel" : true,
	"cancelClass" : "btn-default",
	"maxDate" : new Date(),
	showDropdowns : true,
	locale : {
		format : 'DD-MM-YYYY'
	}
});





$('#tdate').daterangepicker({
	"singleDatePicker" : true,
	"linkedCalendars" : false,
	"showCustomRangeLabel" : true,
	"cancelClass" : "btn-default",
	"maxDate" : new Date(),
	
	showDropdowns : true,
	locale : {
		format : 'DD-MM-YYYY'
	}
});



function Prints(myfrm){
	
	 var fields = $("input[name='btSelectItem']").serializeArray();

	 
	  if (fields.length === 0){
		  myalert();
	 event.preventDefault();
	return false;
	}
	 
	
	
		 
	
		  return true;
	 
			
	}

/* $(document).ready(function(){
	
	$("#table").DataTable({
		"pageLength": 10
	})
})
 */

</script>


</body>
</html>