<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.vts.pfms.committee.model.CommitteeSchedule"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@page import="com.vts.pfms.NFormatConvertion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
<spring:url value="/resources/ckeditor/ckeditor.js" var="ckeditor" />
<spring:url value="/resources/ckeditor/contents.css" var="contentCss" />
<spring:url value="/resources/css/sweetalert2.min.css"
	var="sweetalertCss" />
<spring:url value="/resources/js/sweetalert2.min.js" var="sweetalertJs" />
<link href="${sweetalertCss}" rel="stylesheet" />
<script src="${sweetalertJs}"></script>
<title>COMMITTEE SCHEDULE MINUTES</title>

 <script src="${ckeditor}"></script>
 <link href="${contentCss}" rel="stylesheet" />

  <style>
    .bs-example{
        margin: 20px;
    }
    .accordion .fa{
        margin-right: 0.5rem;
    }
</style>

  	<style type="text/css">
		

label{
  font-weight: bold;
  font-size: 13px;
}
 
.note-editable {
  line-height: 1.0;
}
.panel-info {
    border-color: #bce8f1;
}
.panel {
    margin-bottom: 10px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}
 .panel-heading {
    background-color: #FFF !important;
    border-color: #bce8f1 !important;
    border-bottom: 2px solid #466BA2 !important;
    color: #1d5987;
}
.panel-title {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 13px;
    color: inherit;
    font-weight: bold;
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
div {
    display: block;
}

element.style {
}
.olre-body .panel-info .panel-heading {
    background-color: #FFF !important;
    border-color: #bce8f1 !important;
    border-bottom: 2px solid #466BA2 !important;
   
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-info>.panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.panel-heading {
    padding: 3px 10px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.panel-heading {
    padding: 3px 10px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.panel-heading {
    padding: 3px 10px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.panel-heading {
    padding: 3px 10px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.panel-heading {
    padding: 3px 10px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
.p-5 {
    padding: 5px;
}
.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
user agent stylesheet
div {
    display: block;
}

.panel-info {
    border-color: #bce8f1;
}

.form-check{
	margin:0px 2%;
}

.fa-thumbs-up {
  font-family: FontAwesome, 'Quicksand', Quicksand, sans-serif;
}

.form-inline{

display: inline-block;
}


.form-check-input:checked ~ .form-check-label::before {
    color: #fff;
    border-color: #7B1FA2;
    background-color: red;
}
@keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

.blink {
    animation: blink 1.5s infinite;
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
.scrollclass::-webkit-scrollbar {
	width: 5px;
}
.scrollclass:hover{
cursor: pointer;
}
.scrollclass::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0);
	border-radius: 5px;
}

.scrollclass::-webkit-scrollbar-thumb {
	border-radius: 5px; 
	/*   -webkit-box-shadow: inset 0 0 6px black;  */
	background-color: #fff;
} 

.scrollclass::-webkit-scrollbar-thumb:hover {
	-webkit-box-shadow: inset 0 0 6px black;
	transition: 0.5s;
}

.scrollclass::-webkit-scrollbar {
	width: 7px;
}

.scrollclass::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 5px;
}

.scrollclass::-webkit-scrollbar-thumb {
	border-radius: 5px;
	/*   -webkit-box-shadow: inset 0 0 6px black;  */
	background-color: #fff;
}

.scrollclass::-webkit-scrollbar-thumb:hover {
	-webkit-box-shadow: inset 0 0 6px black;
	transition: 0.5s;
}


.chat-container {
	max-width: 800px;
	height: 600px;
	margin: 30px auto;
	background-color: #f8f9fa;
	border: 1px solid #dee2e6;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.chat-body {
	flex-grow: 1;
	overflow-y: auto;
}

.chat-message {
	margin: 10px 0;
	padding: 12px 16px;
	border-radius: 20px;
	max-width: 75%;
	word-break: break-word;
	font-size: 14px;
}

.user-msg {
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	align-self: flex-start;
}

.admin-msg {
	background-color: #d1e7dd;
	border: 1px solid #badbcc;
	align-self: flex-end;
	margin-left: auto;
}

.chat-message strong {
	display: block;
	font-size: 13px;
	color: #343a40;
	margin-bottom: 4px;
}

.timestamp {
	font-size: 11px;
	color: #6c757d;
	text-align: right;
	margin-top: 6px;
}

.chat-input {
	position: sticky;
	bottom: 0;
	z-index: 10;
}

.sender-name {
	font-weight: bold;
	display: block;
	color: #343a40;
}

/* .btn.submit {
    width: 150px;
    border-radius: 25px;
    padding: 8px 20px;
    font-weight: 600;
} */
@media ( max-width : 768px) {
	.chat-container {
		height: auto;
	}
	.chat-message {
		max-width: 90%;
	}
	.btn.submit {
		width: 100%;
	}
}
	</style>
</head>
<body>

<%

String unit3=null;
unit3=(String)request.getAttribute("unit1");
if(unit3==null){
	  unit3="NO";
}
String unit21=null;
unit21=(String)request.getAttribute("unit2");
if(unit21==null){
	  unit21="NO";
}
 
String specname=(String)request.getAttribute("specname");
SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");

Object[] committeescheduleeditdata=(Object[])request.getAttribute("committeescheduleeditdata");
List<Object[]> committeeagendalist=(List<Object[]>)request.getAttribute("committeeagendalist");

List<Object[]> dis=(List<Object[]>)request.getAttribute("minutesspeclist");
List<Object[]> minutesoutcomelist=(List<Object[]>)request.getAttribute("minutesoutcomelist");
String committscheduleid=(String) request.getAttribute("committscheduleid");
String membertype=(String) request.getAttribute("membertype");
String filesize=(String) request.getAttribute("filesize");
String committeeid=committeescheduleeditdata[0].toString();
String projectid=committeescheduleeditdata[9].toString();
String   committeecode    = committeescheduleeditdata[8].toString();
String GenId="GenAdd";
List<Object[]> minutesattachmentlist=(List<Object[]>)request.getAttribute("minutesattachmentlist");

List<Object[]> committeescheduledata=(List<Object[]>)request.getAttribute("committeescheduledata");
List<String> SplCommitteeCodes=(List<String>)request.getAttribute("SplCommitteeCodes");

Object[]MomAttachment=(Object[])request.getAttribute("MomAttachment");
Long empId = (Long)session.getAttribute("EmpId");
String formname=(String)request.getAttribute("formname");
if(formname!=null){
	GenId=formname;
}
/* if(formname==null){
	GenId="GenAdd";
}  */
	String scheduleId="";
scheduleId=committeescheduleeditdata[6].toString();

String ccmFlag = (String) request.getAttribute("ccmFlag");
String committeeMainId = (String) request.getAttribute("committeeMainId");
String committeeId = (String) request.getAttribute("committeeId");

List<Object[]> agendaList = (List<Object[]>)request.getAttribute("agendaList");

String dmcFlag = (String) request.getAttribute("dmcFlag");
List<CommitteeSchedule> dmcScheduleList = (List<CommitteeSchedule>) request.getAttribute("dmcScheduleList");
%>




<%String ses=(String)request.getParameter("result"); 
 String ses1=(String)request.getParameter("resultfail");
 String errorMsg=(String)request.getParameter("errorMsg");
 if(ses1!=null){
	%>
	 <div align="center">
	   <div class="alert alert-danger" role="alert">
           <%=StringEscapeUtils.escapeHtml4(ses1) %>
       </div>
     </div>
	<%}if(ses!=null){ %>
	<div align="center">
	  <div class="alert alert-success" role="alert" >
        <%=StringEscapeUtils.escapeHtml4(ses) %>
      </div>
    </div>
   <%}if(errorMsg!=null){ %>
  	<div align="center">
		<div class="alert alert-danger" role="alert" >
            <%=StringEscapeUtils.escapeHtml4(errorMsg) %>
        </div>
    </div>
<%} %>
                    
  
<nav class="navbar navbar-light bg-light justify-content-between" id="main1" style="margin-top: -1%">
	<a class="navbar-brand">
		
		<b style="color: #585858; font-size:19px;font-weight: bold;text-align: left; float:left" ><span style="color:#31708f"><%=committeescheduleeditdata[7]!=null?StringEscapeUtils.escapeHtml4(committeescheduleeditdata[7].toString()): " - " %> </span> <span style="color:#31708f;font-size: 15px"> (Meeting Date and Time : <%=committeescheduleeditdata[2]!=null?sdf.format(sdf1.parse(StringEscapeUtils.escapeHtml4(committeescheduleeditdata[2].toString()))):" - " %> - <%=committeescheduleeditdata[3]!=null?StringEscapeUtils.escapeHtml4(committeescheduleeditdata[3].toString()): " - " %>)</span></b>

	</a>
	<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) { %>
		<form action="CommitteeScheduleMinutes.htm" method="get">
			<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
			<input type="hidden" name="committeeId" value="<%=committeeId %>">
			<input type="hidden" name="dmcFlag" value="Y">
			<label>Meeting Id: </label>
			<select class="form-control selectdee" name="committeescheduleid" onchange="this.form.submit()">
				<%if(dmcScheduleList!=null && dmcScheduleList.size()>0) {
					for(CommitteeSchedule dmc : dmcScheduleList) {
				%>
					<option value="<%=dmc.getScheduleId()%>" <%if(dmc.getScheduleId()==(Long.parseLong(committeescheduleeditdata[6].toString()))) {%>selected<%} %> ><%=dmc.getMeetingId()!=null?StringEscapeUtils.escapeHtml4(dmc.getMeetingId()): " - " %></option>
				<%} }%>
			</select>
		</form>
	<%} %>
	<form class="form-inline" method="GET" action="CommitteeMinutesViewAllDownload.htm"  name="myfrm" id="myfrm"> 
					<%-- <button type="button" class="btn btn-sm prints my-2 my-sm-0" formaction=""  style="font-size:12px;" onclick="sendEmail(<%=committeescheduleeditdata[6]%>)">
					<i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp; EMAIL</button> --%>
		
		<%if(SplCommitteeCodes.stream().anyMatch(x -> x.trim().equalsIgnoreCase(committeecode.trim())) && Long.parseLong(projectid)>0){ %>
		    <!-- <input type="submit" class="btn  btn-sm view" value="DPFM L" formaction="CommitteeMinutesNewDfm.htm" formmethod="get" formtarget="_blank" style="background-color:#0e49b5 ;color:white ;font-size:12px;" /> -->
		<%if(committeescheduleeditdata[22].toString().equals("N")){%>
		<%-- 	<button type="button" class="btn btn-sm btn-primary my-2 my-sm-0" onclick="sendDraftMoM('<%=committeescheduleeditdata[6]%>')" style="font-size:12px;font-family: 'Montserrat', sans-serif;font-weight: 800"> SEND DRAFT</button>	 --%>
			<button type="button" class="btn btn-sm btn-secondary my-2 my-sm-0" formaction=""  style="font-size:12px;font-family: 'Montserrat', sans-serif;font-weight: 800" onclick="sendEmail(<%=committeescheduleeditdata[6]%>)">
			<i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp; EMAIL</button> 
<!-- 					 <input type="submit" class="btn  btn-sm view" value="PROTECTED MINUTES" name="PROTECTED MINUTES" formaction="CommitteeMinutesNewProtected.htm" formmethod="get" formtarget="_blank" style="background-color:#DF4646 ;color:white ;font-size:12px;" /> 
 -->			<input type="submit" class="btn  btn-sm view" value="MINUTES" formaction="CommitteeMinutesNewDownload.htm" formmethod="get" formtarget="_blank" style="background-color:#0e49b5 ;color:white ;font-size:12px;" />
			<button type="submit" class="btn btn-primary btn-sm"  name="sub" value="word"  id="wordDownloadBtn" formmethod="get" formtarget="_blank" formaction="CommitteeMinutesNewWordDownload.htm"  ><i class="fa fa-file-word-o" style="font-size:17px" title="Committee Minutes New Word Download"></i></button> 
		<%} %>
			<%if(committeescheduleeditdata[22].toString().equals("N")){%><button type="submit" class="btn btn-sm prints my-2 my-sm-0" formaction="getMinutesFrozen.htm" onclick="return confirm('Are You Sure to Freeze Minutes 2021 ?')" style="font-size:12px;" >FREEZE</button>
			<%}else{ %>
			<button type="submit" class="btn btn-sm prints my-2 my-sm-0" formaction="getMinutesFrozen.htm" onclick="return confirm('Are You Sure to unfreeze Minutes 2021 ?')" style="font-size:12px;" >UNFREEZE</button>
			<%} %>
		<%} %>
		<input type="hidden" name="IsFrozen" value="<%=committeescheduleeditdata[22].toString()%>">
		<%if(!SplCommitteeCodes.contains(committeecode.trim())) { %>
		<button type="button" class="btn btn-sm btn-secondary my-2 my-sm-0" formaction=""  style="font-size:12px;font-size:12px;font-family: 'Montserrat', sans-serif;font-weight: 800" onclick="sendEmails(<%=committeescheduleeditdata[6]%>)">
					<i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp; EMAIL</button> 
		<button type="submit" class="btn btn-sm prints my-2 my-sm-0" formtarget="_blank"  style="font-size:12px;">MINUTES</button>
		<%} %>
		<input type="hidden" class="btn  btn-sm view" value="TABULAR MINUTES" formaction="MeetingTabularMinutesDownload.htm" formtarget="_blank" style="background-color:#0e49b5 ;color:white ;font-size:12px;" /> 
		<input type="submit" class="btn  btn-sm view" value="TABULAR MINUTES" formaction="MOMTabularMinutesDownload.htm" formtarget="_blank" style="background-color:#0e49b5 ;color:white ;font-size:12px;" />		
		<input type="hidden" name="isFrozen" value="<%=committeescheduleeditdata[22]%>">
		<input type="hidden" name="membertype" value="<%=membertype%>">
		<input type="hidden" name="committeescheduleid" value="<%=committeescheduleeditdata[6]%>">
		<input type="hidden" name="scheduleid" value="<%=committeescheduleeditdata[6]%>">
		<%if(ccmFlag!=null && ccmFlag.equalsIgnoreCase("Y")) {%>

			<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
			<input type="hidden" name="ccmScheduleId" value="<%=committeescheduleeditdata[6] %>">
			<input type="hidden" name="committeeMainId" value="<%=committeeMainId %>">
			<input type="hidden" name="committeeId" value="<%=committeeId %>">
			<input type="hidden" name="ccmFlag" value="<%=ccmFlag %>">
			<button  class="btn  btn-sm back" formaction="CCMSchedule.htm" style=" font-size:12px;" >BACK</button>
	          				
		<%}%>
		<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) { %>
			<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
			<input type="hidden" name="committeeId" value="<%=committeeId %>">
			<input type="hidden" name="tabName" value="DMC">
			<button  class="btn  btn-sm back" formaction="CCMPresentation.htm" style=" font-size:12px;" >BACK</button>
	          				
	    <%}%>
		<%if(ccmFlag==null && dmcFlag==null) {%>
			<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
			<input type="hidden" name="scheduleid" value="<%=committeescheduleeditdata[6] %>">
			<button  class="btn  btn-sm back" formaction="CommitteeScheduleView.htm" style=" font-size:12px;" >BACK</button>

		<%} %>	
	</form>
	
	
</nav> 
 <div id="spinner" class="spinner" style="display:none;">
                <img id="img-spinner" style="width: 200px;height: 200px;" src="view/images/spinner1.gif" alt="Loading"/>
                </div>
<%if(committeescheduleeditdata[22].toString().equalsIgnoreCase("N")) {%>   
<div class="container-fluid" id="main2">          
<div class="row"> 
<div class="col-md-5" >
	<div class="card" style="border-color:#00DADA  ;margin-top: 2%;" >
    	<div class="card-body" style="margin-top: -8px" >
    	<%if(dmcFlag==null || (dmcFlag!=null && !dmcFlag.equalsIgnoreCase("Y"))) {%>
         <div class="panel panel-info" style="margin-top: 10px;" >
      		<div class="panel-heading ">
        		<h4 class="panel-title">
          			<span  style="font-size:14px">1. Introduction </span>  
        		</h4>
         	<div   style="float: right !important; margin-top:-23px; ">
		 		
		 		<table style="text-align: right;" >
     				
     				<thead>
	             		<tr>
	                 		<th ></th>
	             		</tr>
	         		</thead>
	         		
	         		<tbody>
	         		
				      <%
				      if(!dis.isEmpty()){
				    	  for(Object[] hlo:dis){
				      if("1".equalsIgnoreCase(hlo[0].toString())){
				    	   /* GenId="GenEdit";  */ 
				       %>   
	      				<tr>
	
				      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
				      			<form  id="myForm500" action="CommitteeMinutesSpecEdit.htm" method="post">
				      			
				      				<input type="hidden" name="specname" value="Introduction">
				                    <input type="hidden" name="scheduleid"	value="<%=hlo[7] %>" />
									<input type="hidden" name="minutesid"	value="<%=hlo[0] %>" />
									<input type="hidden" name="scheduleminutesid" 	value="<%=hlo[1] %>" /> 
				                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
				                     <input type="hidden" name="formname" value="myForm6542" />

				         			<input class="btn btn-warning btn-sm" type="submit" 
				         			  
				         			<%
				      					if(formname!=null && formname.equalsIgnoreCase("myForm6542")){
				     				 %> 
				     				 id="myForm6542"
				         			
				         			<%}else {%>
				         			id="GenAdd"
				         			<%} %>
				         			
				         			onclick="FormNameEdit('myForm500')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
 				       			
 				       				
 				       			
 							</form>
				       		</td>
				       		
	      				</tr>
      	
       					<%}}}%>   
       			
      				 </tbody>
      			</table>
      			<br>
       	</div>
      
      
		<div   style="float: right !important; margin-top:-25px; ">  
		
			 <form name="myForm" id="myFormgen" action="ItemSpecAdd.htm" method="post" 

				<% if(!dis.isEmpty()){
					    	  for(Object[] hlo:dis){
					      if("1".equalsIgnoreCase(hlo[0].toString())){
					    
					       %>hidden="hidden" 
					        <%}}}%>   
				> 
			
			<input type="hidden" name="specname" value="Introduction">
			
			<input class="form-control" type="hidden" name="minutesid" value="1" readonly="readonly">
			<input class="form-control" type="hidden" name="agendasubid" value="0" readonly="readonly">
			<input class="form-control" type="hidden" name="scheduleagendaid" value="0" readonly="readonly">
			<input class="form-control" type="hidden" name="minutesunitid" value="0" readonly="readonly">
			<input type="hidden" name="formname" value="myForm6542" /> 
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			<input type="submit" name="sub"  class="btn btn-info btn-sm"  id="GenAdd" onclick="FormName('myFormgen')" value="ADD"  style="width:40px; height: 24px; font-size:10px; font-weight: bold; text-align: justify; "/>
			
		
			</form>
   		</div>
     </div>
     <!-- panel-heading end -->
  	
	  	<div id="collapse1" class="panel-collapse collapse in">
	
	     </div>      
	       
   </div>
   <!-- panel end -->   
   
   
   
  <!--  2nd row -->
  
  

  	<div class="panel panel-info">
    	<div class="panel-heading">
        	<h4 class="panel-title">
         		<span  style="font-size:14px">2. Opening Remarks </span>
        	</h4>
       	<div   style="float: right !important; margin-top:-23px; ">
		 	<table style="text-align: center;" >
     			<thead>
	             	<tr>
	                 	<th ></th>       
	             	</tr>
	         	</thead>
	         	<tbody>
	         	
	         	
			       <%
			      if(!dis.isEmpty()){
			    	  for(Object[] hlo:dis){
			      if("2".equalsIgnoreCase(hlo[0].toString())){
			       %> 
      	
      				<tr>

			      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
			      			<form  id="myForm1" action="MinutesSpecEdit.htm" method="post">
			                	
			                		<input type="hidden" name="specname" value="OpeningRemarks">
			                		<input type="hidden" name="scheduleid"	value="<%=hlo[7] %>" />
									<input type="hidden" name="minutesid"	value="<%=hlo[0] %>" />
									<input type="hidden" name="scheduleminutesid" 	value="<%=hlo[1] %>" /> 
				                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
			                    	<input type="hidden" name="formname" value="rmmyForm2" /> 

			          			<input type="submit" class="btn btn-warning btn-sm"  id="rmmyForm2" onclick="FormNameEdit('myForm1')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
			          			
			       			</form>
			      		</td>
			      		
      				</tr>
      	
       				 <%}}}%> 
       				 
       			</tbody>
      	
      		</table>
      		<br>
      		
       </div>
       
       
       <div style="float: right !important; margin-top:-25px; " >
			
			<form name="myForm" id="myForm2" action="ItemSpecAdd.htm" method="post" 

				<% if(!dis.isEmpty()){
				    	  for(Object[] hlo:dis){
				      if("2".equalsIgnoreCase(hlo[0].toString())){
				       %>hidden="hiddden" 
				        <%}}}%> 
				> 

				<input type="hidden" name="specname" value="OpeningRemarks">
				<input class="form-control" type="hidden" name="minutesid" value="2" readonly="readonly">
				<input class="form-control" type="hidden" name="agendasubid" value="0" readonly="readonly">
				<input class="form-control" type="hidden" name="scheduleagendaid" value="0" readonly="readonly">
				<input class="form-control" type="hidden" name="minutesunitid" value="0" readonly="readonly">
				<input type="hidden" name="formname" value="rmmyForm2" /> 
	
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<input type="submit" class="btn btn-info btn-sm" id="rmmyForm2" name="sub" onclick="FormName('myForm2')" value="ADD"  style="width:42px height: 24px; font-size:10px; font-weight: bold; text-align: justify; "/>
			
			</form>
			
   		</div>
   		
     </div><!-- panel- heading end -->
	  
	  <div id="collapse2" class="panel-collapse collapse in">
	  
	   
	   </div>    
	       
   </div>   

 <%} %>  
 <%if((ccmFlag==null && dmcFlag==null) || (ccmFlag!=null && !ccmFlag.equalsIgnoreCase("Y")) || (dmcFlag!=null && !dmcFlag.equalsIgnoreCase("Y"))) {%>   
  <!-- 3rd Row New-->
 
 <div class="panel panel-info">
	<div class="panel-heading">
	
    	<h4 class="panel-title">
           <span  style="font-size:14px">3. Agenda</span>
        </h4>
        
       	<div style="float: right !important; margin-top:-20px; " > 
       		<a data-toggle="collapse" data-parent="#accordion" href="#collapse5" > <i class="fa fa-plus" id="agendaclick"></i></a></div>
      	</div>
      
  		<div id="collapse5" class="panel-collapse collapse in">
   			<%int unitcount=1;  long unit=1; String Unit=null; int countloop=100; int form=145;int collapse=140;String temp=null;int form6=565;int form7=123;
   
   
    if(committeeagendalist!=null && committeeagendalist.size()>0){
    	
 	  for(Object[] hlo1:committeeagendalist){
 	
 		 Unit=hlo1[3].toString();
 		 String scheduleagendaid=hlo1[0].toString();
 		 temp=hlo1[0].toString();
 			  
   			%>
   			
   			
<div class="row">  
	<div class="col-md-11"  align="left"  style="margin-left: 10px;">
     	
     	<div class="panel panel-info">
      		<div class="panel-heading">
        		
        		<h4 class="panel-title">
                	<span  style="font-size:14px">3.<%=unitcount %> <%=StringEscapeUtils.escapeHtml4(Unit) %></span> 
                </h4>
       
       			<div style="float: right !important; margin-top:-20px; " >
        			<a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=countloop %>" > <i class="fa fa-plus 5Pre<%=scheduleagendaid %> 5Dis<%=scheduleagendaid %> 5Out<%=scheduleagendaid %>" style="color:orange" id="5Out<%=scheduleagendaid %>" ></i></a></div>
           		</div>
           		
  				<div id="collapse<%=countloop %>" class="panel-collapse in collapse ">
   					
   					<!-- Sub row of Agendas -->

	<!--  New code inside agenda start-->
	
	
	<!-- ******** sub row 1 start *****  -->
	

<!-- --------------------------------------------------  Dinesh  Start  --------------------------------------------------------------------------------------- -->
	
	
	
	<div class="row">  
   			<div class="col-md-11"  align="left"  style="margin-left: 10px;">
		
		<div class="panel panel-info">
		
		<div class="panel-heading">
	    	
	    	<h4 class="panel-title">
	           <span  style="font-size:14px">3.<%=unitcount %>.1. Presentation </span>
	        </h4>
	        
	       	<div style="float: right !important; margin-top:-20px; " > 
	       		<%int collapseP=481; %>
	       		<a data-toggle="collapse" data-parent="#accordion" href="#<%=collapseP%><%=collapse%>" > <i class="fa fa-plus" style="color:green" id="5Pre<%=scheduleagendaid %>5"></i></a>
	       	</div>
	       	
	    </div>
	      
	  	<div id="<%=collapseP%><%= collapse %>" class="panel-collapse collapse in">
	  
	  <% int unitcount11=1; 	long unit11=1; String Unit11=null; int countloop11=100; int form11=1458;int collapse11=140;String temp11=null;int form20=5000; int Presentationcount=0; 
	  
	  /* int unitcount13=1;  long unit13=1; String Unit13=null; int countloop13=100; int form13=4455;int collapse13=140;String temp13=null;int form18=700; */
	  
	   if(!dis.isEmpty()){
			for(Object[] hlod:dis){
				 if("3".equalsIgnoreCase(hlod[0].toString()) &&  temp.equalsIgnoreCase(hlod[3].toString()) && "7".equalsIgnoreCase(hlod[4].toString()))
				 {
		
	   %>
	   
	  			<div class="row">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">3.<%=unitcount %>.1.<%=unit11 %>. 
	          						<!-- newly added by sankha 12-10-2023 -->
	          						<%if(hlod[5].toString().length()>30){ %>
									<%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()).substring(0,20)+"....":" - " %>	 <span style="font-size: 11px;color:crimson;cursor: pointer;]" onclick='showModal("<%=hlod[5].toString()%>")'>(<%=hlod[9]!=null?StringEscapeUtils.escapeHtml4(hlod[9].toString()): " - " %>)</span>         						
	          						<%}else{ %>
	          						<%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()): " - " %><span style="font-size: 11px;color:crimson" >(<%=hlod[9]!=null?StringEscapeUtils.escapeHtml4(hlod[9].toString()): " - " %>)</span>
	          						<%} %></span>
	          						<!-- end -->
	          						  </h4>
		       						<div   style="float: right !important; margin-top:-23px; ">
									 	<table style="text-align: center;" >
							     			<thead>
								             	<tr>
								                 	<th ></th>       
								             	</tr>
								         	 </thead>
								         	<tbody>
							      				<tr>
										      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
										      			<form  id="myForm<%=temp %>P<%=form11 %>" action="MinutesSpecEdit.htm" method="post">
										                	
										                		<input type="hidden" name="specname" value="Agenda-Recommendation">
										                		<input type="hidden" name="scheduleid"	value="<%=hlod[6] %>" />
																<input type="hidden" name="minutesid"	value="<%=hlod[0] %>" />
																<input type="hidden" name="scheduleminutesid" 	value="<%=hlod[1] %>" /> 
											                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
										                    	<input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>P<%=form20 %>" />
																<input class="form-control" type="hidden" name="unit1" value="#5Pre<%=scheduleagendaid %>" readonly="readonly">
										          			<input type="submit" class="btn btn-warning btn-sm"  id="rm<%=form7 %><%=temp %>P<%=form20 %>" onclick="FormNameEditB('myForm<%=temp %>P<%=form11 %>' , '<%=hlod[9] %>')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
										          			
										       			</form>
										      		</td>
										      		
							      				</tr>
							      	
							       				
							       				
							       			</tbody>
							      	
							      		</table>
		      							<br>
		      		
		       						</div>
	           				</div>
	  					</div>
					</div>
				</div>
				
	<%unitcount11++;countloop++;form11++;form20++;unit11++;  Presentationcount++;}}}%>
	   <div class="row">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	       						<form action="ScheduleMinutesUnitEdit.htm" method="post"  id="myForm<%=form6 %><%=temp %>P<%=form20 %>">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">3.<%=unitcount %>.2.<%=unit11 %>.</span>  </h4>
	          						<div style="margin-top:-22px; margin-left: 55px;">
	          						
	          						<input type="text" class=""  name="OutComesId" id="OutComesId" maxlength="100" value="<%= "Presentation "+ (++Presentationcount) %>">
	          						
	          						</div>
	          						<div style="margin-top:-26px; float: right;">
	          						<input type="submit" class="btn btn-info btn-sm" name="sub"  id="rm<%=form7 %><%=temp %>D<%=form20 %>" value="ADD" onclick="FormNameB('myForm<%=form6 %><%=temp %>P<%=form20 %>')" style="width:42px ;height: 22px; font-size:10px; font-weight: bold; text-align: justify; "/>
	          						

	        					    </div>
	        					    <input type="hidden" name="specname" value="Agenda-<%=Unit %>-Outcomes">
	        					    <input class="form-control" type="hidden" name="agendasubid" value="7" readonly="readonly">
									<input class="form-control" type="hidden" name="minutesid" value="3" readonly="readonly">
									<input class="form-control" type="hidden" name="scheduleagendaid" value="<%=scheduleagendaid %>" readonly="readonly">
	        					    <input class="form-control" type="hidden" name="committeescheduleid" value="<%=committscheduleid %>" readonly="readonly">
								    <input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>P<%=form20 %>" />
								    <input type="hidden" name="unitid" value="<%=temp %>" />
								    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								    <input class="form-control" type="hidden" name="membertype" value="<%=membertype %>" readonly="readonly">
								    <input class="form-control" type="hidden" name="unit1" value="#5Pre<%=scheduleagendaid %>" readonly="readonly">
									
	       						</form>
	       					    
	           				</div>
	  					</div>
					</div>
				</div>
	    
			
	  			
	
	     </div>   <!-- Agenda collapse end -->     
	 </div><!-- Agenda Panel end -->  
	
	</div>
	
	</div><!-- row end -->
	
	
	
	 <div class="row">  
   			<div class="col-md-11"  align="left"  style="margin-left: 10px;">
		
		<div class="panel panel-info">
			
		<div class="panel-heading">
	    	
	    	<h4 class="panel-title">
	           <span  style="font-size:14px">3.<%=unitcount %>.2. Discussions </span>
	        </h4>
	        
	       	<div style="float: right !important; margin-top:-20px; " > 
	       		<%int collapseD=483; %>
	       		<a data-toggle="collapse" data-parent="#accordion" href="#<%=collapseD%><%=collapse%>" > <i class="fa fa-plus" style="color:green" id="5Dis<%=scheduleagendaid %>5"></i></a>
	       	</div>
	       	
	    </div>
	      
	  	<div id="<%=collapseD%><%= collapse %>" class="panel-collapse collapse in">
	  
	  <%int unitcount12=1; long unit12=1; String Unit12=null; int countloop12=100; int form12=3455;int collapse12=140;String temp12=null;int form19=650; int discussionscount=0; 
	  
	  /* int unitcount13=1;  long unit13=1; String Unit13=null; int countloop13=100; int form13=4455;int collapse13=140;String temp13=null;int form18=700; */
	  
	   if(!dis.isEmpty()){
			for(Object[] hlod:dis){
				 if("3".equalsIgnoreCase(hlod[0].toString()) &&  temp.equalsIgnoreCase(hlod[3].toString()) && "8".equalsIgnoreCase(hlod[4].toString()))
				 {
		
	   %>
	   
	  			<div class="row">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">3.<%=unitcount %>.2.<%=unit12 %>. 
	          						<!-- newly added by sankha 12-10-2023 -->
	          						<%if(hlod[5].toString().length()>30){ %>
									<%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()).substring(0,20)+"....":" - " %>	          						
	          						<%}else{ %>
	          						<%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()): " - " %>
	          						<%} %>
	          						<!-- end -->
	          						</span>
	          				<span style="color:crimson;font-size:11px;" onclick="showModal('<%=hlod[5].toString() %>')">(<%=hlod[9]!=null?StringEscapeUtils.escapeHtml4(hlod[9].toString()): " - " %>)</span>  </h4>
	          				
		       						<div   style="float: right !important; margin-top:-23px; ">
									 	<table style="text-align: center;" >
							     			<thead>
								             	<tr>
								                 	<th ></th>       
								             	</tr>
								         	 </thead>
								         	<tbody>
							      				<tr>
										      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
										      			<form  id="myForm<%=temp %>D<%=form12 %>" action="MinutesSpecEdit.htm" method="post">
										                	
										                		<input type="hidden" name="specname" value="Agenda-Recommendation">
										                		<input type="hidden" name="scheduleid"	value="<%=hlod[6] %>" />
																<input type="hidden" name="minutesid"	value="<%=hlod[0] %>" />
																<input type="hidden" name="scheduleminutesid" 	value="<%=hlod[1] %>" /> 
											                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
										                    	<input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>D<%=form19 %>" />
																<input class="form-control" type="hidden" name="unit1" value="#5Dis<%=scheduleagendaid %>" readonly="readonly">
										          			<input type="submit" class="btn btn-warning btn-sm"  id="rm<%=form7 %><%=temp %>D<%=form19 %>" onclick="FormNameEditB('myForm<%=temp %>D<%=form12 %>' , '<%=hlod[9] %>')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
										          			
										       			</form>
										      		</td>
										      		
							      				</tr>
							      	
							       				
							       				
							       			</tbody>
							      	
							      		</table>
		      							<br>
		      		
		       						</div>
	           				</div>
	  					</div>
					</div>
				</div>
				
	<%unitcount12++;countloop++;form12++;form19++;unit12++;  discussionscount++;}}}%>
	   <div class="row">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	       						<form action="ScheduleMinutesUnitEdit.htm" method="post"  id="myForm<%=form6 %><%=temp %>D<%=form19 %>">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">3.<%=unitcount %>.2.<%=unit12 %>.</span>  </h4>
	          						<div style="margin-top:-22px; margin-left: 55px;">
	          						
	          						<input type="text" class=""  name="OutComesId" id="OutComesId" maxlength="100" value="<%= "Discussion "+ (++discussionscount) %>">
	          						
	          						</div>
	          						<div style="margin-top:-26px; float: right;">
	          						<input type="submit" class="btn btn-info btn-sm" name="sub"  id="rm<%=form7 %><%=temp %>D<%=form19 %>" value="ADD" onclick="FormNameB('myForm<%=form6 %><%=temp %>D<%=form19 %>')" style="width:42px ;height: 22px; font-size:10px; font-weight: bold; text-align: justify; "/>
	          						

	        					    </div>
	        					    <input type="hidden" name="specname" value="Agenda-<%=Unit %>-Outcomes">
	        					    <input class="form-control" type="hidden" name="agendasubid" value="8" readonly="readonly">
									<input class="form-control" type="hidden" name="minutesid" value="3" readonly="readonly">
									<input class="form-control" type="hidden" name="scheduleagendaid" value="<%=scheduleagendaid %>" readonly="readonly">
	        					    <input class="form-control" type="hidden" name="committeescheduleid" value="<%=committscheduleid %>" readonly="readonly">
								    <input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>D<%=form19 %>" />
								    <input type="hidden" name="unitid" value="<%=temp %>" />
								    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								    <input class="form-control" type="hidden" name="membertype" value="<%=membertype %>" readonly="readonly">
								    <input class="form-control" type="hidden" name="unit1" value="#5Dis<%=scheduleagendaid %>" readonly="readonly">
									
	       						</form>
	       					    
	           				</div>
	  					</div>
					</div>
				</div>
	    
			
	  			
	
	     </div>   <!-- Agenda collapse end -->     
	 </div><!-- Agenda Panel end -->  
	
	</div>
	
	</div><!-- row end -->
	
<!-- --------------------------------------------------  Dinesh  End  --------------------------------------------------------------------------------------- -->	
	
	<!-- ********* sub row 2 end ********* -->
	
	
	
	<!-- ******** sub row 3 start *****  -->
	
	 <div class="row">  
   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
		
		<div class="panel panel-info">
		
		<div class="panel-heading">
	    	
	    	<h4 class="panel-title">
	           <span  style="font-size:14px">3.<%=unitcount %>.3. Outcomes </span>
	        </h4>
	        
	       	<div style="float: right !important; margin-top:-20px; " > 
	       		<%int collapse3=484; %>
	       		<a data-toggle="collapse" data-parent="#accordion" href="#<%=collapse3%><%=collapse%>" > <i class="fa fa-plus" style="color:green" id="5Out<%=scheduleagendaid %>5"></i></a>
	       	</div>
	       	
	    </div>
	      
	  	<div id="<%=collapse3%><%=collapse%>" class="panel-collapse collapse in">
	  	<div class="scrollclass" style="height:200px;overflow-y: auto">
	   <%int unitcount13=1;  long unit13=1; String Unit13=null; int countloop13=100; int form13=4455;int collapse13=140;String temp13=null;int form18=700;
	   if(!dis.isEmpty()){
			for(Object[] hlod:dis){
				 if("3".equalsIgnoreCase(hlod[0].toString())&&temp.equalsIgnoreCase(hlod[3].toString())&&"9".equalsIgnoreCase(hlod[4].toString())){
		
	   %>
	   
	  			<div class="row" style="margin-right: 0px; margin-left: 0px;">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">3.<%=unitcount %>.3.<%=unit13 %>.
	          						<!-- newly added by sankha  on 12/10 -->
	          						<%if(hlod[5].toString().length()>30) {%>    
										<%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()).substring(0,20) +"...":" - "%>
									<%}else{ %>
										    <%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()): " - " %>
									<%} %></span>
									<!-- end -->      						
	          						<span style="color:crimson;font-size:11px;" onclick="showModal('<%=hlod[5].toString()%>')"> (<%=hlod[8]!=null?StringEscapeUtils.escapeHtml4(hlod[8].toString()): " - " %>)</span>  </h4>
	       						<div   style="float: right !important; margin-top:-23px; ">
								 	<table style="text-align: center;" >
						     			<thead>
							             	<tr>
							                 	<th ></th>       
							             	</tr>
							         	 </thead>
							         	<tbody>
							         	
							         	
						
						      	
						      				<tr>
						
									      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
									      			<form  id="myForm<%=temp %>R<%=form13 %>" action="MinutesSpecEdit.htm" method="post">
									                	
									                		<input type="hidden" name="specname" value="Agenda-Recommendation">
									                		<input type="hidden" name="scheduleid"	value="<%=hlod[6] %>" />
															<input type="hidden" name="minutesid"	value="<%=hlod[0] %>" />
															<input type="hidden" name="scheduleminutesid" 	value="<%=hlod[1] %>" /> 
										                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
									                    	<input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>R<%=form18 %>" />
															<input class="form-control" type="hidden" name="unit1" value="#5Out<%=scheduleagendaid %>" readonly="readonly">				
									          			<input type="submit" class="btn btn-warning btn-sm"  id="rm<%=form7 %><%=temp %>R<%=form18 %>" onclick="FormNameEditA('myForm<%=temp %>R<%=form13 %>')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
									          			
									       			</form>
									      		</td>
									      		
						      				</tr>
						       			</tbody>
						      	
						      		</table>
	      							<br>
	      		
	       						</div>
	       			
	       		
	           				</div>
	  					</div>
					</div>
				</div>
				
	<%unitcount13++;countloop++;form13++;form18++;unit13++;}}}%>
	</div>
	
	   			<div class="row">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	       						<form action="ScheduleMinutesUnitEdit.htm" method="post"  id="myForm<%=form6 %><%=temp %>R<%=form18 %>">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">3.<%=unitcount %>.3.<%=unit13 %>.</span>  </h4>
	          						<div style="margin-top:-22px; margin-left: 55px;">
	          							<select  name="OutComesId" id="OutComesId" required="required"  data-live-search="true"  style="width: 165px;"  >
	                                        <%for(Object[] obj:minutesoutcomelist){ %>	
												<option value="<%=obj[0]%>"><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - "%></option>	
											<%} %>
										</select>
	          						
	          						
	          						
	          						
	          						</div>
	          						<div style="margin-top:-26px; margin-left: 240px;">
	          						<input type="submit" class="btn btn-info btn-sm" name="sub"  id="rm<%=form7 %><%=temp %>R<%=form18 %>" value="ADD" onclick="FormNameA('myForm<%=form6 %><%=temp %>R<%=form18 %>')" style="width:42px ;height: 22px; font-size:10px; font-weight: bold; text-align: justify; "/>
	          						

	        					    </div>
	        					    <input type="hidden" name="specname" value="Agenda-<%=Unit %>-Outcomes">
	        					    <input class="form-control" type="hidden" name="agendasubid" value="9" readonly="readonly">
									<input class="form-control" type="hidden" name="minutesid" value="3" readonly="readonly">
									<input class="form-control" type="hidden" name="scheduleagendaid" value="<%=scheduleagendaid %>" readonly="readonly">
	        					    <input class="form-control" type="hidden" name="committeescheduleid" value="<%=committscheduleid %>" readonly="readonly">
								    <input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>R<%=form18 %>" />
								     <input type="hidden" name="unitid" value="<%=temp %>" />
								    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								    <input class="form-control" type="hidden" name="membertype" value="<%=membertype %>" readonly="readonly">
								    <input class="form-control" type="hidden" name="unit1" value="#5Out<%=scheduleagendaid %>" readonly="readonly">
									
	       						</form>
	       					    
	           				</div>
	  					</div>
					</div>
				</div>
	    
			
	  			
	
	     </div>   <!-- Agenda collapse end -->     
	 </div><!-- Agenda Panel end -->  
	
	</div>
	
	</div><!-- row end -->
	
	
	<!-- ********* sub row 3 end ********* -->
	

	
	<!-- New code inside agenda end -->
	


	</div><!-- main sub collapse end  -->
	
</div><!-- Agenda panel end -->

</div>
</div>


 <%unitcount++;countloop++;form6++;form7++;collapse++; }}else{
 	  
    %> 
    
  <div class="panel panel-info">
      <div class="panel-heading">
      		
      	<p>No Agenda Defined ..!!</p>
      		
      </div>
  </div>
      		
<%} %>

     </div>   <!-- Agenda collapse end -->     
 </div><!-- Agenda Panel end -->
    
 
 <!-- End of 3 new-->    
     

  
  
  <!-- New Code  -->
  
  <!-- 4th row Discussion -->
  

  
  <div class="panel panel-info">
	
	<div class="panel-heading">
    	
    	<h4 class="panel-title">
           <span  style="font-size:14px">4. Other Discussion</span>
        </h4>
        
   
   <%int unitcount0=1;  long unit0=1; String Unit0=null; int countloop0=100; int form46=4646;int collapse0=140;String temp0=null;

	
	   		
	   %>
   

       						<div   style="float: right !important; margin-top:-23px; ">
							 	<table style="text-align: center;" >
					     			<thead>
						             	<tr>
						                 	<th ></th>       
						             	</tr>
						         	 </thead>
						         	<tbody>
						         	
						         	
							 <%
							 	if(!dis.isEmpty()){
									for(Object[] hlo:dis){
										 if("4".equalsIgnoreCase(hlo[0].toString())){
										       %>
					      	
					      				<tr>
					
								      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
								      			<form  id="myForm<%=form46 %>" action="MinutesSpecEdit.htm" method="post">
								                	
								                		<input type="hidden" name="specname" value="Other Discussion">
								                		<input type="hidden" name="scheduleid"	value="<%=hlo[6] %>" />
														<input type="hidden" name="minutesid"	value="<%=hlo[0] %>" />
														<input type="hidden" name="scheduleminutesid" 	value="<%=hlo[1] %>" /> 
									                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								                    	<input type="hidden" name="formname" value="rm<%=form46 %>" />
					
								          			<input type="submit" class="btn btn-warning btn-sm"  id="rm<%=form46 %>" onclick="FormNameEdit('myForm<%=form46 %>')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
								          			
								       			</form>
								      		</td>
								      		
					      				</tr>
					      	
					       				 <%}}}%> 
					       				
					       			</tbody>
					      	
					      		</table>
      							<br>
      		
       						</div>
       			
       						
       					    <div style="float: right !important; margin-top:-25px; " >
			
								<form name="myForm" id="myForm<%=form46 %>" action="ItemSpecAdd.htm" method="post" 
		
									<%
							 	if(!dis.isEmpty()){
									for(Object[] hlo:dis){
										 if("4".equalsIgnoreCase(hlo[0].toString())){
										       %>hidden="hidden" 
												        <%}}}%>  
												        >
					
									<input type="hidden" name="specname" value="Other Discussion">
									<input class="form-control" type="hidden" name="agendasubid" value="0" readonly="readonly">
									<input class="form-control" type="hidden" name="minutesid" value="4" readonly="readonly">
									<input class="form-control" type="hidden" name="scheduleagendaid" value="0" readonly="readonly">
									
									<input class="form-control" type="hidden" name="unit1id" value="#unitdiscussion" readonly="readonly">
									<input type="hidden" name="formname" value="rm<%=form46 %>" />
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
									<input type="submit" class="btn btn-info btn-sm" name="sub" id="rm<%=form46 %><%=temp %>OD" onclick="FormName('myForm<%=form46 %>')" value="ADD"  style="width:42px ;height: 22px; font-size:10px; font-weight: bold; text-align: justify; "/>

								
								</form>
			
   							</div>
       					    
   
			
