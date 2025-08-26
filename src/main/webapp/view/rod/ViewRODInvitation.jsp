<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.vts.pfms.master.model.IndustryPartner"%>
<%@page import="java.awt.Container"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,com.vts.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>

<style type="text/css">
.input-group-text {
	font-weight: bold;
}

label {
	font-weight: 800;
	font-size: 16px;
	color: #07689f;
}

hr {
	margin-top: -2px;
	margin-bottom: 12px;
}

b {
	font-family: 'Lato', sans-serif;
}

h5,h6{
	color:#145374;
}
.tdclass {
	padding-top:5px;
	padding-bottom: 5px;
}

.card-header{
	background-color: #07689f;
	color:white;
}

.card{
	border-color: #07689f;
}

/* .external .select2{
	width:500px !important;
} */

.externalwithin .select2{
	width:300px !important;
}



</style>
</head>
<body>

		
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");

	String labcode=(String)session.getAttribute("labcode");
	List<Object[]> ExpertList=(List<Object[]>) request.getAttribute("ExpertList");
	List<Object[]> EmployeeList=(List<Object[]>) request.getAttribute("EmployeeList");
	List<Object[]> rodinvitedlist=(List<Object[]>)request.getAttribute("rodinvitedlist");
	String committeescheduleid=(String)request.getAttribute("committeescheduleid");
	Object[] rodscheduledata=(Object[])request.getAttribute("rodscheduledata");
	List<Object[]> agendalist=(List<Object[]>) request.getAttribute("agendalist");
	List<Object[]> clusterlablist=(List<Object[]>) request.getAttribute("clusterlablist");
	//List<Object[]> committeereplist=(List<Object[]>) request.getAttribute("committeereplist");
	int pscount=0;
	int CoChair=0;
	String labid=(String)request.getAttribute("labid");
	LocalDate scheduledate=LocalDate.parse(rodscheduledata[2].toString());
	LocalDate todaydate=LocalDate.now();	
	
	//List<String> InvitedList = new ArrayList<String>();
	//rodinvitedlist.stream().map(obj -> InvitedList.add(obj[0].toString()+"_"+obj[11].toString())).collect(Collectors.toList());;
	
	List<IndustryPartner> industryPartnerList = (List<IndustryPartner>)request.getAttribute("industryPartnerList");
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

				<div class="card shadow-nohover">
				
					<div class="card-header">
						<div class="row">
							<div class="col-md-3" >
					  			<h4><%=rodscheduledata[8]!=null?StringEscapeUtils.escapeHtml4(rodscheduledata[8].toString()): " - " %> Invitations</h4>
							 </div>
							 <div class="col-md-9" align="right" style="margin-top: 3px;" >
					 			<h5 style="color: white"  >(Meeting Id : <%=rodscheduledata[12]!=null?StringEscapeUtils.escapeHtml4(rodscheduledata[12].toString()): " - " %>) &nbsp;&nbsp; - &nbsp;&nbsp; (Meeting Date & Time : <%= sdf.format(sdf1.parse( rodscheduledata[2].toString()))%>  &  <%=rodscheduledata[3]!=null?StringEscapeUtils.escapeHtml4(rodscheduledata[3].toString()): " - " %>)</h5>
							 </div>
					 	</div>
					</div>
				
					<div class="card-body">
					


