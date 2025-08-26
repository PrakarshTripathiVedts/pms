<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
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

.trup{
	padding:6px 10px 6px 10px ;			
	border-radius: 5px;
	font-size: 14px;
	font-weight: 600;
}
.trdown{
	padding:0px 10px 5px 10px ;			
	border-bottom-left-radius : 5px; 
	border-bottom-right-radius: 5px;
	font-size: 14px;
	font-weight: 600;
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
</style>

<style>
   .toggle-switch {
       position: relative;
       display: inline-block;
       width: 60px;
       height: 34px;
   }

   .toggle-switch input {
       display: none;
   }

   .slider {
       position: absolute;
       cursor: pointer;
       top: 0;
       left: 0;
       right: 0;
       bottom: 0;
       background-color: #ccc;
       transition: .4s;
       border-radius: 34px;
   }

   .slider:before {
       position: absolute;
       content: "";
       height: 26px;
       width: 26px;
       left: 4px;
       bottom: 4px;
       background-color: white;
       transition: .4s;
       border-radius: 50%;
   }

   input:checked + .slider {
       background-color: green;
   }

   input:checked + .slider:before {
       transform: translateX(26px);
   }

   .toggle-switch .label {
       margin-left: 10px;
       vertical-align: middle;
       font-weight: bold;
       font-size: 18px;
   }
</style>
</head>
<body>
<%
String projectType = (String)request.getAttribute("projectType");
String projectId =(String)request.getAttribute("projectId");
String initiationId =(String)request.getAttribute("initiationId");
String productTreeMainId =(String)request.getAttribute("productTreeMainId");
List<Object[]> ProjectList = (List<Object[]>) request.getAttribute("ProjectList");
List<Object[]> preProjectList = (List<Object[]>) request.getAttribute("preProjectList");
List<Object[]> productTreeList = (List<Object[]>) request.getAttribute("productTreeList");
List<Object[]> initiationReqList = (List<Object[]>) request.getAttribute("initiationReqList");
Object[] requirementApproval = (Object[]) request.getAttribute("requirementApprovalFlowData");

List<String> reqforwardstatus = Arrays.asList("RIN","RRR","RRA");

Object[] projectDetails = (Object[]) request.getAttribute("projectDetails");

FormatConverter fc = new FormatConverter();
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

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow-nohover" style="margin-top: -0.6pc">
					<div class="row card-header" style="background: #C4DDFF; box-shadow: 2px 2px 2px grey;">
						<div <%if(projectType.equalsIgnoreCase("M")){ %> class="col-md-4" <%} else{%> class="col-md-4" <%} %> id="projecthead" align="left">
							<h5 id="text" style="margin-left: 1%; font-weight: 600">Project Requirements List</h5>
						</div>
						<div class="col-md-2">
            				<label class="control-label ml-4" style="font-weight: bolder;font-size: 15px;float:right;color:#07689f;">Project Type</label>
        
    					</div>
					    <div class="col-md-2" style="margin-top:-4px;">
					    	<select class="form-control" id="projectType"  name="projectType" style=" margin-top:-6px">
					        	<option disabled="disabled" selected value="">Choose...</option>
					        	<option value="M" <%if(projectType.equalsIgnoreCase("M")){ %> selected="selected" <% }%>>Main Project</option>
					         	<option value="I" <%if(projectType.equalsIgnoreCase("I")){ %> selected="selected" <% }%>>Initiation Project</option>
					    	</select>
					    </div>
						<div class="col-md-2" >
							<form class="form-inline" method="POST" action="Requirements.htm">
								<div class="row W-100" style="width: 100%; margin-top: -3.5%;">
									<div class="col-md-4" id="div1">
										<label class="control-label mt-2" style="font-size: 15px; color: #07689f;"><b>Project:</b></label>
									</div>
									<div class="col-md-8" style="" id="projectname">
										<%if(projectType.equalsIgnoreCase("M")){ %>
										<select class="form-control selectdee" id="projectId" name="projectId" style="width: 200px;">
					
											<%
												if(ProjectList!=null && ProjectList.size()>0){
													for (Object[] obj : ProjectList) {
														String projectshortName1 = (obj[17] != null) ? " ( " + obj[17].toString() + " ) " : ""; %>
														<option value="<%=obj[0]%>"  <%if(obj[0].toString().equalsIgnoreCase(projectId)){ %> selected <%} %>>
															<%=obj[4]!=null?StringEscapeUtils.escapeHtml4(obj[4].toString()): " - "%> <%=projectshortName1!=null?StringEscapeUtils.escapeHtml4(projectshortName1): " - " %>
														</option>
											<%} }%>
										</select>
										<%} else{%>
										<select class="form-control selectdee" id="initiationId" name="initiationId" style="width: 200px;">
					
											<%
												if(preProjectList!=null && preProjectList.size()>0){
													for (Object[] obj : preProjectList) {
														%>
														<option value="<%=obj[0]%>"  <%if(obj[0].toString().equalsIgnoreCase(initiationId)){ %> selected <%} %>>
															<%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()): " - "%> <%="( "+(obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()): " - ")+" )" %>
														</option>
											<%} }%>
										</select>	
										<%} %>
									</div>
									<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> 
									<input id="submit" type="submit" name="submit" value="Submit" hidden="hidden">
									<input type="hidden" name="projectType" id="projectType3" value="<%=projectType %>">
								</div>
							</form>
						</div>
						
						<div class="col-md-2">
							<form class="form-inline" method="POST" action="Requirements.htm">
								<div class="row W-100" style="width: 100%; margin-top: -3.5%;">
									<div class="col-md-4" id="div1">
										<label class="control-label mt-2" style="font-size: 15px; color: #07689f;"><b>System:</b></label>
									</div>
									<div class="col-md-8">
										<select class="form-control selectdee" id="productTreeMainId" name="productTreeMainId" onchange="this.form.submit()" style="width: 200px;">
											<%if(projectDetails!=null) {%>
												<option value="0"><%=projectDetails[1]+"( "+projectDetails[2]+")" %> </option>
											<%} %>
											<%
												if(productTreeList!=null && productTreeList.size()>0){
													for (Object[] obj : productTreeList) {
														 %>
														<option value="<%=obj[0]%>" <%if(obj[0].toString().equalsIgnoreCase(productTreeMainId)){ %> selected <%} %>>
															<%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - "%> <%=" "+(obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()): " - ") %>
														</option>
											<%} }%>
										</select>
									</div>
									<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> 
									<input type="hidden" name="projectId" id="projectId2" value="<%=projectId %>">
									<input type="hidden" name="initiationId"  value="<%=initiationId %>">
									<input type="hidden" name="projectType"  value="<%=projectType %>"> 
									<!-- <input id="submit" type="submit" name="submit" value="Submit" hidden="hidden"> -->
								</div>
							</form>
						</div>
					
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped table-condensed "  id="myTable"> 
	                        	<thead style="text-align: center;">
	                            	<tr>
	                                	<th style="width: 5%;">SN</th>
	                                	<th style="width: 30%;">Initiated By</th>
	                                	<th style="width: 10%;">Initiated Date</th>
	                                	<th style="width: 10%;">Version</th>
	                               		<th style="width: 25%;">Status</th>
	                              		<th style="width: 20%;">Action</th>
	                                </tr>
	                         	</thead>
	                      		<tbody>
	                      			<%if(initiationReqList!=null && initiationReqList.size()>0) {
	                      				int slno=0;
	                      				for(Object[] obj:initiationReqList) {%>
	                      			<tr>
	                      				<td align="center" ><%=++slno %> </td>
	                      				<td><%=obj[6]!=null?StringEscapeUtils.escapeHtml4(obj[6].toString()): " - "%>, <%=obj[7]!=null?StringEscapeUtils.escapeHtml4(obj[7].toString()): " - " %></td>
	                      				<td align="center"><%if(obj[5]!=null) {%><%=fc.SqlToRegularDate(StringEscapeUtils.escapeHtml4(obj[5].toString())) %><%} else{%><%} %></td>
	                      				<td align="center" >v<%=obj[8]!=null?StringEscapeUtils.escapeHtml4(obj[8].toString()): " - "%></td>
	                      				<td align="center" >
	                      					<form action="#">
				                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				                            	<input type="hidden" name="reqInitiationId" value="<%=obj[0] %>">
				                            	<input type="hidden" name="docType" value="R">
				                            	<button type="submit" class="btn btn-sm btn-link w-70 btn-status" formaction="ProjectRequirementTransStatus.htm" data-toggle="tooltip" data-placement="top" title="Transaction History" style=" color: <%=obj[11] %>; font-weight: 600;" formtarget="_blank">
											    	<%=obj[10]!=null?StringEscapeUtils.escapeHtml4(obj[10].toString()): " - " %>&emsp;<i class="fa fa-telegram" aria-hidden="true" style="float: right;margin-top: 0.3rem;"></i>
												</button>
	                                        </form>
	                      				</td>
	                      				<td align="center" >
	                      					<form action="#" method="POST" name="myfrm" style="display: inline">
												
												<%if(obj[9]!=null && reqforwardstatus.contains(obj[9].toString()) ) {%>
													
													<button class="editable-clicko" formaction="ProjectRequirementDetails.htm" >
														<div class="cc-rockmenu">
															<div class="rolling">
																<figure class="rolling_icon">
																	<img src="view/images/preview3.png">
																</figure>
																<span>Preview</span>
															</div>
														</div>
													</button>
													
													<button type="submit" class="editable-clicko" formaction="ProjectRequirementApprovalSubmit.htm" data-toggle="tooltip" data-placement="top" title="Forward" onclick="return confirm('Are You Sure To Forward this Requirement?');">
														<div class="cc-rockmenu">
															<div class="rolling">
																<figure class="rolling_icon">
																	<img src="view/images/forward1.png">
																</figure>
																<span>Forward</span>
															</div>
														</div>
													</button>
													<input type="hidden" name="Action" value="A">
													
												<%} %>
												<%if(obj[9]!=null && "RFA".equalsIgnoreCase(obj[9].toString()) ) {%>
													<button type="button" class="editable-clicko" data-placement="top" title="Amend" data-toggle="modal" data-target="#myModal" onclick="setversiondata('<%=obj[8]%>','<%=obj[0]%>')">
														<div class="cc-rockmenu">
															<div class="rolling">
																<figure class="rolling_icon">
																	<img src="view/images/correction.png" style="width: 28px;">
																</figure>
																<span>Amend</span>
															</div>
														</div>
													</button>
												<%} %>
												<button class="editable-clicko" name="isPdf" value="N" <%if(obj[9]!=null && ("RFA".equalsIgnoreCase(obj[9].toString()) ||  "RAM".equalsIgnoreCase(obj[9].toString()))) {%>formaction="#"<%}else {%>formaction="RequirementDocumentDownlod.htm"<%} %> formtarget="blank" >
													<div class="cc-rockmenu">
														<div class="rolling">
															<figure class="rolling_icon">
																<img src="view/images/worddoc.png">
															</figure>
															<span>Document</span>
														</div>
													</div>
												</button>
												
												<button class="editable-clicko" name="isPdf" value="Y" formaction="RequirementDocumentDownlod.htm" <%-- <%if(obj[9]!=null && ("RFA".equalsIgnoreCase(obj[9].toString()) ||  "RAM".equalsIgnoreCase(obj[9].toString()))) {%>formaction="RequirementDocumentDownlodPdfFreeze.htm"<%}else {%>formaction="RequirementDocumentDownlodPdf.htm"<%} %> --%>  formtarget="blank" >
													<div class="cc-rockmenu">
														<div class="rolling">
															<figure class="rolling_icon">
																<img src="view/images/pdf.png" style="width: 25px;">
															</figure>
															<span>Document</span>
														</div>
													</div>
												</button>
													
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<input type="hidden" name="projectType" value="<%=projectType %>">
					                        	<input type="hidden" name="projectId" value="<%=obj[1] %>">
					                        	<input type="hidden" name="initiationId" value="<%=obj[2] %>">
					                        	<input type="hidden" name="productTreeMainId" value="<%=obj[3] %>">
					                        	<input type="hidden" name="reqInitiationId" value="<%=obj[0] %>">
											</form>
	                      				</td>
	                      			</tr>
	                      			<%} }%>
	                            </tbody>
	                       	</table>
	                    </div>
	                    <%if(initiationReqList!=null && initiationReqList.size()==0) {%>
	                    <div style="text-align: center;">
	                    	<form action="ProjectRequirementDetails.htm" id="myform" method="post">
	                    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        	<button class="btn btn-sm " type="submit" name="Action" id="addAction" value="Add" onclick="addRequirementCheck()" style="background-color: #428bca;border-color: #428bca;color: white;font-weight: bold;">Add Requirement v1</button>
	                        	<input type="hidden" name="projectType" id="projectType11" value="<%=projectType %>">
	                        	<input type="hidden" name="projectId" id="projectId11" value="<%=projectId %>">
	                        	<input type="hidden" name="initiationId" id="initiationId11" value="<%=initiationId %>">
	                        	<input type="hidden" name="productTreeMainId" id="productTreeMainId11" value="<%=productTreeMainId %>">
	                        	<input type="hidden" name="reqInitiationId" value="0">
	                 		</form>
	                    </div>
	                    <%}else{ %>
	                          <div style="text-align: center;">
	                   	<form action="TraceabilityMatrix.htm" id="myform21" method="post">
	                    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        	<button class="btn btn-sm btn-primary" type="submit" name="Action" id="addAction"  style="">See Traceabilities</button>
	                        	<input type="hidden" name="projectType" id="projectType11" value="<%=projectType %>">
	                        	<input type="hidden" name="projectId"  value="<%=projectId!=null?projectId:"0" %>">
	                        	<input type="hidden" name="initiationId"  value="<%=initiationId!=null?initiationId:"0" %>">
	                        	<input type="hidden" name="productTreeMainId"  value="<%=productTreeMainId!=null ?productTreeMainId:"0" %>">
	                        	<input type="hidden" name="reqInitiationId" value="<%=initiationReqList.get(0)[0].toString()%>">
	                 		</form>
	                 		      </div>
	                   <%} %> 
	                    <div class="row">
		 					<div class="col-md-12" style="text-align: center;"><b>Approval Flow For Requirement</b></div>
		 	    		</div>
		    			<div class="row"  style="text-align: center; padding-top: 10px; padding-bottom: 15px; " >
		           			<table align="center"  >
		        				<tr>
		        					<td class="trup" style="background: linear-gradient(to top, #3c96f7 10%, transparent 115%);">
		         						Prepared By - <%if(requirementApproval!=null) {%><%=StringEscapeUtils.escapeHtml4(requirementApproval[0].toString()) %> <%} else{%>Prepared By<%} %>
		         					</td>
		             		
		                    		<td rowspan="2">
		             					<i class="fa fa-long-arrow-right " aria-hidden="true" style="font-size: 20px;"></i>
		             				</td>
		             						
		        					<td class="trup" style="background: linear-gradient(to top, #eb76c3 10%, transparent 115%);">
		        						Reviewer - <%if(requirementApproval!=null) {%><%=StringEscapeUtils.escapeHtml4(requirementApproval[1].toString()) %> <%} else{%>Reviewer<%} %>
		        	    			</td>
		             	    				
		                    		<td rowspan="2">
		             					<i class="fa fa-long-arrow-right " aria-hidden="true" style="font-size: 20px;"></i>
		             				</td>
		             						
		             				<td class="trup" style="background: linear-gradient(to top, #9b999a 10%, transparent 115%);">
		             					Approver - <%if(requirementApproval!=null) {%><%=StringEscapeUtils.escapeHtml4(requirementApproval[2].toString()) %> <%} else{%>Approver<%} %>
		             	    		</td>
		            			</tr> 	
		            	    </table>			             
						</div>
						
						<form action="ProjectRequirementAmendSubmit.htm" method="post">
					        <div class="container">
					            <!-- The Modal -->
					            <div class="modal" id="myModal" style="margin-top: 10%;">
					                <div class="modal-dialog">
					                    <div class="modal-dialog modal-dialog-jump modal-lg modal-dialog-centered" style="width: 114%;">
					                        <div class="modal-content">
					                            <!-- Modal Header -->
					                            <div class="modal-header">
					                                <h4 class="modal-title" style="color: #0587f9">Amend Document</h4>
					                                <button type="button" class="close" data-dismiss="modal">&times;</button>
					                            </div>
					                            <!-- Modal body -->
					                            <div class="modal-body">
					                                <div class="form-inline">
					                                    <div class="form-group w-30">
					                                        <label class="form-label" style="font-size: 14px;">
					                                            Current Version : &nbsp;<span id="currentversion" style="color: green;"></span>
					                                        </label>
					                                    </div>
					                                    &emsp;
					                                    
					                                    <div class="form-group w-35">
					                                        <label class="form-label" style="font-size: 14px;">Is New Release?</label>
					                                        &nbsp;
					                                        <label class="toggle-switch">
					                                            <input type="checkbox" id="releaseToggleSwitch" name="isNewRelease" checked>
					                                            <span class="slider"></span>
					                                            <span class="label" id="releaseToggleLabel">ON</span>
					                                        </label>
					                                    </div>
					                                    &emsp;
					                                    <div class="form-group w-35">
					                                        <label class="form-label" style="font-size: 14px;">Is New Version?</label>
					                                        &nbsp;
					                                        <label class="toggle-switch">
					                                            <input type="checkbox" id="versionToggleSwitch" name="isNewVersion">
					                                            <span class="slider"></span>
					                                            <span class="label" id="versionToggleLabel">OFF</span>
					                                        </label>
					                                    </div>
					                                    
					                                </div>
					
					                                <div class="form-inline mt-2">
					                                    <div class="form-group w-100">
					                                        <label class="form-label" style="font-size: 14px;">
					                                            Remarks&nbsp;<span class="text-danger">*</span>&nbsp;: 
					                                        </label>
					                                    </div>
					                                </div>
					                                <div class="form-inline">
					                                    <div class="form-group w-100">
					                                        <input type="text" class="w-100" name="remarks" maxlength="255" style="border-left: 0; border-top: 0; border-right: 0;" required>
					                                    </div>
					                                </div>
					                            </div>
					
					                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					                            <input type="hidden" name="reqInitiationId" id="reqInitiationIdAmend">
					                            <input type="hidden" name="amendversion" id="amendversion">
					                            <!-- Modal footer -->
					                            <div class="modal-footer" style="justify-content: center;">
					                                <button class="btn btn-sm " type="submit" name="Action" id="addAction" value="Add" onclick="return confirm('Are You Sure to Amend?')" style="background-color: #428bca;border-color: #428bca;color: white;font-weight: bold;">
					                                    Add Requirement <span id="amendversiondisplay"></span>
					                                </button>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
    					</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<form action="ProjectOverAllRequirement.htm" id="form1">
		<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> 
	</form>
	
	<form action="Requirements.htm" id="form2">
		<input type="hidden" name="projectType" id="projectType2" value="<%=projectType %>">
		<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> 
	</form>
		
		