<%unitcount0++;countloop++;form46++;%>
   
    
	
  			

     </div>   <!-- Agenda collapse end -->     
 </div><!-- Agenda Panel end -->   

<!--  4th row end-->



<!-- 5th row Recommendation -->


<div class="panel panel-info">
	
	<div class="panel-heading">
    	
    	<h4 class="panel-title">
           <span  style="font-size:14px">5. Other Outcomes</span>
        </h4>
        
       	<div style="float: right !important; margin-top:-20px; " > 
       		<a data-toggle="collapse" data-parent="#accordion" href="#collapse58" > <i class="fa fa-plus" id="OutCome5"></i></a>
       	</div>
       	
    </div>
      
  	<div id="collapse58" class="panel-collapse collapse in">
  	<div class="scrollclass" style="height:200px;overflow-y: auto">
   <% int unitcount1=1;  long unit1=1; String Unit1=null; int countloop1=100; int form1=545;int collapse1=140;String temp1=null; %>
	  
	   
   	 <%
							 	if(!dis.isEmpty()){
									for(Object[] hlo:dis){
										 if("5".equalsIgnoreCase(hlo[0].toString())){
										       %>
  			<div class="row" style="margin-right: 0px; margin-left: 0px;">  
   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
     				<div class="panel panel-info">
      					<div class="panel-heading">
       						
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">5.<%=unitcount1 %> 
	          						<!-- Newly added by sankha 12-10-2023 -->
	          						<%if(hlo[5].toString().length()>40) {%>
	          						<%=hlo[5]!=null?StringEscapeUtils.escapeHtml4(hlo[5].toString()).substring(0, 35)+"....":" - " %><span style="font-size: 11px;color:crimson;cursor: pointer;"onclick='showModal("<%=hlo[5].toString()%>")'>(<%=hlo[8]!=null?StringEscapeUtils.escapeHtml4(hlo[8].toString()): " - " %> )</span>
	          						<%}else{ %>
	          						<%=hlo[5]!=null?StringEscapeUtils.escapeHtml4(hlo[5].toString()): " - "%>&nbsp;<span style="font-size: 11px;color:crimson;">(<%=hlo[8]!=null?StringEscapeUtils.escapeHtml4(hlo[8].toString()): " - " %> )</span>
	          						<%} %></span>
	          						<!-- end  -->
	          						  </h4>
	          				
       						<div   style="float: right !important; margin-top:-23px; ">
							 	<table style="text-align: center;" >
					     			<thead>
						             	<tr>
						                 	<th ></th>       
						             	</tr>
						         	 </thead>
						         	<tbody>
					      				<tr>
								      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
								      			<form  id="myForm<%=form1 %>" action="MinutesSpecEdit.htm" method="post">
								                	 	
								                		<input type="hidden" name="specname" value="Recommendation">
								                		<input type="hidden" name="scheduleid"	value="<%=hlo[6] %>" />
														<input type="hidden" name="minutesid"	value="<%=hlo[0] %>" />
														<input type="hidden" name="scheduleminutesid" 	value="<%=hlo[1] %>" /> 
									                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								                        <input type="hidden" name="formname" value="rm<%=form1 %>" /> 
														<input class="form-control" type="hidden" name="unit1" value="5" readonly="readonly">
								          			<input type="submit" class="btn btn-warning btn-sm" id="rm<%=form1 %>"   onclick="FormNameEditA('myForm<%=form1 %>')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
								          			
								       			</form>
								      		</td>
					      				</tr>
					       			</tbody>
					      		</table>
      							<br>
      		
       						</div>
       			
       						
       				
       					    
           				</div>
  					</div>
				</div>
			</div>
		 <%unitcount1++;form1++;}}}%> 
		 </div>	