<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
					
			
		
					
					
					<div  class="row">
								
						<br>
		
						<!-- -----------------------Internal start------------------------------- -->
						
						<div class="col-md-4">
							
							<%
							if(rodinvitedlist!=null && rodinvitedlist.size()>0){
							for(int i=0;i<rodinvitedlist.size();i++)
									{
										if(rodinvitedlist.get(i)[3].toString().equals("I"))
										{%>	
						
							<br>
								<label class="control-label">Internal</label>
								
							<%break;}} }%>	
								
							<table border="0" >
								
								<%
								if(rodinvitedlist!=null && rodinvitedlist.size()>0){
									int intcount=1; 
									for(int i=0;i<rodinvitedlist.size();i++)
									{
									
										if(rodinvitedlist.get(i)[3].toString().equals("I"))
										{%>								
											<tr>

												<td>
													<%=intcount%> . <%=rodinvitedlist.get(i)[6]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[6].toString()): " - "%> (<%=rodinvitedlist.get(i)[7]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[7].toString()): " - "%>)
												</td>
												<%if( rodinvitedlist.get(i)[9].toString().equalsIgnoreCase("Y")){ %>
													<td style="padding-left: 10px">
												 		<i class="fa fa-check" aria-hidden="true" style="color: green" ></i> 
													</td>
												<%} %>
												<td style="padding-left: 30px">
												
													<%if(Long.parseLong(rodscheduledata[10].toString())<11 ){%>
														<form action="CommitteeInvitationDelete.htm" method="post">
															<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
															<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
															<input type="hidden" name="committeeinvitationid" value="<%=rodinvitedlist.get(i)[1]%>">
															<input type="hidden" name="redirpageflag" value="ROD">
															<button type="submit" class="btn" onclick="return confirm('Are you sure To Remove this Member?')" > <i class="fa fa-trash" aria-hidden="true" ></i> </button>
														</form>
													<%} %>
													
												</td>  
											
											</tr>	
														
										<% intcount++;
										}
									}}%>						
							</table>
						
						</div>	
						
				<!-- -----------------------Internal end------------------------------- -->
				

				<!-- ----------------------External Within start------------------------------ -->
						
						<div class="col-md-4">
						
						<% 
						if(rodinvitedlist!=null && rodinvitedlist.size()>0){
							for(int i=0;i<rodinvitedlist.size();i++)
							{
								if(rodinvitedlist.get(i)[3].toString().equals("W"))
								{%>		
						
						<br>
						<label class="control-label">External (Within DRDO) </label>
						
						<%break;} } } %>
						
						<table border="0">
						
						<% 
						if(rodinvitedlist!=null && rodinvitedlist.size()>0){
						int extcountwithin=1; 
							for(int i=0;i<rodinvitedlist.size();i++)
							{
								
								if(rodinvitedlist.get(i)[3].toString().equals("W"))
								{%>		
										
										<tr>
										<td><%=extcountwithin%> . <%=rodinvitedlist.get(i)[6]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[6].toString()): " - "%> (<%=rodinvitedlist.get(i)[7]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[7].toString()): " - "%>) (<%=rodinvitedlist.get(i)[11]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[11].toString()): " - "%>)</td> 
										<td style="padding-left: 30px">
										
										<%if(Long.parseLong(rodscheduledata[10].toString())<11 ){ %>
											<form action="CommitteeInvitationDelete.htm" method="Post">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="committeeinvitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="redirpageflag" value="ROD">
												<button type="submit" class="btn" onclick="return confirm('Are you sure To Remove this Member?')" > <i class="fa fa-trash" aria-hidden="true" ></i> </button>
											</form>		
										<%} %>										
										<td>										
											<form action="MeetingInvitationLetter.htm" method="Post" target="_blank">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="memberid" value="<%=rodinvitedlist.get(i)[0]%>">
												<input type="hidden" name="invitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="membertype" value="<%=rodinvitedlist.get(i)[3]%>">
												<input type="hidden" name="rodflag" value="Y">
												<button type="submit" class="btn"  > <i class="fa fa-eye" aria-hidden="true" ></i>  </button>
											</form>
										</td>
										<td>
											<form action="MeetingInvitationLetterDownload.htm" method="Post" target="_blank">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="invitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="memberid" value="<%=rodinvitedlist.get(i)[0]%>">
												<input type="hidden" name="membertype" value="<%=rodinvitedlist.get(i)[3]%>">
												<input type="hidden" name="rodflag" value="Y">
												<button type="submit" class="btn"  > <i class="fa fa-download" aria-hidden="true" ></i>  </button>
											</form>
										</td>
										</tr>				  
								<% extcountwithin++;}
							}}%>
					
						</table>
						
						</div>
					
				<!-- ----------------------External within end------------------------------ -->	
						
				
				<!-- ----------------------External start------------------------------ -->
						
						<div class="col-md-4">
						
						<%
						if(rodinvitedlist!=null && rodinvitedlist.size()>0){
						for(int i=0;i<rodinvitedlist.size();i++)
							{
								if(rodinvitedlist.get(i)[3].toString().equals("E"))
								{%>		
						<br>
						<label class="control-label">External (Outside DRDO) </label>
							
							<%break;} }%>
							
						<%} %>
						
						<table border="0">
	
						<% 
						if(rodinvitedlist!=null && rodinvitedlist.size()>0){
						int extcount=1; 
							for(int i=0;i<rodinvitedlist.size();i++)
							{								
								if(rodinvitedlist.get(i)[3].toString().equals("E"))
								{%>		
										
										<tr>
										<td><%=extcount%> . <%=rodinvitedlist.get(i)[6]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[6].toString()): " - "%> (<%=rodinvitedlist.get(i)[7]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[7].toString()): " - "%>)(<%=rodinvitedlist.get(i)[11]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[11].toString()): " - "%>)</td> 
										<td style="padding-left: 30px">
										
										<%if(Long.parseLong(rodscheduledata[10].toString())<11 ){ %>
											<form action="CommitteeInvitationDelete.htm" method="Post">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="committeeinvitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="redirpageflag" value="ROD">
												<button type="submit" class="btn" onclick="return confirm('Are you sure To Remove this Member?')" > <i class="fa fa-trash" aria-hidden="true" ></i> </button>
											</form>
										<%} %>
											
											
											
										<td>
										
											<form action="MeetingInvitationLetter.htm" method="Post" target="_blank">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="invitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="memberid" value="<%=rodinvitedlist.get(i)[0]%>">
												<input type="hidden" name="membertype" value="<%=rodinvitedlist.get(i)[3]%>">
												<input type="hidden" name="rodflag" value="Y">
												<button type="submit" class="btn"  > <i class="fa fa-eye" aria-hidden="true" ></i>  </button>
											</form>
										</td>
										<td>
											<form action="MeetingInvitationLetterDownload.htm" method="Post" target="_blank">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="invitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="memberid" value="<%=rodinvitedlist.get(i)[0]%>">
												<input type="hidden" name="membertype" value="<%=rodinvitedlist.get(i)[3]%>">
												<input type="hidden" name="rodflag" value="Y">
												<button type="submit" class="btn"  > <i class="fa fa-download" aria-hidden="true" ></i>  </button>
											</form>
										</td>
										</tr>				  
								<% extcount++;}
							} }%>
					
						</table>
						</div>
				<!-- ----------------------External end------------------------------ -->
				
				<!-- ---------------------- Industry Partner start------------------------------ -->
						
						<div class="col-md-4">
						
						<% 
						if(rodinvitedlist!=null && rodinvitedlist.size()>0){
							for(int i=0;i<rodinvitedlist.size();i++)
							{
								if(rodinvitedlist.get(i)[3].toString().equals("IP"))
								{%>		
						
						<br>
						<label class="control-label">Industry Partner </label>
						
						<%break;} } } %>
						
						<table border="0">
						
						<% 
						if(rodinvitedlist!=null && rodinvitedlist.size()>0){
						int extcountwithin=1; 
							for(int i=0;i<rodinvitedlist.size();i++)
							{
								
								if(rodinvitedlist.get(i)[3].toString().equals("IP"))
								{%>		
										
										<tr>
										<td><%=extcountwithin%> . <%=rodinvitedlist.get(i)[6]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[6].toString()): " - "%> (<%=rodinvitedlist.get(i)[7]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[7].toString()): " - "%>) (<%=rodinvitedlist.get(i)[11]!=null?StringEscapeUtils.escapeHtml4(rodinvitedlist.get(i)[11].toString()): " - "%>)</td> 
										<td style="padding-left: 30px">
										
										<%if(Long.parseLong(rodscheduledata[10].toString())<11 ){ %>
											<form action="CommitteeInvitationDelete.htm" method="Post">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="committeeinvitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="redirpageflag" value="ROD">
												<button type="submit" class="btn" onclick="return confirm('Are you sure To Remove this Member?')" > <i class="fa fa-trash" aria-hidden="true" ></i> </button>
											</form>		
										<%} %>										
										<td>										
											<form action="MeetingInvitationLetter.htm" method="Post" target="_blank">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="memberid" value="<%=rodinvitedlist.get(i)[0]%>">
												<input type="hidden" name="invitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="membertype" value="<%=rodinvitedlist.get(i)[3]%>">
												<input type="hidden" name="rodflag" value="Y">
												<button type="submit" class="btn"  > <i class="fa fa-eye" aria-hidden="true" ></i>  </button>
											</form>
										</td>
										<td>
											<form action="MeetingInvitationLetterDownload.htm" method="Post" target="_blank">
												<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
												<input type="hidden" name="invitationid" value="<%=rodinvitedlist.get(i)[1]%>">
												<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid%>">
												<input type="hidden" name="memberid" value="<%=rodinvitedlist.get(i)[0]%>">
												<input type="hidden" name="membertype" value="<%=rodinvitedlist.get(i)[3]%>">
												<input type="hidden" name="rodflag" value="Y">
												<button type="submit" class="btn"  > <i class="fa fa-download" aria-hidden="true" ></i>  </button>
											</form>
										</td>
										</tr>				  
								<% extcountwithin++;}
							}}%>
					
						</table>
						
						</div>
					
				<!-- ---------------------- Industry Partner end------------------------------ -->
						
					</div>		
					
	          				
				<div class=row>
		       		<div class="col-md-12" id="addmemtitleid" style="display: none;">
		       			<h5 style="color:#145374">Add Additional Members</h5>
		       			<hr> 
		          	</div>
		          	<div class="col-md-12" id="reptitleid" style="display: none;">
		       			<h5 style="color:#145374">Add Representative Members</h5>
		       			<hr> 
		          	</div>
		          	
		     	</div>			
		
	<!-- --------------------------------internal add ----------------------------------------------- -->				
			<div  id="additionalmemadd"  > 
				<%-- <div class="row" id="repselect"  >						
					<div class="col-md-6">	 
						
						<table  style="margin-top: 10px;width:100%">
							<tr >			
									
								<td style="width: 100%;">	
									<label>Representative Type</label>										
									<select class="form-control selectdee " name="reptype" id="reptype"  data-live-search="true" onchange="setreptype();" >
										<option selected value="0"  > Choose... </option>
										<%if(committeereplist.size()==0){ %> <option disabled> No results found </option> <%} %>
										<% for (Object[] obj : committeereplist) {%>					
											<option value="<%=obj[2]%>"> <%=obj[3]%> </option>
										<%} %>
									</select>
								</td>
							</tr>
						</table>	
					</div>		
				</div> --%>
	
					<form  action="CommitteeInvitationCreate.htm" method="POST" name="myfrm1" id="myfrm1">					
					<div class="row">	
								
						<div class="col-md-6">
							<table class="table  table-bordered table-hover table-striped table-condensed  info shadow-nohover" id="" style="margin-top: 10px;width:100%">
								<thead>  
									<tr id="" >
										<th> Internal Members</th>
									</tr>
								</thead>				
								<tr class="tr_clone">
									<td >								
										 <div class="input select external">
											 <select class="form-control selectdee" name="internalmember" id="internalmember"  data-live-search="true"   data-placeholder="Select Members" multiple required>
								               
								                 <% for (Object[] obj : EmployeeList) {%>
										       			<option value="<%=obj[0]%>,I,<%=obj[3]%>"><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - "%> ( <%=obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()): " - " %> ) </option>
										    	<%} %>
											</select>
											<input type="hidden" name="internallabcode" value="<%=labcode %>" />
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
	 									<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid %>">
	 									<input type="hidden" name="rep" id="rep1" value="0" />
										<input type="hidden" name="redirpageflag" value="ROD">
									</td>
								</tr>
							</table>
						</div>
						
						<div class="col-md-6 align-self-center">
						
							<button class="btn btn-primary btn-sm add" name="submit" value="submit" type="submit"  onclick="return confirm('Are you Sure to Add these Members ?');">SUBMIT</button>
								
						</div>
					
				</div>
				</form>
	<!-- --------------------------------internal add ----------------------------------------------- -->
	
	<!-- --------------------------------External Members (Within DRDO)----------------------------------------------- -->
					<form  action="CommitteeInvitationCreate.htm" method="POST" name="myfrm1" id="myfrm1">
					<div class="row">	
						
						<div class="col-md-6">
							
							<table class="table  table-bordered table-hover table-striped table-condensed  info shadow-nohover" id="table1" style="margin-top: 10px;">
								<thead>  
									<tr id="">
										<th colspan="2"> External Members (Within DRDO)</th>
									</tr>
								</thead>
								<tr class="tr_clone1">
									<td style="width:30%">							
										<div class="input select">
											<select class="form-control selectdee" name="externallabid" tabindex="-1"  style="" id="LabCode" onchange="employeename()" required>
												<option disabled="true"  selected value="">Lab Name</option>
													<% for (Object[] obj : clusterlablist) {
													if(!labcode.equals(obj[3].toString())){%>
														<option value="<%=obj[3]%>"><%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()): " - "%></option>
													<%} 
													}%>
											</select>
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
		 								<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid %>">
		 								<input type="hidden" name="rep" id="rep2" value="0" />
										<input type="hidden" name="redirpageflag" value="ROD">
									</td>
									<td style="width:70%">
										<div class="input select ">
											<select class="form-control selectdee" name="externalmember" id="ExternalMemberLab" data-live-search="true"   data-placeholder="Select Members" multiple>
											</select>
										</div>
									</td>						
								</tr>
							</table>				
						</div>
						
						<div class="col-md-6 align-self-center">
							
								<button class="btn btn-primary btn-sm add" name="submit" value="submit" type="submit"  onclick="return confirm('Are you Sure to Add these Members ?');">SUBMIT</button>
									
						</div>
						
					</div>
					</form>
	<!-- --------------------------------External Members (Within DRDO)----------------------------------------------- -->
	<!-- --------------------------------External Members (Outside DRDO)----------------------------------------------- -->

					
					<form  action="CommitteeInvitationCreate.htm" method="POST" name="myfrm1" id="myfrm1">
					<div class="row">					
						
						<div class="col-md-6">
							
								<table class="table  table-bordered table-hover table-striped table-condensed  info shadow-nohover" id="" style="margin-top: 10px;width:100%">
								<thead>  
									<tr id="">
										<th> External Members (Outside DRDO)</th>
									</tr>
								</thead>
								<tr class="tr_clone2">
									<td >
										<div class="input select external">
											<select  class= "form-control selectdee" name="expertmember" id=""   data-live-search="true"   data-placeholder="Select Members" multiple required>
												<% for (Object[] obj : ExpertList) {%>
											       	<option value="<%=obj[0]%>,E,<%=obj[3]%>"><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - "%> ( <%=obj[2]!=null?StringEscapeUtils.escapeHtml4(obj[2].toString()): " - " %> ) </option>
											    <%} %>
											</select>
											<input type="hidden" name="expertlabid" value="@EXP" />
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
			 							<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid %>">
			 							<input type="hidden" name="rep" id="rep3" value="0" />		
			 							<input type="hidden" name="redirpageflag" value="ROD">		
			 						</td>
								</tr>
							</table>
							
						</div>
						
						<div class="col-md-6 align-self-center">
								
							<button class="btn btn-primary btn-sm add" name="submit" value="submit" type="submit"  onclick="return confirm('Are you Sure to Add these Members ?');">SUBMIT</button>
										
						</div>
						
					</div>	
					</form>
	<!-- --------------------------------External Members (Outside DRDO)----------------------------------------------- -->
	
	<!-- --------------------------------Industry Partner----------------------------------------------- -->
					<form  action="CommitteeInvitationCreate.htm" method="POST" name="myfrm1" id="myfrm1">
					<div class="row">	
						
						<div class="col-md-6">
							
							<table class="table  table-bordered table-hover table-striped table-condensed  info shadow-nohover" id="table1" style="margin-top: 10px;">
								<thead>  
									<tr id="">
										<th colspan="2"> Industry Partner</th>
									</tr>
								</thead>
								<tr class="tr_clone1">
									<td style="width:30%">							
										<div class="input select">
											<select class="form-control selectdee" name="industryPartnerId" tabindex="-1"  style="" id="industryPartnerId" onchange="industrypartnerrepname()" required>
												<option disabled="true"  selected value="">Industry Partner</option>
													<% for (IndustryPartner partner : industryPartnerList) {
													%>
														<option value="<%=partner.getIndustryPartnerId()%>"
														data-subtext="(<%=partner.getIndustryCity()+" - "+partner.getIndustryPinCode() %>)"
														><%=partner.getIndustryName()!=null?StringEscapeUtils.escapeHtml4(partner.getIndustryName()): " - "%> (<%=partner.getIndustryCity()!=null?StringEscapeUtils.escapeHtml4(partner.getIndustryCity()): " - "%>-<%=partner.getIndustryPinCode()!=null?StringEscapeUtils.escapeHtml4(partner.getIndustryPinCode()): " - " %>)</option>
														
													<%}%>
											</select>
											<input type="hidden" name="industrypartnerlabid" value="@IP" />
										</div>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
		 								<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid %>">
		 								<input type="hidden" name="rep" id="rep4" value="0" />
										<input type="hidden" name="redirpageflag" value="ROD">
									</td>
									<td style="width:70%">
										<div class="input select ">
											<select class="form-control selectdee" name="industryPartnerRep" id="industryPartnerRep" data-live-search="true"   data-placeholder="Select Members" multiple>
											</select>
										</div>
									</td>						
								</tr>
							</table>				
						</div>
						
						<div class="col-md-6 align-self-center">
							
								<button class="btn btn-primary btn-sm add" name="submit" value="submit" type="submit"  onclick="return confirm('Are you Sure to Add these Members ?');">SUBMIT</button>
									
						</div>
						
					</div>
					</form>
	<!-- --------------------------------Industry Partner----------------------------------------------- -->
	
				</div>	
				
				<br>	
					<div  align="center">
	          			<table>
	          				<tr>
	          					<td>
						 		</td>
						 		<td>
					            	<form method="post" action="RODScheduleView.htm" id="backform111">
											<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
											<input type="hidden" name="scheduleid" value="<%=committeescheduleid %>">
											<button class="btn btn-info btn-sm  shadow-nohover back" onclick='$("#backform111").submit()'>Back</button>
									</form>
						 		</td>
						 		<td>			 		
						 		
								 	<%if( Integer.parseInt(rodscheduledata[10].toString())<7)
									{ %> 					 	
						            	<form method="post" action="SendInvitationLetter.htm" id="inviteform">
											<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
											<input type="hidden" name="committeescheduleid" value="<%=committeescheduleid %>">
											<input type="hidden" name="rodflag" value="Y">
               								<button type="submit" onclick="inviteform()" class=" btn btn-sm btn-warning prints" form="inviteform"  ><i class="fa fa-paper-plane-o" aria-hidden="true"></i> SEND INVITATION</button>
										</form>
									<%} %>	  
											
							 		</td>
							 		<!-- <td>
								 		<button type="button" class="btn btn-sm add" id="addrep" onclick="showaddladd();">Add Additional Members</button>
										<button type="button" class="btn btn-sm add" id="addrep" onclick="showrepadd();">Add Representative</button>
							 		
							 		</td> -->
							 	</tr>
		            	</table>
	          		</div>
	          		
			</div>		
					
				

				</div><!-- card-body end -->
	
			</div>
		
		</div>	
	</div>

	
