<%@page import="org.apache.commons.text.StringEscapeUtils"%>
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

.cc-rockmenu {
	color: fff;
	padding: 0px 5px;
	font-family: 'Lato', sans-serif;
}

.cc-rockmenu .rolling {
	display: inline-block;
	cursor: pointer;
	width: 34px;
	height: 30px;
	text-align: left;
	overflow: hidden;
	transition: all 0.3s ease-out;
	white-space: nowrap;
}

.cc-rockmenu .rolling:hover {
	width: 108px;
}

.cc-rockmenu .rolling .rolling_icon {
	float: left;
	z-index: 9;
	display: inline-block;
	width: 28px;
	height: 52px;
	box-sizing: border-box;
	margin: 0 5px 0 0;
}

.cc-rockmenu .rolling .rolling_icon:hover .rolling {
	width: 312px;
}

.cc-rockmenu .rolling i.fa {
	font-size: 20px;
	padding: 6px;
}

.cc-rockmenu .rolling span {
	display: block;
	font-weight: bold;
	padding: 2px 0;
	font-size: 14px;
	font-family: 'Muli', sans-serif;
}

.cc-rockmenu .rolling p {
	margin: 0;
}

.width {
	width: 270px !important;
}
.width1 {
	width: 210px !important;
}
a:hover {
	color: white;
}
</style>
</head>
 
<body>
  <%
  


  List<Object[]> AssigneeList=(List<Object[]>)request.getAttribute("ForwardList");
  SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
  SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
  String type = (String)request.getAttribute("type");
  
  
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

    <br />
    
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow-nohover">
				<div class="card-header">	
					<div class="row">
					<div class="col-sm-6" align="left">
						<h5 >Action Review & Close</h5>
						</div>
						<div class="col-sm-3  "></div>