<%countloop++;%>
   
    
		  <div class="row">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	       						<form action="ScheduleMinutesUnitEdit.htm" method="post" id="myForm<%=form1 %>">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px">5.<%=unitcount1 %>.</span>  </h4>
	          						<div style="margin-top:-22px; margin-left: 25px;">
		          						<select  name="OutComesId" id="Assignee" required="required"  data-live-search="true"  style="width: 165px;"  >
		                                    <%for(Object[] obj:minutesoutcomelist){ %>	
												<option value="<%=obj[0]%>"><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - "%></option>	
											<%} %>
										</select>
	          						</div>
	          						<div style="margin-top:-26px; margin-left: 200px;">
	          						<input type="submit" class="btn btn-info btn-sm" name="sub"  id="rm<%=form1 %>" value="ADD" onclick="FormNameA('myForm<%=form1 %>')" style="width:42px ;height: 22px; font-size:10px; font-weight: bold; text-align: justify; "/>
	        					    </div>
	        					       <input class="form-control" type="hidden" name="agendasubid" value="0" readonly="readonly">
									    <input class="form-control" type="hidden" name="minutesid" value="5" readonly="readonly">
									   <input class="form-control" type="hidden" name="scheduleagendaid" value="0" readonly="readonly">
	        		                   <input type="hidden" name="specname" value="Other OutComes">
	        					    <input class="form-control" type="hidden" name="committeescheduleid" value="<%=committscheduleid %>" readonly="readonly">
								    
								     <input type="hidden" name="unitid" value="<%=temp %>" />
								    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								    <input class="form-control" type="hidden" name="membertype" value="<%=membertype %>" readonly="readonly">
								    <input class="form-control" type="hidden" name="unit1" value="5" readonly="readonly">
									<input type="hidden" name="formname" value="rm<%=form1 %>" />
	       						</form>
	       					    
	           				</div>
	  					</div>
					</div>
				</div>
  			

     </div>   <!-- Agenda collapse end -->     
 </div><!-- Agenda Panel end --> 