<script type="text/javascript">

	function FormNameEdit(id){
	
   		 $.ajax({

				type : "GET",
				url : "AttendanceToggle.htm",
				data : {
							invitationid : id
					   },
				datatype : 'json',
				success : function(result) {

				var result = JSON.parse(result);
		
				var values = Object.keys(result).map(function(e) {
			 				 return result[e]
			  
								});
					}
					   
				});

}
 
</script>


<script>

function submitforms(){
	
	var ret=onclick="return confirm('Are You Sure To Invite These Members ?');"
	if(ret){
		$("#myfrm1").submit();
		$("#myfrm2").submit();
	}else{
		event.preventDefault();
	}
	
}

function employeename(){

	$('#ExternalMemberLab').val("");
	
		var $LabCode = $('#LabCode').val();
	
		
				if($LabCode!=""){
		
							$
								.ajax({

								type : "GET",
								url : "ExternalEmployeeListInvitations.htm",
								data : {
											LabCode : $LabCode,
											scheduleid : '<%=committeescheduleid %>' 	
									   },
								datatype : 'json',
								success : function(result) {

								var result = JSON.parse(result);
						
								var values = Object.keys(result).map(function(e) {
							 				 return result[e]
							  
												});
						
						var s = '';
						s += '<option value="">'
							+"--Select--"+ '</option>';
						 for (i = 0; i < values.length; i++) {
							
							s += '<option value="'+values[i][0]+",W,"+values[i][4]+'">'
									+values[i][1] + " (" +values[i][3]+")" 
									+ '</option>';
						} 
						 
						$('#ExternalMemberLab').html(s);
						
				
						
					}
				});

}
	}



 