<!-- 						<div class="col-sm-3" style="margin-top: -8px;">
						Meeting -
						<select class="form-control selectdee " id="meetingId" style="width:50%" >
						<option selected >All</option>
						<option>PMRC</option>
						<option>EB</option>
						</select>
						</div> -->
						<div class="col-sm-3" align="left" style="margin-top: -8px;">
					<%-- 	<form action="ActionForwardList.htm" method="post">
										<select class="form-control selectdee " name="Type"  required="required"  data-live-search="true" onchange="this.form.submit();">                                                     
											<option value="A" <%if("A".equalsIgnoreCase(type)){%>selected="selected" <%}%>>  All</option>	
											<option value="F" <%if("F".equalsIgnoreCase(type)){%>selected="selected" <%}%>>  Forwarded</option>
											<option value="NB" <%if("NB".equalsIgnoreCase(type)){%>selected="selected" <%}%>> Assigned</option>
										</select>	
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										
						</form>	 --%>
									</div>		
						</div>
					</div>
					<div class="card-body">

						<div class="data-table-area mg-b-15">
							<div class="container-fluid">


								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="sparkline13-list">

										<div class="sparkline13-graph">
											<div class="datatable-dashv1-list custom-datatable-overright">
												<div id="toolbar">
													<!-- <select class="form-control dt-tb">
														<option value="">Export Basic</option>
														<option value="all">Export All</option>
														<option value="selected">Export Selected</option>
													</select> -->
														<form action="ActionForwardList.htm" method="post">
										<select class="form-control selectdee " name="Type"  required="required"  data-live-search="true" onchange="this.form.submit();">                                                     
											<option value="A" <%if("A".equalsIgnoreCase(type)){%>selected="selected" <%}%>>  All</option>	
											<option value="F" <%if("F".equalsIgnoreCase(type)){%>selected="selected" <%}%>>  Forwarded</option>
											<option value="NB" <%if("NB".equalsIgnoreCase(type)){%>selected="selected" <%}%>> Assigned</option>
										</select>	
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										
						</form>	
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
															<th style="text-align: left;">Action Item</th>
															<th class="width-115px">PDC</th>
															<th style="">Assigned Date</th>								
														 	<th style="">Assignee</th>
														 	<th class="width-115px">Progress</th>		
														 	<th class="width-140px">Action</th>	
														 	
														</tr>
													</thead>
													<tbody>
														<%int  count=1;
														 	if(AssigneeList!=null&&AssigneeList.size()>0){
															for(Object[] obj: AssigneeList){%>
															<tr>
															<td class="center"><%=count%></td>
															<td><%=obj[14]!=null?StringEscapeUtils.escapeHtml4(obj[14].toString()):" - " %></td>
															<td>
															<input type="hidden" id="td<%=obj[0].toString()%>" value='"<%=obj[5].toString()%>"'>
															<%if(obj[5]!=null && obj[5].toString().length()<75) {%>
															<%=StringEscapeUtils.escapeHtml4(obj[5].toString()) %>
															<%}else{ %>
															<%=StringEscapeUtils.escapeHtml4(obj[5].toString()).substring(0,75) %>&nbsp;&nbsp;<span style="text-decoration: underline;font-size:13px;color: #145374;cursor: pointer;font-weight: bolder" onclick="showAction('<%=obj[0].toString()%>','<%=obj[14].toString()%>')">show more</span>
															<%} %>
															</td>
															<td><%=obj[4]!=null?sdf.format(obj[4]):" - "%></td>
															<td><%=obj[3]!=null?sdf.format(obj[3]):" - "%></td>
															<td><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()):" - "%>, <%=obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()):" - "%></td>
															<td><%if(obj[11]!=null){%>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar progress-bar-striped" role="progressbar" style=" width: <%=obj[11]%>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=StringEscapeUtils.escapeHtml4(obj[11].toString())%>
															</div> 
															</div><%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Yet Started .
															</div>
															</div> <%} %></td>

															<td class="left width1">		
																<%if(obj[6]!=null && "A".equalsIgnoreCase(obj[6].toString()) || "B".equalsIgnoreCase(obj[6].toString())||"I".equalsIgnoreCase(obj[6].toString())){%> 
																
																<form name="myForm1" id="myForm1" action="CloseAction.htm" method="POST" 
																	style="display: inline">

																	<button class="btn btn-sm editable-click" name="sub" value="Details" 	>
																		<div class="cc-rockmenu">
																			<div class="rolling">
																				<figure class="rolling_icon">
																					<img src="view/images/preview3.png">
																				</figure>
																				<span>Details</span>
																			</div>
																		</div>
																	</button>
												                    <input type="hidden" name="Assigner" value="<%=obj[1]%>,<%=obj[2]%>"/>													
                                                                    <input type="hidden" name="ActionLinkId" value="<%=obj[13]%>"/>
																	<input type="hidden" name="ActionMainId" value="<%=obj[0]%>"/>
																	<input type="hidden" name="ActionNo" value="<%=obj[14]%>"/>
																	<input type="hidden" name="ActionAssignid" value="<%=obj[15]%>"/>
																	<input type="hidden" name="ActionAssignId" value="<%=obj[15]%>"/><!-- added  -->
																	<input type="hidden" name="ActionPath" value="F"><!-- added -->
																	<input type="hidden" name="ProjectId" value="<%=obj[16]%>"/>
																	<input type="hidden" name="back" value="backToReview">
 																	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																	
																</form>
																
																
																<%}else if(obj[6]!=null && "F".equalsIgnoreCase(obj[6].toString())){%>
															<form name="myForm1" id="myForm1" action="ForwardSub.htm" method="POST" 
																	style="display: inline">

																	<button class="editable-click" name="sub" value="Details" 	>
																		<div class="cc-rockmenu">
																			<div class="rolling">
																				<figure class="rolling_icon">
																					<img src="view/images/preview3.png">
																				</figure>
																				<span>Details</span>
																			</div>
																		</div>
																	</button>
																	<button type="submit"  class="btn btn-sm editable-click" name="ActionAssignid" value="<%=obj[15]%>" formtarget="blank" title="Action Tree"  formaction="ActionTree.htm" formmethod="POST"  >
																			<div class="cc-rockmenu">
																				 <div class="rolling">	
																					   <figure class="rolling_icon">
																					 	<img src="view/images/tree.png"  >
																                       </figure>
															                        	<span> Action Tree</span>
															                      </div>
															                  </div>
																	</button> 
                                                                    <input type="hidden" name="ActionLinkId" value="<%=obj[13]%>"/>
                                                                    <input type="hidden" name="ActionNo" value="<%=obj[14]%>"/>
																	<input type="hidden" name="Assignee" value="<%=obj[1]%>,<%=obj[2]%>"/>
																	<input type="hidden" name="ActionMainId" value="<%=obj[0]%>"/>
																	<input type="hidden" name="ActionAssignId" value="<%=obj[15]%>"/>
 																	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																</form> 
																<%}else if(obj[6]!=null && "C".equalsIgnoreCase(obj[6].toString())){%>
																<span class="badge badge-pill badge-success p-2">Closed</span>
																<%} %>		
															</td>
														</tr>
												<% count++; } }else{%>
												<tr>
													<td colspan="6" style="text-align: center">No List Found</td>
												</tr>
												<%} %>
												</tbody>
												</table>
												
							<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />


											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				
				
				<div class="card-footer" align="right">
								
				</div>
				
				
				</div>

	
			</div>

		</div>

	</div>			
				
				
				
				
	<!-- Modal for action -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="height:50px;">
        <h5 class="modal-title" id="exampleModalLongTitle">Action</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:red;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalbody">
     
      </div>
      <div align="right" id="header" class="p-2"></div>
    </div>
  </div>
</div>			
				
				
				
				


<script>
	$('#DateCompletion').daterangepicker({
			"singleDatePicker" : true,
			"linkedCalendars" : false,
			"showCustomRangeLabel" : true,
			/* "minDate" : new Date(), */
			"cancelClass" : "btn-default",
			showDropdowns : true,
			locale : {
				format : 'DD-MM-YYYY'
			}
		});
	
	
	function showAction(a,b){
		/* var y=JSON.stringify(a); */
		var y=$('#td'+a).val();
		console.log(a);
		$('#modalbody').html(y);
		$('#header').html(b);
		$('#exampleModalCenter').modal('show');
	}
	</script>  


</body>
</html>