<!-- 6th row Conclusion -->
				

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" id="myModal">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
       <div class="p-3" id="filltext"></div>
      </div>
    </div>
  </div>
</div>


<div class="panel panel-info">
	
	<div class="panel-heading">
    	
    	<h4 class="panel-title">
           <span  style="font-size:14px">6. Conclusion</span>
        </h4>
        
     
  	
   <%int unitcount2=1;  long unit2=1; String Unit2=null; int countloop2=100; int form2=5456;int collapse2=140;String temp2=null;
   

	   		
	   %>

       						<div   style="float: right !important; margin-top:-23px; ">
							 	<table style="text-align: center;" >
					     			<thead>
						             	<tr>
						                 	<th ></th>       
						             	</tr>
						         	 </thead>
						         	<tbody>
						         	
						         	
							 <%
							 	if(!dis.isEmpty()){
									for(Object[] hlo:dis){
										 if("6".equalsIgnoreCase(hlo[0].toString())){
											 
										       %>
					      	
					      				<tr>
					
								      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
								      			<form  id="myForm<%=form2 %>" action="MinutesSpecEdit.htm" method="post">
								                	
								                		<input type="hidden" name="specname" value="Conclusion">
								                		<input type="hidden" name="scheduleid"	value="<%=hlo[6] %>" />
														<input type="hidden" name="minutesid"	value="<%=hlo[0] %>" />
														<input type="hidden" name="scheduleminutesid" 	value="<%=hlo[1] %>" /> 
									                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								                    	<input type="hidden" name="formname" value="rm<%=form2 %>" />
														<input class="form-control" type="hidden" name="unit1id" value="#unitconclusion" readonly="readonly">
							
								          			<input type="submit" class="btn btn-warning btn-sm"  id="rm<%=form2 %>" onclick="FormNameEdit('myForm<%=form2 %>')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
								          			
								       			</form>
								      		</td>
								      		
					      				</tr>
					      	
					       				 <%}}}%> 
					       				
					       			</tbody>
					      	
					      		</table>
      							<br>
      		
       						</div>
       			
       						
       					    <div style="float: right !important; margin-top:-25px; " >
			
								<form name="myForm" id="myForm<%=form2 %>" action="ItemSpecAdd.htm" method="post" 
		
									<%
							 	if(!dis.isEmpty()){
									for(Object[] hlo:dis){
										 if("6".equalsIgnoreCase(hlo[0].toString())){
										       %>hidden="hidden" 
												        <%}}}%>  
												        >
					
									<input type="hidden" name="specname" value="Conclusion">
									<input class="form-control" type="hidden" name="agendasubid" value="0" readonly="readonly">
									<input class="form-control" type="hidden" name="minutesid" value="6" readonly="readonly">
									<input class="form-control" type="hidden" name="scheduleagendaid" value="0" readonly="readonly">
									
									<input class="form-control" type="hidden" name="unit1id" value="#unitconclusion" readonly="readonly">
									<input type="hidden" name="formname" value="rm<%=form2 %>" />
									
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	
									<input type="submit" class="btn btn-info btn-sm" name="sub"  id="rm<%=form2 %><%=temp %>CO" onclick="FormName('myForm<%=form2%>')" value="ADD"  style="width:42px ;height: 22px; font-size:10px; font-weight: bold; text-align: justify; "/>
								
									
								
								</form>
			
   							</div>
       					    
  
			
<%unitcount2++;countloop++;form2++;%>
  

     </div>   <!-- Agenda collapse end -->     
 </div><!-- Agenda Panel end --> 

<%-- <%if(SplCommitteeCodes.contains(committeecode.trim())) { %>
<div class="panel panel-info">
	
	<div class="panel-heading">
    	
    	<h4 class="panel-title">
           <span  style="font-size:14px">7. Attachment</span>
           <%if(MomAttachment!=null) {%>     
                     <input type="button" class="btn btn-warning btn-sm" id="" onclick="showAttachmentModal()" value="EDIT" style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;float: right">
        
        <%}else{ %>
          <input type="button" class="btn btn-info btn-sm" id="" onclick="showAttachmentModal()" value="ADD" style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;float: right">
        <%} %>
        </h4>
        </div>
        </div>

<%} %> --%>
<!--  New code end-->

<!-- CCM part MOM  -->

