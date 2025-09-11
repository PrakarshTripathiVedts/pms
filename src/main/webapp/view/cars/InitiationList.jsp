<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
<spring:url value="/resources/summernote-lite.js" var="SummernoteJs" />
<spring:url value="/resources/summernote-lite.css" var="SummernoteCss" />
<script src="${SummernoteJs}"></script>
<link href="${SummernoteCss}" rel="stylesheet" />
<!-- <style type="text/css">
/* icon styles */
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

th
 {
 	border: 1px solid black;
 	text-align: center;
 	padding: 5px;
 }
 
 td
 {
 	border: 1px solid black;
 	text-align: left;
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
</style> -->

<style type="text/css">
label {
	font-weight: bold;
	font-size: 13px;
}

.table .font {
	font-family: 'Muli', sans-serif !important;
	font-style: normal;
	font-size: 13px;
	font-weight: 400 !important;
}

.card{

box-shadow: rgba(0, 0, 0, 0.25) 0px 4px 14px;
border-radius: 10px;
border: 0px;
}

.table button {
	background-color: Transparent !important;
	background-repeat: no-repeat;
	border: none;
	cursor: pointer;
	overflow: hidden;
	outline: none;
	text-align: left !important;
}

.table td {
	padding: 5px !important;
}

.resubmitted {
	color: green;
}

.fa-long-arrow-right {
	font-size: 2.20rem;
	padding: 0px 5px;
}

.datatable-dashv1-list table tbody tr td {
	padding: 8px 10px !important;
}

.card-deck{
display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}

.pagin{
display: grid;
float:left;
  grid-template-columns: 1fr 1fr 1fr;
}

.table-project-n {
	color: #005086;
}

#table thead tr th {
	padding: 0px 0px !important;
}

#table tbody tr td {
	padding: 2px 3px !important;
}

/* icon styles */
.cc-rockmenu {
	color: fff;
	padding: 0px 5px;
	font-family: 'Lato', sans-serif;
	height: 28px;
}

.col-xl{
height: 28px;
}

.cc-rockmenu .rolling {
	display: inline-block;
	cursor: pointer;
	width: 34px;
	height: 28px;
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
	height: 28px;
	box-sizing: border-box;
	margin: 0 5px 0 0;
}