<script type="text/javascript">
$(document).ready(function() {
	$('#projectId').on('change', function() {
		var temp = $(this).children("option:selected").val();
		var projectId = $('#projectId').val();
		$('#projectId2').val(projectId);
		$('#submit').click();
	});
	$('#initiationId').on('change', function() {
		var temp = $(this).children("option:selected").val();
		$('#submit').click();
	});
	
	 $("#myTable").DataTable({
		 "lengthMenu": [  5,10,25, 50, 75, 100 ],
		 "pagingType": "simple"
		
	});
});


$("#projectType").on('change', function() {
    var projectType = $("#projectType").val();
    $("#projectType2,#projectType3").val(projectType);

    $("#form2").submit(); 
  /*  if(value==="M"){
	var form= $("#form2");
	form.submit();
	console.log(form);
   }else{
	   var form= $("#form1"); 
	   form.submit();
   } */
});

function addRequirementCheck(){
	var projectType = $('#projectType').val();
	var projectId = $('#projectId').val();
	var initiationId = $('#initiationId').val();
	var productTreeMainId = $('#productTreeMainId').val();
	
	$('#projectType11').val(projectType);
	$('#projectId11').val(projectId);
	$('#initiationId11').val(initiationId);
	$('#productTreeMainId11').val(productTreeMainId);
	
	if(projectType==="M"){
		if(productTreeMainId==null || productTreeMainId=="" || productTreeMainId =="null") {
			alert('Please Select a System..!');
			event.preventDefault();
			return false;
		}
	}else{
		return true;
	}
}
</script>	