<%} else{%>
<%
minutesoutcomelist = minutesoutcomelist!=null && minutesoutcomelist.size()>0 ? minutesoutcomelist.stream().limit(3).collect(Collectors.toList()): null;
int unitcount=1;  long unit=1; String Unit=null; int countloop=100; int form=145;int collapse=140;String temp="0";int form6=565;int form7=123;long scheduleagendaid=0; 
%>

	<div class="panel panel-info">
		
		<div class="panel-heading">
	    	
	    	<h4 class="panel-title">
	           <span  style="font-size:14px"> <%if(dmcFlag!=null) {%> 1<%} else{%> 3<%} %>. Discussion </span>
	        </h4>
	        
	       	<div style="float: right !important; margin-top:-20px; " > 
	       		<%int collapse3=484; %>
	       		<a data-toggle="collapse" data-parent="#accordion" href="#<%=collapse3%><%=collapse%>" > <i class="fa fa-plus" style="color:green" id="5Out<%=scheduleagendaid %>5"></i></a>
	       	</div>
	       	
	    </div>
	      
	  	<div id="<%=collapse3%><%=collapse%>" class="panel-collapse collapse in">
	  	<div class="scrollclass" style="height:200px;overflow-y: auto">
	   <%int unitcount13=1;  long unit13=1; String Unit13=null; int countloop13=100; int form13=4455;int collapse13=140;String temp13=null;int form18=700;
	   if(dis!=null && !dis.isEmpty()){
			for(Object[] hlod:dis){
				 if("4".equalsIgnoreCase(hlod[0].toString())&&temp.equalsIgnoreCase(hlod[3].toString())&&"0".equalsIgnoreCase(hlod[4].toString())){
		
	   %>
	   
	  			<div class="row" style="margin-right: 0px; margin-left: 0px;">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px"><%if(dmcFlag!=null) {%> 1<%} else{%> 3<%} %>.<%=unit13 %>.
	          						<!-- newly added by sankha  on 12/10 -->
	          						<%if(hlod[5].toString().length()>30) {%>    
										<%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()).substring(0,20) +"...":" - "%>
									<%}else{ %>
										    <%=hlod[5]!=null?StringEscapeUtils.escapeHtml4(hlod[5].toString()): " - " %>
									<%} %></span>
									<!-- end -->      						
	          						<span style="color:crimson;font-size:11px;" onclick="showModal('<%=hlod[5].toString()%>')"> (<%=hlod[8]!=null?StringEscapeUtils.escapeHtml4(hlod[8].toString()): " - " %>)</span>  </h4>
	       						<div   style="float: right !important; margin-top:-23px; ">
								 	<table style="text-align: center;" >
						     			<thead>
							             	<tr>
							                 	<th ></th>       
							             	</tr>
							         	 </thead>
							         	<tbody>
							         	
							         	
						
						      	
						      				<tr>
						
									      		<td style="max-width:120px;  font-size:small; font-weight:bold; overflow: hidden; word-break: break-word !important; white-space: normal !important;"> 
									      			<form  id="myForm<%=temp %>R<%=form13 %>" action="MinutesSpecEdit.htm" method="post">
									                	
									                		<input type="hidden" name="specname" value="Discussion">
									                		<input type="hidden" name="scheduleid"	value="<%=hlod[6] %>" />
															<input type="hidden" name="minutesid"	value="<%=hlod[0] %>" />
															<input type="hidden" name="scheduleminutesid" 	value="<%=hlod[1] %>" /> 
										                    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
									                    	<input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>R<%=form18 %>" />
															<input class="form-control" type="hidden" name="unit1" value="#5Out<%=scheduleagendaid %>" readonly="readonly">				
									          			<input type="submit" class="btn btn-warning btn-sm"  id="rm<%=form7 %><%=temp %>R<%=form18 %>" onclick="FormNameEditA('myForm<%=temp %>R<%=form13 %>')" value="EDIT"  style="width:44px; height: 24px; font-size:10px; font-weight: bold; text-align: justify;"   />
									          			
									       			</form>
									      		</td>
									      		
						      				</tr>
						       			</tbody>
						      	
						      		</table>
	      							<br>
	      		
	       						</div>
	       			
	       		
	           				</div>
	  					</div>
					</div>
				</div>
				
	<%unitcount13++;countloop++;form13++;form18++;unit13++;}}}%>
	</div>
	
	   			<div class="row">  
	   				<div class="col-md-11"  align="left"  style="margin-left: 10px;">
	     				<div class="panel panel-info">
	      					<div class="panel-heading">
	       						<form action="ScheduleMinutesUnitEdit.htm" method="post"  id="myForm<%=form6 %><%=temp %>R<%=form18 %>">
	        					<h4 class="panel-title">
	          						<span  style="font-size:14px"><%if(dmcFlag!=null) {%> 1<%} else{%> 3<%} %>.<%=unit13 %>.</span>  </h4>
	          						<div style="margin-top:-22px; margin-left: 55px;">
	          							<select  name="OutComesId" id="OutComesId" required="required"  data-live-search="true"  style="width: 165px;"  >
	                                        <%for(Object[] obj:minutesoutcomelist){ %>	
												<option value="<%=obj[0]%>"><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - "%></option>	
											<%} %>
										</select>
	          						
	          						
	          						
	          						
	          						</div>
	          						<div style="margin-top:-26px; margin-left: 240px;">
	          						<input type="submit" class="btn btn-info btn-sm" name="sub"  id="rm<%=form7 %><%=temp %>R<%=form18 %>" value="ADD" onclick="FormNameA('myForm<%=form6 %><%=temp %>R<%=form18 %>')" style="width:42px ;height: 22px; font-size:10px; font-weight: bold; text-align: justify; "/>
	          						

	        					    </div>
	        					    <input type="hidden" name="specname" value="Discussion">
	        					    <input class="form-control" type="hidden" name="agendasubid" value="0" readonly="readonly">
									<input class="form-control" type="hidden" name="minutesid" value="4" readonly="readonly">
									<input class="form-control" type="hidden" name="scheduleagendaid" value="<%=scheduleagendaid %>" readonly="readonly">
	        					    <input class="form-control" type="hidden" name="committeescheduleid" value="<%=committscheduleid %>" readonly="readonly">
								    <input type="hidden" name="formname" value="rm<%=form7 %><%=temp %>R<%=form18 %>" />
								     <input type="hidden" name="unitid" value="<%=temp %>" />
								    <input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />  
								    <input class="form-control" type="hidden" name="membertype" value="<%=membertype %>" readonly="readonly">
								    <input class="form-control" type="hidden" name="unit1" value="#5Out<%=scheduleagendaid %>" readonly="readonly">
									
	       						</form>
	       					    
	           				</div>
	  					</div>
					</div>
				</div>
	    
			
	  			
	
	     </div>   <!-- Agenda collapse end -->     
	 </div>
<%} %>




<!-- Modal for Attachment -->


<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="attachmentModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
   <div class="modal-header" style="background: #055C9D ;color:white;">
        <h5 class="modal-title" id="exampleModalLabel">Attachment</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
       <div class="modal-body">
    <form action="MomAttachment.htm" enctype="multipart/form-data" action="#" method="post">
  <div class="row">
  <div class="col-md-8">
  <input class="form-control" type="file" id="pdfFile" name="MOMFile" accept=".pdf" required="required">
  </div>
  <div class="col-md-4">
   <%if(MomAttachment!=null) {%>     
<button type="submit" class="btn btn-sm edit" onclick="return confirm('Are you sure to update?')">UPDATE</button>        
        <%}else{ %>
<button type="submit" class="btn btn-sm submit" onclick="return confirm('Are you sure to submit?')">SUBMIT</button>        <%} %>
  
  
  
  <input type="hidden" name="ScheduleId" value=<%=scheduleId %>>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </div>
  </div>
      </form>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">

function showAttachmentModal(){
	
	$('#attachmentModal').modal('show');
}

</script>


		</div><!-- Big card-body end -->
	
	</div><!-- Card End  -->
	
	
	<br>
	
	
	<%if(!committeescheduledata.isEmpty()){ %>
	
	<div class="row">
	
		<div class="col-md-3" >
		
			<form class="" name="assignaction" id="assignaction" action="CommitteeAction.htm" method="post">
	
				<input type="submit" name="sub" class="btn btn-sm add fa-thumbs-up" style="background-color:#0e49b5 !important; " form="assignaction"  value="ASSIGN ACTION &nbsp;&nbsp;&#xf164;"  onclick=""/>
				<input type="hidden" name="ScheduleId" value="<%=committeescheduleeditdata[6] %>">	
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="minutesback" value="minutesback"/>
				<%if(ccmFlag!=null && ccmFlag.equalsIgnoreCase("Y")) {%>
					<input type="hidden" name="ccmScheduleId" value="<%=committeescheduleeditdata[6] %>">
					<input type="hidden" name="committeeMainId" value="<%=committeeMainId %>">
					<input type="hidden" name="committeeId" value="<%=committeeId %>">
					<input type="hidden" name="ccmFlag" value="<%=ccmFlag %>">
				<%} %>
				<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) {%>
					<input type="hidden" name="committeeId" value="<%=committeeId %>">
					<input type="hidden" name="dmcFlag" value="<%=dmcFlag %>">
				<%} %>
			</form>
		
		
		</div>
	</div>
	<%} %>
<div class="row">
	<div class="col-md-12" >
		<div class="card" style="border-color:#00DADA  ;margin-top: 2%;" >
    		<div class="card-body" style="margin-top: -8px" >       	
				<b style="color: #346691; font-size: 20px;font-family: 'Lato',sans-serif; "></b> 
				<hr><br>				
					<%if(minutesattachmentlist.size()>0){ %>
						<div class="card-body" style="margin-top: -8px" >       	
							<table class="table table-bordered table-hover table-striped table-condensed" >					
									<tr>
										<td><%=minutesattachmentlist.get(0)[2] %></td>
										<td><%if(minutesattachmentlist.get(0)[2].toString().endsWith(".pdf")) {%>
											<div  align="center">
												<a  href="MinutesAttachDownloadprotected.htm?attachmentid=<%=minutesattachmentlist.get(0)[0]%>"  data-toggle="tooltip" data-placement="top" title="Protected PDF"
												  target="_blank" data-trigger="hover"  ><i class="fa fa-download" style="color:#DF4646;"></i></a>
											</div>
											<%} %>
										</td>
										<td>
											<div  align="center">
												<a  href="MinutesAttachDownload.htm?attachmentid=<%=minutesattachmentlist.get(0)[0]%>" 
												  target="_blank"><i class="fa fa-download"></i></a>
											</div>						
										</td>
										<td>
											<form method="post" action="MinutesAttachmentDelete.htm">
												<button class="fa fa-trash btn  " type="submit" onclick="return confirm('Are You Sure To Delete this File?');" style="margin-right: -30px"></button>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<input type="hidden" name="ScheduleId" value="<%=committeescheduleeditdata[6] %>">
												<input type="hidden" name="attachmentid" value="<%=minutesattachmentlist.get(0)[0] %>">
												<%if(ccmFlag!=null && ccmFlag.equalsIgnoreCase("Y")) {%>
													<input type="hidden" name="ccmScheduleId" value="<%=committeescheduleeditdata[6] %>">
													<input type="hidden" name="committeeMainId" value="<%=committeeMainId %>">
													<input type="hidden" name="committeeId" value="<%=committeeId %>">
													<input type="hidden" name="ccmFlag" value="<%=ccmFlag %>">
												<%} %>
												<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) {%>
													<input type="hidden" name="committeeId" value="<%=committeeId %>">
													<input type="hidden" name="dmcFlag" value="<%=dmcFlag %>">
												<%} %>
											</form>									
										</td>
									</tr>
								
							</table>
						</div>
					<%} %>
				<form method="post" action="MinutesAttachment.htm" enctype="multipart/form-data" id="attachmentfrm" name="attachmentfrm" >					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="ScheduleId" value="<%=committeescheduleeditdata[6] %>"> 
					<%if(ccmFlag!=null && ccmFlag.equalsIgnoreCase("Y")) {%>
						<input type="hidden" name="ccmScheduleId" value="<%=committeescheduleeditdata[6] %>">
						<input type="hidden" name="committeeMainId" value="<%=committeeMainId %>">
						<input type="hidden" name="committeeId" value="<%=committeeId %>">
						<input type="hidden" name="ccmFlag" value="<%=ccmFlag %>">
					<%} %>
					<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) {%>
						<input type="hidden" name="committeeId" value="<%=committeeId %>">
						<input type="hidden" name="dmcFlag" value="<%=dmcFlag %>">
					<%} %>
					<table>
						<tr>
							<td>
								<input type="file" name="FileAttach" id="FileAttach" required  class="form-control" aria-describedby="inputGroup-sizing-sm" maxlength="255" form="attachmentfrm" accept=".pdf"  onchange="Filevalidation('FileAttach');" />
							</td>
							<td>&nbsp;</td>
							<td>		
								<%if( minutesattachmentlist.size()==0){ %>						
									<input type="submit" name="sub" class="btn  btn-sm submit"  value="SUBMIT" onclick="return editcheck('FileAttach');" />
								<%}else if(minutesattachmentlist.size()>0){ %>
									<input type="hidden" name="attachmentid" value="<%=minutesattachmentlist.get(0)[0]%>"/>
									<input type="submit" name="sub" class="btn  btn-sm edit"  value="EDIT" onclick="return editcheck1('FileAttach');" />
								<%} %>
							</td>
						</tr>
					</table>
				</form>				
			</div>			
		</div>
	</div>
</div>
				
		
		
	

	
	
	
	
	
</div> <!-- col-md-5 end -->





