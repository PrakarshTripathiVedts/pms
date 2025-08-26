<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meeting DateWise Report</title>
<jsp:include page="../static/header.jsp"></jsp:include>

</head>
<body>


<%List<Object[]> ProjectsList=(List<Object[]>) request.getAttribute("ProjectsList");
List<Object[]> getMeetingList=(List<Object[]>) request.getAttribute("getMeetingList");

String empId = ((Long)session.getAttribute("EmpId")).toString();
String projectid=(String)request.getAttribute("projectid");
String committeeid=(String)request.getAttribute("committeeid");
String scheduleid =(String)request.getAttribute("scheduleid");
FormatConverter fc=new FormatConverter(); 
SimpleDateFormat sdf=fc.getRegularDateFormat();
SimpleDateFormat sdf1=fc.getSqlDateFormat();
String fromDate1 =(String)request.getAttribute("fromDate");
String toDate1 =(String)request.getAttribute("toDate");

SimpleDateFormat sdf2=new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat sdf3=new SimpleDateFormat("yyyy-MM-dd");
LocalDate today = LocalDate.now();
String fromDate = today.minusMonths(1).toString();
String fromDate2 = today.withDayOfMonth(1).toString();
String fromDate3 = today.getYear()+"-01-01";
String toDate = today.toString();


%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card shadow-nohover">
                <div class="card-header ">  
                    <div class="row">
                        <h4 class="col-md-4">Meeting DateWise List</h4>  
                        <div class="col-md-8" style="float: right; margin-top: -8px;" >
                            <form method="get" action="MeetingDateWiseReport.htm" name="dateform" id="myform">
                                <table>
                                    <tr>
                                        <td>
                                            <label class="control-label" style="font-size: 17px; margin-bottom: .0rem;">Project: </label>
                                        </td>
                                        <td style="max-width: 300px; padding-right: 50px">
                                            <select class="form-control selectdee" id="projectid" required="required" name="projectid" onchange="document.getElementById('myform').submit();" >
                                              
                                                <% if(ProjectsList!=null && ProjectsList.size()>0){
                                                    for (Object[] obj : ProjectsList) {
                                                        String projectshortName=(obj[17]!=null)?" ( "+obj[17].toString()+" ) ":"";			 
                                                %>
                                                    <option value="<%=obj[0]%>" <%if(obj[0].toString().equals(projectid)){ %>selected<%} %> ><%=obj[4]!=null?StringEscapeUtils.escapeHtml4(obj[4].toString()):" - "%> <%= projectshortName!=null?StringEscapeUtils.escapeHtml4(projectshortName):" - " %></option>
                                                <%}} %>
                                             <option value="0" <%if("0".equals(projectid)){ %>selected<%} %>>General</option>
                                            </select>
                                                   
                                        </td>

                                        <td style="width: 24%;"></td>
                                        <th class="right" style="width: 5%;">From :</th>
                                        <td style="width:11%;">
                                            <input type="text" class="form-control" name="fromDate" id="FromDate" <%if(fromDate1!=null){%>value="<%=fc.SqlToRegularDate(fromDate1)%>" <%}%> onchange="document.getElementById('myform').submit();">
                                        </td>
                                        <th class="right" style="width: 5%;">To :</th>
                                        <td style="width: 11%;">
                                            <input type="text" class="form-control" name="toDate" id="ToDate" <%if(toDate1!=null){%>value="<%=fc.SqlToRegularDate(toDate1)%>" <%}%> onchange="document.getElementById('myform').submit();">
                                        </td>
                                    </tr>
                                </table>
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
														 	<th>Member Secretary</th>
														 	<th>Action</th>	
														 				 	
														 	
													</tr>
													</thead>
													<tbody>
														<%int count=1;
													
															if(getMeetingList!=null&&getMeetingList.size()>0)
																
															{
												   					for (Object[] obj :getMeetingList) 
												   					{ %>
												   					
																 <tr>
																		<td class="center"><%=count %></td>
																		
																		
																		 <td>
																			<form action="CommitteeMinutesViewAll.htm" >
																				<button  type="submit" class="btn btn-outline-info" formtarget="_blank" > <%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()):" - "%></button>
																				<input type="hidden" name="committeescheduleid" value="<%=obj[0] %>" />
																			</form> 
																		</td>
																		<td><%=obj[2]!=null?sdf.format(obj[2]):" - "%> - <%=obj[3]%></td>																		
																		<td><%=obj[5]!=null?StringEscapeUtils.escapeHtml4(obj[5].toString()):" - "%></td>
																	  	<td><%if(obj[4]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[4].toString())%><%}else{ %>-<%} %></td>
																	  	<td><%if(obj[6]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[6].toString())%><%}else{%>-<%} %></td>
																	  	<td>
																	  	
																	  	<form method="GET">
																	  	<input type="hidden" name="FromDate" value="<%=fromDate1 %>">
																	  	<input type="hidden" name="ToDate" value="<%=toDate1 %>">
																	  	<input type="hidden" name="ProjectId" value="<%=projectid %>">
																	  	<input type="hidden" name="Meeting" value="<%=obj[1]%>">
    <button type="submit" formaction="MeetingActionDetails.htm" value="<%=obj[0] %>" name="MeetingId" ><i class="fa fa-eye" aria-hidden="true"></i></button>
</form>
				
																	</tr>
																	<%count++;%>
													
														<% 	}}else{%>
														<tr>
															<td colspan="6" style="text-align: center;"> no data found</td></tr>
																<%}%>										   					
														
													</tbody>
												</table>												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						<br>
						<!-- <div class="card-footer" align="right">&nbsp;</div>
					</div>
				</div>
			</div>
		</div> -->









<script type="text/javascript">
$('#FromDate').daterangepicker({
    "singleDatePicker" : true,
    "linkedCalendars" : false,
    "showCustomRangeLabel" : true,    
    "cancelClass" : "btn-default",
    showDropdowns : true,
    locale : {
        format : 'DD-MM-YYYY'
    }
})

$('#ToDate').daterangepicker({
    "singleDatePicker" : true,
    "linkedCalendars" : false,
    "showCustomRangeLabel" : true,
    "minDate" : $('#FromDate').val(),
    "cancelClass" : "btn-default",
    showDropdowns : true,
    locale : {
        format : 'DD-MM-YYYY'
    }
})
</script>

</body>
</html>