</script>
 <script type="text/javascript">
 
 		$(document).ready(function(){
 		
 			$('#additionalmemadd').hide();
 			showaddladd();
 		})
 		
 
 
 
					function showrepadd()
					{
						document.getElementById('addmemtitleid').style.display = 'none';
						document.getElementById('reptitleid').style.display = 'block';	
						
						/* $('#internalmember').val('').trigger("change");
						$('#ExternalMemberLab').val('').trigger("change");
						$('#expertmember').val('').trigger("change");
						$('#LabCode').val('').trigger("change");  */
						
						//document.getElementById('additionalmemadd').style.visibility = 'visible';
						//document.getElementById('repselect').style.visibility = 'visible';

						$('#repselect').show();
						$('#additionalmemadd').show();
						
						$('html, body').animate({
					        scrollTop: $("#additionalmemadd").offset().top
					    }, 100);
					}
					
					function showaddladd()
					{
						document.getElementById('reptitleid').style.display = 'none';
						document.getElementById('addmemtitleid').style.display = 'block';
						
					 	/* $('#internalmember').val('').trigger("change");
						$('#ExternalMemberLab').val('').trigger("change");
						$('#expertmember').val('').trigger("change");
						$('#LabCode').val('').trigger("change");  */
						
						//document.getElementById('additionalmemadd').style.visibility = 'visible';

						$('#repselect').hide();
						$('#additionalmemadd').show();
						
						$("#reptype").val("0").change();
						
						/* if($('#repselect').css('visibility')==='visible')
						{
							document.getElementById('repselect').style.visibility = 'collapse';
						}  */
						
						$('html, body').animate({
					        scrollTop: $("#additionalmemadd").offset().top
					    }, 100);
						 
					}
					
		function setreptype()
		{
			reptype=$('#reptype').val();
			$('#rep1').val(reptype);
			$('#rep2').val(reptype);
			$('#rep3').val(reptype);
		}
			
		$(function () {
			  $('[data-toggle="tooltip"]').tooltip()
			})
</script>

<script type="text/javascript">
function industrypartnerrepname(){

	$('#industryPartnerRep').val("");
	
		var $industryPartnerId = $('#industryPartnerId').val();
	
		
				if($industryPartnerId!=""){
		
							$
								.ajax({

								type : "GET",
								url : "IndustryPartnerRepListInvitations.htm",
								data : {
									industryPartnerId : $industryPartnerId,
											scheduleid : '<%=committeescheduleid %>' 	
									   },
								datatype : 'json',
								success : function(result) {

								var result = JSON.parse(result);
						
								var values = Object.keys(result).map(function(e) {
							 				 return result[e]
							  
												});
						
						var s = '';
						s += '<option value="">'
							+"--Select--"+ '</option>';
						 for (i = 0; i < values.length; i++) {
							
							s += '<option value="'+values[i][0]+",IP,"+values[i][4]+'">'
									+values[i][1] + " (" +values[i][3]+")" 
									+ '</option>';
						} 
						 
						$('#industryPartnerRep').html(s);
						
				
						
					}
				});

}
	}
</script>
</body>
</html>