<div class="col-md-7">
	
	<div class="card" style="margin-top: 2%;">
    	<div class="card-body">
    		<%if(dmcFlag==null) {%>
            <form name="specadd" id="specadd" action="CommitteeMinutesSubmit.htm" method="post">
  
   				<div class="row"  style="margin-bottom: 10px;">
   					
   					<div class="col-md-12"  align="left">
						<label>
						<b id="iditemspec" style="font-size:18px " ></b>
						<b id="iditemsubspecofsub" style="font-size:18px " ></b>
						<b id="iditemsubspec" style="font-size:18px " ></b>
						<b id="iditemunit" style="font-size:18px " ></b>

							<input class="form-control" type="hidden" name="minutesid" id="minutesidadd" >
							<input class="form-control" type="hidden" name="agendasubid" id="agendasubidadd" >
							<input class="form-control" type="hidden" name="scheduleagendaid" id="scheduleagendaidadd" >
							<input class="form-control" type="hidden" name="specname" id="specnameadd" >
							<input class="form-control" type="hidden" name="minutesunitid" id="minutesunitidadd" >
							<input class="form-control" type="hidden" name="statusflag" value="D" readonly="readonly">
							<!--  for redirecting-->
							<input class="form-control" type="hidden" name="unit1" id="unit1idadd" readonly="readonly">
							<input class="form-control" type="hidden" name="formname" id="formnameadd" >
							
							<input class="form-control" type="hidden" name="scheduleidedit" id="scheduleidedit" >
							<input class="form-control" type="hidden" name="minutesidedits" id="minutesidedit" >
							<input class="form-control" type="hidden" name="schedulminutesid" id="scheduleminutesidedit" >
							
						</label>
					</div>
   					
   					<div class="col-md-12"  align="left" style="margin-left: 0px;width:100%;margin-top: -25px ">
						<label style="margin-left: 50px;"></label>
						<div   id="summernote" class="center">
						 
						</div>
						 <textarea  name="NoteText" id="editor1" style="display:none;"></textarea>
					</div>

  					
  
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
		 			<div class="col-md-12"  align="left" style="margin-left: 0px;width:100% ">
    					
    					<div class="card"  style="margin-top: 15px;">
            				<div class="card-body" style="background-color: #f7f7f7;">
  								
  								
  								<div align="center" id="drcdiv"  style="margin-top: 10px;">
  								
  									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="darc" id="decision" value="D">
									  <label class="form-check-label" for="decision">Decision</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="darc" id="recommendation" value="R">
									  <label class="form-check-label" for="recommendation">Recommendation</label>
									</div>
									
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="darc" id="comments" value="C">
									  <label class="form-check-label" for="comments">Comments</label>
									</div>
  								
  								</div>
 
  								<div class="form-group">
  									<label class="">Remarks : </label>
  									<input  class="form-control"  type="text" maxlength="255"  placeholder="Nil" name="remarks" id="remarks" style="width:80%">
  								
                        		</div>
  
								<div align="center" style="margin-top: -25px;">
									<br>
									
									<br>
																	
 										<input type="submit" name="sub" class="btn  btn-sm submit" form="specadd"  id="adding" value="SUBMIT"  />
								  		<input type="submit" name="sub" class="btn  btn-sm submit" form="specadd" id="editing"  value="SUBMIT" formaction="CommitteeMinutesEditSubmit.htm" onclick="return confirm('Are you sure To Submit?')"/>
										<input type="submit" name="sub" hidden="hidden" form="specadd" id="hiddensubmit">
										<input type="hidden" name="scheduleid" value="<%=committeescheduleeditdata[6] %>">	
										<input type="hidden" name="schedulesubid" value="1" readonly="readonly">
										<input type="hidden" name="membertype" value="<%=membertype %>" readonly="readonly">
										<input type="hidden" name="committeename" value="<%=committeescheduleeditdata[8]%>">
										
										<%if(ccmFlag!=null && ccmFlag.equalsIgnoreCase("Y")) {%>
											<input type="hidden" name="ccmScheduleId" value="<%=committeescheduleeditdata[6] %>">
											<input type="hidden" name="committeeMainId" value="<%=committeeMainId %>">
											<input type="hidden" name="committeeId" value="<%=committeeId %>">
											<input type="hidden" name="ccmFlag" value="<%=ccmFlag %>">
										<%} %>
								</div>
  							</div>
  						</div>
					</div>
  
 				</div>  

	 		</form>
	 		<%} %>
	 		
	 		<!-- AIR -->
	 		<%if(dmcFlag!=null) {%>
	 			<form action="#">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"  />
					<input type="hidden" name="committeeIdDMC" value="<%=committeeId %>">
					<input type="hidden" name="committeeId" value="<%=committeeId %>">
					<input type="hidden" name="committeeScheduleId" value="<%=committscheduleid %>">
					<input type="hidden" name="dmcFlag" value="Y">
					<div class="row mb-3">
						
						<div class="col-md-2 ">
							<label class="">Schedule Date: </label>
						</div>
						<div class="col-md-3 ">
							<input type="text" class="form-control" name="meetingDate" id="meetingDate" <%if(committeescheduleeditdata!=null) {%>value="<%=sdf.format(sdf1.parse(committeescheduleeditdata[2].toString())) %>"<%} %> style="height: 32px;" readonly>
						</div>
						
						<div class="col-md-2 left">
							<button type="submit" class="btn btn-sm fw-bold edit mr-2" name="action" value="Edit" formmethod="post" formaction="DCMScheduleDetailsSubmit.htm" onclick="return confirm('Are you Sure to Update Schedule?')">
								Update
							</button>
						</div>
						
					</div>
					
				</form>
				<hr class="mb-2">
	 		<%} %>
	 		<form name="specadd" id="specair" action="CommitteeMinutesSubmit.htm" method="post" <%if(dmcFlag!=null) {%>style="display: none;"<%} %> >
  
   				<div class="row"  style="margin-bottom: 10px;">
   					
   					<div class="col-md-12"  align="left">
						<label>
						<b id="iditemspecair" style="font-size:18px " ></b>
						<b id="iditemsubspecofsubair" style="font-size:18px " ></b>
						<b id="iditemsubspecair" style="font-size:18px " ></b>
						<b id="iditemair" style="font-size:18px " ></b>
						<b id="outcomeair" style="font-size:18px " ></b>

							<input class="form-control" type="hidden" name="minutesid" id="minutesidair" >
							<input class="form-control" type="hidden" name="agendasubid" id="agendasubidair" >
							<input class="form-control" type="hidden" name="scheduleagendaid" id="scheduleagendaidair" >
							<input class="form-control" type="hidden" name="specname" id="specnameair" >

							<!--  for redirecting-->
							<input class="form-control" type="hidden" name="formname" id="formnameair" >
							<input class="form-control" type="hidden" name="unit1" id="unit1idair" readonly="readonly">
				
							
							<input class="form-control" type="hidden" name="scheduleidedit" id="scheduleideditair" >
							<input class="form-control" type="hidden" name="minutesidedits" id="minutesideditair" >
							<input class="form-control" type="hidden" name="schedulminutesid" id="scheduleminutesideditair" >
							
						</label>
					</div>
   					
   					<div class="col-md-12"  align="left" style="margin-left: 0px;width:100%;">
						<label >Action Name</label>

						 <textarea class="form-control" required="required"  name="NoteText" id="editorair" style="width:100%;height: 140px;" maxlength="5000"></textarea>
					</div>

  					
  
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
		 			<div class="col-md-12"  align="left" style="margin-left: 0px;width:100% ">
    					
    					<div class="card"  style="margin-top: 15px;">
            				<div class="card-body" style="background-color: #f7f7f7;">
                             <div class="row" >
                             <div class="col-md-8">
  								<div class="form-group">
  									<label class="">Remarks : </label>
  									<input  class="form-control"  type="text" maxlength="255"  placeholder="Nil" name="remarks" id="remarksair" style="width:100%">
                        		</div>
                        		</div>
                        		  <div class="col-md-4" id="OutComeDiv">
                        		<div class="form-group">
                        		<label class="">Outcome Type </label>
  	                               <select  class="form-control" name="darc" id="OutComeAir" required="required"  data-live-search="true"  >
                                        <%for(Object[] obj:minutesoutcomelist){ %>	
																	
											<option value="<%=obj[0]%>"><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - "%></option>	
															
										<%} %>
									</select>
								</div>
								</div>
								
								  <div class="col-md-4" id="PresDiscHeader">
                        		<div class="form-group">
                        		<label class="">Header </label>
  	                               <input type="text" class="form-control" name="PresDiscHeaderVal" value="" id="PresDiscHeaderVal" maxlength="100">
								</div>
								</div>
								
								</div>							
								<div align="center" style="margin-top: -25px;">
									<br>
									<br>
 										<input type="submit" name="sub" class="btn  btn-sm submit" form="specair"  id="addingair" value="SUBMIT"  />
								  		<input type="submit" name="sub" class="btn  btn-sm submit" form="specair" id="editingair"  value="SUBMIT" formaction="CommitteeMinutesEditSubmit.htm" onclick="return confirm('Are you sure To Submit?')"/>
								  		<input type="submit" name="sub" class="btn  btn-sm submit" style="background-color: #dc3545; border-color: #dc3545;" form="specair" id="deletingair"  value="DELETE" formaction="CommitteeMinutesDeleteSubmit.htm" onclick="return confirm('Are you sure To Submit?')"/>
										<input type="submit" name="sub" hidden="hidden" form="specadd" id="hiddensubmit">
										<input type="hidden" name="scheduleid" value="<%=committeescheduleeditdata[6] %>">	
										<input type="hidden" name="schedulesubid" value="1" readonly="readonly">
										<input type="hidden" name="membertype" value="<%=membertype %>" readonly="readonly">
										<input type="hidden" name="committeename" value="<%=committeescheduleeditdata[8]%>">
										<input type="hidden" name="OutComeAirHead"  id="OutComeAirHead" value="">
										
										<%if(ccmFlag!=null && ccmFlag.equalsIgnoreCase("Y")) {%>
											<input type="hidden" name="ccmScheduleId" value="<%=committeescheduleeditdata[6] %>">
											<input type="hidden" name="committeeMainId" value="<%=committeeMainId %>">
											<input type="hidden" name="committeeId" value="<%=committeeId %>">
											<input type="hidden" name="ccmFlag" value="<%=ccmFlag %>">
										<%} %>
										
										<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) {%>
											<input type="hidden" name="committeeId" value="<%=committeeId %>">
											<input type="hidden" name="dmcFlag" value="<%=dmcFlag %>">
										<%} %>
								</div>
  							</div>
  						</div>
					</div>  
 				</div>  
	 		</form>	 		
  		</div> 
	</div>	
</div>
<!-- col-md-7 end -->


</div> <!-- main row end -->

</div>
<%} else{%>
	<div class="centered-card" style="  display: flex;justify-content: center;align-items: center;height: 70vh;">
	<div class="card" >
  	<div class="card-body" style="height:20vh;display: flex;align-items: center;justify-content: center;">
  	<div style="font-size: 1.25rem;font-weight: 600; color: crimson; text-shadow: 2px 2px 2px skyblue">MOM already freezed. If you want to edit please unfreeze it. </div>
  	</div>
  	<div class="mb-2" align="center">
  	<form class="form-inline" method="GET" action="CommitteeMinutesViewAllDownload.htm"  name="myfrm" id="myfrm"> 
	<%if(SplCommitteeCodes.stream().anyMatch(x -> x.trim().equalsIgnoreCase(committeecode.trim())) && Long.parseLong(projectid)>0){ %>
	<!--<input type="submit" class="btn  btn-sm view" value="DPFM L" formaction="CommitteeMinutesNewDfm.htm" formmethod="get" formtarget="_blank" style="background-color:#0e49b5 ;color:white ;font-size:12px;" /> -->
	<button type="submit" class="btn  btn-sm view"  formaction="CommitteeMinutesNewDownload.htm" formmethod="get" formtarget="_blank" style="background-color:#0e49b5 ;color:white ;font-size:12px;">MINUTES
	<i class="fa fa-download blink" aria-hidden="true" style="color:white;"></i>
	</button>&nbsp;&nbsp;
	
	<%}%>
	<input type="hidden" name="isFrozen" value="<%=committeescheduleeditdata[22]%>">
	<input type="hidden" name="committeescheduleid" value="<%=committeescheduleeditdata[6]%>">
	<input type="hidden" name="scheduleid" value="<%=committeescheduleeditdata[6]%>">
	<input type="hidden" name="membertype" value="<%=membertype%>">
	</form>
	</div> 
	<div class="row">
	<div class="col-md-12" >
		<div class="card" style="margin-top: 2%;border:0px!important;" >
    		<div class="card-body" style="margin-top: -8px" >       	
				<b style="color: #346691; font-size: 14px;font-family: 'Lato',sans-serif; ">Upload Signed MOM :</b> 
				<br>				
				<%if(minutesattachmentlist.size()>0){ %>
						<div class="card-body" style="margin-top: -8px" >       	
							<table class="table table-bordered table-hover table-striped table-condensed" >					
									<tr>
										<td><%=minutesattachmentlist.get(0)[2]!=null?StringEscapeUtils.escapeHtml4(minutesattachmentlist.get(0)[2].toString()): " - " %></td>
										<td>
											
											<div  align="center">
												<a  href="MinutesAttachDownload.htm?attachmentid=<%=minutesattachmentlist.get(0)[0]%>" 
												  target="_blank"><i class="fa fa-download"></i></a>
											</div>						
										</td>
										<td>
											<form method="post" action="MinutesAttachmentDelete.htm">
												<button class="fa fa-trash btn  " type="submit" onclick="return confirm('Are You Sure To Delete this File?');" style="margin-right: -30px"></button>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<input type="hidden" name="ScheduleId" value="<%=committeescheduleeditdata[6] %>">
												<input type="hidden" name="attachmentid" value="<%=minutesattachmentlist.get(0)[0] %>">
											</form>									
										</td>
									</tr>
								
							</table>
						</div>
					<%} %>
				<form method="post" action="MinutesAttachment.htm" enctype="multipart/form-data" id="attachmentfrm" name="attachmentfrm" >					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="ScheduleId" value="<%=committeescheduleeditdata[6] %>">
					<%if(ccmFlag!=null && ccmFlag.equalsIgnoreCase("Y")) {%>
						<input type="hidden" name="ccmScheduleId" value="<%=committeescheduleeditdata[6] %>">
						<input type="hidden" name="committeeMainId" value="<%=committeeMainId %>">
						<input type="hidden" name="committeeId" value="<%=committeeId %>">
						<input type="hidden" name="ccmFlag" value="<%=ccmFlag %>">
					<%} %>
					<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) {%>
						<input type="hidden" name="committeeId" value="<%=committeeId %>">
						<input type="hidden" name="dmcFlag" value="<%=dmcFlag %>">
					<%} %>
					<table>
						<tr>
							<td>
								<input type="file" name="FileAttach" id="FileAttach" required  class="form-control" aria-describedby="inputGroup-sizing-sm" maxlength="255" form="attachmentfrm"  onchange="Filevalidation('FileAttach');" />
							</td>
							<td>&nbsp;</td>
							<td>		
								<%if( minutesattachmentlist.size()==0){ %>						
									<input type="submit" name="sub" class="btn  btn-sm submit"  value="SUBMIT" onclick="return editcheck('FileAttach');" />
								<%}else if(minutesattachmentlist.size()>0){ %>
									<input type="hidden" name="attachmentid" value="<%=minutesattachmentlist.get(0)[0]%>"/>
									<input type="submit" name="sub" class="btn  btn-sm edit"  value="EDIT" onclick="return editcheck1('FileAttach');" />
								<%} %>
							</td>
						</tr>
					</table>
				</form>		
	
			</div>			
		</div>
	</div>
</div>
</div>
</div>


	

<%} %>


<!-- Modal to give remarks and show remarks   -->
	<div class="modal fade" id="chatModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 200%; margin-left: -50%;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="chat-container d-flex flex-column">

						<!-- Scrollable chat body -->
						<div class="chat-body flex-grow-1 overflow-auto px-3 py-2" id="messageEditor">

						</div>

						<!-- Fixed input section -->
						<div class="chat-input border-top p-3 bg-white">

							<div class="form-group mb-2">
								<label for="Remarks"><strong>Comment:</strong></label>
								<textarea rows="2" class="form-control" id="RemarksEdit"
									name="Remarks" placeholder="Enter Comments" required></textarea>
							</div>
							<div class="text-center">
								<input type="button" class="btn btn-primary btn-sm submit"
									value="Submit" name="sub" onclick="submitRemarks()"> 
									
								<!-- <input type="button" class="btn btn-danger btn-sm delete"
									value="Close" name="sub"
									onclick="return confirm('Are You Sure To Close?')"> -->
							</div>


						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
<script type="text/javascript">

function editcheck(editfileid)
{
	const fi = $('#'+editfileid )[0].files[0].size;							 	
    const file = Math.round((fi / 1024/1024));
    if (document.getElementById(editfileid).files.length !=0 && file >= <%=filesize%> ) 
    {
    	event.preventDefault();
     	alert("File too Big, please select a file less than <%=filesize%> mb");
    } else
    {
    	 return confirm('Are You Sure To Upload Minutes File ?');
    }
}


</script>

<script type="text/javascript">
function editcheck1(editfileid)
{
	const fi = $('#'+editfileid )[0].files[0].size;							 	
    const file = Math.round((fi / 1024/1024));
    if (document.getElementById(editfileid).files.length !=0 && file >= <%=filesize%> ) 
    {
    	event.preventDefault();
     	alert("File too Big, please select a file less than <%=filesize%> mb");
    } else
    {
    	return confirm('Are You Sure To Edit Minutes File ?');
    }
}