<script>
	function updateVersion() {
        var version = parseFloat($('#currentversion').text());
        if ($('#versionToggleSwitch').is(':checked')) {
            $('#versionToggleLabel').text('ON');
            $('#releaseToggleLabel').text('OFF');
            $('#releaseToggleSwitch').prop('checked', false);
            $('#amendversiondisplay').text('v' + (version + 1).toFixed(1)); // Increment by 1
            $('#amendversion').val((version + 1).toFixed(1)); // Increment by 1
        } else if ($('#releaseToggleSwitch').is(':checked')) {
            $('#releaseToggleLabel').text('ON');
            $('#versionToggleLabel').text('OFF');
            $('#versionToggleSwitch').prop('checked', false);
            $('#amendversiondisplay').text('v' + (version + 0.1).toFixed(1)); // Increment by 0.1
            $('#amendversion').val((version + 0.1).toFixed(1)); // Increment by 0.1
        }
    }

    $('#versionToggleSwitch').change(function() {
        if ($(this).is(':checked')) {
            $('#releaseToggleSwitch').prop('checked', false);
        } else if (!$('#releaseToggleSwitch').is(':checked')) {
            $('#releaseToggleSwitch').prop('checked', true);
        }
        updateVersion();
    });

    $('#releaseToggleSwitch').change(function() {
        if ($(this).is(':checked')) {
            $('#versionToggleSwitch').prop('checked', false);
        } else if (!$('#versionToggleSwitch').is(':checked')) {
            $('#versionToggleSwitch').prop('checked', true);
        }
        updateVersion();
    });

    function setversiondata(version, reqInitiationId) {
        console.log(version);
        document.getElementById('currentversion').textContent = version;
        $('#reqInitiationIdAmend').val(reqInitiationId);
        updateVersion(); // Set initial value of amendversiondisplay based on the toggle state
    }
</script>
</body>
</html>