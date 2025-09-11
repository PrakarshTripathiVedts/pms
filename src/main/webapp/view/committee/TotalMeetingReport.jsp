<%-- <%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat,java.io.ByteArrayOutputStream,java.io.ObjectOutputStream"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>

 

<title>Total Meeting Report</title>
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
  SimpleDateFormat sdf1=fc.getSqlDateFormat();

  SimpleDateFormat sdf2=new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat sdf3=new SimpleDateFormat("yyyy-MM-dd");
  
  List<Object[]> TotalMeetingReportListAll=(List<Object[]>)request.getAttribute("TotalMeetingReportListAll");
  List<Object[]> ProjectList=(List<Object[]>)request.getAttribute("ProjectList");
  String Project=(String)request.getAttribute("Project");
  List<Object[]> EmployeeList=(List<Object[]>)request.getAttribute("EmployeeList");
  String Employee=(String)request.getAttribute("Employee");
  String EmpId=(String)request.getAttribute("EmpId");
  String fdate=(String)request.getAttribute("fdate");
  String tdate=(String)request.getAttribute("tdate");  
  String LoginType=(String)request.getAttribute("LoginType");  
 %>



<%String ses=(String)request.getParameter("result"); 
 String ses1=(String)request.getParameter("resultfail");
 if(ses1!=null){
	%>
	<center>
	<div class="alert alert-danger" role="alert" >
                     <%=ses1 %>
                    </div></center>
	<%}if(ses!=null){ %>
	<center>
	<div class="alert alert-success" role="alert"  >
                     <%=ses %>
                   </div></center>
                    <%} %>

    <br/>