</script>




		<script type="text/javascript">
						
			    function Filevalidation (fileid)  
			    {
			        const fi = $('#'+fileid )[0].files[0].size;							 	
			        const file = Math.round((fi / 1024/1024));
			        if (file >= <%=filesize%>) 
			        {
			        	alert("File too Big, please select a file less than <%=filesize%> mb");
			        } 
			    }
						
		</script>
						



<script>
  
    $(document).ready(function(){
        // Add minus icon for collapse element which is open by default
        $(".collapse.show").each(function(){
        	$(this).prev(".panel-heading").find(".fa").addClass("fa-minus").removeClass("fa-plus");
        });
        
        // Toggle plus minus icon on show hide of collapse element
        $(".collapse").on('show.bs.collapse', function(){
        	$(this).prev(".panel-heading").find(".fa").removeClass("fa-plus").addClass("fa-minus");
        }).on('hide.bs.collapse', function(){
        	$(this).prev(".panel-heading").find(".fa").removeClass("fa-minus").addClass("fa-plus");
        });
    });
    
    $(document).ready(function(){
        // Add minus icon for collapse element which is open by default
        $(".collapse.show").each(function(){
        	$(this).prev(".panel-heading").find(".btn").addClass("btn-danger btn-sm").removeClass("btn-info btn-sm");
        });
        
        // Toggle plus minus icon on show hide of collapse element
        $(".collapse").on('show.bs.collapse', function(){
        	$(this).prev(".panel-heading").find(".btn").removeClass("btn-info btn-sm").addClass("btn-danger btn-sm");
        }).on('hide.bs.collapse', function(){
        	$(this).prev(".panel-heading").find(".btn").removeClass("btn-danger btn-sm").addClass("btn-info btn-sm");
        });
    });
   
    unitt="<%=unit3 %>";
    unitnew="<%=unit21%>";
    

    var regex = /\d+/g;
    var matches = unitt.match(regex);
    
	if(matches!=null){
		if("5"==matches){
			$("#OutCome5").click();	
		}else{
			
			$("#agendaclick").click();	
			unitt=unitt.slice(1);
			$("."+unitt).click();
			$("#"+unitt+'5').click();
		}
	}   
    
	
	function checklength(id){
		
		$('#'+id).on('change', function() { 
	        if($(this).is(':checked')) 
	        {
	        	var data =CKEDITOR.instances['summernote'].getData();
	        	if(data.length>1024){
	        		alert('Maximum number of characters for Action, Issue and Risk is 1024 . Characters entered by you is ' + data.length + '.');
					$(this).prop("checked", false);
				}
	        	
	        }
	    });
	}
	

 
</script>
	

 <script type="text/javascript">
	 
	
	  $('#specadd').submit(function() {
		  
		  var data =CKEDITOR.instances['summernote'].getData();
		  $('textarea[name=NoteText]').val(data);

		  if($('#issue').is(':checked')) 
		    {
				var data =CKEDITOR.instances['summernote'].getData();
				if(data.length>1024){
					alert('Maximum number of characters for Action, Issue and Risk is 1024 . Characters entered by you is ' + data.length+ '.');
					event.preventDefault();
				}
				
			}
			if($('#risk').is(':checked')) 
		    {
				var data =CKEDITOR.instances['summernote'].getData();
				if(data.length>1024){
					alert('Maximum number of characters for Action, Issue and Risk is 1024 . Characters entered by you is ' + data.length+ '.');
					event.preventDefault();
				}
				
			}
			if($('#action').is(':checked')) 
		    {
				var data =CKEDITOR.instances['summernote'].getData();
				if(data.length>1024){
					alert('Maximum number of characters for Action, Issue and Risk is 1024 . Characters entered by you is ' + data.length+ '.');
					event.preventDefault();
				}
				
			}
			

			    if ( $('input:radio', this).is(':checked')) {
			  
			    } else {
			        
			    	alert('Kindly select a action item !');
			        
			        return false;
			    }
			
		  
      });
	  
	  
	  function FormNameB(formId) {
    	  $("#"+formId).submit(function(event){
    		    event.preventDefault();
    		    $('#editingair').hide();
    		    $('#deletingair').hide();
    		    $('#addingair').show();
    		    $('#specadd').hide();
    		    $('#specair').show();
    		    $('#OutComeDiv').hide();
    		    $('#PresDiscHeader').hide();
    		    var minutesidadd = $("input[name='minutesid']",this).val();
    		    var specnameadd= $("input[name='specname']",this).val();
    		    var agendasubidadd= $("input[name='agendasubid']",this).val();
    		    var scheduleagendaidadd= $("input[name='scheduleagendaid']",this).val();
    		    var formnameadd= $("input[name='formname']",this).val();
    		    var type=$("#OutComesId",this).val();
    		    var unit1idadd= $("input[name='unit1']",this).val();
    		 
    		    $("#minutesidair").val(minutesidadd);
    		    $("#specnameair").val(specnameadd);
    		    $("#agendasubidair").val(agendasubidadd);
    		    $("#scheduleagendaidair").val(scheduleagendaidadd);
    		    $("#formnameair").val(formnameadd);
    		    $("#unit1idair").val(unit1idadd);
    		    $.ajax({
    				type : "GET",
    				url : "CommitteeMinutesSpecAdd.htm",
    				data : {
    					
    					minutesid : minutesidadd,
    					specname:specnameadd,
    					agendasubid:agendasubidadd,
    					scheduleagendaid:scheduleagendaidadd,
    					formname:formnameadd,
    					
    				},
    				datatype : 'json',
    				success : function(result) {
    					
    					var result = JSON.parse(result);
    					var values = Object.keys(result).map(function(e) {
    						  return result[e]
    						});

    						if(scheduleagendaidadd==0){
    						document.getElementById('iditemsubspecofsubair').innerHTML = "" ;
        					}	
    						
							if(scheduleagendaidadd!=0){
    						document.getElementById('iditemsubspecofsubair').innerHTML = " / " + values[4]; 
        					}
							
		
							if(agendasubidadd==0){
	    						
	    						document.getElementById('iditemsubspecair').innerHTML = "";
	        				}
    						if(agendasubidadd!=0){
    						
    						document.getElementById('iditemsubspecair').innerHTML = " / " + values[3]; 
        					}
    						
    						
    					document.getElementById('iditemspecair').innerHTML = values[1];

    					$("#remarksair").val('');
    					$("#OutComeAirHead").val(type);
    					$("#editorair").val('');
    					$("#OutComeAir").val('C');
    					document.getElementById('outcomeair').innerHTML = " / "+type;
     					

      	  		         	 
    				}
    			});
    		   
    		  });
    	  

    }  

	  function FormNameA(formId) {
	
		  
    	  $("#"+formId).submit(function(event){
    		    event.preventDefault();
    		    $('#editingair').hide();
    		    $('#deletingair').hide();
    		    $('#addingair').show();
    		    $('#specadd').hide();
    		    $('#specair').show();
    		    $('#OutComeDiv').hide();
    		    $('#PresDiscHeader').hide();
    		    var minutesidadd = $("input[name='minutesid']",this).val();
    		    var specnameadd= $("input[name='specname']",this).val();
    		    var agendasubidadd= $("input[name='agendasubid']",this).val();
    		    var scheduleagendaidadd= $("input[name='scheduleagendaid']",this).val();
    		    var formnameadd= $("input[name='formname']",this).val();
    		    var type=$("select[name='OutComesId']",this).val();
    		    var unit1idadd= $("input[name='unit1']",this).val();
    		 
    		    $("#minutesidair").val(minutesidadd);
    		    $("#specnameair").val(specnameadd);
    		    $("#agendasubidair").val(agendasubidadd);
    		    $("#scheduleagendaidair").val(scheduleagendaidadd);
    		    $("#formnameair").val(formnameadd);
    		    $("#unit1idair").val(unit1idadd);
    		    $.ajax({
    				type : "GET",
    				url : "CommitteeMinutesSpecAdd.htm",
    				data : {
    					
    					minutesid : minutesidadd,
    					specname:specnameadd,
    					agendasubid:agendasubidadd,
    					scheduleagendaid:scheduleagendaidadd,
    					formname:formnameadd,
    					
    				},
    				datatype : 'json',
    				success : function(result) {
    					
    					var result = JSON.parse(result);
    					var values = Object.keys(result).map(function(e) {
    						  return result[e]
    						});

    						if(scheduleagendaidadd==0){
    						document.getElementById('iditemsubspecofsubair').innerHTML = "" ;
        					}	
    						
							if(scheduleagendaidadd!=0){
    						document.getElementById('iditemsubspecofsubair').innerHTML = " / " + values[4]; 
        					}
							
		
							if(agendasubidadd==0){
	    						
	    						document.getElementById('iditemsubspecair').innerHTML = "";
	        				}
    						if(agendasubidadd!=0){
    						
    						document.getElementById('iditemsubspecair').innerHTML = " / " + values[3]; 
        					}
    						
    						
    					document.getElementById('iditemspecair').innerHTML = values[1];

    					$("#remarksair").val('');
    					$("#OutComeAir").val(type);
    					$("#editorair").val('');
    					if(type=="D"){
    						document.getElementById('outcomeair').innerHTML = " / Decision";
     					}
     					else if(type=="A"){
     						document.getElementById('outcomeair').innerHTML = " / Action";
     	  		        }
     					else if(type=="R"){
     						document.getElementById('outcomeair').innerHTML = " / Recommendation";
     					}
     					else if(type=="C"){
     						document.getElementById('outcomeair').innerHTML = " / Comment";
     					}
     					else if(type=="I"){
     						document.getElementById('outcomeair').innerHTML = " / Issue";
     					}
     					else if(type=="K"){
     						document.getElementById('outcomeair').innerHTML = " / Risk";
     					}

      	  		         	 
    				}
    			});
    		   
    		  });
    	  

    }  

    function FormName(formId) {
    	  $("#"+formId).submit(function(event){
    		    event.preventDefault();
    		    $('#editing').hide();
    		    $('#adding').show();
    		    $('#specadd').show();
    		    $('#specair').hide();
    		    var minutesidadd = $("input[name='minutesid']",this).val();
    		    var specnameadd= $("input[name='specname']",this).val();
    		    var agendasubidadd= $("input[name='agendasubid']",this).val();
    		    var scheduleagendaidadd= $("input[name='scheduleagendaid']",this).val();
    		    var unit1idadd= $("input[name='unit1id']",this).val();
    		    var formnameadd= $("input[name='formname']",this).val();
    		    
    		    $("#minutesidadd").val(minutesidadd);
    		    $("#specnameadd").val(specnameadd);
    		    $("#agendasubidadd").val(agendasubidadd);
    		    $("#scheduleagendaidadd").val(scheduleagendaidadd);
    		    $("#unit1idadd").val(unit1idadd);
    		    $("#formnameadd").val(formnameadd);
    		    
    		    $.ajax({
    				type : "GET",
    				url : "CommitteeMinutesSpecAdd.htm",
    				data : {
    					
    					minutesid : minutesidadd,
    					specname:specnameadd,
    					agendasubid:agendasubidadd,
    					scheduleagendaid:scheduleagendaidadd,
    					unit1:unit1idadd,
    					formname:formnameadd,
    					
    				},
    				datatype : 'json',
    				success : function(result) {
    					
    					var result = JSON.parse(result);
    					var values = Object.keys(result).map(function(e) {
    						  return result[e]
    						});

    						if(scheduleagendaidadd==0){
    						document.getElementById('iditemsubspecofsub').innerHTML = "" ;
        					}	
    						
							if(scheduleagendaidadd!=0){
    						document.getElementById('iditemsubspecofsub').innerHTML = " / " + values[4]; 
        					}
							
		
							if(agendasubidadd==0){
	    						
	    						document.getElementById('iditemsubspec').innerHTML = "";
	        				}
    						if(agendasubidadd!=0){
    						
    						document.getElementById('iditemsubspec').innerHTML = " / " + values[3]; 
        					}
    						
    					document.getElementById('iditemspec').innerHTML = values[1];
    			
    					
    					CKEDITOR.instances['summernote'].setData();
    					$("#remarks").val('');
    					/* drcdiv */
    					
      						 $("#decision").prop("checked", false);
      	  			         $("#recommendation").prop("checked", false);
      	  		             $("#comments").prop("checked", true); 
      	  		         	 $("#drcdiv").hide();
      	  		        
      	  		         	 
      	  		         if(formId=="myForm34" || formId=="myForm35" || formId=="myForm36"){
      	  	  				CKEDITOR.instances['summernote'].setReadOnly(true);
      	   	  		        }else{
      	   	  		       CKEDITOR.instances['summernote'].setReadOnly(false);
      	   	  		        }    
				
    				}
    			});
    		   
    		  });
    	  

    }  
    
    
    function FormNameEditB(formId, AgendaSubHead) {
  	  $("#"+formId).submit(function(event){
  		    event.preventDefault();
  		  $('#addingair').hide();
  		 $('#editingair').show();
  		 $('#deletingair').show();
  		 $('#specadd').hide();
	       $('#specair').show();
	       $('#OutComeDiv').hide();
	       $('#PresDiscHeader').show();
	       
  		    var itemidadd = $("input[name='scheduleminutesid']",this).val();
  		 	var specnameadd= $("input[name='specname']",this).val();
  		 	var formnameadd= $("input[name='formname']",this).val();
  		 	var unit1idadd= $("input[name='unit1']",this).val();
		 	
  		 	
  		 	$("#specnameair").val(specnameadd);
  		 	$("#formnameair").val(formnameadd);
  		 	$("#unit1idair").val(unit1idadd);
  		 	
  		    $.ajax({
  				type : "GET",
  				url : "CommitteeMinutesSpecEdit.htm",
  				data : {
  					scheduleminutesid : itemidadd,
  					specname:specnameadd,
  					forname:formnameadd,
  					
  				},
  				datatype : 'json',
  				success : function(result) {
  					
  					var result = JSON.parse(result);
  					var values = Object.keys(result).map(function(e) {
  						  return result[e]
  						});
  					
  					$("#scheduleideditair").val(values[2]);	
   		  			$("#minutesideditair").val(values[0]);
   		  		    $("#scheduleminutesideditair").val(values[3]);
   		  		    
   		  			if(values[6]==0){
					document.getElementById('iditemsubspecofsubair').innerHTML = ""; 
					}	
					if(values[6]!=0){
					document.getElementById('iditemsubspecofsubair').innerHTML = " / " + values[8]; 
					}	
   		  		    
					if(values[5]==0){	
					document.getElementById('iditemsubspecair').innerHTML = "";
					}

					if(values[5]!=0){
					document.getElementById('iditemsubspecair').innerHTML = " / " + values[7]; 
					}

  					
  					document.getElementById('iditemspecair').innerHTML = values[4];
	
  					
  					$("#remarksair").val(values[9]);
  					$("#OutComeAir").val(values[10]);
  					$("#editorair").val(values[1]);
  					$("#PresDiscHeaderVal").val(AgendaSubHead);
  					document.getElementById('outcomeair').innerHTML = " / "+AgendaSubHead;
  	  			
  				}
  			});
  		    
  		  });
  	  

  } 
    
    function FormNameEditA(formId) {
    	  $("#"+formId).submit(function(event){
    		    event.preventDefault();
    		  $('#addingair').hide();
    		 $('#editingair').show();
    		 $('#deletingair').show();
    		 $('#specadd').hide();
  	         $('#specair').show();
  	       $('#OutComeDiv').show();
  	     $('#PresDiscHeader').hide();
    		    var itemidadd = $("input[name='scheduleminutesid']",this).val();
    		 	var specnameadd= $("input[name='specname']",this).val();
    		 	var formnameadd= $("input[name='formname']",this).val();
    		 	var unit1idadd= $("input[name='unit1']",this).val();
     		    $("#unit1idair").val(unit1idadd);
    		 	
    		 	$("#specnameair").val(specnameadd);
    		 	$("#formnameair").val(formnameadd);
    		 	$("#unit1idair").val(unit1idadd);
    		 	
    		    $.ajax({
    				type : "GET",
    				url : "CommitteeMinutesSpecEdit.htm",
    				data : {
    					scheduleminutesid : itemidadd,
    					specname:specnameadd,
    					forname:formnameadd,
    					
    				},
    				datatype : 'json',
    				success : function(result) {
    					
    					var result = JSON.parse(result);
    					var values = Object.keys(result).map(function(e) {
    						  return result[e]
    						});
    					
    					$("#scheduleideditair").val(values[2]);	
     		  			$("#minutesideditair").val(values[0]);
     		  		    $("#scheduleminutesideditair").val(values[3]);
     		  		    
     		  			if(values[6]==0){
  					document.getElementById('iditemsubspecofsubair').innerHTML = ""; 
  					}	
  					if(values[6]!=0){
  					document.getElementById('iditemsubspecofsubair').innerHTML = " / " + values[8]; 
  					}	
     		  		    
  					if(values[5]==0){	
  					document.getElementById('iditemsubspecair').innerHTML = "";
  					}

  					if(values[5]!=0){
  					document.getElementById('iditemsubspecair').innerHTML = " / " + values[7]; 
  					}
  					

    					
    					document.getElementById('iditemspecair').innerHTML = values[4];
    					

    					
    					$("#remarksair").val(values[9]);
    					$("#OutComeAir").val(values[10]);
    					$("#editorair").val(values[1]);
    					
    					
    	  			    
    					if(values[10]=="D"){
    						document.getElementById('outcomeair').innerHTML = " / Decision";
     					}
     					else if(values[10]=="A"){
     						document.getElementById('outcomeair').innerHTML = " / Action";
     	  		        }
     					else if(values[10]=="R"){
     						document.getElementById('outcomeair').innerHTML = " / Recommendation";
     					}
     					else if(values[10]=="C"){
     						document.getElementById('outcomeair').innerHTML = " / Comment";
     					}
     					else if(values[10]=="I"){
     						document.getElementById('outcomeair').innerHTML = " / Issue";
     					}
     					else if(values[10]=="K"){
     						document.getElementById('outcomeair').innerHTML = " / Risk";
     					}
    	  			
    				}
    			});
    		    
    		  });
    	  

    } 
   
    function FormNameEdit(formId) {
  	  $("#"+formId).submit(function(event){
  		    event.preventDefault();
  		  $('#adding').hide();
  		 $('#editing').show();
  		$('#specadd').show();
	    $('#specair').hide();
  		    var itemidadd = $("input[name='scheduleminutesid']",this).val();
  		 	var specnameadd= $("input[name='specname']",this).val();
  		 	var formnameadd= $("input[name='formname']",this).val();
  		 	
  		 	
  		 	$("#specnameadd").val(specnameadd);
  		 	$("#formnameadd").val(formnameadd);
  		 	
  		    $.ajax({
  				type : "GET",
  				url : "CommitteeMinutesSpecEdit.htm",
  				data : {
  					scheduleminutesid : itemidadd,
  					specname:specnameadd,
  					forname:formnameadd,
  					
  				},
  				datatype : 'json',
  				success : function(result) {
  					
  					var result = JSON.parse(result);
  					var values = Object.keys(result).map(function(e) {
  						  return result[e]
  						});
  					
  					$("#scheduleidedit").val(values[2]);	
   		  			$("#minutesidedit").val(values[0]);
   		  		    $("#scheduleminutesidedit").val(values[3]);
   		  		    
   		  			if(values[6]==0){
					document.getElementById('iditemsubspecofsub').innerHTML = ""; 
					}	
					if(values[6]!=0){
					document.getElementById('iditemsubspecofsub').innerHTML = " / " + values[8]; 
					}	
   		  		    
					if(values[5]==0){	
					document.getElementById('iditemsubspec').innerHTML = "";
					}

					if(values[5]!=0){
					document.getElementById('iditemsubspec').innerHTML = " / " + values[7]; 
					}
					

  					
  					document.getElementById('iditemspec').innerHTML = values[4];
  					
  					CKEDITOR.instances['summernote'].setData(values[1]);
  					
  					$("#remarks").val(values[9]);
  					
  					if(values[10]=="D"){
 						 $("#decision").prop("checked", true);
 					}
 					else if(values[10]=="R"){
 						$("#recommendation").prop("checked", true);
 					}
 					else if(values[10]=="C"){
 						$("#comments").prop("checked",true);
 					}
  					$("#drcdiv").hide();
  	  			    
  	  			   if(formId=="myForm34" || formId=="myForm35" || formId=="myForm36"){
  	  				CKEDITOR.instances['summernote'].setReadOnly(true);
   	  		        }else{
   	  		       CKEDITOR.instances['summernote'].setReadOnly(false);
   	  		        }
  	  			
  				}
  			});
  		    
  		  });
  	  

  } 
 
   	
  
    </script>
   
   <script>