.sameline{
display: inline-block;
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

.editable-click{
float: left;
z-index: 9;
white-space: nowrap;
height: 28px;
margin: 0 5px 0 0;
box-sizing: border-box;
display: inline-block;
/* border: none;
background: none; */
}

.editable-clicko{
z-index: 9;
white-space: nowrap;
height: 28px;
margin: 0 5px 0 0;
box-sizing: border-box;
display: inline-block;
background: none;border-style: none;
}

.cc-rockmenu .rolling p {
	margin: 0;
}

.width {
	width: 270px !important;
}

.label {
	border-radius: 3px;
	color: white;
	padding: 1px 2px;
}

.label-primary {
	background-color: #D62AD0; /* D62AD0 */
}

.label-warning {
	background-color: #5C33F6;
}

.label-info {
	background-color: #006400;
}

.label-success {
	background-color: #4B0082;
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

.modal-dialog-jump {
  animation: jumpIn 1.5s ease;
}

@keyframes jumpIn {
  0% {
    transform: scale(0.1);
    opacity: 0;
  }
  70% {
    transform: scale(1);
  }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}

/* Summer Note styles */
.note-editor {
	width: 835px !important;
}
</style>
</head>
<body>
<%
FormatConverter fc = new FormatConverter();
List<Object[]> intiationList = (List<Object[]>)request.getAttribute("InitiationList");
String committeeId = (String)request.getAttribute("committeeId");
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
	
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card shadow-nohover">
				<div class="row card-header">
			   		<div class="col-md-6">
						<h4>Initiation List</h4>
					</div>
				</div>
				<div class="card-body">	
				
					<%-- <div class="table-responsive">
	                	<table class="table table-bordered table-hover table-striped table-condensed" id="myTable"> 
	                    	<thead>
	                        	<tr>
	                            	<th width="5%">SN</th>
	                                <th width="10%">Date</th>
	                                <th width="15%">CARSNo</th>
	                                <th width="10%">Funds From</th>
	                                <th width="20%">Title</th>
	                                <th width="30%">Status</th>
	                                <th width="10%">Action</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<% if(intiationList!=null && intiationList.size()>0) {
	                               int slno=0; 
	                               for(Object[] obj : intiationList) {%>   
	                            	<tr>
	                                	<td style="text-align: center;"><%=++slno %> </td>
	                                    <td style="text-align: center;"><%if(obj[3]!=null) {%><%=fc.SqlToRegularDate(obj[3].toString()) %><%} else {%>- <%} %></td>
	                                    <td style="text-align: center;"><%=obj[2] %> </td>
	                                    <td style="text-align: left;">
	                                    	<%if(obj[7]!=null) {%> <%if(obj[7].toString().equalsIgnoreCase("0")) {%>Buildup<%} else{%>Project<%} }%>
	                                    </td>
	                                    <td style="text-align: left;"><%=obj[4] %> </td>
	                                    <td style="text-align: center;">
	                                    	<form action="#">
	                                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                                        	<input type="hidden" name="carsInitiationId" value="<%=obj[0] %>">
	                                       	  	<button type="submit" class="btn btn-sm btn-link w-50 btn-status" formaction=CARSTransStatus.htm value="<%=obj[0] %>" name="carsInitiationId"  data-toggle="tooltip" data-placement="top" title="Transaction History" style=" color: <%=obj[11] %>; font-weight: 600;" formtarget="_blank">
								    			<%=obj[10] %> <i class="fa fa-telegram" aria-hidden="true" style="float: right;margin-top: 0.3rem;"></i>
								    			</button>
	                                        </form>
	                                    </td>
	                                    <td style="text-align: center;">
	                                        <form action="#" method="post">
	                                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                                        	
	                                       	 	<button class="editable-click" name="carsInitiationId" value="<%=obj[0] %>" formaction="CARSInitiationDetails.htm">
													<div class="cc-rockmenu">
														<div class="rolling">
															<figure class="rolling_icon">
																<img src="view/images/clipboard.png">
															</figure>
															<span>Details</span>
														</div>
													</div>
											    </button>
											    <%if(obj[12]!=null && (obj[12].toString().equalsIgnoreCase("FWD") || obj[12].toString().equalsIgnoreCase("SFU"))) {%>
	                                       	 	<button class="editable-click" name="carsUserRevoke" value="<%=obj[0] %>/<%=obj[12] %>" formaction="CARSUserRevoke.htm" formmethod="post" onclick="return confirm('Are you sure to revoke?')">
													<div class="cc-rockmenu">
														<div class="rolling">
															<figure class="rolling_icon">
																<img src="view/images/userrevoke.png" style="width: 22px !important;">
															</figure>
															<span>Revoke</span>
														</div>
													</div>
											    </button>
											    <%} %>
	                                        </form>
	                                    </td>
	                                </tr>
	                            <%} }%>
	                        </tbody>
	                    </table>
	                </div> --%>
	                
	                
	                
	                <div align="center">
	                	<form action="#" id="myform" method="post">
	                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        <button  class="btn add" type="submit" name="Action" value="Add" formaction="CARSInitiationDetails.htm" formnovalidate="formnovalidate">Add CARS</button>
	                 	</form>
	              	</div>
				
				
				
				</div>
				
				<%if(intiationList!=null && intiationList.size()>0) {%>
				<!-- search box -->
					<form method="get" class="form-inline my-2 my-lg-0" style="display: flex; justify-content: center; padding-bottom:10px;">
						<div >
							<input name="search" id="search" required class="form-control mr-sm-2" placeholder="Search" aria-label="Search" type="Search" />
							<input type="submit" class="btn btn-outline-success my-2 my-sm-0" name="clicked" value="Search" />
							<a href="CARSInitiationList.htm"><button type="submit" class="btn btn-outline-danger my-2 my-sm-0" formnovalidate="formnovalidate" >Reset</button></a>
							
						</div>
					</form>
				<!-- search ends -->
					
					<!-- card project visualizations -->
					<div style="display: flex; justify-content: center;padding-bottom:10px;position: relative;">
						<div class="card-deck" style="position: relative;">
							<%
							for(Object[] obj: intiationList){ 
								String carstitle = obj[4].toString();
								List<String> transactionCodes = Arrays.asList(obj[15].toString().split(","));
								String amount = String.format("%.2f", Double.parseDouble(obj[20]!=null?obj[20].toString():obj[13].toString())/100000);
							%>
								
								<div class="card" style="margin:10px; margin-left: 20px;margin-right: 20px;min-width:450px;">
									<div class="card-body">
										<div class="container">
				  							<div class="row">
					  							<div class="col-lg">
													<h4 class="card-title" ><%=obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()): " - " %></h4></div>
											<%-- <div class="col-">
												<p> <%if(obj[8]!=null){if(obj[8].equals('Y')){%><%="MAIN" %>
													<%}else{ %><%="SUB" %> <% }}else{ %> - <%} %>
												</p>
											</div> --%>
											</div>
										</div>
									
									<%-- <div class="container">
				  						<div class="row">
					  						<div class="col-lg">
												<h6> <%if(obj[2]!=null){%><%=obj[2] %></h6>
											</div>
											<div class="col-" style="text-align: right;">
												<h6><%if(obj[6]!=null){%><%=obj[6] %> lakhs
												<%}else{ %>-<%} %>
												</h6> 
											</div>
										</div>
									</div> --%>
									
									
										<%-- <div class="container">
					  						<div class="row">
												<div class="col-xl" style="text-align: left;">
												Date : <%if(obj[3]!=null) {%><%=fc.SqlToRegularDate(obj[3].toString()) %><%} else {%>-<%} %>
												<br/></div>
											</div>
										</div> --%>
										
										<div class="container">
					  						<div class="row">
												<div class="col-xl" style="height: 45px;">
												Title : 
														<%if(obj[4]!=null){%>
														    <span>
														    	<%if(carstitle.length()<100){%> <%=carstitle!=null?StringEscapeUtils.escapeHtml4(carstitle): " - "%> <%}else{%><%=carstitle!=null?StringEscapeUtils.escapeHtml4(carstitle).substring(0,100):" - "%>
														    </span>
															<span>
																<b><span style="color:#1176ab;font-size: 14px;"><a href="#" onclick="titlemodal('<%=obj[0]%>','<%=obj[4]%>')" style="text-decoration: none;">......(View More)</a></span></b>
															</span>
																
											            		<%-- <button type="button" class="editable-click" style="border-style:none;" name="carsInitiationId"  id="carsInitiationId" value="<%=obj[0]%>" onclick="titlemodal('<%=obj[0]%>')">
																	<b><span style="color:#1176ab;font-size: 14px;">......(View More)</span></b>
													         	</button> --%>
											         		<%}%> 
														<%}else{ %>
															-
														<%} %>
												<br/></div>
											</div>
										</div>
									
										<div class="container">
					  						<div class="row">
					  							<div class="col-xl" style="text-align: left;">
													Date : <%if(obj[3]!=null) {%><%=fc.SqlToRegularDate(StringEscapeUtils.escapeHtml4(obj[3].toString())) %><%} else {%>-<%} %>
												</div>
												<div class="col-">
													Funds from : <%if(obj[7]!=null) {%> <%if(StringEscapeUtils.escapeHtml4(obj[7].toString()).equalsIgnoreCase("0")) {%>Buildup<%} else{%>Project<%} }%>
												</div>
												
											</div>
										</div>
									
										<div class="container" style="">
					  						<div class="row">
												<div class="col-xl">
													Cost : <%=amount %> Lakhs
												</div>
												<div class="col-">
													Duration : <%=obj[33]!=null?StringEscapeUtils.escapeHtml4(obj[33].toString()):(obj[8]!=null?StringEscapeUtils.escapeHtml4(obj[8].toString()):"0") %> Months
												</div>
											</div>
										</div>
										<%-- <div class="container" style="">
					  						<div class="row">
												<div class="col-xl">
													Duration : <%if(obj[8]!=null){%><%=obj[8] %> months
													<%}else{ %>-<%} %>
													<br/>
												</div>
											</div>
										</div> --%>
										
										<div class="container" style="">
					  						<div class="row">
												<div class="col-xl">
													<form action="#">
				                                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				                                        	<input type="hidden" name="carsInitiationId" value="<%=obj[0] %>">
				                                       	  	<button type="submit" class="btn btn-sm btn-link w-100 btn-status" formaction=CARSTransStatus.htm value="<%=obj[0] %>" name="carsInitiationId"  data-toggle="tooltip" data-placement="top" title="Transaction History" style=" color: <%=obj[11] %>; font-weight: 600;" formtarget="_blank">
											    			<%=obj[10]!=null?StringEscapeUtils.escapeHtml4(obj[10].toString()): " - " %> <i class="fa fa-telegram" aria-hidden="true" style="float: right;margin-top: 0.3rem;"></i>
											    			</button>
	                                        			</form>
													<br/>
												</div>
											</div>
										</div>
										
										<%-- <div style="bottom: 0px;margin-bottom: 15px;">
											<div class="container">
						  						<div class="row">
													<div class="col-xl">
														<form action="#">
				                                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				                                        	<input type="hidden" name="carsInitiationId" value="<%=obj[0] %>">
				                                       	  	<button type="submit" class="btn btn-sm btn-link w-50 btn-status" formaction=CARSTransStatus.htm value="<%=obj[0] %>" name="carsInitiationId"  data-toggle="tooltip" data-placement="top" title="Transaction History" style=" color: <%=obj[11] %>; font-weight: 600;" formtarget="_blank">
											    			<%=obj[10] %> <i class="fa fa-telegram" aria-hidden="true" style="float: right;margin-top: 0.3rem;"></i>
											    			</button>
	                                        			</form>
													</div>
												</div>
											</div>
										</div> --%>
												
										<div style="bottom: 0px;margin-bottom: 15px;padding-top: 10px;">
											<div class="container">
						  						<div class="row" style="text-align: center">
													<div class="col-xl">
													
														<form action="#" method="post">
		                                        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                                        	
	                                       	 				<button class="editable-clicko" name="carsInitiationId" value="<%=obj[0] %>" formaction="CARSInitiationDetails.htm">
																<div class="cc-rockmenu">
																	<div class="rolling">
																		<figure class="rolling_icon">
																			<img src="view/images/clipboard.png">
																		</figure>
																		<span>Details</span>
																	</div>
																</div>
											    			</button>
											    			<%if(obj[12]!=null && (obj[12].toString().equalsIgnoreCase("FWD") || obj[12].toString().equalsIgnoreCase("SFU"))) {%>
					                                       	 	<button class="editable-clicko" name="carsUserRevoke" value="<%=obj[0] %>/<%=obj[12] %>" formaction="CARSUserRevoke.htm" formmethod="post" onclick="return confirm('Are you sure to revoke?')">
																	<div class="cc-rockmenu">
																		<div class="rolling">
																			<figure class="rolling_icon">
																				<img src="view/images/userrevoke.png" style="width: 22px !important;">
																			</figure>
																			<span>Revoke</span>
																		</div>
																	</div>
															    </button>
											    			<%} %>
											    			<%if(obj[14]!=null && obj[14].toString().equalsIgnoreCase("A")) {%>
		                                       	 				<button class="editable-clicko" name="carsInitiationId" value="<%=obj[0] %>" formaction="CARSMilestonesMonitor.htm">
																	<div class="cc-rockmenu">
																		<div class="rolling">
																			<figure class="rolling_icon">
																				<img src="view/images/milestone.png">
																			</figure>
																			<span>Milestones</span>
																		</div>
																	</div>
												    			</button>
											    			<%} %>
												    		<%if((transactionCodes.contains("AGD") || transactionCodes.contains("APD")) ) {%>
		                                       	 				<button class="editable-clicko" name="carsInitiationId" value="<%=obj[0] %>" formaction="CommitteeMainMembers.htm">
																	<div class="cc-rockmenu">
																		<div class="rolling">
																			<figure class="rolling_icon">
																				<img src="view/images/committee.jpeg" style="width: 35px;">
																			</figure>
																			<span>Constitute</span>
																		</div>
																	</div>
												    			</button>
												    			
												    			<input type="hidden" name="committeeid" value="<%=committeeId%>">
												    			<input type="hidden" name="committeemainid" value="<%=obj[19] %>">
												    			<input type="hidden" name="projectid" value="0">
												    			<input type="hidden" name="divisionid" value="0">
												    			<input type="hidden" name="initiationid" value="0">
												    		<%} %>	
												    		<textarea id="currentStatus<%=obj[0] %>" style="display: none;"><%=obj[34] %></textarea>
											    			<button type="button" class="editable-clicko" id="carsDetails" data-id="<%=obj[0] %>" data-carsno="<%=obj[2] %>" data-toggle="modal" data-target="#currentStatusModal" formnovalidate="formnovalidate">
																<div class="cc-rockmenu">
																	<div class="rolling">
																		<figure class="rolling_icon">
																			<img src="view/images/current-status.png" style="width: 30px;">
																		</figure>
																		<span>Status</span>
																	</div>
																</div>
											    			</button>
		                                        		</form>
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							
							<% }%>
							</div>
							<br/><br/>						
					</div>
					<!-- card project visualizations FINISH -->
					
					<div class="pagin" style="display: flex; justify-content: center;padding-bottom:10px;">
						<nav aria-label="Page navigation example" >
							<div class="pagination" >
								<% int pagin = Integer.parseInt(request.getAttribute("pagination").toString()) ; %>
							
									<div class="page-item">
										<form method="get" action="CARSInitiationList.htm" onsubmit="return verify()">
											<input class="page-link" type="submit" <%if(pagin==0){ %>disabled<%} %> value="Previous" />
											<% if (request.getAttribute("searchFactor")!=null){ %>
												<input type="hidden" value="<%= request.getAttribute("searchFactor").toString() %>" name="search" />
											<%} %>
											<input type="hidden" id="pagination" name="pagination" value=<%=pagin-1 %> />
										</form>
									</div>
									<div class="page-item">
										<input class="page-link" type="button" value="<%=pagin+1 %>" disabled/>
									</div>
									<div class="page-item">
										<form method="get" action="CARSInitiationList.htm" >
											<% int last=pagin+2;if(Integer.parseInt(request.getAttribute("maxpagin").toString())<last)
												last=0; %>
												<input class="page-link" type="submit" value="Next" <%if(last==0){ %><%="disabled"%><%} %> />
												<input type="hidden" name="pagination" value=<%=pagin+1 %> />
										</form>
									</div>
							</div>
						</nav>
					</div>
				<%} %>	
				
				<!-- ------------------------------------- CARS Full Title Modal ----------------------------- -->
				<div class="modal fade" id="titlemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-jump modal-dialog-centered" role="document" style="max-width: 70% !important;height: 40%;">
						<div class="modal-content" style="min-height: 80%;" >
						    <div class="modal-header" style="background-color: rgba(0,0,0,.03);">
						    	<h4 class="modal-title" id="model-card-header" style="color: #145374">Title</h4>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
						          <span aria-hidden="true">&times;</span>
						        </button>
						    </div>
						    
							<div class="modal-body"  style="padding: 0.5rem !important;">
								<div class="card-body" style="min-height:30% ;max-height: 25% !important;overflow-y: auto;">
									<div class="row" id="titledata">
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				
				<!-- ------------------------------------- CARS Full Title Modal End ----------------------------- -->
				<!-- ------------------------------------- CARS Current Status Modal ----------------------------- -->
				<div class="modal fade bd-example-modal-lg" id="currentStatusModal" tabindex="-1" role="dialog" aria-labelledby="currentStatusModal" aria-hidden="true" style="margin-top: 5%;">
					<div class="modal-dialog modal-lg" role="document" style="max-width: 900px;">
						<div class="modal-content">
							<div class="modal-header bg-primary text-light" >
					        	<h5 class="modal-title ">Current Status - <span id="carsnoheader"></span></h5>
						        <button type="button" class="close" style="text-shadow: none !important" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true" style="color: #f02828;">&times;</span>
						        </button>
					      	</div>
			     			<div class="modal-body">
			     				<div class="container-fluid mt-3">
			     					<div class="row">
										<div class="col-md-12 " align="left">
											<form action="CARSCurrentStatusSubmit.htm" method="POST" id="myfrm">
												<div id="Editor" class="center"></div>
												<textarea id="currentStatus" name="currentStatus" style="display: none;"></textarea>
												<div class="mt-2" align="center" id="detailsSubmit">
													<span id="EditorDetails"></span>
													<input type="hidden" name="carsInitiationId" id="carsInitiationId">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
													<span id="Editorspan">
														<span id="btn1" style="display: block;"><button type="submit"class="btn btn-sm btn-warning edit mt-2" onclick="return confirm('Are you sure to Update?')">UPDATE</button></span>
													</span>
												</div>
											</form>
										</div>
									</div>
			     				</div>
			     			</div>
			     		</div>
			     	</div>
			     </div>				
			     <!-- ------------------------------------- CARS Current Status Modal End----------------------------- -->				
			</div>
		</div>
	</div>
</div>	

<script type="text/javascript">
function titlemodal(carsinitiationid,carstitle) {
	
	$('#titledata').html(carstitle);
	$('#titlemodal').modal('toggle');
	event.preventDefault();
}
	
	

</script>

<script type="text/javascript">

$(document).ready(function(){
	  $("#myTable").DataTable({
	 "lengthMenu": [  5,10,25, 50, 75, 100 ],
	 "pagingType": "simple"
	
	});
	  
	  
});

function verify(){
	const ele = document.getElementById("pagination").value;
	if(ele<0)
	{
		return false;
	}
	return true;
}

//Define a common Summernote configuration
var summernoteConfig = {
    width: 900,
    toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['fontsize', 'fontname', 'color', 'superscript', 'subscript']],
        ['insert', ['picture', 'table']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']]
    ],
    fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '24', '36', '48', '64', '82', '150'],
    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica', 'Impact', 'Tahoma', 'Times New Roman', 'Verdana','Segoe UI','Segoe UI Emoji','Segoe UI Symbol'],
    buttons: {
        superscript: function() {
            return $.summernote.ui.button({
                contents: '<sup>S</sup>',
                tooltip: 'Superscript',
                click: function() {
                    document.execCommand('superscript');
                }
            }).render();
        },
        subscript: function() {
            return $.summernote.ui.button({
                contents: '<sub>S</sub>',
                tooltip: 'Subscript',
                click: function() {
                    document.execCommand('subscript');
                }
            }).render();
        }
    },
    height: 300
};

// This is for RSQR
/* CKEDITOR.replace('Editor', editor_config); */
$('#Editor').summernote(summernoteConfig);

$('#currentStatusModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var id = button.data('id');          // Extract info from data-* attributes
    var carsno = button.data('carsno');
    var status = $('#currentStatus'+id).val();
    status = (status=='null' || status == null)?'':status;

    // Update the modal's content
    var modal = $(this);
    modal.find('.modal-title #carsnoheader').text(carsno);
    modal.find('.modal-body #carsInitiationId').val(id); // Example of updating a modal element
    modal.find('.modal-body #currentStatus').html(status);
    
    //
    modal.find('.modal-body #Editor').summernote('code', status);
});

$('#myfrm').submit(function() {
	 var data = $('#Editor').summernote('code');
	 $('textarea[name=currentStatus]').val(data);
});
</script>
</body>
</html>