<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow-nohover">
					<div class="card-header ">  

					<div class="row">
						<h5 class="col-md-2">Meeting Reports</h5>  
							<div class="col-md-10" style="float: right; margin-top: -12px;">
					   			<form method="post" action="TotalMeetingReport.htm" name="dateform" id="dateform">
					   				<table >
					   					<tr>
					   						<td >
					   							<label class="control-label" style="font-size: 14px; margin-bottom: .0rem;">Project: </label>
					   						</td>
					   						<td style=" padding-right: 50px">
                                                        <select class="form-control selectdee " name="Project" id="Project" required="required"  data-live-search="true"  >
                                                           <option value="0"  <%if(Project.equalsIgnoreCase("0")){ %> selected="selected" <%} %>>General</option>	
                                                           <%
                                                           for(Object[] obj:ProjectList){ 
                                                           String projectshortName=(obj[17]!=null)?" ( "+obj[17].toString()+" ) ":"";
                                                           %>
														   <option value="<%=obj[0] %>" <%if(Project.equalsIgnoreCase(obj[0].toString())){ %> selected="selected" <%} %>><%=obj[4]+projectshortName %></option>	
														<%} %>
																</select>	        
											</td>
											
					   						<td >
					   							<label class="control-label" style="font-size: 14px; margin-bottom: .0rem;">Name </label>
					   						</td>
					   						
					   						<%if(LoginType.equalsIgnoreCase("Z") || LoginType.equalsIgnoreCase("Y") || LoginType.equalsIgnoreCase("P") || LoginType.equalsIgnoreCase("L") || LoginType.equalsIgnoreCase("C")|| LoginType.equalsIgnoreCase("I")  ) {%>
					   						
					   						<td style=" padding-right: 25px">
                                                        <select class="form-control selectdee " name="EmpId" id="EmpId" required="required"  data-live-search="true"  >
                                                           <option value="A"  <%if(Employee.equalsIgnoreCase("A")){ %> selected="selected" <%} %>>ALL</option>	
                                                           
                                                           <%
                                                           for(Object[] obj:EmployeeList){ %>
														   <option value="<%=obj[0] %>" <%if(Employee.equalsIgnoreCase(obj[0].toString())){ %> selected="selected" <%} %>><%=obj[1] %>, <%=obj[2] %></option>	
														<%} %>
																</select>	        
											</td>
											
											<%}else{ %>
											
											<td style=" padding-right: 20px">
                                                        <select class="form-control selectdee " name="EmpId" id="EmpId" required="required"  data-live-search="true"  >
                                                           
                                                           <%
                                                           for(Object[] obj:EmployeeList){ 
                                                           if(obj[0].toString().equalsIgnoreCase(EmpId)){
                                                           %>
                                                           
                                                           
														   <option value="<%=obj[0] %>" <%if(Employee.equalsIgnoreCase(obj[0].toString())){ %> selected="selected" <%} %>><%=obj[1] %>, <%=obj[2] %></option>	
														<%}} %>
																</select>	        
											</td>
					   							
					   						<%} %>
					   							
					   						<td >
					   							<label class="control-label" style="font-size: 14px; margin-bottom: .0rem;">From Date: </label>
					   						</td>
					   						<td style="padding-right: 20px">
					   							<input  class="form-control"  data-date-format="dd/mm/yyyy" id="fdate" name="fdate"  required="required"  value="<%=sdf.format(sdf1.parse(fdate))%>">
					   						</td>
					   						<td>
					   							<label class="control-label" style="font-size: 14px; margin-bottom: .0rem;">To Date: </label>
					   						</td>
					   						<td style=" padding-right: 20px">
					   							<input  class="form-control "  data-date-format="dd/mm/yyyy" id="tdate" name="tdate"  required="required"  value="<%= sdf2.format(sdf3.parse(tdate))%>">
					   						</td>
					   						<td>
					   							<input type="submit" value="SUBMIT" class="btn  btn-sm submit "/>
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
															<th>SN </th>
															<th>Meeting Id</th>
															<th>Date & Time</th>
															<th>Committee</th>																							
														 	<th >Venue</th>					 	
														 	
														</tr>
													</thead>
													<tbody>
														<%int count=1;
															if(TotalMeetingReportListAll!=null&&TotalMeetingReportListAll.size()>0)
															{
												   					for (Object[] obj :TotalMeetingReportListAll) 
												   					{ %>
												   					
																	<tr>
																		<td class="center"><%=count %></td>
																		<td>
																			<form action="CommitteeMinutesViewAll.htm" >
																				<button  type="submit" class="btn btn-outline-info" formtarget="_blank" > <%=obj[0]%></button>
																				<input type="hidden" name="committeescheduleid" value="<%=obj[6] %>" />
																			</form>
																		</td>
																		<td><%=sdf.format(obj[1])%> - <%=obj[2]%></td>																		
																		<td><%=obj[4]%></td>
																	  	<td><%if(obj[5]!=null){%><%=obj[5]%><%}else{ %>-<%} %></td>
																	  	
																					
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


</script>


</body>
</html> --%>

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

 

<title>Total Meeting Report</title>
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
  SimpleDateFormat sdf1=fc.getSqlDateFormat();

  SimpleDateFormat sdf2=new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat sdf3=new SimpleDateFormat("yyyy-MM-dd");
  
  List<Object[]> TotalMeetingReportListAll=(List<Object[]>)request.getAttribute("TotalMeetingReportListAll");
  List<Object[]>  projapplicommitteelist=(List<Object[]>)request.getAttribute("projapplicommitteelist");

  List<Object[]> ProjectList=(List<Object[]>)request.getAttribute("ProjectList");
  String Project=(String)request.getAttribute("Project");
 
  List<Object[]> EmployeeList=(List<Object[]>)request.getAttribute("EmployeeList");
  String Employee=(String)request.getAttribute("Employee");
  String EmpId=(String)request.getAttribute("EmpId");
  String fdate=(String)request.getAttribute("fdate");
  String tdate=(String)request.getAttribute("tdate");
  String committeeid=(String)request.getAttribute("committeeid");
  String LoginType=(String)request.getAttribute("LoginType");  
  
  String projectid=(String)request.getAttribute("projectid");
  
  String scheduleid =(String)request.getAttribute("scheduleid");
  List<Object[]> meetinglistAll=(List<Object[]>)request.getAttribute("meetinglistAll");
  List<Object[]> meetinglist=(List<Object[]>)request.getAttribute("meetinglist");
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
						<h5 class="col-md-4">Meeting Reports</h5>
							<div class="col-md-8" style="float: right; margin-top: -12px;">
					   			<form method="get" action="TotalMeetingReport.htm" name="dateform" id="myform">
					   				<table >
					   					<tr>
					   					<td >
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Project: </label>
					   					</td>
					   						<td style="  max-width: 300px;  padding-right: 50px">
                                             <select class="form-control selectdee " name="projectid" id="Project" required="required"  data-live-search="true" onchange='submitForm1();' >
                                            	<!-- PRAKARSH -->
													<%
													for (Object[] obj : ProjectList) {
														String projectShortName = (obj[17] != null) ? "(" + obj[17].toString() + ")" : "";
													%>
													<option value="<%=obj[0]%>"
														<%if (projectid.equalsIgnoreCase(obj[0].toString())) {%>
														selected="selected" <%}%>><%=obj[4]!=null?StringEscapeUtils.escapeHtml4(obj[4].toString()): " - " %> <%= projectShortName!=null?StringEscapeUtils.escapeHtml4(projectShortName): " - "%></option>
													<%
													}
													%>       
											</select></td>
					   						<td>
					   							<label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Committee: </label>
					   						</td>
					   						 <td style="max-width: 300px; padding-right: 50px">
                                              <select class="form-control selectdee" id="committeeid" required="required" name="committeeid" onchange='submitForm();' >
                                               
                                        
                                                <option value="A" <%if ((committeeid).equalsIgnoreCase("A")) {%>
														selected="selected" <%}%>>ALL</option>
                                              
                                                   <% for (Object[] obj : projapplicommitteelist) {%>
		                                        	     <option value="<%=obj[0]%>" <%if(obj[0].toString().equals(committeeid)){%>selected<%} %> ><%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()): " - "%></option>
		                                        	      <%} %>  
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
															<th>SN </th>
															<th>Meeting Id</th>
															<th>Date & Time</th>
															<th>Committee</th>																							
														 	<th >Venue</th>	
														 	<th>Presenter</th>	
														 				 	
														 	
													</tr>
													</thead>
													<tbody>
														<%int count=1;
														if(committeeid.equalsIgnoreCase("A")){
															if(meetinglistAll!=null&&meetinglistAll.size()>0)
																
															{
												   					for (Object[] obj :meetinglistAll) 
												   					{ %>
												   					
																 <tr>
																		<td class="center"><%=count %></td>
																		
																		
																		 <td>
																			<form action="CommitteeMinutesViewAll.htm" >
																				<button  type="submit" class="btn btn-outline-info" formtarget="_blank" > <%=obj[1]%></button>
																				<input type="hidden" name="committeescheduleid" value="<%=obj[0] %>" />
																			</form> 
																		</td>
																		<td><%=obj[2]!=null?sdf.format(obj[2]): " - " %> - <%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()): " - "%></td>																		
																		<td><%=obj[5]!=null?StringEscapeUtils.escapeHtml4(obj[5].toString()): " - "%></td>
																	  	<td><%if(obj[4]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[4].toString())%><%}else{ %>-<%} %></td>
																	  	<td><%if(obj[6]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[6].toString())%><%}else{%>-<%} %></td>
				
																	</tr>
																	<%count++;%>
													
														<% 	}}}else{
															if(meetinglist!=null&&meetinglist.size()>0)
														
															{
												   					for (Object[] obj :meetinglist) 
												   					{ %>
												   					
																	<tr>
																		<td class="center"><%=count %></td>
																
																		 <td>
																			<form action="CommitteeMinutesViewAll.htm" >
																				<button  type="submit" class="btn btn-outline-info" formtarget="_blank" > <%=obj[1]%></button>
																				<input type="hidden" name="committeescheduleid" value="<%=obj[0] %>" />
																			</form> 
																		</td>
																		<td><%=obj[2]!=null?sdf.format(obj[2]): " - " %> - <%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()): " - "%></td>																		
																		<td><%=obj[5]!=null?StringEscapeUtils.escapeHtml4(obj[5].toString()): " - "%></td>
																	  	<td><%if(obj[4]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[4].toString())%><%}else{ %>-<%} %></td>
				                                                        <td><%if(obj[6]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[6].toString())%><%}else{%>-<%} %></td>
																	</tr>
																<%count++;%>
																<%}}}%>										   					
														
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
	
	
function submitForm()
{ 
  document.getElementById('myform').submit(); 
}
function submitForm1()
{ 
	$("#committeeid").val("all").change();
}

</script>


</body>
</html>