CKEDITOR.replace( 'summernote', {
	
	
toolbar: [{
          name: 'clipboard',
          items: ['PasteFromWord', '-', 'Undo', 'Redo']
        },
        {
          name: 'basicstyles',
          items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'Subscript', 'Superscript']
        },
        {
          name: 'links',
          items: ['Link', 'Unlink']
        },
        {
          name: 'paragraph',
          items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
        },
        {
          name: 'insert',
          items: ['Image', 'Table']
        },
        {
          name: 'editing',
          items: ['Scayt']
        },
        '/',

        {
          name: 'styles',
          items: ['Format', 'Font', 'FontSize']
        },
        {
          name: 'colors',
          items: ['TextColor', 'BGColor', 'CopyFormatting']
        },
        {
          name: 'align',
          items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
        },
        {
          name: 'document',
          items: ['Print', 'PageBreak', 'Source']
        }
      ],
     
    removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar',

	customConfig: '',

	disallowedContent: 'img{width,height,float}',
	extraAllowedContent: 'img[width,height,align]',

	height: 380,

	
	contentsCss: [CKEDITOR.basePath +'mystyles.css' ],

	
	bodyClass: 'document-editor',

	
	format_tags: 'p;h1;h2;h3;pre',

	
	removeDialogTabs: 'image:advanced;link:advanced',

	stylesSet: [
	
		{ name: 'Marker', element: 'span', attributes: { 'class': 'marker' } },
		{ name: 'Cited Work', element: 'cite' },
		{ name: 'Inline Quotation', element: 'q' },

		
		{
			name: 'Special Container',
			element: 'div',
			styles: {
				padding: '5px 10px',
				background: '#eee',
				border: '1px solid #ccc'
			}
		},
		{
			name: 'Compact table',
			element: 'table',
			attributes: {
				cellpadding: '5',
				cellspacing: '0',
				border: '1',
				bordercolor: '#ccc'
			},
			styles: {
				'border-collapse': 'collapse'
			}
		},
		{ name: 'Borderless Table', element: 'table', styles: { 'border-style': 'hidden', 'background-color': '#E6E6FA' } },
		{ name: 'Square Bulleted List', element: 'ul', styles: { 'list-style-type': 'square' } }
	]
} );

var genid="<%=GenId%>";
 $(document).ready(function(){

 	 $("#"+genid).click();
 	 
 	 if(unitt.charAt(0)==='#')
 	 {
 	 	$(unitt).click(); 
 	 }
 	 else
 	 {
 		$('#'+unitt).click(); 	 
 	 }
 
 

 	}); 
 
    
   

</script>


<script type='text/javascript'> 
function submitForm(formname)
{ 
  document.getElementById(formname).submit(); 
} 





function showModal(a){
	document.getElementById('filltext').innerHTML=a;
	$('#myModal').modal('show');
}

function sendEmail(a){
	  $('body').css("filter", "blur(1.0px)");
	 $('#spinner').show();
	 $('#main1').hide();
	 $('#main2').hide();
	var committeescheduleid= a;
	
 	$.ajax({
		type:'GET',
		url:'SendMinutes.htm',
		data:{
			committeescheduleid:committeescheduleid,
		},
		datatype:'json',
		
		success:function (result){
				
			console.log( result);

			if(result.length>0){
				 $('#main1').show();
				 $('#main2').show();
				 $('#spinner').hide();
				 $('body').css("filter", "none");
				 console.log("Email Sent");
				 alert("MoM sent to the Participating members")
			}
			
		}
	}) 
	
}


function sendEmails(a){
	  $('body').css("filter", "blur(1.0px)");
		 $('#spinner').show();
		 $('#main1').hide();
		 $('#main2').hide();
		var committeescheduleid= a;

		$.ajax({
			type:'GET',
			url:'SendNonProjectMinutes.htm',
			data:{
				committeescheduleid:committeescheduleid,
			},
			datatype:'json',
			
			success:function (result){
					
				console.log( typeof result);
				console.log(result)
				if(result.length>0){
					 $('#main1').show();
					 $('#main2').show();
					 $('#spinner').hide();
					 $('body').css("filter", "none");
					 console.log("Email Sent");
					 alert("MoM sent to the Participating members")
				}
				
			}
		}) 
}

<%if(dmcFlag!=null && dmcFlag.equalsIgnoreCase("Y")) { %>
	$('#meetingDate').daterangepicker({
	    "singleDatePicker": true,
	    "linkedCalendars": false,
	    "showCustomRangeLabel": true,
	    "cancelClass": "btn-default",
	    "showDropdowns": true,
	    /* "drops": "up", */
	    "locale": {
	        format: 'DD-MM-YYYY'
	    }
	});
<%} %>


function sendDraftMoM(a){
	   $('body').css("filter", "blur(1.0px)");
		 $('#spinner').show(); 
		 var committeescheduleid= a;
		$.ajax({
		type:'GET',
		url:'sendDraftMom.htm',
		datatype:'json',
		data:{
			committeescheduleid:committeescheduleid,
		},
		success:function(result){
			var ajaxresult = JSON.parse(result)
			console.log("meeting draft sent##"+ajaxresult)
			if(Number(ajaxresult)>0){
				alert("Mom Draft Sent Successfully");
				 $('#spinner').hide();
				 $('body').css("filter", "none");
				 location.reload();
			}else{
				/* alert("Mom Draft has already been Sent ! Wait for their Remarks"); */
				 $('#spinner').hide();
				 $('body').css("filter", "none");
				showModal(committeescheduleid)
			}
		}
	})
}

var scheduleId="0";
function showModal(a){
	console.log(a)
	$.ajax({
	
		type:'GET',
		url:'getMomDraftRemarks.htm',
		datatype:'json',
		data:{
			scheduleId:a,
		},
		success : function (result){
			var ajaxresult = JSON.parse(result);
			
			var empid = '<%=empId %>'
			
			var html = "";
		
			for (var i=0;i<ajaxresult.length;i++){
				
				var sender = ajaxresult[i][4];
				if(sender==empid){
					html=html +'<div class="chat-message user-msg">'
				}else{
					html=html +'<div class="chat-message admin-msg">'
				}
				
				var senderName = ajaxresult[i][0]+", "+ajaxresult[i][1];
				var message = ajaxresult[i][2];
				var arr= ajaxresult[i][3].split(" ");
				var msgdate = arr[0].split("-")[2]+"-"+arr[0].split("-")[1]+"-"+arr[0].split("-")[0];
				
				var msgtime = arr[1].substring(0,5);
				
				html = html +
						'<strong class="sender-name">'+senderName +'</strong>'+message 
						+'<div class="timestamp">'+msgdate+' '+ msgtime+'</div></div>'
			}
			$('#messageEditor').html(html);
		}
		
		
	})
	
	scheduleId=a;
	
$('#chatModal').modal('show');
}



function submitRemarks(){
	console.log(scheduleId)
	
	
	var remarks = $('#RemarksEdit').val().trim();
	console.log(remarks)
	
	if(remarks.length==0){
		Swal.fire({
			  icon: "error",
			  title: "Oops...",
			  text: "Remarks can not be empty!",
			
			});
		
		event.preventDefault();
		return false;
	}
	console.log(remarks +"remarks")
	
	Swal.fire({
title: 'Are you sure?',
text: "Do you want to submit the remarks?",
icon: 'warning',
showCancelButton: true,
confirmButtonText: 'Yes',
cancelButtonText: 'No'
}).then((result) => {
if (result.isConfirmed) {
    $.ajax({
        type: 'GET',
        url: 'submitMomRemarks.htm',
        dataType: 'json',  
        data: {
            scheduleId: scheduleId,
            remarks: remarks
        },
        success: function (result) {
            var ajaxresult = JSON.parse(result);
            if (Number(ajaxresult) > 0) {
                $('#chatModal').modal('hide'); // hide modal first

                Swal.fire({
                    icon: "success",
                    title: "SUCCESS",
                    text: "Remarks Given",
                    allowOutsideClick: false
                }).then(() => {
                    // After Swal is closed, reopen the modal
                    $('#RemarksEdit').val('');
                    showModal(scheduleId);
                });
            }
        },
        error: function () {
            // Optional: show error message
            Swal.fire('Error', 'There was an issue submitting your remarks.', 'error');
        }
    });
}
})
	
	
}

</script>

</body>
</html>



