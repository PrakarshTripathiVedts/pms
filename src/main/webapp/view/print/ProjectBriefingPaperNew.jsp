<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.math.MathContext"%>
<%@page import="com.vts.pfms.model.TotalDemand"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="com.vts.pfms.committee.model.Committee"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.vts.pfms.print.model.TechImages"%>
<%@page import="com.vts.pfms.model.LabMaster"%>
<%@page import="com.vts.pfms.AESCryptor"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.vts.pfms.master.dto.ProjectFinancialDetails"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.BigDecimal"%> 
<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@page import="com.vts.pfms.NFormatConvertion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat,java.time.LocalDate"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
<spring:url value="/resources/ckeditor/ckeditor.js" var="ckeditor" />
<script src="${ckeditor}"></script>
<spring:url value="/resources/js/excel.js" var="excel" />
<script src="${excel}"></script>
<spring:url value="/resources/ckeditor/contents.css" var="contentCss" />
<link href="${contentCss}" rel="stylesheet" />
<spring:url value="/resources/css/sweetalert2.min.css" var="sweetalertCss" />
<spring:url value="/resources/js/sweetalert2.min.js" var="sweetalertJs" />
<link href="${sweetalertCss}" rel="stylesheet" />
<script src="${sweetalertJs}"></script>
<title>Briefing </title>
<style type="text/css">
 
 p{
  text-align: justify;
  text-justify: inter-word;
}
.form-check-input:checked ~ .form-check-label::before {
    color: #fff;
    border-color: #7B1FA2;
    background-color: red;
}
.form-check-input:checked ~ .form-check-label::before {
    color: #fff;
    border-color: #7B1FA2;
    background-color: red;
}
 th
 {
 	border: 1px solid black;
 	text-align: center;
 	padding: 5px;
	overflow-wrap: break-word;
 }
 td
 {
 	border: 1px solid black;
 	text-align: left;
 	padding: 5px;
 	overflow-wrap: break-word;
 }
 
  }
 .textcenter{
 	
 	text-align: center;
 }
 .border
 {
 	border: 1px solid black;
 }
 .textleft{
 	text-align: left;
 }
 .containers {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}
.anychart-credits {
   display: none;
}
.flex-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}
summary[role=button] {
  background-color: white;
  color: black;
  border: 1px solid black ;
  border-radius:5px;
  padding: 0.5rem;
  cursor: pointer;
  
}
summary[role=button]:hover
 {
color: white;
border-radius:15px;
background-color: #4a47a3;

}
 summary[role=button]:focus
{
color: white;
border-radius:5px;
background-color: #4a47a3;
border: 0px ;

}
summary::marker{
}
details { 
  margin-bottom: 5px;  
}
details  .content {
background-color:white;
padding: 0 1rem ;
align: center;
border: 1px solid black;
}
}
.anchorlink{
	cursor: pointer;
	color: #C84B31;
}
.anchorlink:hover {
    text-decoration: underline;
}
</style>
<!-- --------------  tree   ------------------- -->
<style>
ul, #myUL {
  list-style-type: none;
}
#myUL {
  margin: 0;
  padding: 0;
}
.caret {
  cursor: pointer;
  -webkit-user-select: none; /* Safari 3.1+ */
  -moz-user-select: none; /* Firefox 2+ */
  -ms-user-select: none; /* IE 10+ */
  user-select: none;
}
.caret::before {
  content: "  \25B7";
  color: black;
  display: inline-block;
  margin-right: 6px;
}
.caret-down::before {
  content: "\25B6  ";
  -ms-transform: rotate(90deg); /* IE 9 */
  -webkit-transform: rotate(90deg); /* Safari */'
  transform: rotate(90deg);  
}
.caret-last {
  cursor: pointer;
  -webkit-user-select: none; /* Safari 3.1+ */
  -moz-user-select: none; /* Firefox 2+ */
  -ms-user-select: none; /* IE 10+ */
  user-select: none;
}
.caret-last::before {
  content: "\25B7";
  color: black;
  display: inline-block;
  margin-right: 6px;
}
.nested {
  display: none;
}
.active {
  display: block;
}

</style>

<!------------------- tree -------------------->
<!----------------- model  tree   ---------------------->
<style>
.caret-1 {
  cursor: pointer;
  -webkit-user-select: none; /* Safari 3.1+ */
  -moz-user-select: none; /* Firefox 2+ */
  -ms-user-select: none; /* IE 10+ */
  user-select: none;
}
.caret-last-1 {
  cursor: pointer;
  -webkit-user-select: none; /* Safari 3.1+ */
  -moz-user-select: none; /* Firefox 2+ */
  -ms-user-select: none; /* IE 10+ */
  user-select: none;
}
.caret-last-1::before {
  content: "\25B7" ;
  color: black;
  display: inline-block;
  margin-right: 6px;
}
.caret-1::before {
  content: "\25B7" ;
  color: black;
  display: inline-block;
  margin-right: 6px;
}
.caret-down-1::before {
  content: "\25B6";
  -ms-transform: rotate(90deg); /* IE 9 */
  -webkit-transform: rotate(90deg); /* Safari */'
  transform: rotate(90deg);  
}
.nested-1 {
  display: none;
}
.active-1 {
  display: block;
}
 .completed{
	color: green;
	font-weight: 700;
}
.briefactive{
	color: blue;
	font-weight: 700;
}
.inprogress{
	color: #F66B0E;
	font-weight: 700;
}
.assigned{
	color: brown;
	font-weight: 700;
}
.notyet{
	color: purple;
	font-weight: 700;
}
.notassign{
	color:#AB0072;
	font-weight: 700;
}
.ongoing{
	color: #F66B0E;
	font-weight: 700;
}
.completed{
	color: green;
	font-weight: 700;
}
.delay{
	color: maroon;
	font-weight: 700;
}
.completeddelay{
	color:#BABD42;
	font-weight: 700;
}
.inactive{
	color: red;
	font-weight: 700;
}
.delaydays
{
	color:#000000;
	font-weight: 700;
}
.select2-container{
	float:right !important;
	margin-top: 5px;
	
}
.modal-xl{
	max-width: 1400px;
}
.sub-title{
	font-size : 20px !important;
	color: #145374 !important
}
.subtables{
	width: 1100px !important;
}
.date-column{
	max-width:60px !important;
}
.status-column{
	max-width:10px !important;
} 

.resp-column{
	max-width:80px !important;
} 
.currency{
	color:#367E18 !important;
	font-style: italic;
} 


.subtables th{
	/* background-color: #001253 !important; 
	color: white !important;
	border-color: white; */
	color: #001253 !important;
	
}
 
.mainsubtitle{
	font-size : 18px !important;
	color:#882042 !important;
}
 
 
.projectattributetable th{
	text-align: left !important;
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

.folder-tree {
  list-style: none;
  padding-left: 0;
}

.folder-tree .list-group-item {
  border: none;
  padding: 8px 15px;
  transition: all 0.3s ease;
  border-radius: 6px;
  background: #fff;
  box-shadow: 0 1px 2px rgba(0,0,0,0.05);
}

.folder-tree .folder-item:hover {
  background: #f0f8ff;
  transform: translateX(5px);
}

.folder-tree .file-item:hover {
  background: #f9f9f9;
  transform: scale(1.02);
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.folder-tree .subfolder {
  display: none;
  margin-left: 20px;
  padding-left: 10px;
  border-left: 2px dashed #ddd;
}

.folder-tree .folder-item.open > .subfolder {
  display: block;
}

.folder-icon {
  margin-right: 8px;
  transition: transform 0.3s;
  font-size: 18px;
}

.pdf-check {
  cursor: pointer;
}

.folder-item.open > .folder-icon {
  color: #f39c12 !important;
  transform: scale(1.3);
  transition: all 0.3s ease;
}

.folder-tree .folder-item:hover {
  background: #f0f8ff;
  transform: translateX(5px);
}

</style>
<meta charset="ISO-8859-1">
</head>
<body >
<%
DecimalFormat df=new DecimalFormat("####################.##");
FormatConverter fc=new FormatConverter(); 
SimpleDateFormat sdf=fc.getRegularDateFormat();
SimpleDateFormat sdf1=fc.getSqlDateFormat();

int addcount=0; 
NFormatConvertion nfc=new NFormatConvertion();
Format format = com.ibm.icu.text.NumberFormat.getCurrencyInstance(new Locale("en", "in"));
String filePath=(String)request.getAttribute("filePath");
String projectLabCode=(String)request.getAttribute("projectLabCode");
List<Object[]> projectslist=(List<Object[]>)request.getAttribute("projectslist");
String projectid=(String)request.getAttribute("projectid");
String committeeid=(String)request.getAttribute("committeeid");
Committee committee=(Committee)request.getAttribute("committeeData");

List<Object[]> projectattributeslist = (List<Object[]> )request.getAttribute("projectattributes");
List<List<Object[]>> ebandpmrccount = (List<List<Object[]>> )request.getAttribute("ebandpmrccount");
List<List<Object[]>> milestones= (List<List<Object[]>>)request.getAttribute("milestones");
List<List<Object[]>> lastpmrcactions = (List<List<Object[]>>)request.getAttribute("lastpmrcactions");
List<List<Object[]>> lastpmrcminsactlist = (List<List<Object[]>>)request.getAttribute("lastpmrcminsactlist");
List<List<Object[]>> ganttchartlist=(List<List<Object[]>>)request.getAttribute("ganttchartlist");
List<Object[]> projectdatadetails = (List<Object[]> )request.getAttribute("projectdatadetails");
List<List<Object[]>> oldpmrcissueslist=(List<List<Object[]>>)request.getAttribute("oldpmrcissueslist");

List<List<ProjectFinancialDetails>> projectFinancialDetails = (List<List<ProjectFinancialDetails>>)request.getAttribute("financialDetails");
List<List<Object[]>> procurementOnDemand = (List<List<Object[]>>)request.getAttribute("procurementOnDemandlist");
List<List<Object[]>> procurementOnSanction = (List<List<Object[]>>)request.getAttribute("procurementOnSanctionlist");
List<List<Object[]>> riskmatirxdata = (List<List<Object[]>>)request.getAttribute("riskmatirxdata");
List<List<Object[]>> actionplanthreemonths = (List<List<Object[]>>)request.getAttribute("actionplanthreemonths");
List<Object[]> TechWorkDataList=(List<Object[]>)request.getAttribute("TechWorkDataList");
List<Object[]> ProjectDetail=(List<Object[]>)request.getAttribute("ProjectDetails"); 
List<String> projectidlist = (List<String>)request.getAttribute("projectidlist");
List<Object[]> pdffiles=(List<Object[]>)request.getAttribute("pdffiles");
List<Object[]> milestoneactivitystatus =(List<Object[]>)request.getAttribute("milestoneactivitystatus");
List<Object[]> MilestoneList=(List<Object[]>)request.getAttribute("MilestoneActivityList");
String ProjectId=(String)request.getAttribute("projectid");
List<TotalDemand> totalprocurementdetails = (List<TotalDemand>)request.getAttribute("TotalProcurementDetails");
//List<List<Object[]>> ReviewMeetingList=(List<List<Object[]>>)request.getAttribute("ReviewMeetingList");
//List<List<Object[]>> ReviewMeetingListPMRC=(List<List<Object[]>>)request.getAttribute("ReviewMeetingListPMRC");
Map<String, List<Object[]>> reviewMeetingListMap = (Map<String, List<Object[]>>) request.getAttribute("reviewMeetingListMap");
List<List<Object[]>> ProjectRevList = (List<List<Object[]>>)request.getAttribute("ProjectRevList");
List<List<Object[]>> MilestoneDetails6 = (List<List<Object[]>>)request.getAttribute("milestonedatalevel6");//b
List<List<TechImages>> TechImages = (List<List<TechImages>>)request.getAttribute("TechImages");

List<Object[]> SpecialCommitteesList = (List<Object[]>)request.getAttribute("SpecialCommitteesList");


long ProjectCost = (long)request.getAttribute("ProjectCost"); 
String levelid= (String) request.getAttribute("levelid");
LocalDate before6months = LocalDate.now().minusDays(committee.getPeriodicDuration());
String No2=null;
SimpleDateFormat sdfg=new SimpleDateFormat("yyyy");

if(ebandpmrccount!=null && ebandpmrccount.size()>0){
	List<Object[]> ebandpmrcsub = ebandpmrccount.get(0);
	Object[] comcount = ebandpmrcsub.stream().filter(e -> e[0].toString().equalsIgnoreCase(committee.getCommitteeShortName())).findFirst().orElse(null);
	No2=committee.getCommitteeShortName()+(Long.parseLong(comcount!=null? comcount[1].toString() : "0")+1);
	
}


Object[] nextMeetVenue =  (Object[]) request.getAttribute("nextMeetVenue");
List<Object[]> RecDecDetails = (List<Object[]>)request.getAttribute("recdecDetails");

List<Object[]> RiskTypes = (List<Object[]>)request.getAttribute("RiskTypes");
Map<Integer,String> treeMapLevOne =(Map<Integer,String>)request.getAttribute("treeMapLevOne");
Map<Integer,String> treeMapLevTwo =(Map<Integer,String>)request.getAttribute("treeMapLevTwo");

List<Object[]> envisagedDemandlist = (List<Object[]>)request.getAttribute("envisagedDemandlist");
SimpleDateFormat inputFormat = new SimpleDateFormat("ddMMMyyyy");
SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
Map<Integer,String> committeeWiseMap=(Map<Integer,String>)request.getAttribute("committeeWiseMap");
//Map<Integer,String> mapEB=(Map<Integer,String>)request.getAttribute("mapEB");

List<Object[]> otherMeetingList = (List<Object[]>)request.getAttribute("otherMeetingList");
List<List<Object[]>> overallfinance = (List<List<Object[]>>)request.getAttribute("overallfinance");//b
String thankYouImg = (String)request.getAttribute("thankYouImg");
String IsIbasConnected=(String)request.getAttribute("IsIbasConnected");
String isCCS = (String)request.getAttribute("isCCS");
%>
	<% String ses = (String) request.getParameter("result"); 
       String ses1 = (String) request.getParameter("resultfail");
       if (ses1 != null) { %>
        <div align="center">
            <div class="alert alert-danger" role="alert">
                <%= ses1 %>
            </div>
        </div>
    <% } if (ses != null) { %>
        <div align="center">
            <div class="alert alert-success" role="alert">
                <%= ses %>
            </div>
        </div>
 	<% } %>
	<div id="spinner" class="spinner" style="display:none;"><img id="img-spinner" style="width: 200px;height: 200px;" src="view/images/spinner1.gif" alt="Loading"/></div>
 
	<div class="container-fluid">
		<div class="row" id="main">
			<div class="col-md-12">
				<div class="card shadow-nohover">
					<div class="row card-header" style="">
			   			<div class="col-md-4"  style="margin-top: -8px;">
							<h3>Project Briefing Paper</h3>
						</div>							
						<div class="col-md-8 justify-content-end" style="float: right;margin-top: -17px;">
						<form method="post" action="ProjectBriefingPaper.htm" id="projectchange">
							<table >
								<tr>
									<td  style="border: 0 ;padding-top: 13px;"><h6>Project </h6></td>
									<td  style="border: 0 ;">
										
										<select class="form-control items" name="projectid"  required="required" style="width:200px;" data-live-search="true" data-container="body" onchange="submitForm('projectchange');">
											<%for(Object[] obj : projectslist){ 
												String projectshortName=(obj[17]!=null)?" ( "+obj[17].toString()+" ) ":"";
											%>
												<option value=<%=obj[0]%> <%if(projectid!=null && projectid.equals(obj[0].toString())) { %>selected <%} %> ><%=obj[4] +projectshortName%></option>
											<%} %>
										</select>
									</td>
									<td  style="border: 0;padding-top: 13px; "><h6>Committee</h6></td>
									<td  style="border: 0 ">
										<select class="form-control items" name="committeeid"  required="required" style="width:200px;" data-live-search="true" data-container="body" onchange="submitForm('projectchange');">
											<%
											for(Object[] comm : SpecialCommitteesList){ %>
												<%-- <%if((Double.parseDouble(projectattributeslist.get(0)[7].toString())*100000)>500 && !comm[1].toString().equalsIgnoreCase("PMRC")){ %>
													<option <%if(Long.parseLong(committeeid)==Long.parseLong(comm[0].toString())){ %>selected<%} %> value="<%=comm[0] %>" ><%=comm[1] %></option>
												<%}else if(comm[1].toString().equalsIgnoreCase("PMRC")){ %>
													<option <%if(Long.parseLong(committeeid)==Long.parseLong(comm[0].toString())){ %>selected<%} %> value="<%=comm[0] %>" ><%=comm[1] %></option>
												<%} %> --%>
												<option <%if(committeeid.equalsIgnoreCase(comm[0].toString())){ %>selected<%} %> value="<%=comm[0] %>" ><%=comm[1] %></option>
											<%} %>
										</select>
									</td>
									
									<td style="border: 0 "> 
										<button  type="submit" class="btn btn-sm" style="border: 0 ;border-radius: 3px;" formmethod="GET" formaction="ProjectBriefingDownload.htm" formtarget="_blank"
										 data-toggle="tooltip" data-placement="top" title="Briefing Paper pdf" >
											<i class="fa fa-download fa-lg" aria-hidden="true"></i>
										</button>
									</td>
									<td style="border: 0 "> 
										<button  type="submit" class="btn btn-sm " formmethod="POST" formaction="ProjectBriefingFreeze.htm" onclick="return confirm('Are You Sure To Freeze Briefing Paper for Next Scheduled Meeting ?')" title="Freeze" style="border: 0 ;border-radius: 3px;"
										data-toggle="tooltip" data-placement="top">
											<i class="fa fa-certificate fa-lg" style="color:red; " aria-hidden="true"></i>
										</button>
									</td>
									<td style="border: 0 "> 
										<button  type="submit" class="btn btn-sm " formmethod="POST" formaction="BriefingPresentation.htm" formtarget="_blank" title="Presentation" style="border: 0 ;border-radius: 3px;"
										data-toggle="tooltip" data-placement="top" >
											<img alt="" src="view/images/presentation.png" style="width:19px !important">
										</button>
									</td>
										<td style="border: 0 "> 
										<button  type="submit" class="btn btn-sm" style="border: 0 ;border-radius: 3px;" name="text" value="p" formmethod="GET" formaction="ProjectBriefingDownload.htm" formtarget="_blank"
										data-toggle="tooltip" data-placement="top" title="Presentation pdf">
											<img alt="" src="view/images/presentation.png" style="width:19px !important"><i class="fa fa-download" aria-hidden="true" style="margin-left:6px;"></i>
										</button>
									</td>
									<td style="border: 0 "><button  type="button" class="btn btn-sm back"  data-toggle="modal" data-target="#LevelModal"  style="float: right;margin-top: 5px;text-transform: capitalize !important;"  >Mil Level (<%=levelid %>)</button></td>
								</tr>
							</table>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="hidden" name="projectid" value="<%=projectid%>"/>
								<input type="hidden" name="committeeid" value="<%=committeeid%>"/>	
							</form>				
						</div>
					 </div>
					 
	
						<div class="card-body">	
						
				 		
							 <details>					
							    <summary role="button" tabindex="0"><b>1. Project Attributes </b>  </summary>
								<div class="content">
									<% 
									for(int z=0;z<projectidlist.size();z++)
									{
										List<Object[]>  revlist= ProjectRevList.get(z); 
										Object[] projectattributes =projectattributeslist.get(z);	%>  
										<%if(projectattributes!=null){ %>
										
										<div>
											<%-- <b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b> --%>
											<form action="ProjectSubmit.htm" method="post" target="_blank">
												<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
												<button type="submit" name="action" value="edit"  class="btn btn-sm edit" style="padding : 3px;" > <i class="fa fa-pencil-square-o fa-lg" style="color: black" aria-hidden="true"></i> </button>
												<input type="hidden" name="ProjectId" value="<%=ProjectDetail.get(z)[0] %>">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											</form>
										</div>	
										
										
									<table class="subtables projectattributetable" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;   border-collapse:collapse;" >
										<tr>
											 <td style="width: 5px !important; padding: 5px; padding-left: 10px">(a)</td>
											 <td style="width: 150px;padding: 5px; padding-left: 10px"><b>Project Title</b></td>
											 <td colspan="4" style=" width: 370px; padding: 5px; padding-left: 10px"> <%=projectattributes[1] %></td>
										</tr>
										<tr>
											 <td  style="padding: 5px; padding-left: 10px">(b)</td>
											 <td style="width: 150px;padding: 5px; padding-left: 10px"><b>Project Code</b></td>
											 <td colspan="4" style=" width: 370px; padding: 5px; padding-left: 10px"> <%=projectattributes[0]%> </td>
										</tr>
										<tr>
											 <td  style=" padding: 5px; padding-left: 10px">(c)</td>
											 <td  style="width: 150px;padding: 5px; padding-left: 10px"><b>Category</b></td>
											 <td colspan="4" style=" width: 370px; padding: 5px; padding-left: 10px"><%=projectattributes[14]%></td>
										</tr>
										<tr>
											 <td  style="padding: 5px; padding-left: 10px">(d)</td>
											 <td  style="width: 150px;padding: 5px; padding-left: 10px"><b>Date of Sanction</b></td>
											 <td colspan="4" style=" width: 370px; padding: 5px; padding-left: 10px"><%=sdf.format(sdf1.parse(projectattributes[3].toString()))%></td>
										</tr>
										<tr>
											 <td  style="width: 20px; padding: 5px; padding-left: 10px">(e)</td>
											 <td  style="width: 150px;padding: 5px; padding-left: 10px"><b>Nodal and Participating Labs</b></td>
											 <td colspan="4" style=" width: 370px; padding: 5px; padding-left: 10px"><%if(projectattributes[15]!=null){ %><%=projectattributes[15]%><%} %></td>
										</tr>
										<tr>
											 <td  style=" padding: 5px; padding-left: 10px">(f)</td>
											 <td  style="width: 150px;padding: 5px; padding-left: 10px"><b>Objective</b></td>
											 <td colspan="4" style=" width: 370px; padding: 5px; padding-left: 10px;text-align: justify"> <%=projectattributes[4]%></td>
										</tr>
										<tr>
											 <td  style="padding: 5px; padding-left: 10px">(g)</td>
											 <td  style="width: 150px;padding: 5px; padding-left: 10px"><b>Deliverables</b></td>
											 <td colspan="4" style=" width: 370px; padding: 5px; padding-left: 10px"> <%=projectattributes[5]%></td>
										</tr>
										<tr>
											 <td rowspan="2" style="padding: 5px; padding-left: 10px">(h)</td>
											 <td rowspan="2" style="width: 150px;padding: 5px; padding-left: 10px"><b>PDC</b></td>
											 
											<td colspan="2" style="text-align: center !important">&nbsp;</td>					
											<%if( ProjectRevList.get(z).size()>0){ %>	
												<td colspan="2" style="text-align: center !important">Revised</td>																			
											<%}else{ %>													 
										 		<td colspan="2" ></td>	
										 	<%} %>
										</tr>
								 		<tr>
								 			<%if( ProjectRevList.get(z).size()>0 ){ %>								
										 		<td colspan="2" style="text-align: center;"><%= sdf.format(sdf1.parse(ProjectRevList.get(z).get(0)[12].toString()))%> </td>
										 		<td colspan="2" style="text-align: center;">
											 		<%if(LocalDate.parse(projectattributes[6].toString()).isEqual(LocalDate.parse(ProjectRevList.get(z).get(0)[12].toString())) ){ %>
											 			-
											 		<%}else{ %>
											 			<%= sdf.format(sdf1.parse(projectattributes[6].toString()))%>
											 		<%} %>
										 		
										 		</td>
											<%}else{ %>													 
										 		<td colspan="2" style="text-align: center;"><%= sdf.format(sdf1.parse(projectattributes[6].toString()))%></td>
												<td colspan="2" ></td>
										 	<%} %>
										 		    
								 		</tr>
											 	
										<tr>
											<td rowspan="3" style="width: 30px; padding: 5px; padding-left: 10px">(i)</td>
											<td rowspan="3" style="padding-left: 10px"><b>Cost Breakup( &#8377; <span class="currency">Lakhs</span>)</b></td>
											
											<%if( ProjectRevList.get(z).size()>0 ){ %>
													<td style="width: 10% !important" >RE Cost</td>
													<td style="text-align: center;"><%=ProjectRevList.get(z).get(0)[17] %></td> 
													<td colspan="2" style="text-align: center;"><%=projectattributes[8] %></td>
												</tr>
												
												
												<tr>
													<td style="width: 10% !important">FE Cost</td>		
													<td style="text-align: center;"><%=ProjectRevList.get(z).get(0)[16] %></td>					
													<td colspan="2" style="text-align: center;"><%=projectattributes[9] %></td>
												</tr>
													
												<tr>	
													<td style="width: 10% !important">Total Cost</td>	
													<td style="text-align: center;"><%=ProjectRevList.get(z).get(0)[11] %></td>
											 		<td colspan="2" style="text-align: center;"><%=projectattributes[7] %></td>
												</tr> 
														
											<%}else{ %>
													
													<td style="width: 10% !important">RE Cost</td>
													<td ><%=projectattributes[8] %></td>
													<td colspan="2" ></td>
												</tr>
											
												<tr>
													<td style="width: 10% !important">FE Cost</td>		
													<td ><%=projectattributes[9] %></td>					
													<td colspan="2"></td>
												</tr>
												
												<tr>	
													<td style="width: 10% !important" >Total Cost</td>	
													<td ><%=projectattributes[7] %></td>
													<td colspan="2"></td>			
												</tr> 
											<%} %>
												
																			 	
										<tr>
											<td  style="width: 20px; padding: 5px; padding-left: 10px">(j)</td>
											<td style="width: 150px;padding: 5px; padding-left: 10px"><b>No. of Meetings held</b> </td>
											<td colspan="4">
												<% if(ebandpmrccount!=null && ebandpmrccount.size()>0){
													List<Object[]> ebandpmrcsub = ebandpmrccount.get(z); 
													for(Object[] ebandpmrc: ebandpmrcsub) { %>
												 	<b><%=ebandpmrc[0] %> : </b>
													<span><%=ebandpmrc[1] %></span> &emsp;&emsp;
												<%} }%>
											</td>
										</tr>
										<tr>
											<td  style="width: 20px; padding: 5px; padding-left: 10px">(k)</td>
											<td  style="width: 210px;padding: 5px; padding-left: 10px"><b>Current Stage of Project</b></td>
											<td colspan="4" style=" width: 200px;color:white; padding: 5px; padding-left: 10px ; <%if(projectdatadetails.get(z)!=null){ %> background-color: <%=projectdatadetails.get(z)[11] %> ;   <%} %>" >
												<span> <%if(projectdatadetails.get(z)!=null){ %><b><%=projectdatadetails.get(z)[10] %> </b>  <%}else{ %>Data Not Found<%} %></span>
											</td> 
										</tr>	
									</table>
		
										<%}else{ %>
											<div align="center" style="margin: 25px;"> Complete Project Data Not Found </div>
										<%} %>
									<% } %>
							</div>
						</details>

<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->		
				 
						<details>
	   						<summary role="button" tabindex="0"><b>2. Schematic Configuration</b>   </summary>
	   						<div class="content">
	   						<%for(int z=0;z<1;z++){ %>
	   						<div align="left" style="margin-left: 15px;">
	   							
								<%if(ProjectDetail.size()>1){ %>
										<div>
											<form action="ProjectData.htm" method="post" target="_blank">
												<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
												<button type="submit" name="action" value="edit"  class="btn btn-sm edit" style="padding : 3px;" > <i class="fa fa-pencil-square-o fa-lg" style="color: black" aria-hidden="true"></i> </button>
												<input type="hidden" name="projectid" value="<%=ProjectDetail.get(z)[0] %>">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											</form>
										</div>	
								<%} %>
	   							<table >
									<tr>
										<td style="border:0;"> 
										
										
											<%if(projectdatadetails.get(z)!=null && projectdatadetails.get(z)[3]!=null){ %>
												<form action="ProjectDataSystemSpecsFileDownload.htm"  method="post" target="_blank" >	
													2 (a) System Configuration. &nbsp; <span class="anchorlink" onclick="$('#config<%=ProjectDetail.get(z)[0] %>').toggle();" style="color: #C84B31;cursor: pointer;" ><b>As on File Attached</b></span>
													<button  type="submit" class="btn btn-sm "  ><i class="fa fa-download fa-lg" ></i></button>
													<input type="hidden" name="projectdataid" value="<%=projectdatadetails.get(z)[0]%>"/>
													<input type="hidden" name="filename" value="sysconfig"/>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</form>	
												
												
												<%
												Path systemPath = Paths.get(filePath,projectLabCode,"ProjectData",projectdatadetails.get(z)[3].toString());
												File systemfile = systemPath.toFile();
												if(systemfile.exists()){
												if(FilenameUtils.getExtension(projectdatadetails.get(z)[3].toString()).equalsIgnoreCase("pdf")){ %>
													<iframe	width="1200" height="600" src="data:application/pdf;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(systemfile))%>"  id="config<%=ProjectDetail.get(z)[0] %>" style="display: none" > </iframe>
												<%}else{ %>
													<img style="max-width:25cm;max-height:17cm;display: none" src="data:image/<%=FilenameUtils.getExtension(projectdatadetails.get(z)[3].toString()) %>;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(systemfile))%>"  id="config<%=ProjectDetail.get(z)[0] %>"  > 											
												<%} %>
                                              <%} %>
											<%}else{ %>
												2 (a) System Configuration. &nbsp; File Not Found
											<%} %>
										
										
										</td>
											
									</tr>
								</table>
							
							</div>
							<div align="left" style="margin-left: 15px;">
							<table >
								<tr>
									<td style="border:0;"> 
										<%if(projectdatadetails.get(z)!=null && projectdatadetails.get(z)[4]!=null){ %>
											<form action="ProjectDataSystemSpecsFileDownload.htm"  method="post" target="_blank" >	
															
												2 (b) System Specifications. &nbsp; <span class="anchorlink" onclick="$('#sysspecs<%=ProjectDetail.get(z)[0] %>').toggle();" style="color: #C84B31;cursor: pointer;" ><b>As on File Attached</b></span>
												<button  type="submit" class="btn btn-sm "  ><i class="fa fa-download fa-lg" ></i></button>
												<input type="hidden" name="projectdataid" value="<%=projectdatadetails.get(z)[0]%>"/>
												<input type="hidden" name="filename" value="sysspecs"/>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											</form>
											<%
											Path specificPath = Paths.get(filePath,projectLabCode,"ProjectData",projectdatadetails.get(z)[4].toString());
											File specificfile = specificPath.toFile();
											if(specificfile.exists()){
											if(FilenameUtils.getExtension(projectdatadetails.get(z)[4].toString()).equalsIgnoreCase("pdf")){ %>
												<iframe	width="1200" height="600" src="data:application/pdf;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(specificfile))%>"  id="sysspecs<%=ProjectDetail.get(z)[0] %>" style="display: none" > </iframe>
											<%}else{ %>
												<img style="max-width:25cm;max-height:17cm;display: none" src="data:image/<%=FilenameUtils.getExtension(projectdatadetails.get(z)[4].toString()) %>;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(specificfile))%>"  id="sysspecs<%=ProjectDetail.get(z)[0] %>"  > 											
											<%} %>
										   <%} %>
										<%}else{ %>
											2 (b) System Specifications. &nbsp; File Not Found
										<%} %>
									
									
									
									</td>
									<td style="border:0;">  
									
									</td>
								</tr>
							</table>
							</div>
							<%} %>
							</div>
						</details>
				
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->
				 			
						<details>
	   						<summary role="button" tabindex="0"><b>3. Overall Product tree/WBS</b> </summary>
							
							<%for(int z=0;z<1;z++){ %>
							<div>
								<%if(ProjectDetail.size()>1){ %>
									<div style="margin-left:1rem; ">
										<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
									</div>	
								<%} %>
								<table>
									<tr>
										<td style="border:0; padding-left: 1.5rem;"> 
											<%if(projectdatadetails.get(z)!=null && projectdatadetails.get(z)[5]!=null){ %>
											
												<form action="ProjectDataSystemSpecsFileDownload.htm"  method="post" target="_blank" >	
													Overall Product tree/WBS &nbsp; :  &nbsp;<span class="anchorlink" onclick="$('#protree<%=ProjectDetail.get(z)[0] %>').toggle();" style="color: #C84B31;cursor: pointer;" ><b>As on File Attached</b></span>	
													<button  type="submit" class="btn btn-sm "  ><i class="fa fa-download fa-lg" ></i></button>
													<input type="hidden" name="projectdataid" value="<%=projectdatadetails.get(z)[0]%>"/>
													<input type="hidden" name="filename" value="protree"/>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</form>	
												
												
												<%
												Path productTreePath = Paths.get(filePath,projectLabCode,"ProjectData",projectdatadetails.get(z)[5].toString());
												File productTreeFile = productTreePath.toFile();
												if(productTreeFile.exists()){
												if(FilenameUtils.getExtension(projectdatadetails.get(z)[5].toString()).equalsIgnoreCase("pdf")){ %>
													<iframe	width="1200" height="600" src="data:application/pdf;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(productTreeFile))%>"  id="protree<%=ProjectDetail.get(z)[0] %>" style="display: none" > </iframe>
												<%}else{ %>
													<img style="max-width:25cm;max-height:17cm;display: none" src="data:image/<%=FilenameUtils.getExtension(projectdatadetails.get(z)[5].toString()) %>;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(productTreeFile))%>"  id="protree<%=ProjectDetail.get(z)[0] %>"  > 											
												<%} %>
											  <%} %>
											<%}else{ %>
												Overall Product tree/WBS &nbsp; File Not Found
											<%} %>
										
										</td>
										<td style="border:0;">  
											
										</td>
									</tr>
								</table>
							</div>
							<%} %>
						</details>
  				
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->		
				
						<details>
   						<summary role="button" tabindex="0"><b>4. Particulars of Meeting </b> </summary>
   						
   						<div class="content">
   							<%for(int z=0;z<1;z++){ %>
   								<h1 class="break"></h1>
   								
   								  	<%if(ProjectDetail.size()>1){ %>
										<div>
											<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
										</div>	
									<%} %>	
								   <div align="left" style="margin-left: 15px;">(a) <%if(committee.getCommitteeShortName().trim().equalsIgnoreCase("PMRC")){ %>
															   						Approval 
															   						<%}else { %>
															   						Ratification
															   						<%} %>  of <b>recommendations</b> of last PMRC / <%=committee.getCommitteeShortName().trim().toUpperCase() %> Meeting (if any)</div>
															   						
							
			<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px; border-collapse:collapse;" >
				<thead>
					<tr>
						<td colspan="6" style="border: 0">
							<p style="font-size: 10px;text-align: center"> 
								<span class="notassign">NA</span> : Not Assigned &nbsp;&nbsp;
								<span class="assigned">AA</span> : Activity Assigned &nbsp;&nbsp; 
								<span class="ongoing">OG</span> : On Going &nbsp;&nbsp; 
								<span class="delay">DO</span> : Delay - On Going &nbsp;&nbsp; 
								<span class="ongoing">RC</span> : Review & Close &nbsp;&nbsp;
								<span class="delay">FD</span> : Forwarded With Delay &nbsp;&nbsp;
								<span class="completed">CO</span> : Completed &nbsp;&nbsp; 
								<span class="completeddelay">CD</span> : Completed with Delay &nbsp;&nbsp; 
								<span class="inactive">IA</span> : InActive &nbsp;&nbsp;
								<span class="delaydays">DD</span> : Delayed days &nbsp;&nbsp; 
							</p>
						</td>									
					</tr>
										
					<tr>
						<th  style="width: 15px !important;text-align: center;">SN</th>
						<th  style="width: 100px !important;"> ID</th>
						<th  style="width: 315px !important;">Recommendation Point</th>
						<th  style="width: 100px !important;"> PDC</th>
						<th  style="width: 210px !important;"> Responsibility</th>
						<th  style="width: 80px !important;">Status(DD)</th>
						<th  style="width: 250px !important; ">Remarks</th>
					</tr>
				</thead>
				<tbody>
					<%if(lastpmrcminsactlist.get(z).size()==0){ %>
						<tr><td colspan="6" style="text-align: center;" > Nil</td></tr>
					<%}
						else if(lastpmrcminsactlist.get(z).size()>0)
							{int i=1;String key2="";
								for(Object[] obj:lastpmrcminsactlist.get(z)){
									// only recommendations and the if recommendation is completed or closed then only those actions which are completed after last meeting
									if( obj[3].toString().equalsIgnoreCase("R") && (obj[10]==null || !obj[10].toString().equals("C") || (obj[10].toString().equals("C") && obj[14]!=null && before6months.isBefore(LocalDate.parse(obj[14].toString()) ) )) ){ %>
						<tr>
							<td style="text-align: center;"><%=i %></td>
							
							<td>
							
							
									<%if(obj[21]!=null && Long.parseLong(obj[21].toString())>0){ %>
								
									
			 						<span style="font-weight: bold;">	
								<%for (Map.Entry<Integer, String> entry : committeeWiseMap.entrySet()) {
									Date date = inputFormat.parse(obj[5].toString().split("/")[3]);
									 String formattedDate = outputFormat.format(date);
									 if(entry.getValue().equalsIgnoreCase(formattedDate)){
										 key2=entry.getKey().toString();
									 } }%>
								
								<%=committee.getCommitteeShortName().trim().toUpperCase()+"-"+key2+"/"+obj[5].toString().split("/")[4] %>
								
								
								</span>	
									
									
								<%}%>
							</td>
							
							
							<td style="text-align: justify; "><%=obj[2] %></td>
							<%-- <td style=" text-align: center;">
								<%if(obj[8]!= null && !LocalDate.parse(obj[8].toString()).equals(LocalDate.parse(obj[7].toString())) ){ %><br><%=sdf.format(sdf1.parse(obj[8].toString()))%><%} %>		
								<%if(obj[7]!= null && !LocalDate.parse(obj[7].toString()).equals(LocalDate.parse(obj[6].toString())) ){ %><br><%=sdf.format(sdf1.parse(obj[7].toString()))%><%} %>
								<%if(obj[6]!= null){ %><%=sdf.format(sdf1.parse(obj[6].toString()))%><%} %>
							</td> --%>
							<td style="text-align: center;">
								<%if(obj[8]!= null && !LocalDate.parse(obj[8].toString()).equals(LocalDate.parse(obj[7].toString())) ){ %><span style="color:black;font-weight: bold;"><%=sdf.format(sdf1.parse(obj[8].toString()))%></span><br><%} %>	
								<%if(obj[7]!= null && !LocalDate.parse(obj[7].toString()).equals(LocalDate.parse(obj[6].toString())) ){ %><span style="color:black;font-weight: bold;"><%=sdf.format(sdf1.parse(obj[7].toString()))%></span><br><%} %>
								<%if(obj[6]!= null){ %><span><%=sdf.format(sdf1.parse(obj[6].toString()))%></span><br><%} %>
								</td>
							<td>
								<%if(obj[4]!= null){ %>  
									<%=obj[12] %>, <%=obj[13] %>
								<%}else { %><span class="">Not Assigned</span> <%} %> 
							</td>
							<td  style="text-align: center; ">
								<%if(obj[4]!= null){ %> 
									<%	String actionstatus = obj[10].toString();
										int progress = obj[18]!=null ? Integer.parseInt(obj[18].toString()) : 0;
										LocalDate pdcorg = LocalDate.parse(obj[6].toString());
										LocalDate lastdate = obj[14]!=null ? LocalDate.parse(obj[14].toString()): null;
										LocalDate today = LocalDate.now();
									%> 
									<% if(lastdate!=null && actionstatus.equalsIgnoreCase("C") ){%>
											<%if(actionstatus.equals("C") && (pdcorg.isAfter(lastdate) || pdcorg.equals(lastdate))){%>
												<span class="completed">CO</span>
											<%}else if(actionstatus.equals("C") && pdcorg.isBefore(lastdate)){ %>	
												<span class="completeddelay">CD (<%= ChronoUnit.DAYS.between(pdcorg, lastdate) %>) </span>
											<%} %>	
										<%}else{ %>
											<%if(actionstatus.equals("F")  && (pdcorg.isAfter(lastdate) || pdcorg.isEqual(lastdate) )){ %>
												<span class="ongoing">RC</span>												
											<%}else if(actionstatus.equals("F")  && pdcorg.isBefore(lastdate)) { %>
												<span class="delay">FD</span>
											<%}else if(actionstatus.equals("A") && progress==0){  %>
												<span class="assigned">
													AA <%if(pdcorg.isBefore(today)){ %> (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>) <%} %>
												</span>
											<%} else if(pdcorg.isAfter(today) || pdcorg.isEqual(today)){  %>
												<span class="ongoing">OG</span>
											<%}else if(pdcorg.isBefore(today)){  %>
												<span class="delay">DO (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>)  </span>
											<%} %>										
									<%} %>
								<%}else { %>
									<span class="notassign">NA</span>
								<%} %>
							</td>
							<td ><%if(obj[19]!=null){%><%=obj[19] %><%} %></td>
						</tr>		
					<%i++;}
						}%>
					<%if(i==1){ %> <tr><td colspan="6" style="text-align: center;" > Nil</td></tr>	<%} %>
											
					<%} %>
				</tbody>
										
			</table>
				
							
							
		 <%if((Double.parseDouble(projectattributeslist.get(0)[7].toString())*100000)>1){ %>
								  
		  	<div align="left" style="margin-left: 15px;">(b) Last <%=committee.getCommitteeShortName().trim().toUpperCase() %>
															   						Meeting action points with Probable Date of completion (PDC), Actual Date of Completion (ADC) and current status.</div>
					
					<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;   border-collapse:collapse;" >
						<thead>
							<tr>
								<td colspan="7" style="border: 0">
									<p style="font-size: 10px;text-align: center"> 
										<span class="notassign">NA</span> : Not Assigned &nbsp;&nbsp;
										<span class="assigned">AA</span> : Activity Assigned &nbsp;&nbsp; 
										<span class="ongoing">OG</span> : On Going &nbsp;&nbsp; 
										<span class="delay">DO</span> : Delay - On Going &nbsp;&nbsp; 
										<span class="ongoing">RC</span> : Review & Close &nbsp;&nbsp;
										<span class="delay">FD</span> : Forwarded With Delay &nbsp;&nbsp;
										<span class="completed">CO</span> : Completed &nbsp;&nbsp; 
										<span class="completeddelay">CD</span> : Completed with Delay &nbsp;&nbsp; 
										<span class="inactive">IA</span> : InActive &nbsp;&nbsp;
										<span class="delaydays">DD</span> : Delayed days &nbsp;&nbsp; 
									</p>
								</td>									
							</tr>
										
							<tr>
								<th  style="width: 15px !important;text-align: center;  ">SN</th>
								<th  style="width: 120px !important;text-align: center;  ">ID</th>
								<th  style="width: 320px; ">Action Point</th>
								<th  style="width: 150px; ">ADC<br>PDC</th>
								<!-- <th  style="width: 100px; "> ADC</th> -->
								<th  style="width: 210px; "> Responsibility</th>
								<th  style="width: 80px; ">Status(DD)</th>
								<th  style="width: 205px; ">Remarks</th>			
							</tr>
						</thead>
							
						<tbody>		
							<%if(lastpmrcactions.get(z).size()==0){ %>
								<tr><td colspan="7"  style="text-align: center;" > Nil</td></tr>
								<%}
								else if(lastpmrcactions.size()>0)
								{int i=1;String key="";
								for(Object[] obj:lastpmrcactions.get(z)){ %>
								<tr>
									<td  style="text-align: center;"><%=i %></td>
									<td>
										<%if(obj[17]!=null && Long.parseLong(obj[17].toString())>0){ %>
								<span style="font-weight: bold">
								<%for (Map.Entry<Integer, String> entry : committeeWiseMap.entrySet()) {
									String actionNo = obj[1].toString();
									Date date = inputFormat.parse(obj[1].toString().split("/")[3]);
									 String formattedDate = outputFormat.format(date);
									 if(entry.getValue().equalsIgnoreCase(formattedDate)){
										 key=entry.getKey().toString();
									 } }%>
								
								<%=committee.getCommitteeShortName().trim().toUpperCase()+"-"+key+"/"+obj[1].toString().split("/")[4] %>
								</span> 
								<%}%>
									</td>
									<td  style="text-align: justify ;"><%=obj[2] %></td>
									<td style="text-align: center;">
									<%	String actionstatus = obj[9].toString();
										int progress = obj[15]!=null ? Integer.parseInt(obj[15].toString()) : 0;
										LocalDate pdcorg = LocalDate.parse(obj[3].toString());
										LocalDate lastdate = obj[13]!=null ? LocalDate.parse(obj[13].toString()): null;
										LocalDate today = LocalDate.now();
										LocalDate endPdc=LocalDate.parse(obj[4].toString());
									%> 
					 				<% if(lastdate!=null && actionstatus.equalsIgnoreCase("C") ){%>
											<%if(actionstatus.equals("C") && (pdcorg.isAfter(lastdate) || pdcorg.equals(lastdate))){%>
											<span class="completed"><%= sdf.format(sdf1.parse(obj[13].toString()))%> </span>
											<%}else if(actionstatus.equals("C") && pdcorg.isBefore(lastdate)){ %>	
											<span class="completeddelay"><%= sdf.format(sdf1.parse(obj[13].toString()))%> </span>
											<%} %>	
										<%}else{ %>
												-									
										<%} %>
									<br>
									<span <%if(endPdc.isAfter(today) || endPdc.isEqual(today)) {%>style="color:black;font-weight: bold;" <%} else{%> style="color:maroon ;font-weight:bold;" <%} %>>
									<%=sdf.format(sdf1.parse(endPdc.toString())) %>
									</span>	
									<%if(!pdcorg.equals(endPdc)) {%>
									<br>
									<span <%if(pdcorg.isAfter(today) || pdcorg.isEqual(today)) {%>style="color:black;font-weight: bold;" <%} else{%> style="color:maroon ;font-weight:bold;" <%} %>>
									<%=sdf.format(sdf1.parse(pdcorg.toString())) %>
									</span>	
									<%} %>
								</td>	
									<td> 
										<%=obj[11] %>, <%=obj[12] %> </td>
										<td  style="text-align: center;" > 
										<% if(lastdate!=null && actionstatus.equalsIgnoreCase("C") ){ %>
										<%if(actionstatus.equals("C") && (pdcorg.isAfter(lastdate) || pdcorg.equals(lastdate))){%>
										<span class="completed">CO</span>
										<%}else if(actionstatus.equals("C") && pdcorg.isBefore(lastdate)){ %>	
										<span class="completeddelay">CD (<%= ChronoUnit.DAYS.between(pdcorg, lastdate) %>) </span>
										<%} %>	
										<%}else{ %>
										<%if(actionstatus.equals("F")  && (pdcorg.isAfter(lastdate) || pdcorg.isEqual(lastdate) )){ %>
										<span class="ongoing">RC</span>												
										<%}else if(actionstatus.equals("F")  && pdcorg.isBefore(lastdate)) { %>
										<span class="delay">FD</span>
										<%}else if(actionstatus.equals("A") && progress==0){  %>
										<span class="assigned">AA <%if(pdcorg.isBefore(today)){ %> (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>) <%} %></span>
									    <%} else if(pdcorg.isAfter(today) || pdcorg.isEqual(today)){  %>
										<span class="ongoing">OG</span>
										<%}else if(pdcorg.isBefore(today)){  %>
										<span class="delay">DO (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>)  </span>
										<%} %>					
										<%} %>
										
						
									</td>	
									<td style="text-align: justify ;"><%if(obj[16]!=null){%><%=obj[16] %><%} %></td>			
								</tr>			
							<%i++;
							}} %>
							</tbody>
									
						</table> 
								
					<%} %>
								
			<div align="left" style="margin-left: 15px;">(c) Details of Technical/ User Reviews (if any).</div>
						
							
						<div align="center" style="width:1100px">

							<form action="CommitteeMinutesNewDownload.htm" method="get" target="_blank">
							<div class="row">
							<%for(Map.Entry<String, List<Object[]>> entry : reviewMeetingListMap.entrySet()) { 
								if(entry.getValue().size()>0) { %>
									<div class="col-md-4 mt-2">
										<table class="subtables" style="align: left; margin-top: 10px; margin-left: 25px; max-width: 350px; border-collapse: collapse; float: left;">
											<thead>
												<tr>
													<th  style="width: 140px; ">Committee</th>
													<th  style="width: 140px; "> Date Held</th>
												</tr>
											</thead>
											<tbody>
												<%int i=0;
												for(Object[] obj : entry.getValue()){ %>
													<tr>
														<td >
															<button class="btn btn-link" style="padding:0px;margin:0px;" name="committeescheduleid" value="<%=obj[0]%>"> <%=entry.getKey()%> #<%=++i %></button>
														</td>												
														<td style="text-align: center; " ><%= fc.sdfTordf(obj[3].toString())%></td>
													</tr>				
												<%} %>
											</tbody>
										</table>
									</div>
								<%} %>	
							<%} %>
							</div>
						</form>
						
									<%if(otherMeetingList!=null && otherMeetingList.size()>0) {
					int count=0;
				%>
				<div align="left" class="mb-2 ml-4"><b><%="Other Meetings" %></b></div>
						<div align="left" class="mb-2"><table class="subtables" style="align: left; margin-top: 10px; margin-left: 25px; max-width: 350px; border-collapse: collapse;">
						<thead><tr> <th style="width: 140px; ">Committee</th> <th  style="width: 140px; "> Date Held</th></tr></thead>
				<%for(Object[]obj:otherMeetingList) {%>
				
											<tbody>
									<tr><td><button class="btn btn-link" style="padding:0px;margin:0px;" name="committeescheduleid" value="<%=obj[0]%>"><%=obj[3]%> </button>
														</td>												
														<td  style="text-align: center; " ><%= sdf.format(sdf1.parse(obj[1].toString()))%></td>
													</tr>
									</tbody>
				
				<%}%></table></div> <%} %>
						</div>
															
					<%} %>
					 
				</details>
				
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->				
				 
						<details>
   						<summary role="button" tabindex="0"><b>5. Milestones achieved prior to this <%=committee.getCommitteeShortName().trim().toUpperCase() %> period.</b>  </summary>
							<div class="content">
				
								<%for(int z=0;z<1;z++){ %>
									<%if(ProjectDetail.size()>1){ %>
										<div>
											<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
										</div>	
									<%} %>	
				
							<table  class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;  border-collapse:collapse;" >
								<thead>
								<tr>
									<td colspan="10" style="border: 0">
										<p style="font-size: 10px;text-align: center"> 
											 <span class="notassign">NA</span> : Not Assigned &nbsp;&nbsp;
											 <span class="assigned">AA</span> : Activity Assigned &nbsp;&nbsp; 
											 <span class="ongoing">OG</span> : On Going &nbsp;&nbsp; 
											 <span class="delay">DO</span> : Delay - On Going &nbsp;&nbsp; 
											 <span class="ongoing">RC</span> : Review & Close &nbsp;&nbsp;
											 <span class="delay">FD</span> : Forwarded With Delay &nbsp;&nbsp;
											 <span class="completed">CO</span> : Completed &nbsp;&nbsp; 
											 <span class="completeddelay">CD</span> : Completed with Delay &nbsp;&nbsp; 
											 <span class="inactive">IA</span> : InActive &nbsp;&nbsp;
											 <span class="delaydays">DD</span> : Delayed days &nbsp;&nbsp; 
										 </p>
									</td>									
								</tr>
								
									<tr>
										<th  style="width: 20px; ">SN</th>
										<th  style="width: 30px; ">MS</th>
										<th  style="width: 60px; ">L</th>
										<th  style="width: 350px; ">System/ Subsystem/ Activities</th>
										<th  style="width: 120px; ">ADC<br> PDC</th>
									<!-- 	<th  style="width: 150px; "> ADC</th> -->
										<th  style="width: 60px; "> Progress</th>
										<th  style="width: 50px; "> Status(DD)</th>
									 	<th  style="width: 260px; "> Remarks</th>
									 	<th  style="max-width: 30px; "> Info </th>
									</tr>
								</thead>
									<% if( milestones.get(z).size()>0){
										long count1=1;
										int milcountA=1;
										int milcountB=1;
										int milcountC=1;
										int milcountD=1;
										int milcountE=1;
										
										%>
										<%int serial=1;for(Object[] obj:milestones.get(z)){
											
											if(Integer.parseInt(obj[21].toString())<= Integer.parseInt(levelid)){
											%>
											<tr>
												<td style="text-align: center"><%=serial%></td>
												<td>M<%=obj[0] %></td>
												
												<td style="text-align: center">
													<%
													
													if(obj[21].toString().equals("0")) {%>
														<!-- L -->
													<%	milcountA=1;
														milcountB=1;
														milcountC=1;
														milcountD=1;
														milcountE=1;
													}else if(obj[21].toString().equals("1")) {
														for(Map.Entry<Integer,String>entry:treeMapLevOne.entrySet()){
															if(entry.getKey().toString().equalsIgnoreCase(obj[2].toString())){%>
																<%=entry.getValue() %>
														<%}} 
														%>
														<%-- A-<%=milcountA %> --%>
													<%/*  milcountA++;
														milcountB=1;
														milcountC=1;
														milcountD=1;
														milcountE=1; */
													}else if(obj[21].toString().equals("2")) {
														for(Map.Entry<Integer,String>entry:treeMapLevTwo.entrySet()){
															if(entry.getKey().toString().equalsIgnoreCase(obj[3].toString())){%>
																<%=entry.getValue() %>
														<%}}	
														%>
														<%-- B-<%=milcountB %> --%>
													<%/* milcountB+=1;
													milcountC=1;
													milcountD=1;
													milcountE=1; */
													}else if(obj[21].toString().equals("3")) { %>
														C-<%=milcountC %>
													<%milcountC+=1;
													milcountD=1;
													milcountE=1;
													}else if(obj[21].toString().equals("4")) { %>
														D-<%=milcountD %>
													<%
													milcountD+=1;
													milcountE=1;
													}else if(obj[21].toString().equals("5")) { %>
														E-<%=milcountE %>
													<%milcountE++;
													} %>
												</td>
	
												<td style="<%if(obj[21].toString().equals("0")) {%>font-weight: bold;<%}%>">
													<%if(obj[21].toString().equals("0")) {%>
														<%=obj[10] %>
													<%}else if(obj[21].toString().equals("1")) { %>
														&nbsp;&nbsp;<%=obj[11] %>
													<%}else if(obj[21].toString().equals("2")) { %>
														&nbsp;&nbsp;<%=obj[12] %>
													<%}else if(obj[21].toString().equals("3")) { %>
														&nbsp;&nbsp;<%=obj[13] %>
													<%}else if(obj[21].toString().equals("4")) { %>
														&nbsp;&nbsp;<%=obj[14] %>
													<%}else if(obj[21].toString().equals("5")) { %>
														&nbsp;&nbsp;<%=obj[15] %>
													<%} %>
												</td>
												<td style="text-align: center">
												<!-- ADC  -->
												<% 
													LocalDate StartDate = LocalDate.parse(obj[7].toString());
													LocalDate EndDate = LocalDate.parse(obj[8].toString());
													LocalDate OrgEndDate = LocalDate.parse(obj[9].toString());
													int Progess = Integer.parseInt(obj[17].toString());
													LocalDate CompletionDate =obj[24]!=null ? LocalDate.parse(obj[24].toString()) : null;
													
													LocalDate Today = LocalDate.now();
													
												%>
												<% if ((obj[19].toString().equalsIgnoreCase("3") || obj[19].toString().equalsIgnoreCase("5")) && obj[24] != null) { %>	
															<span 
																<%if(Progess==0){ %>
																	class="assigned"
																<%} else if(Progess>0 && Progess<100 && (OrgEndDate.isAfter(Today) || OrgEndDate.isEqual(Today) )){ %>
																	class="ongoing"
																<%} else if( Progess>0 && Progess<100 && (OrgEndDate.isBefore(Today) )){ %>
																	class="delay"
																<%} else if((CompletionDate!=null && ( CompletionDate.isBefore(OrgEndDate) ||  CompletionDate.isEqual(OrgEndDate)))){ %>
																	class="completed"
																<%} else if((CompletionDate!=null && CompletionDate.isAfter(OrgEndDate) )){ %>
																	class="completeddelay"
																<%}else if(CompletionDate!=null && Progess==0 &&  ( EndDate.isAfter(Today) ||  EndDate.isEqual(Today)) ){ %>
																	class="inactive"
																<%}else{ %>
																	class="assigned"
																<%} %>
																> <%=sdf.format(sdf1.parse(obj[24].toString()))%> </span>
															
														 <% } else {  %> - <% } %>
												
												<br>
													<%if(! LocalDate.parse(obj[8].toString()).isEqual(LocalDate.parse(obj[9].toString())) ){ %> 
														<%= sdf.format(sdf1.parse(obj[8].toString()))%><br> 
													<%}%>
													<%=sdf.format(sdf1.parse(obj[9].toString())) %>
												</td>
												

												<!-- <td style="text-align: center"> -->
														<%-- <% if ((obj[19].toString().equalsIgnoreCase("3") || obj[19].toString().equalsIgnoreCase("5")) && obj[24] != null) { %>
														<span class="<%if (obj[19].toString().equalsIgnoreCase("0")) {%>assigned
																					<%} else if (obj[19].toString().equalsIgnoreCase("1")) {%> assigned
																					<%} else if (obj[19].toString().equalsIgnoreCase("2")) {%> ongoing
																					<%} else if (obj[19].toString().equalsIgnoreCase("3")) {%> completed
																					<%} else if (obj[19].toString().equalsIgnoreCase("4")) {%> delay 
																					<%} else if (obj[19].toString().equalsIgnoreCase("5")) {%> completeddelay
																					<%} else if (obj[19].toString().equalsIgnoreCase("6")) {%> inactive<%}%>	 ">
						
															<%=sdf.format(sdf1.parse(obj[24].toString()))%> 
															<% } else {  %> - <% } %> --%>
														
												<!-- </td> -->
												<td style="text-align: center"><%=obj[17] %>%</td>											
												<%-- <td style="text-align: center">
													<span class="<%if(obj[19].toString().equalsIgnoreCase("0")){%>assigned
															<%}else if(obj[19].toString().equalsIgnoreCase("1")) {%> assigned
															<%}else if(obj[19].toString().equalsIgnoreCase("2")) {%> ongoing
															<%}else if(obj[19].toString().equalsIgnoreCase("3")) {%> completed
															<%}else if(obj[19].toString().equalsIgnoreCase("4")) {%> delay 
															<%}else if(obj[19].toString().equalsIgnoreCase("5")) {%> completeddelay
															<%}else if(obj[19].toString().equalsIgnoreCase("6")) {%> inactive<%} %>	 " >
														<%=obj[22] %>	
														
														<%if(obj[19].toString().equalsIgnoreCase("5") && obj[24]!=null){ %>
															(<%= ChronoUnit.DAYS.between(LocalDate.parse(obj[9].toString()), LocalDate.parse(obj[24].toString())) %>) 
														<%}else if(obj[19].toString().equalsIgnoreCase("4")){ %>
															(<%= ChronoUnit.DAYS.between(LocalDate.parse(obj[9].toString()), LocalDate.now()) %>)
														<%} %>	
													</span>
												
												</td> --%>
												
												<td style="text-align: center">	
								
														<%if(Progess==0){ %>
															<span class="assigned"> AA </span>
														<%} else if(Progess>0 && Progess<100 && (OrgEndDate.isAfter(Today) || OrgEndDate.isEqual(Today) )){ %>
															<span class="ongoing"> OG </span>
														<%} else if( Progess>0 && Progess<100 && (OrgEndDate.isBefore(Today) )){ %>
															<span class="delay"> DO (<%=ChronoUnit.DAYS.between(OrgEndDate, LocalDate.now())%>)</span>
														<%} else if((CompletionDate!=null && ( CompletionDate.isBefore(OrgEndDate) ||  CompletionDate.isEqual(OrgEndDate)))){ %>
															<span class="completed"> CO</span>
														<%} else if((CompletionDate!=null && CompletionDate.isAfter(OrgEndDate) )){ %>
															<span class="completeddelay">CD (<%=ChronoUnit.DAYS.between(OrgEndDate, CompletionDate)%>)</span>
														<%}else if(CompletionDate!=null && Progess==0 &&  ( EndDate.isAfter(Today) ||  EndDate.isEqual(Today)) ){ %>
															<span class="inactive">IA</span>
														<%}else{ %>
															<span class="assigned">AA</span>
														<%} %>
													
												</td>
												<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;"><%if(obj[23]!=null){%><%=obj[23]%><%} %></td>
	                                            <td >
													<a  data-toggle="modal" data-target="#exampleModal1" data-id="milestonemodal<%=obj[0] %>" class="milestonemodal" data-whatever="@mdo" style="padding: 0px 1.5rem;cursor:pointer" >
														<i class="fa fa-info-circle " style="font-size: 1.3rem;color:#145374 " aria-hidden="true"></i> 
													</a>
												</td>
											</tr>
										<%count1++;serial++;}} %>
									<%} else{ %>
									<tr><td colspan="10" style="text-align:center; "> Nil</td></tr>
									
									
									<%} %>
							</table>
			
			
								<div id="milestoneactivitychange" ></div>
								
							<%} %>
						</div>
				</details>
 				
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->
				 	
						<details>
   						<summary role="button" tabindex="0" id="leveltab"><b>6. Details of work and current status of sub system with major milestones (since last <%=committee.getCommitteeShortName().trim().toUpperCase()%>)</b>  </summary>
						<div class="content">
							
							<%for(int z=0;z<1;z++){ %>
								<%if(ProjectDetail.size()>1){ %>
									<div>
										<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
									</div>	
								<%} %>	
								<div align="left" style="margin-left: 15px;">(a) Work carried out, Achievements, test result etc.
									   <%if(z==0){ %>
										<form action="FilterMilestone.htm" method="POST">  
											<button class="btn btn-sm back"    style="float: right;margin-top: 5px;text-transform: capitalize !important; " formtarget="blank"> Filter</button> 
											<input type="hidden" name="projectidvalue" <%if( projectid!=null ){%> value="<%=projectid%>" <%}%>>
											<input type="hidden" name="committeidvalue" <%if(committeeid!=null){%> value="<%=committeeid %>" <%}%>>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										</form>
										<%}%> 
								</div>
								<div align="left" style="margin-left: 20px;"><b>Present Status:</b>
								
								</div>
								
								
								
			<!-- Tharun code Start (For Filtering Milestone based on levels) -->		
			
			
						<table  class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;  border-collapse:collapse;" >
							<thead>
							<tr>
								<td colspan="10" style="border: 0">
									<p style="font-size: 10px;text-align: center"> 
										 <span class="notassign">NA</span> : Not Assigned &nbsp;&nbsp;
										 <span class="assigned">AA</span> : Activity Assigned &nbsp;&nbsp; 
										 <span class="ongoing">OG</span> : On Going &nbsp;&nbsp; 
										 <span class="delay">DO</span> : Delay - On Going &nbsp;&nbsp; 
										 <span class="ongoing">RC</span> : Review & Close &nbsp;&nbsp;
										 <span class="delay">FD</span> : Forwarded With Delay &nbsp;&nbsp;
										 <span class="completed">CO</span> : Completed &nbsp;&nbsp; 
										 <span class="completeddelay">CD</span> : Completed with Delay &nbsp;&nbsp; 
										 <span class="inactive">IA</span> : InActive &nbsp;&nbsp;
										 <span class="delaydays">DD</span> : Delayed days &nbsp;&nbsp; 
									 </p>
								</td>									
							</tr>
							
							<tr>
								<th  style="width: 20px; ">SN</th>
								<th  style="width: 30px; ">MS</th>
								<th  style="width: 60px; ">L</th>
								<th  style="width: 350px; ">System/ Subsystem/ Activities</th>
								<th  style="width: 150px; "> PDC</th>
								<th  style="width: 60px; "> Progress</th>
								<th  style="width: 50px; "> Status(DD)</th>
							 	<th  style="width: 260px; "> Remarks</th>
							</tr>
							</thead>
								<% if( MilestoneDetails6.get(z).size()>0) { 
									long count1=1;
									int milcountA=1;
									int milcountB=1;
									int milcountC=1;
									int milcountD=1;
									int milcountE=1;
									
									%>
									<%int serial=1;for(Object[] obj:MilestoneDetails6.get(z)){
										
										if(Integer.parseInt(obj[21].toString())<= Integer.parseInt(levelid)){
										%>
										<tr>
											<td style="text-align: center"><%=serial%></td>
											<td>M<%=obj[0] %></td>
											
											<td style="text-align: center">
												<%
												
												if(obj[21].toString().equals("0")) {%>
													<!-- L -->
												<%	milcountA=1;
													milcountB=1;
													milcountC=1;
													milcountD=1;
													milcountE=1;
												}else if(obj[21].toString().equals("1")) {
													for(Map.Entry<Integer,String>entry:treeMapLevOne.entrySet()){
														if(entry.getKey().toString().equalsIgnoreCase(obj[2].toString())){%>
															<%=entry.getValue() %>
													<%}}	
													
													%>
													<%-- A-<%=milcountA %> --%>
												<% /* milcountA++;
													milcountB=1;
													milcountC=1;
													milcountD=1;
													milcountE=1; */
												}else if(obj[21].toString().equals("2")) { 
													for(Map.Entry<Integer,String>entry:treeMapLevTwo.entrySet()){
														if(entry.getKey().toString().equalsIgnoreCase(obj[3].toString())){%>
															<%=entry.getValue() %>
													<%}}	
												%>
													<%-- B-<%=milcountB %> --%>
												<%/* milcountB+=1;
												milcountC=1;
												milcountD=1;
												milcountE=1; */
												}else if(obj[21].toString().equals("3")) { %>
													C-<%=milcountC %>
												<%milcountC+=1;
												milcountD=1;
												milcountE=1;
												}else if(obj[21].toString().equals("4")) { %>
													D-<%=milcountD %>
												<%
												milcountD+=1;
												milcountE=1;
												}else if(obj[21].toString().equals("5")) { %>
													E-<%=milcountE %>
												<%milcountE++;
												} %>
											</td>

											<td style="<%if(obj[21].toString().equals("0")) {%>font-weight: bold;<%}%>">
												<%if(obj[21].toString().equals("0")) {%>
													<%=obj[10] %>
												<%}else if(obj[21].toString().equals("1")) { %>
													&nbsp;&nbsp;<%=obj[11] %>
												<%}else if(obj[21].toString().equals("2")) { %>
													&nbsp;&nbsp;<%=obj[12] %>
												<%}else if(obj[21].toString().equals("3")) { %>
													&nbsp;&nbsp;<%=obj[13] %>
												<%}else if(obj[21].toString().equals("4")) { %>
													&nbsp;&nbsp;<%=obj[14] %>
												<%}else if(obj[21].toString().equals("5")) { %>
													&nbsp;&nbsp;<%=obj[15] %>
												<%} %>
											</td>
											<td style="text-align: center">
												<%if(! LocalDate.parse(obj[8].toString()).isEqual(LocalDate.parse(obj[9].toString())) ){ %> 
													<%= sdf.format(sdf1.parse(obj[8].toString()))%><br> 
												<%}%>
												<%=sdf.format(sdf1.parse(obj[9].toString())) %>
											</td>
											<% 
												LocalDate StartDate = LocalDate.parse(obj[7].toString());
												LocalDate EndDate = LocalDate.parse(obj[8].toString());
												LocalDate OrgEndDate = LocalDate.parse(obj[9].toString());
												int Progess = Integer.parseInt(obj[17].toString());
												LocalDate CompletionDate =obj[24]!=null ? LocalDate.parse(obj[24].toString()) : null;
												LocalDate Today = LocalDate.now();
											%>
											<td style="text-align: center"><%=obj[17] %>%</td>											
											<td style="text-align: center">
												<%-- <span class="<%if (obj[19].toString().equalsIgnoreCase("0")) {%>assigned
																		<%} else if (obj[19].toString().equalsIgnoreCase("1")) {%> assigned
																		<%} else if (obj[19].toString().equalsIgnoreCase("2")) {%> ongoing
																		<%} else if (obj[19].toString().equalsIgnoreCase("3")) {%> completed
																		<%} else if (obj[19].toString().equalsIgnoreCase("4")) {%> delay 
																		<%} else if (obj[19].toString().equalsIgnoreCase("5")) {%> completeddelay
																		<%} else if (obj[19].toString().equalsIgnoreCase("6")) {%> inactive<%}%>	 ">
													<%=obj[22]%> 
													<% if ( obj[19].toString().equalsIgnoreCase("5") && obj[24] != null) {  %>
														(<%=ChronoUnit.DAYS.between(LocalDate.parse(obj[9].toString()), LocalDate.parse(obj[24].toString()))%>)
													<% } else if (obj[19].toString().equalsIgnoreCase("4")) { %>
														(<%=ChronoUnit.DAYS.between(LocalDate.parse(obj[9].toString()), LocalDate.now())%>)
													<% } %>
				
												</span> --%>
												
												
												<%if(Progess==0){ %>
													<span class="assigned"> AA </span>
												<%} else if(Progess>0 && Progess<100 && (OrgEndDate.isAfter(Today) || OrgEndDate.isEqual(Today) )){ %>
													<span class="ongoing"> OG </span>
												<%} else if( Progess>0 && Progess<100 && (OrgEndDate.isBefore(Today) )){ %>
													<span class="delay"> DO (<%=ChronoUnit.DAYS.between(OrgEndDate, LocalDate.now())%>)</span>
												<%} else if((CompletionDate!=null && ( CompletionDate.isBefore(OrgEndDate) ||  CompletionDate.isEqual(OrgEndDate)))){ %>
													<span class="completed"> CO</span>
												<%} else if((CompletionDate!=null && CompletionDate.isAfter(OrgEndDate) )){ %>
													<span class="completeddelay">CD (<%=ChronoUnit.DAYS.between(OrgEndDate, CompletionDate)%>)</span>
												<%}else if(CompletionDate!=null && Progess==0 &&  ( EndDate.isAfter(Today) ||  EndDate.isEqual(Today)) ){ %>
													<span class="inactive">IA</span>
												<%}else{ %>
													<span class="assigned">AA</span>
												<%} %>
												
											</td>
											<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;"><%if(obj[23]!=null){%><%=obj[23]%><%} %></td>
										</tr>
									<%count1++;serial++;}} %>
								<%} else{ %>
										<tr><td colspan="9" style="text-align:center; "> Nil</td></tr>
								
								
								<%} %>
							</table>

								<!--  Commenting Old Data End-->
							
								<div align="left" style="margin-left: 15px;">(b) TRL table with TRL at sanction stage and current stage indicating overall PRI.</div>
									
								<div>
									<table  >
										<tr><td style="border:0;"></td>
											<td style="border:0;">  
											<%if(projectdatadetails.get(z)!=null && projectdatadetails.get(z)[6]!=null ){ %>
												<form action="ProjectDataSystemSpecsFileDownload.htm"  method="post" target="_blank" >	
													<span class="anchorlink" onclick="$('#pearl<%=ProjectDetail.get(z)[0] %>').toggle();"  style="color: #C84B31;cursor: pointer;" ><b>As on File Attached</b></span>
													<button  type="submit" class="btn btn-sm "  ><i class="fa fa-download fa-lg" ></i></button>
													<input type="hidden" name="projectdataid" value="<%=projectdatadetails.get(z)[0]%>"/>
													<input type="hidden" name="filename" value="pearl"/>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</form>	
												
												<%
												Path trlPath = Paths.get(filePath,projectLabCode,"ProjectData",projectdatadetails.get(z)[6].toString());
												File trlfile = trlPath.toFile();
												if(trlfile.exists()){
												if(FilenameUtils.getExtension(projectdatadetails.get(z)[6].toString()).equalsIgnoreCase("pdf")){ %>
													<iframe	width="1200" height="600" src="data:application/pdf;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(trlfile))%>"  id="pearl<%=ProjectDetail.get(z)[0] %>" style="display: none" > </iframe>
												<%}else{
													%>
													<img style="max-width:25cm;max-height:17cm;display: none" src="data:image/<%=FilenameUtils.getExtension(projectdatadetails.get(z)[6].toString()) %>;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(trlfile))%>"  id="pearl<%=ProjectDetail.get(z)[0] %>"  >											
												  <%} %>
												<%} %>
											<% }else{ %>
												File Not Found
											<%} %>
										</td>
										</tr>
									</table>
								</div>
								<div align="left" style="margin-left: 15px;">(c) Risk Matrix/Management Plan/Status. </div>
									
									<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;  border-collapse:collapse;" >
										<thead>	
												<tr>
													<td colspan="9" style="border: 0">
														<p style="font-size: 10px;text-align: center"> 
															<span class="notassign">NA</span> : Not Assigned &nbsp;&nbsp;
															<span class="assigned">AA</span> : Activity Assigned &nbsp;&nbsp; 
															<span class="ongoing">OG</span> : On Going &nbsp;&nbsp; 
															<span class="delay">DO</span> : Delay - On Going &nbsp;&nbsp; 
															<span class="ongoing">RC</span> : Review & Close &nbsp;&nbsp;
															<span class="delay">FD</span> : Forwarded With Delay &nbsp;&nbsp;
															<span class="completed">CO</span> : Completed &nbsp;&nbsp; 
															<span class="completeddelay">CD</span> : Completed with Delay &nbsp;&nbsp; 
															<span class="inactive">IA</span> : InActive &nbsp;&nbsp;
															<span class="delaydays">DD</span> : Delayed days &nbsp;&nbsp; 
														</p>
									   				</td>									
												</tr>
												<tr>
													<td colspan="9" style="border:0;text-align: right;"><b>RPN :</b>Risk Priority Number</td>
												</tr>
												<tr>
													<th style="width: 15px;text-align: center " rowspan="2">SN</th>
													<th style="width: 330px; " colspan="3">
														Risk
														<a data-toggle="modal" class="fa faa-pulse animated " data-target="#RiskTypesModal" data-whatever="@mdo" style="padding: 0px 1.5rem;cursor:pointer"><i class="fa fa-info-circle " style="font-size: 1.3rem;color: " aria-hidden="true"></i> </a>
													</th>
													<th style="width: 100px; " rowspan="1" > ADC <br>PDC</th>
												<!-- 	<th style="width: 100px; " rowspan="1"> ADC</th> -->
													<th style="width: 160px; " rowspan="1"> Responsibility</th>
													<th style="width: 50px; "  rowspan="1">Status(DD)</th>
													<th style="width: 215px; " rowspan="1">Remarks</th>	
												</tr>
												<tr>
													<th  style="text-align: center;width: 110px; " > Severity<br>(1-10)</th>
													<th  style="text-align: center;width: 110px;"> Probability<br>(1-10)</th>
													<th  style="text-align: center;width: 110px;"> RPN<br>(1-100)</th>
													<th  style="width:210px" colspan="3" > Mitigation Plans</th>
													<th  style="width:315px" colspan="2"> Impact</th>		
												</tr>
															
										</thead>
																							
										<tbody>
											<%if(riskmatirxdata.get(z).size()>0){
												int i=0;%> 
													<%for(Object[] obj : riskmatirxdata.get(z)){
													i++;%>
														<tr>
															<td style="text-align: center" rowspan="2"><%=i %></td>
															<td style="text-align: justify;color: red; " colspan="3" >
																<%=obj[0] %> <span style="color: #3D60FF;font-weight: bold;"> - <%=obj[23] %><%=obj[24]%></span>
															</td>
															<td style="text-align: center" rowspan="1">
															<%	String actionstatus = obj[15].toString();
																	LocalDate pdcorg = LocalDate.parse(obj[9].toString());
																	LocalDate enddate = LocalDate.parse(obj[17].toString());
																	LocalDate lastdate = obj[20]!=null ? LocalDate.parse(obj[20].toString()): null;
																	LocalDate today = LocalDate.now();
																	int progress = obj[18]!=null ? Integer.parseInt(obj[18].toString()) : 0;
																%> 
																	<% if(lastdate!=null && actionstatus.equalsIgnoreCase("C") ){%>
																		<%if(actionstatus.equals("C") && (pdcorg.isAfter(lastdate) || pdcorg.equals(lastdate))){%>
																		<span class="completed"><%= sdf.format(sdf1.parse(obj[20].toString()))%> </span>
																		<%}else if(actionstatus.equals("C") && pdcorg.isBefore(lastdate)){ %>	
																		<span class="completeddelay"><%= sdf.format(sdf1.parse(obj[20].toString()))%> </span>
																		<%} %>	
																	<%}else{ %>
																		-									
																	<%} %>
																	<br>
															
															
																<%-- <% if (obj[11] != null && !LocalDate.parse(obj[11].toString()).equals(LocalDate.parse(obj[10].toString())) ) { %><%=sdf.format(sdf1.parse(obj[11].toString()))%><br> <% } %>
																<% if (obj[10] != null && !LocalDate.parse(obj[10].toString()).equals(LocalDate.parse(obj[9].toString())) ) { %><%=sdf.format(sdf1.parse(obj[10].toString()))%><br><% } %> --%>
																<%if(!pdcorg.equals(enddate)) {%>
																<%=sdf.format(sdf1.parse(obj[17].toString()))%>
																<%} %>
																
																<%=sdf.format(sdf1.parse(obj[9].toString()))%>
															</td>
															
														<!-- 	<td style="text-align: center" rowspan="1">
																
															</td> -->
																		
															<td rowspan="1"  ><%=obj[7] %>, <%=obj[8] %></td>	
															<td style="text-align: center" rowspan="1">
																	
																<% if(lastdate!=null && actionstatus.equalsIgnoreCase("C") ){ %>
																	<%if(actionstatus.equals("C") && (pdcorg.isAfter(lastdate) || pdcorg.equals(lastdate))){%>
																		<span class="completed">CO</span>
																	<%}else if(actionstatus.equals("C") && pdcorg.isBefore(lastdate)){ %>	
																		<span class="completeddelay">CD (<%= ChronoUnit.DAYS.between(pdcorg, lastdate) %>) </span>
																	<%} %>	
																<%}else{ %>
																	<%if(actionstatus.equals("F")  && (pdcorg.isAfter(lastdate) || pdcorg.isEqual(lastdate) )){ %>
																		<span class="ongoing">RC</span>												
																	<%}else if(actionstatus.equals("F")  && pdcorg.isBefore(lastdate)) { %>
																		<span class="delay">FD</span>
																	<%}else if(actionstatus.equals("A") && progress==0){  %>
																		<span class="assigned">
																			AA <%if(pdcorg.isBefore(today)){ %> (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>) <%} %>
																		</span>
																	<%} else if(pdcorg.isAfter(today) || pdcorg.isEqual(today)){  %>
																		<span class="ongoing">OG</span>
																	<%}else if(pdcorg.isBefore(today)){  %>
																		<span class="delay">DO (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>)  </span>
																	<%} %>					
																									
																<%} %>
																
																			
															</td>
															<td style="text-align: justify" rowspan="1"><%if(obj[19]!=null){ %> <%=obj[19] %><%} %></td>
																
														</tr>	
														
														<%-- <tr>
															<td style="text-align: center;" ><% if(obj[23].toString().equalsIgnoreCase("I")){ %> Internal<%}else{ %>External<%} %></td>
															<td style="text-align: center;" colspan="2" ><%=obj[24] %></td>
														</tr> --%>
																		
														<tr>
															<td style="text-align: center;" ><%=obj[1] %></td>
															<td style="text-align: center;" ><%=obj[2] %></td>
															<td style="text-align: center;">
																<%=obj[22]%>
																<% int RPN =Integer.parseInt(obj[22].toString());
																		if(RPN>=1 && RPN<=25){ %>(Low)
																		<%}else if(RPN>=26 && RPN<=50){ %>(Medium)
																		<%}else if(RPN>=51 && RPN<=75){ %>(High)
																		<%}else if(RPN>=76){ %>(Very High)
																		<%} %>
															</td>
															<td style="text-align: justify;" colspan="3" ><%=obj[3] %></td>
															<td style="text-align: justify;" colspan="2" ><%=obj[21] %></td>
														</tr>
																	
														<%if(riskmatirxdata.get(z).size() > i){ %>
															<tr>
																<td colspan="9" style="color:transparent ;">.</td>
															</tr>
														<%} %>	
														<%}%>
													<%}else{%>
														<tr><td colspan="9"  style="text-align: center;">Nil </td></tr>
													<%} %>
												</tbody>		
											</table>
 	 
									
								
								<% } %>
							</div>
							
									
						</details>
				
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->
				 
						<details>
   						<summary role="button" tabindex="0"><b>7. Details of Procurement</b>  </summary>
						<div class="content">
							<%for(int z=0;z<projectidlist.size();z++){ %>
								<%if(ProjectDetail.size()>1){ %>
									<div>
										<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
									</div>	
								<%} %>
								
								<div align="left" style="margin-left: 15px;"><b>(a) Details of Procurement Plan (Major Items)</b></div>
								<div align="right"> <span class="currency" style="font-weight: bold;" >(In &#8377; Lakhs)</span></div>
			
								
								<table class="subtables" style="width:1200px; margin-left: 8px;margin-top:5px;font-size: 16px; border-collapse: collapse;border: 1px solid black" >
										<thead>
										<tr>
											<th colspan="11" style="text-align: right;"> <span class="currency" >(In &#8377; Lakhs)</span></th>
										</tr>
										 <tr>
										 	<th colspan="11" class="std">Demand Details ( > &#8377; <% if (projectdatadetails.get(0) != null && projectdatadetails.get(0)[13] != null) { %>
													<%=projectdatadetails.get(0)[13].toString().replaceAll("\\.\\d+$", "")%> ) <% } else { %> - )<% } %>
												
											</th>
										</tr>
										</thead>
										
										<tr>
											<th class="std" style="border: 1px solid black;width: 30px !important;">SN</th>
											<th class="std" style="border: 1px solid black;max-width:90px;">Demand No<br>Demand Date</th>
<!-- 											<th class="std" style="border: 1px solid black;max-width:90px; ">Demand Date</th>
 -->											<th class="std" colspan="4" style="border: 1px solid black;max-width: 150px;"> Nomenclature</th>
											<th class="std" style="border: 1px solid black;max-width:90px;"> Est. Cost</th>
											<th class="std" style="border: 1px solid black;max-width:80px; "> Status</th>
											<th class="std" colspan="3" style="border: 1px solid black;max-width:200px;">Remarks</th>
										</tr>
										    <% int k=0;
										    if(procurementOnDemand.get(z)!=null &&  procurementOnDemand.get(z).size()>0){
										    Double estcost=0.0;
										    Double socost=0.0;
										    for(Object[] obj : procurementOnDemand.get(z)){ 
										    	k++; %>
											<tr>
												<td class="std"  style=" border: 1px solid black;"><%=k%></td>
												<td class="std"  style=" border: 1px solid black;"><%=obj[1]%><br><%=sdf.format(sdf1.parse(obj[3].toString()))%></td>
<%-- 												<td class="std"  style=" border: 1px solid black;"><%=sdf.format(sdf1.parse(obj[3].toString()))%></td>
 --%>												<td class="std" colspan="4" ><%=obj[8]%></td>
												<td class="std" style=" text-align:right;"> <%=format.format(new BigDecimal(obj[5].toString())).substring(1)%></td>
												<td class="std"  style=" border: 1px solid black;"> <%=obj[10]%> </td>
												<td class="std" colspan="3" style=" border: 1px solid black;"><%=obj[11]%> </td>		
											</tr>		
											<%
											estcost += Double.parseDouble(obj[5].toString());
										    }%>
										    
										    <tr>
										    	<td class="std" colspan="8" style="text-align: right;"><b>Total</b></td>
										    	<td class="std" style="text-align: right;"><b><%=df.format(estcost)%></b></td>
										    	
										    	<td class="std" colspan="2" style="text-align: right;"></td>

										    </tr>
										    
										    
										    <% }else{%>											
												<tr><td colspan="11" style="border: 1px solid black;text-align: center;" class="std" >Nil </td></tr>
											<%} %>
											<!-- ********************************Future Demand Start *********************************** -->
											<tr>
											<th class="std" colspan="11" style="border: 1px solid black"><span class="mainsubtitle">Future Demand</span></th>
											</tr>
											<tr>
												 <th class="std" style="border: 1px solid black;width: 15px !important;text-align: center;">SN</th>
													 <th class="std"  colspan="4" style="border: 1px solid black;;width: 295px;"> Nomenclature</th>
													 <th class="std" style="border: 1px solid black;width: 80px;"> Est. Cost-Lakh &#8377;</th>
													 <th class="std" style="border: 1px solid black;max-width:50px; "> Status</th>
													 <th class="std" colspan="4" style="border: 1px solid black;max-width: 310px;">Remarks</th>
											</tr>
										
										    			    <% int a=0;
										    if(envisagedDemandlist!=null &&  envisagedDemandlist.size()>0){
										    Double estcost=0.0;
										    Double socost=0.0;
										    for(Object[] obj : envisagedDemandlist){ 
										    	a++; %>
											<tr>
												<td class="std"  style=" border: 1px solid black;"><%=a%></td>
												<td class="std" colspan="4" style="border: 1px solid black;" ><%=obj[3]%></td>
												<td class="std" style="border: 1px solid black; text-align:right;"> <%=format.format(new BigDecimal(obj[2].toString())).substring(1)%></td>
												<td class="std"  style=" border: 1px solid black;"> <%=obj[6]%> </td>
												<td class="std" colspan="4" style="border: 1px solid black;"><%=obj[4]%> </td>		
											</tr>		
											<%
												estcost += Double.parseDouble(obj[2].toString());
										    }%>
										    
										    <tr>
										    	<td  class="std"colspan="7" style="border: 1px solid black;text-align: right;"><b>Total</b></td>
										    	<td class="std" style="border: 1px solid black;text-align: right;" colspan="4"><b><%=df.format(estcost)%></b></td>
										    </tr>
										    
										    
										    <% }else{%>											
												<tr><td colspan="11" style="border: 1px solid black;text-align: center;" class="std" >Nil </td></tr>
											<%} %>
											
									<!-- ********************************Future Demand End *********************************** -->
											
											 <tr >
											 
												<th  class="std"  colspan="11">Orders Placed ( > &#8377; <% if (projectdatadetails.get(0) != null && projectdatadetails.get(0)[13] != null) { %>
													<%=projectdatadetails.get(0)[13].toString().replaceAll("\\.\\d+$", "")%> ) <% } else { %> - )<% } %>
												</th>
											 </tr>
										
										  	 <tr>	
										  	 	 <th class="std" rowspan="1" style="border: 1px solid black;width: 30px !important;">SN</th>
										  	 	 <th class="std" style="border: 1px solid black;width:150px;">Demand No <br>Demand  Date</th>
										  	 	<!--  <th class="std" style="border: 1px solid black;" >Demand  Date</th> -->
												 <th class="std" colspan="2" style="border: 1px solid black;"> Nomenclature</th>
												 <th class="std"  style=" border: 1px solid black;width: 150px;">Supply Order No <br> SO Date </th>
												 <th class="std"  colspan="1" style="border: 1px solid black;width:100px">SO Cost-Lakh &#8377;</th>
												<!--  <th class="std" style="border: 1px solid black;max-width:90px;	">DP Date</th> -->
													 <th class="std" style="border: 1px solid black;width:100px;">DP Date<br> Rev DP</th>
												 <th class="std" colspan="2" style="border: 1px solid black;width: 200px;">Vendor Name</th>
												 <th class="std" style="border: 1px solid black;max-width:80px; "> Status</th>
												<th class="std" style="border: 1px solid black;width:200px; "> Remarks</th>
												</tr>
											
											
											<%if(procurementOnSanction.get(z)!=null && procurementOnSanction.get(z).size()>0){ 
												  int rowk=0;
										    	  Double estcost=0.0;
												  Double socost=0.0;
												  String demand="";
												  List<Object[]> list = new ArrayList<>();
												  for(Object[] obj:procurementOnSanction.get(z)){ 
													if(obj[2]!=null){
														if(!obj[1].toString().equalsIgnoreCase(demand)){
															rowk++;
											  	 		 	 list = procurementOnSanction.get(z).stream().filter(e-> e[0].toString().equalsIgnoreCase(obj[0].toString())).collect(Collectors.toList());
														}
													}
													  
											%>
					<tr>
					<td <%if(!obj[1].toString().equalsIgnoreCase(demand)){ %>  style="border: 1px solid black;border-bottom:none;"<%} else{ %> style="border: 1px solid black;border-bottom:none;border-top:none;"<%} %>>
					<%if(!obj[1].toString().equalsIgnoreCase(demand)){ %>
					<%=rowk %>
					<%} %>
					</td>
					<td <%if(!obj[1].toString().equalsIgnoreCase(demand)){ %> style="border: 1px solid black;border-bottom:none;"<%} else{ %> style="border: 1px solid black;border-bottom:none;border-top:none;"<%} %>>
					<%if(!obj[1].toString().equalsIgnoreCase(demand)){ %><%if(obj[1]!=null) {%> <%=obj[1].toString()%><% }else{ %>-<%} %><br>
					<%=sdf.format(sdf1.parse(obj[3].toString()))%>
					<%} %>
					</td>
					<td colspan="2" <%if(!obj[1].toString().equalsIgnoreCase(demand)){ %> style="border: 1px solid black;border-bottom:none;"<%} else{ %> style="border: 1px solid black;border-bottom:none;border-top:none;"<%} %>>
					<%if(!obj[1].toString().equalsIgnoreCase(demand)){ %>
					<%=obj[8]%>
					<%} %>
					</td>
				<td style="border: 1px solid black;text-align: center;"><% if(obj[2]!=null){%> <%=obj[2]%> <%}else{ %>-<%} %><br>
					<%if(obj[16]!=null){%> <%=sdf.format(sdf1.parse(obj[16].toString()))%> <%}else{ %> - <%} %>
				</td>
				<td style="border: 1px solid black;text-align: right"><%if(obj[6]!=null){%> <%=format.format(new BigDecimal(obj[6].toString())).substring(1)%> <%} else{ %> - <%} %></td>
				<td style="border: 1px solid black;">
				<%if(obj[4]!=null){%> <%=sdf.format(sdf1.parse(obj[4].toString()))%> <%}else{ %> - <%} %><br>
				<span style="text-align: center"><%if(obj[7]!=null){if(!obj[7].toString().equals("null")){%> <%=sdf.format(sdf1.parse(obj[7].toString()))%><%}}else{ %>-<%} %></span>	</td>
					<td colspan="2" style="border: 1px solid black;"><%=obj[12] %> </td>
					<td <%if(!obj[1].toString().equalsIgnoreCase(demand)){ %> style="border: 1px solid black;border-bottom:none;"<%} else{ %> style="border: 1px solid black;border-bottom:none;border-top:none;"<%} %>>
						<%if(!obj[1].toString().equalsIgnoreCase(demand)){ %>
					<%=obj[10]%>
					<%} %>
					
					</td>					
					<td <%if(!obj[1].toString().equalsIgnoreCase(demand)){ %> style="border: 1px solid black;border-bottom:none;"<%} else{ %> style="border: 1px solid black;border-bottom:none;border-top:none;"<%} %>>
						<%if(!obj[1].toString().equalsIgnoreCase(demand)){ %>
					<%=obj[11].toString()%>
					<%} %>
					
					</td>
					
					
					</tr>
											<%
											demand = obj[1].toString();
											Double value = 0.00;
								  	 		if(obj[6]!=null){
								  	 			value=Double.parseDouble(obj[6].toString());
								  	 		}
								  	 		
								  	 		estcost += Double.parseDouble(obj[5].toString());
								  	 		socost +=  value;
											}
											%>
											
												<tr>
										    	<td colspan="5" class="std" style="text-align: right;border: 1px solid black;"><b>Total</b></td>
										    	<td colspan="1" class="std" style="text-align: right;border: 1px solid black;"><b><%=df.format(socost)%></b></td>
										    	<td colspan="5" class="std" style="text-align: right;border: 1px solid black;"></td>
										   		 </tr>	
										 <% }else{%>
											
												<tr><td colspan="8" style="border: 1px solid black;" class="std"  style="text-align: center;">Nil </td></tr>
											<%} %>
									</table> 
								<div align="right" style="width:980px !important;"> <span class="currency" style="font-weight: bold;" >(In &#8377; Lakhs)</span></div>
								<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;width:980px !important;  border-collapse:collapse;" >
										 <thead>
											 <tr >
												 <th colspan="8" ><span class="mainsubtitle">Total Summary of Procurement</span></th>
											 </tr>
										 </thead>
										 
										 <tbody>
										<tr >
												 <th>No. of Demand</th>
												 <th>Est. Cost</th>
										  	 	 <th>No. of Orders</th>
										  	 	 <th>SO Cost </th>
										  	 	 <th>Expenditure</th>
										</tr>
										 
										 <%if(totalprocurementdetails!=null && totalprocurementdetails.size()>0){ 
										 for(TotalDemand obj:totalprocurementdetails){
											 if(obj.getProjectId().equalsIgnoreCase(projectid)){
										 %>
										   <tr>
										      <td style="text-align: center;"><%=obj.getDemandCount() %></td>
										      <td style="text-align: center;"><%=obj.getEstimatedCost() %></td>
										      <td style="text-align: center;"><%=obj.getSupplyOrderCount()%></td>
										      <td style="text-align: center;"><%=obj.getTotalOrderCost() %></td>
										      <td style="text-align: center;"><%=obj.getTotalExpenditure() %></td>
										   </tr>
										   <%}}}else{%>
										   <tr>
										      <td class="std" colspan="5" style="text-align: center;">IBAS Server Could Not Be Connected</td>
										   </tr>
										   <%} %>
										   </tbody>
									  </table>
									  
									  
								<div align="left" style="margin-left: 15px;"><b>(b) Procurement Status</b></div>
								<div align="right" style="width:980px !important;"> <span class="currency" style="font-weight: bold;" >(In &#8377; Lakhs)</span></div>
							 	
							 	<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;width:980px !important;  border-collapse:collapse;font-size: 12px;" >
									<thead>
										<tr>
											<th colspan="29" ><span class="mainsubtitle">Procurement Status</span></th>
									 	</tr>
									 	<tr>
											<th style="width: 30px;">SN</th>
											<th style="width: 250px;">Item Name</th>
											<th style="width: 130px;">Est/SO Cost<br><span class="currency" style="font-weight: bold;" >(In &#8377; Lakhs)</span></th>
											<th style="width: 20px;">0</th>
											<th style="width: 20px;">1</th>
											<th style="width: 20px;">2</th>
											<th style="width: 20px;">3</th>
											<th style="width: 20px;">4</th>
											<th style="width: 20px;">5</th>
											<th style="width: 20px;">6</th>
											<th style="width: 20px;">7</th>
											<th style="width: 20px;">8</th>
											<th style="width: 20px;">9</th>
											<th style="width: 20px;">10</th>
											<th style="width: 20px;">11</th>
											<th style="width: 20px;">12</th>
											<th style="width: 20px;">13</th>
											<th style="width: 20px;">14</th>
											<th style="width: 20px;">15</th>
											<th style="width: 20px;">16</th>
											<th style="width: 20px;">17</th>
											<th style="width: 20px;">18</th>
											<th style="width: 20px;">19</th>
											<th style="width: 20px">20</th>
											<th style="width: 20px">21</th>
											<th style="width: 20px">22</th>
											<th style="width: 20px">23</th>
											<th style="width: 20px">24</th>
											<th style="width: 20px">25</th>
									 	</tr>
									</thead>
									<tbody>
										<%	List<Object[]> procuremntsList = new ArrayList<>();
											
											if( procurementOnDemand.get(z)!=null ){  procuremntsList.addAll(procurementOnDemand.get(z)); }
											if( procurementOnSanction.get(z)!=null ){  procuremntsList.addAll(procurementOnSanction.get(z)); }
										%>
										<%int psn=0; for(Object[] proc : procuremntsList){psn++; %>
											<tr>
												<td style="text-align:center; "><%=psn %></td>
												<td><%=proc[8] %></td>
												<td style="text-align: right;">
													<%if(proc[9].toString().equalsIgnoreCase("S")){ %>
														<%=proc[6] %>
													<%}else{ %>
														<%=proc[5] %>
													<%} %>
												</td>
												<td style="background-color: green;"></td>
												<% int filestatus = Integer.parseInt(proc[13].toString()); 
													int tempstatus = filestatus;
													%>
												<%for(int tdc=1;tdc<=25;tdc++){ %>
													
													<%if(filestatus>11){  filestatus--;  } %>
													<%if(filestatus>25){  filestatus--;  } %>
													
													
													<%if(tdc < (tempstatus)){ %>
														<td style="background-color: green;"></td>
													<%}else if(tdc == (tempstatus)){ %>
														<td style="background-color: green;text-align: center;color: white ">*</td>
													<%}else if(tdc >(tempstatus)){ %>
														<td style=""></td>
													<%} %>
													
												<%} %>
											</tr>
										<%}if(envisagedDemandlist!=null && envisagedDemandlist.size()>0){
										for(Object[] envi : envisagedDemandlist){psn++; %>
										<tr>
												<td style="text-align:center; "><%=psn %></td>
												<td><%=envi[3] %></td>
												<td style="text-align: right;"><%=envi[2] %></td>
												<td style="background-color: #F96E16;text-align: center; ">*</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												</tr>
										<%}} %>
										<%if(psn ==0 && envisagedDemandlist.size()==0 ){ %>
											<tr>
										      <td colspan="29" style="text-align: center;">Nil</td>
										   </tr>
										<%} %>
										
										
								 	</tbody>
								</table>
								<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;width:980px !important;  border-collapse:collapse;font-size: 12px;" >
									<tr>
										<td>0</td>
										<td>Demand to be Initiated</td>
										<td>7</td>
										<td>TCEC Approved</td>
										<td>14</td>
										<td>CDR</td>
										<td>21</td>
										<td>Inward Inspection Clearance</td>
									</tr>
									<tr>
							            <td>1</td>
										<td>Demand Initiated</td>
										<td>8</td>
										<td>TPC Approved</td>
										<td>15</td>
										<td>Acceptance of Critical BoM by Dev Partner</td>
										<td>22</td>
										<td>Payment Process</td>
									</tr>
									<tr>
										<td>2</td>
										<td>SPC Cleared</td>
									    <td>9</td>
										<td>Financial Sanction</td>
										<td>16</td>
										<td>Realization Completed</td>
										<td>23</td>
										<td>Partially Paid</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Demand Approved</td>
									    <td>10</td>
										<td>Order Placement</td>
										<td>17</td>
										<td>FAT Completed</td>
										<td>24</td>
										<td>Payment Released</td>
									</tr>
									<tr>
										<td>4</td>
										<td>Tender Enquiry Floated</td>
										<td>11</td>
										<td>PDR</td>
										<td>18</td>
										<td>ATP/QTP Completed</td>
										<td>25</td>
										<td>Available for Integration</td>
									</tr>
									<tr>
										<td>5</td>
										<td>Receipt of Quotations</td>
										<td>12</td>
										<td>SO for Critical BoM by Dev Partner</td>
										<td>19</td>
										<td>Delivery at Stores</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>6</td>
										<td>Tender Opening</td>
										<td>13</td>
										<td>DDR</td>
										<td>20	</td>
										<td>SAT / SoFT</td>
										<td></td>
										<td></td>
									</tr>
								</table>
									  
               				<% } %>
							</div>
						</details>
				
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->						
				 	
						<details>
   						<summary role="button" tabindex="0"><b>8. Overall Financial Status  <i style="text-decoration: underline;">(&#8377; Crore)</i> </b> </summary>
   						
											  	<div class="content">
						  	<%for(int z=0;z<projectidlist.size();z++){ 
		                		double totSanctionCost=0,totReSanctionCost=0,totFESanctionCost=0;
			                	double totExpenditure=0,totREExpenditure=0,totFEExpenditure=0;
			                 	double totCommitment=0,totRECommitment=0,totFECommitment=0,totalDIPL=0,totalREDIPL=0,totalFEDIPL=0;
				                double totBalance=0,totReBalance=0,totFeBalance=0,btotalRe=0,btotalFe=0;
						  	%>
						  	<%if(ProjectDetail.size()>1){ %>
								<div>
									<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
								</div>	
							<%} %>	
						  	
						  	<br>				 
						  	<table  class="subtables" style="width: 980px;">
						  	    <thead>
		                           <tr>
		                         	<th colspan="2" style="text-align: center ;width:200px !important;">Head</th>
		                         	<th colspan="2" style="text-align: center;width:120px !important;">Sanction</th>
			                        <th colspan="2" style="text-align: center;width:120px !important;">Expenditure</th>
			                        <th colspan="2" style="text-align: center;width:120px !important;">Out Commitment </th>
		                           	<th colspan="2" style="text-align: center;width:120px !important;">Balance</th>
			                        <th colspan="2" style="text-align: center;width:120px !important;">DIPL</th>
		                          	<th colspan="2" style="text-align: center;width:120px !important;">Notional Balance</th>
		                          	<%if(IsIbasConnected!=null &&  IsIbasConnected.equalsIgnoreCase("N")) {%>
		                          	<th colspan="1" style="text-align: center;border: none;">
		                          	<button data-toggle="tooltip" onclick ="showModal(<%=projectid %>,'<%=ProjectDetail.get(z)[0] %>','<%=ProjectDetail.get(z)[1] %>')" class="btn btn-sm"  style="cursor: pointer;font-weight: 600"  type="button"  data-toggle="tooltip" data-placement="right"  title="Upload Overall Finance"  ><i class="fa fa-file-excel-o" aria-hidden="true" style="color: green;"></i>&nbsp;Excel Upload</button>
		                       	<jsp:include page="../print/OverallExcelUpload.jsp"></jsp:include> 
		                          	</th> <%} %>
			                      </tr>
			                      <tr>
				                    <th style="width:30px !important;text-align: center;" >SN</th>
				                    <th   style="width:180px !important;" width="10">Head</th>
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
			                    <%if(IsIbasConnected==null || IsIbasConnected.equalsIgnoreCase("Y")) {%>
			                    <tbody>
			                    <% 

				                int count=1;
			                        if(projectFinancialDetails!=null && projectFinancialDetails.size()>0 && projectFinancialDetails.get(z)!=null ){
			                      for(ProjectFinancialDetails projectFinancialDetail:projectFinancialDetails.get(z)){                       %>
			 
			                         <tr>
										<td align="center" style="max-width:50px !important;text-align: center;"><%=count++ %></td>
										<td ><b><%=projectFinancialDetail.getBudgetHeadDescription()%></b></td>
										<td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getReSanction()) %></td>
										<%totReSanctionCost+=(projectFinancialDetail.getReSanction());%>
										<td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getFeSanction())%></td>
										<%totFESanctionCost+=(projectFinancialDetail.getFeSanction());%>
										<td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getReExpenditure()) %></td>
										<%totREExpenditure+=(projectFinancialDetail.getReExpenditure());%>
									    <td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getFeExpenditure())%></td>
										<%totFEExpenditure+=(projectFinancialDetail.getFeExpenditure());%>
									    <td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getReOutCommitment())%></td>
										<%totRECommitment+=(projectFinancialDetail.getReOutCommitment());%>
									    <td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getFeOutCommitment())%></td>
										<%totFECommitment+=(projectFinancialDetail.getFeOutCommitment());%>
										<td align="right"style="text-align: right;"><%=df.format(projectFinancialDetail.getReBalance()+projectFinancialDetail.getReDipl())%></td>
										<%btotalRe+=(projectFinancialDetail.getReBalance()+projectFinancialDetail.getReDipl());%>
										<td align="right"style="text-align: right;"><%=df.format(projectFinancialDetail.getFeBalance()+projectFinancialDetail.getFeDipl())%></td>
								       	<%btotalFe+=(projectFinancialDetail.getFeBalance()+projectFinancialDetail.getFeDipl());%>
										<td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getReDipl())%></td>
										<%totalREDIPL+=(projectFinancialDetail.getReDipl());%>
										<td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getFeDipl())%></td>
										<%totalFEDIPL+=(projectFinancialDetail.getFeDipl());%>
										<td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getReBalance())%></td>
										<%totReBalance+=(projectFinancialDetail.getReBalance());%>
										<td align="right" style="text-align: right;"><%=df.format(projectFinancialDetail.getFeBalance())%></td>
										<%totFeBalance+=(projectFinancialDetail.getFeBalance());%>
									</tr>
			<%} }%>

					<tr>
						<td colspan="2"><b>Total</b></td>
						<td align="right" style="text-align: right;"><%=df.format(totReSanctionCost)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFESanctionCost)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totREExpenditure)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFEExpenditure)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totRECommitment)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFECommitment)%></td>
						<td align="right" style="text-align: right;"><%=df.format(btotalRe)%></td>
						<td align="right" style="text-align: right;"><%=df.format(btotalFe)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totalREDIPL)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totalFEDIPL)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totReBalance)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFeBalance)%></td>
					</tr>
					<tr>
						<td colspan="2"><b>GrandTotal</b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totReSanctionCost+totFESanctionCost)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totREExpenditure+totFEExpenditure)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totRECommitment+totFECommitment)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(btotalRe+btotalFe)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totalREDIPL+totalFEDIPL)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totReBalance+totFeBalance)%></b></td>
					</tr>
			                         
			                         
			                         
			                    
			                 
			     </tbody>
			     <%}else{ %>
			     <tbody id="tbody<%=ProjectDetail.get(z)[0].toString()%>">
			     <%int count=0;
			     if(overallfinance!=null && overallfinance.size()>0 && overallfinance.get(z)!=null && overallfinance.get(z).size()>0)  {
			    	for(Object[]obj:overallfinance.get(z)){ 
			    	 %>
			    	 <tr>
			   <td align="center" style="max-width:50px !important;text-align: center;"><%=++count %></td>
				<td style="text-align: justify ;"><b><%=obj[4].toString()%></b></td>
				<td style="text-align: right;"><%=obj[5].toString()%></td>
				<td style="text-align: right;"><%=obj[6].toString()%></td>
				<td style="text-align: right;"><%=obj[7].toString()%></td>
				<td style="text-align: right;"><%=obj[8].toString()%></td>
				<td style="text-align: right;"><%=obj[9].toString()%></td>
				<td style="text-align: right;"><%=obj[10].toString()%></td>
				<td style="text-align: right;"><%=obj[11].toString()%></td>
				<td style="text-align: right;"><%=obj[12].toString()%></td>
				<td style="text-align: right;"><%=obj[13].toString()%></td>
				<td style="text-align: right;"><%=obj[14].toString()%></td>
				<td style="text-align: right;"><%=obj[15].toString()%></td>
				<td style="text-align: right;"><%=obj[16].toString()%></td>
				</tr>
			     <%}%>
			    	 	<tr>
						<td colspan="2"><b>Total</b></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[17].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[18].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[19].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[20].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[21].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[22].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[23].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[24].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[25].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[26].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[27].toString()%></td>
						<td align="right" style="text-align: right;"><%=overallfinance.get(z).get(0)[28].toString()%></td>
					</tr>
			     	<tr>
						<td colspan="2"><b>GrandTotal</b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=Double.parseDouble(overallfinance.get(z).get(0)[17].toString())  +Double.parseDouble(overallfinance.get(z).get(0)[18].toString())%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=Double.parseDouble(overallfinance.get(z).get(0)[19].toString())  +Double.parseDouble(overallfinance.get(z).get(0)[20].toString())%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=Double.parseDouble(overallfinance.get(z).get(0)[21].toString())  +Double.parseDouble(overallfinance.get(z).get(0)[22].toString())%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=Double.parseDouble(overallfinance.get(z).get(0)[23].toString())  +Double.parseDouble(overallfinance.get(z).get(0)[24].toString())%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=Double.parseDouble(overallfinance.get(z).get(0)[25].toString())  +Double.parseDouble(overallfinance.get(z).get(0)[26].toString())%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=Double.parseDouble(overallfinance.get(z).get(0)[27].toString())  +Double.parseDouble(overallfinance.get(z).get(0)[28].toString())%></b></td>				     
			     	</tr>
			     <%}else{%> 
			     	<tr>
						<td colspan="2"><b>Total</b></td>
						<td align="right" style="text-align: right;"><%=df.format(totReSanctionCost)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFESanctionCost)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totREExpenditure)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFEExpenditure)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totRECommitment)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFECommitment)%></td>
						<td align="right" style="text-align: right;"><%=df.format(btotalRe)%></td>
						<td align="right" style="text-align: right;"><%=df.format(btotalFe)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totalREDIPL)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totalFEDIPL)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totReBalance)%></td>
						<td align="right" style="text-align: right;"><%=df.format(totFeBalance)%></td>
					</tr>
					<tr>
						<td colspan="2"><b>GrandTotal</b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totReSanctionCost+totFESanctionCost)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totREExpenditure+totFEExpenditure)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totRECommitment+totFECommitment)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(btotalRe+btotalFe)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totalREDIPL+totalFEDIPL)%></b></td>
						<td colspan="2" align="right" style="text-align: right;"><b><%=df.format(totReBalance+totFeBalance)%></b></td>
					</tr>
			     <% }%>
			     </tbody>
			     <% } %>
			</table>  	
  
  
							<%} %>
							
							</div> 	
						
						</details>
	
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->
						
					<details>
						<%if(committee.getCommitteeShortName().trim().equalsIgnoreCase("EB")){ %>
   							<summary role="button" tabindex="0"><b>9. Action Plan for Next Six months </b>    </summary>
						<%}else { %>
							<summary role="button" tabindex="0"><b>9. Action Plan for Next Three months </b>    </summary>
						<%} %>
						
						<div class="content">
						<%for(int z=0;z<1;z++){ %>
							<%if(ProjectDetail.size()>1){ %>
								<div>
									<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
								</div>	
							<%} %>
					
					
				<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;   border-collapse:collapse;" >
				
				
						<thead>
							<tr>
								<td colspan="9" style="border: 0">
									<p style="font-size: 10px;text-align: center"> 
									<span class="notassign">NA</span> : Not Assigned &nbsp;
									<span class="assigned">AA</span> : Activity Assigned &nbsp;
									<span class="ongoing">OG</span> : On Going &nbsp;
									<span class="delay">DO</span> : Delay - On Going &nbsp;
									<span class="ongoing">RC</span> : Review & Close &nbsp;
									<span class="delay">FD</span> : Forwarded With Delay &nbsp;
									<span class="completed">CO</span> : Completed &nbsp;
									<span class="completeddelay">CD</span> : Completed with Delay &nbsp;
									<span class="inactive">IA</span> : InActive &nbsp;
									<span class="delaydays">DD</span> : Delayed days &nbsp;&nbsp; 
									 </p>
								</td>									
							</tr>
							
							<tr>
									<th style="width: 15px !important;text-align: center;">SN</th>
									<th style="width: 20px; ">MS</th>
									<th style="width: 50px; ">L</th>
									<th style="width: 275px;">Action Plan </th>	
									<th style="width: 110px;" >PDC</th>	
									
									<%if(!session.getAttribute("labcode").toString().equalsIgnoreCase("ADE")) {%>
									<th style="width: 210px;">Responsibility </th>
									<%} %>
									<th style="width: 50px;">Progress </th>
					                <th style="width: 50px;padding-right: 5px !important; ">Status(DD)</th>
					             	<!-- <th style="width: 100px;" >FO ( &#x20B9; Cr)</th> -->
					                <th style="width: 220px;">Remarks</th>
								</tr>
							</thead>
							<tbody>
								<%if(actionplanthreemonths.get(z).size()>0){ 
									long count1=1;
									int countA=1;
									int countB=1;
									int countC=1;
									int countD=1;
									int countE=1;
									%>
									<%int serialno=1; for(Object[] obj:actionplanthreemonths.get(z)){
										
										if(Integer.parseInt(obj[26].toString())<= Integer.parseInt(levelid) ){
										/*  if(obj[26].toString().equals("0")||obj[26].toString().equals("1")){ */
										%>
										
										<tr>
											<td style="text-align: center;"><%=serialno %></td>
											<td style="text-align: center">M<%=obj[22] %></td>
							
											<td style="text-align: center">
												<%
												
												if(obj[26].toString().equals("0")) {%>
													<!-- L -->
												<%countA=1;
													countB=1;
													countC=1;
													countD=1;
													countE=1;
												}else if(obj[26].toString().equals("1")) { 
												
										for(Map.Entry<Integer,String>entry:treeMapLevOne.entrySet()){
											if(entry.getKey().toString().equalsIgnoreCase(obj[2].toString())){%>
												<%=entry.getValue() %>
										<%}} 
									 %>
											<%-- 		A-<%=countA %> --%>
												<% /* countA++;
												    countB=1;
												    countC=1;
													countD=1;
													countE=1; */
													}else if(obj[26].toString().equals("2")) {
													for(Map.Entry<Integer,String>entry:treeMapLevTwo.entrySet()){
														if(entry.getKey().toString().equalsIgnoreCase(obj[3].toString())){%>
															<%=entry.getValue() %>
													<%}} 
													%>
													<%-- B-<%=countB %> --%>
												<%/* countB+=1;
												countC=1;
												countD=1;
												countE=1; */
												}else if(obj[26].toString().equals("3")) { %>
													C-<%=countC %>
												<%countC+=1;
												countD=1;
												countE=1;
												}else if(obj[26].toString().equals("4")) { %>
													D-<%=countD %>
												<%
												countD+=1;
												countE=1;
												}else if(obj[26].toString().equals("5")) { %>
													E-<%=countE %>
												<%countE++;
												} %>
											</td>
											
											<td style="<%if(obj[26].toString().equals("0")) {%>font-weight: bold;<%}%>;text-align:justify ">
												<%if(obj[26].toString().equals("0")) {%>
													<%=obj[9] %>
												<%}else if(obj[26].toString().equals("1")) { %>
													&nbsp;&nbsp;<%=obj[10] %>
												<%}else if(obj[26].toString().equals("2")) { %>
													&nbsp;&nbsp;<%=obj[11] %>
												<%}else if(obj[26].toString().equals("3")) { %>
													&nbsp;&nbsp;<%=obj[12] %>
												<%}else if(obj[26].toString().equals("4")) { %>
													&nbsp;&nbsp;<%=obj[13] %>
												<%}else if(obj[26].toString().equals("5")) { %>
													&nbsp;&nbsp;<%=obj[14] %>
												<%} %>
											</td>
											<td  style="text-align:center">
												
												<%if(! LocalDate.parse(obj[8].toString()).isEqual(LocalDate.parse(obj[29].toString())) ){ %> 
													<%=sdf.format(sdf1.parse(obj[8].toString())) %> 
												<%}%>
												<%=sdf.format(sdf1.parse(obj[29].toString())) %>
												
											
											</td>
																				<%if(!session.getAttribute("labcode").toString().equalsIgnoreCase("ADE")) {%>
											
											<td ><%=obj[24] %>, <%=obj[25] %></td>
											<%} %>
											<td style="text-align: center"><%=obj[16] %>%</td>	
											<% 
												LocalDate StartDate = LocalDate.parse(obj[7].toString());
												LocalDate EndDate = LocalDate.parse(obj[8].toString());
												LocalDate OrgEndDate = LocalDate.parse(obj[29].toString());
												int Progess = Integer.parseInt(obj[16].toString());
												LocalDate CompletionDate =obj[18]!=null ? LocalDate.parse(obj[18].toString()) : null;
												LocalDate Today = LocalDate.now();
												
											%>										
											<td  style="text-align: center">
											<%-- <span class="<%if(obj[20].toString().equalsIgnoreCase("0")){%>assigned
												<%}else if(obj[20].toString().equalsIgnoreCase("1")) {%> assigned
												<%}else if(obj[20].toString().equalsIgnoreCase("2")) {%> ongoing
												<%}else if(obj[20].toString().equalsIgnoreCase("3")) {%> completed
												<%}else if(obj[20].toString().equalsIgnoreCase("4")) {%> delay 
												<%}else if(obj[20].toString().equalsIgnoreCase("5")) {%> completeddelay
												<%}else if(obj[20].toString().equalsIgnoreCase("6")) {%> inactive<%} %>	 status-column " >
												
												<%=obj[27] %>	
												
												<%if((obj[20].toString().equalsIgnoreCase("3") || obj[20].toString().equalsIgnoreCase("5") )&& obj[18]!=null){ %>
													(<%= ChronoUnit.DAYS.between(LocalDate.parse(obj[29].toString()), LocalDate.parse(obj[18].toString())) %>) 
												<%}else if(obj[20].toString().equalsIgnoreCase("4")){ %>
													(<%= ChronoUnit.DAYS.between(LocalDate.parse(obj[29].toString()), LocalDate.now()) %>)
												<%} %>
												
											</span> --%>
											
											<%if(Progess==0){ %>
												<span class="assigned"> AA </span>
											<%} else if(Progess>0 && Progess<100 && (OrgEndDate.isAfter(Today) || OrgEndDate.isEqual(Today) )){ %>
												<span class="ongoing"> OG </span>
											<%} else if( Progess>0 && Progess<100 && (OrgEndDate.isBefore(Today) )){ %>
												<span class="delay"> DO (<%=ChronoUnit.DAYS.between(OrgEndDate, LocalDate.now())%>)</span>
											<%} else if((CompletionDate!=null && ( CompletionDate.isBefore(OrgEndDate) ||  CompletionDate.isEqual(OrgEndDate)))){ %>
												<span class="completed"> CO</span>
											<%} else if((CompletionDate!=null && CompletionDate.isAfter(OrgEndDate) )){ %>
												<span class="completeddelay">CD (<%=ChronoUnit.DAYS.between(OrgEndDate, CompletionDate)%>)</span>
											<%}else if(CompletionDate!=null && Progess==0 &&  ( EndDate.isAfter(Today) ||  EndDate.isEqual(Today)) ){ %>
												<span class="inactive">IA</span>
											<%}else{ %>
												<span class="assigned">AA</span>
											<%} %>
											
											</td>

											<td >
												<%if(obj[28]!=null){ %>
												<%=obj[28] %>
												<%} %>
											</td>
										</tr>
										
									<%count1++; serialno++;}} %>
								<%} else{ %>
								
								<tr><td colspan="9" style="text-align:center; "> Nil</td></tr>
								
								<%} %>
								
								</tbody>
								
							</table>
		
		
						<%} %>
						</div>
					
					</details>

<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->						
						
					<details >
   						<summary role="button" tabindex="0"><b> 10. GANTT chart of overall project schedule [<span style="text-decoration: underline;">Original </span>(as per Project sanction / Latest PDC extension) and <span style="text-decoration: underline;">Current</span>]</b>    </summary>
   						
						    <div class="content">
							    <%for(int z=0;z<1;z++){ %>
							    <div>
							    	<%if(ProjectDetail.size()>1){ %>
										<div>
											<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
										</div>	
									<%} %>	
								    <div class="row">
								    	<div class="col-md-9 ">
											<form method="post" style="float: right;margin-top:13px;" enctype="multipart/form-data" >
												<label>Note : Upload PNG image only.</label>
												<input type="file" name="FileAttach" id="FileAttach"  required="required"  accept="image/png"/>
												<input type="hidden" name="ChartName"  value="grantt_<%=projectidlist.get(z)%>_<%=No2%>"> 
												<button type="submit" class="btn btn-sm back" formaction="GanttChartUpload.htm"  style="margin-right: 50px;margin" >Upload</button>
												<button type="submit" formtarget="_blank" class="btn btn-sm back" formaction="GanttChartSub.htm" formnovalidate="formnovalidate" style="float:right; background-color: #DE834D; font-weight: 600;border:0px;">Sub Level</button>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
												<input type="hidden" name="ProjectId" id="ProjectId" value="<%=projectidlist.get(z)%>"> 
												<input type="hidden" name="committeeid" value="<%=committeeid%>">
											</form>
										</div>
										<div class="col-md-3" style="float:right;margin-top:10px;  ">
											<label>Interval : &nbsp;&nbsp;&nbsp; </label>
											<select class="form-control selectdee " name="interval_<%=projectidlist.get(z)%>" id="interval_<%=projectidlist.get(z)%>" required="required"  data-live-search="true"  style="width:150px !important" >
				                                <option value="quarter"> Quarterly </option>
				                                <option value="half" >Half-Yearly</option>
				                                <option value="year" >Yearly</option>
				                                <option value="month"> Monthly </option>
											</select>
										</div>
									</div>
	<!-- -----------------------------------------------gantt chart js ------------------------------------------------------------------------------------------------------------------------------- -->						    		
									
										
											<div class="row" style="margin-top: 10px;font-weight: bold;"   >
												<div class="col-md-4"></div>
												<div class="col-md-4"></div>
												<div class="col-md-4">
													<div style="font-weight: bold; " >
														<span style="margin:0px 0px 10px  10px;">Original :&ensp; <span style=" background-color: #29465B;  padding: 0px 15px; border-radius: 3px;"></span></span>
														<span style="margin:0px 0px 10px  15px;">Ongoing :&ensp; <span style=" background-color: #059212;  padding: 0px 15px;border-radius: 3px;"></span></span>
														<span style="margin:0px 0px 10px  15px;">Revised :&ensp; <span style=" background-color: #f25287; opacity: 0.5; padding: 0px 15px;border-radius: 3px;"></span></span>
													</div>
												</div>
											</div>
										
									<div class="row">
										<div class="col-md-12" style="float: right;" align="center">
										   	<div class="flex-container containers" id="containers_<%=projectidlist.get(z)%>"  ></div>
										</div>		
									</div>		
								</div>
							<%} %>							
						</div>
					
					</details>
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->
 						
					<details>
   						<summary role="button" tabindex="0"><b>11. Issues</b></summary>
   						
						   <div class="content">
						   			<%for(int z=0;z<1;z++){ %>		
						   			
						   			<%if(ProjectDetail.size()>1){ %>
										<div>
											<b>Project : <%=ProjectDetail.get(z)[1] %> 	<%if(z!=0){ %>(SUB)<%} %>	</b>
										</div>	
									<%} %>	
										   		 
									
			<table class="subtables" style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px;   border-collapse:collapse;" >
						<thead>
							<tr>
								<td colspan="7" style="border: 0">
									<p style="font-size: 10px;text-align: center"> 
										<span class="notassign">NA</span> : Not Assigned &nbsp;&nbsp;
										<span class="assigned">AA</span> : Activity Assigned &nbsp;&nbsp; 
										<span class="ongoing">OG</span> : On Going &nbsp;&nbsp; 
										<span class="delay">DO</span> : Delay - On Going &nbsp;&nbsp; 
										<span class="ongoing">RC</span> : Review & Close &nbsp;&nbsp;
										<span class="delay">FD</span> : Forwarded With Delay &nbsp;&nbsp;
										<span class="completed">CO</span> : Completed &nbsp;&nbsp; 
										<span class="completeddelay">CD</span> : Completed with Delay &nbsp;&nbsp; 
										<span class="inactive">IA</span> : InActive &nbsp;&nbsp;
										<span class="delaydays">DD</span> : Delayed days &nbsp;&nbsp; 
									</p>
								</td>									
							</tr>
							<tr>
								<th  style="width: 20px !important;text-align: center;">SN</th>
								<th  style="width: 50px !important;text-align: center;">ID</th>
								<th  style="width: 300px;">Issue Point</th>
								<th  style="width: 120px; "> ADC <br> PDC</th>
								<!-- <th  style="width: 100px; "> ADC</th> -->
								<th  style="width: 210px; ">Responsibility</th>
								<th  style="width: 50px; " >Status(DD)</th>	
								<th  style="width: 230px; ">Remarks</th>		
							</tr>
						</thead>
						<tbody>				
										<%if(oldpmrcissueslist.get(z).size()==0){ %>
										<tr><td colspan="7" style="text-align: center;" > Nil</td></tr>
										<%}
										else if(oldpmrcissueslist.get(z).size()>0)
										{
											int i=1;
										for(Object[] obj:oldpmrcissueslist.get(z)){
											if(!obj[9].toString().equals("C")  || (obj[9].toString().equals("C") && obj[13]!=null && before6months.isBefore(LocalDate.parse(obj[13].toString())) )){
											%>
											<tr>
												<td  style="text-align: center;"><%=i %></td>
																<td style="text-align: center;" >
									<%if(obj[18]!=null && Long.parseLong(obj[18].toString())>0){
										String []temp=obj[1].toString().split("/");
										String tempString=temp[temp.length-1];
										%>
										<span style="font-weight: bold">
										<%=tempString %>
										</span>
									<%}%>
								</td>
												<td  style="text-align: justify;"><%=obj[2] %></td>
												<td   style="text-align: center;" >
													<span style="color:green;">		<%	String actionstatus = obj[9].toString();
															int progress = obj[16]!=null ? Integer.parseInt(obj[16].toString()) : 0;
															LocalDate pdcorg = LocalDate.parse(obj[3].toString());
															LocalDate endDate = LocalDate.parse(obj[4].toString());
															LocalDate lastdate = obj[13]!=null ? LocalDate.parse(obj[13].toString()): null;
															LocalDate today = LocalDate.now();
													%> 
													<% if(lastdate!=null && actionstatus.equalsIgnoreCase("C") ){%>
														<%if(actionstatus.equals("C") && (pdcorg.isAfter(lastdate) || pdcorg.equals(lastdate))){%>
														<span class="completed"><%= sdf.format(sdf1.parse(obj[13].toString()))%> </span>
														<%}else if(actionstatus.equals("C") && pdcorg.isBefore(lastdate)){ %>	
														<span class="completeddelay"><%= sdf.format(sdf1.parse(obj[13].toString()))%> </span>
														<%} %>	
													<%}else{ %>
															-									
													<%} %>
												
												<br></span>
													<%-- <% if (obj[6] != null && !LocalDate.parse(obj[6].toString()).equals(LocalDate.parse(obj[5].toString())) ) { %> <%=sdf.format(sdf1.parse(obj[6].toString()))%><br> <% } %> 
													<% if (obj[5] != null && !LocalDate.parse(obj[5].toString()).equals(LocalDate.parse(obj[3].toString())) ) { %> <%=sdf.format(sdf1.parse(obj[5].toString()))%><br> <% } %> --%>
													<%if(!pdcorg.equals(endDate)){ %>
													<%=sdf.format(sdf1.parse(obj[4].toString()))%><br>
													<%} %>
													<%=sdf.format(sdf1.parse(obj[3].toString()))%>
												</td>

	<!-- 											<td  style="text-align: center;"> 

												</td> -->
											

												<td > <%=obj[11] %>, <%=obj[12] %></td>

												<td  style=";text-align: center;"> 
													<%if(obj[4]!= null){ %> 
														
														<% if(lastdate!=null && actionstatus.equalsIgnoreCase("C") ){%>
																<%if(actionstatus.equals("C") && (pdcorg.isAfter(lastdate) || pdcorg.equals(lastdate))){%>
																	<span class="completed">CO</span>
																<%}else if(actionstatus.equals("C") && pdcorg.isBefore(lastdate)){ %>	
																	<span class="delay">CD (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>)  </span>
																<%} %>	
															<%}else{ %>
																<%if(actionstatus.equals("F")  && (pdcorg.isAfter(lastdate) || pdcorg.isEqual(lastdate) )){ %>
																	<span class="ongoing">RC</span>												
																<%}else if(actionstatus.equals("F")  && pdcorg.isBefore(lastdate)) { %>
																	<span class="delay">FD</span>
																<%}else if(actionstatus.equals("A") && progress==0){  %>
																	<span class="assigned">
																		AA <%if(pdcorg.isBefore(today)){ %> (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>) <%} %>
																	</span>
																<%} else if(pdcorg.isAfter(today) || pdcorg.isEqual(today)){  %>
																	<span class="ongoing">OG</span>
																<%}else if(pdcorg.isBefore(today)){  %>
																	<span class="delay">DO (<%= ChronoUnit.DAYS.between(pdcorg, today)  %>)  </span>
																<%} %>										
														<%} %>
													<%}else { %>
														-
													<%} %>
												</td>	
												<td > <%if(obj[17]!=null){ %> <%=obj[17] %> <%} %> </td>			
											</tr>			
										<%i++;
										}}} %>
								</tbody>			
							</table>
	
								<%} %>
						   </div>	
						   
					</details>

<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->
 
					<details>
   						<summary role="button" tabindex="0"><b>12. Decision/Recommendations sought from <%=committee.getCommitteeShortName().trim().toUpperCase() %></b>     </summary>
   						
						  <div class="content">
						  
						  <%if(nextMeetVenue!=null && nextMeetVenue[0]!=null){%>
						  
						  	<form action="RecDecDetailsAdd.htm" method="post" id="recdecdetails">
								<div class="row" style="margin-top: 10px;">
									<div class="col-md-4"> 
										<table class="table table-bordered table-hover table-striped table-condensed ">
											<thead>
												<tr><th style="width: 5%;">SN</th><th style="width: 80%;">Type</th><th style="width: 5%;">Action</th></tr>
											</thead>
											<tbody>
											<%int i=0; if(RecDecDetails!=null && RecDecDetails.size()>0){ 
												for(Object[] obj :RecDecDetails){
												String pointdata= "";
												if(obj[3].toString().length()>30){
													pointdata=obj[3].toString();
												}else{
													pointdata=obj[3].toString();
												}
												%>
												<tr>
													<td style="width: 5%; text-align: center;"> <%=++i%></td>
													<td style="width: 80%; word-wrap: break-word;">
													<b style="color: #145374;"><%=obj[2]%> :-</b>
													  <%if(pointdata.length()>30){%> <%=pointdata.substring(0,30)%>  <span onclick="RecDecmodal('<%=obj[0]%>')" style="color:#1176ab;font-size: 14px; cursor: pointer;"><b> ...View More </b></span> <%}else{%> <%=pointdata%><%}%>
													  </td>
													<td style="text-align: center;width: 5%;"> 
													<button class="btn btn-warning btn-sm" type="button" onclick="RecDecEdit('<%=obj[0]%>' )" value="EDIT"  > <i class="fa fa-pencil-square-o" style="color:#100f0e;" aria-hidden="true"></i></button>
												
													<button class="btn btn-sm btn-danger" type="button" onclick="RecDecremove('<%=obj[0].toString() %>')" ><i class="fa fa-trash" aria-hidden="true" style="color:white"></i></button>
																									
													</td>
												</tr>
												<%}}else{%><td colspan="3" style="text-align: center;"> No Data Available!</td><%}%>
											</tbody>
										</table>
										<div align="center">
											<button type="button" class="btn btn-info btn-sm add" onclick="RecDecEdit('0')"> ADD</button>
										</div>
									</div>
									<div class="col-md-8"> 
									<div class="card" >
										<div class="card-header" style="height: 40px;">
											<div align="center" id="drcdiv"  >
			  									<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="darc" id="decision" value="D" required="required">
												  <label class="form-check-label" for="decision"><b> Decision </b></label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="darc" id="recommendation" value="R" required="required">
												  <label class="form-check-label" for="recommendation"> <b>Recommendation </b></label>
												</div>
			  								</div>
										</div>
										 <div class="card-body">
										    <textarea class="form-control" name="RecDecPoints" id="ckeditor1" rows="5" cols="20" maxlength="5"  required="required"></textarea>
											<div align="center">
												<input type="hidden" name="RedDecID" id="recdecid">
												<input type="hidden" name="schedulid" value="<%=nextMeetVenue[0]%>">
												<button type="button" style="margin-top: 10px;" class="btn btn-primary btn-sm add"  onclick="return checkData('recdecdetails')">Submit </button>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<input type="hidden" name="projectid" value="<%=projectid%>"/>
												<input type="hidden" name="committeeid" value="<%=committeeid%>"/>	
											</div>
										</div>
								    </div>
									</div>
								</div>	
								</form>
								<%}else{%>
										 <h5>Meeting is Not Scheduled!</h5>
								<%}%>
						  	<br><br><br><br><br>
						  </div>	
						   
					</details>						
			 					<form action="DecesionRemove.htm" id="remvfrm" style="display: none;">
				<input type="hidden" name="recdecId" id="recdecId">
				<input type="hidden" name="committeeid" value="<%=committeeid%>">
						<input type="hidden" name="ProjectId"  value="<%=projectidlist.get(0)%>"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
<!--  ---------------------------------------------------------------------------------------------------------------------------------------------  -->						
					<details>
   						<summary role="button" tabindex="0"><b> 13. Other Relevant Points (if any) 
   							<%if(committee.getCommitteeShortName().trim().equalsIgnoreCase("EB")){ %>
   								and Technical Work Carried Out For Last Six Months
							<%}else { %>
								and Technical Work Carried Out For Last Three Months
							<%} %>
   							</b>
   						</summary>
   						
						  <div class="content">
						  	<%for(int z=0;z<1;z++){ %>
						  	<%if(z!=0){ break;} %>
								<div>
									<b>Project : <%=ProjectDetail.get(z)[1] %> 		</b>
								</div>	
								
								<div class="card-body" style="width:100%"  >
								
									<form action="TechnicalWorkDataAdd.htm" method="post">
										<div class="row"align="center" >
											<div class="row" style="width:100%;margin-left: 0.5rem; margin-top: -0.5rem;">
												<div class="col-12">
													<textarea class="form-control" name="RelevantPoints" id="ckeditor" rows="5" cols="50" maxlength="5"><%if(TechWorkDataList.get(z)!=null){ %> <%=TechWorkDataList.get(z)[2] %> <%}%></textarea>
												</div>	
											</div>
										</div>
										<div class="row" align="center" style="margin-top:15px;" >
										<!-- <div class="col-2"></div> -->
										<div class="col-3" style="text-align: left;margin-top: 8px;margin-bottom: 5px"><label style="font-weight: 600;font-size: 16px;color: black;">Technical Work Carried (Attachment)</label></div>
											<div class="col-9" style="text-align: left;">
												<div class="row">
												  <div class="col-2" style="margin-left: -5rem">
													<span id="attachname_<%=projectidlist.get(z)%>" ></span>
													<%if(TechWorkDataList.get(z)==null){ %>
														<input type="hidden" name="TechDataId" value="0">
														<input type="hidden" class="hidden" name="attachid" id="attachid_<%=projectidlist.get(z)%>" value="0">
													<%}else{ %>
														<input type="hidden" name="TechDataId" value="<%=TechWorkDataList.get(z)[0]%>">
														<%if(TechWorkDataList.get(z)[3]!=null && Long.parseLong(TechWorkDataList.get(z)[3].toString())>0){ %>
														<button type="button" class="btn" title="Download Document"  onclick="FileDownload1('<%=TechWorkDataList.get(z)[3]%>');"  ><i class="fa fa-download" aria-hidden="true"> </i></button>
														<button type="button" class="btn btn-danger btnfileattachment"  title="Unlink Document" onclick="removeFileAttch('<%=projectidlist.get(z)%>','<%=TechWorkDataList.get(z)[0]%>','<%=TechWorkDataList.get(z)[3]%>') ;" ><i class="fa fa-chain-broken" aria-hidden="true"></i></button>
														<input type="hidden" class="hidden" name="attachid" id="attachid_<%=projectidlist.get(z)%>" value="<%=TechWorkDataList.get(z)[3]%>">
														<%} else{%>
														<input type="hidden" class="hidden" name="attachid" id="attachid_<%=projectidlist.get(z)%>" value="0">
														<%} %>
													<%} %>
													<button type="button" class="btn btn-primary btnfileattachment"  title="Link Document" onclick="openMainModal(<%=projectidlist.get(z)%>) ;" ><i class="fa fa-link" aria-hidden="true"></i></button>
													<input type="hidden" name="projectid" value="<%=projectidlist.get(z)%>">
													<input type="hidden" name="committeeid" value="<%=committeeid%>">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    </div>
                                                    <div class="col-2"></div>
		                                             <div class="col-3">
														<button type="submit" class="btn btn-sm submit" name="submit" value="submit" onclick="return confirm('Are You Sure To Submit ?');">SUBMIT</button>
														<input type="hidden" name="fileRepID" id="fileRepID" value="">
													</div>
											  </div>
											</div>
										</div>
									</form>								
								
								<b>Technical Images</b> 
								<div class="row">
									<form action="ProjectTechImages.htm" method="post" style="float: left;margin-top:5px;" enctype="multipart/form-data" >
										<input type="file" name="FileAttach" id="FileAttach" required="required"  accept="image/jpeg"/> 
										<button type="submit" class="btn btn-sm back"  onclick="return confirm('Are you sure to submit this?')">Upload</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<input type="hidden" name="committeeid" value="<%=committeeid%>">
										<input type="hidden" name="ProjectId"  value="<%=projectidlist.get(z)%>"> 
									</form>
											
								</div>
							<% if(TechImages.size()>0){
							List<TechImages>  TechImagesList= TechImages.get(z); 
							if(TechImagesList.size()>0){
							int i=0;
							for(TechImages imges:TechImagesList){ %>
							<div class="row">
							<table>
							<tr>
							<td style="border:0; padding-left: 1.5rem;"> 
							<% 
							Path uploadPath = Paths.get(filePath,projectLabCode,"TechImages",imges.getTechImagesId()+"_"+imges.getImageName());
							File file = uploadPath.toFile();
							if(file.exists()){ %>
								<img style="max-width:20cm;max-height:14cm;margin-bottom: 5px" src="data:image/*;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(file))%>" > 											
									<%} %>
									<button class="btn btn-sm" id="TechImagesId1" value="" onclick="openEditDiv(<%=imges.getTechImagesId()%>)" style="background-color: transparent;font-size: 2.5rem"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
									<form action="#" style="display: inline">
									<button class="btn btn-danger" name="TechImagesId" value="<%=imges.getTechImagesId()%>" formaction="ProjectImageDelete.htm" formmethod="POST" onclick="return confirm('Are you sure, you want to remove this?')"><i class="fa fa-trash" aria-hidden="true" style="color:white" ></i></button>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
									<input type="hidden" name="committeeid" value="<%=committeeid%>">
									<input type="hidden" name="ProjectId"  value="<%=projectidlist.get(z)%>"> 
									</form>
									<form action="TechImagesEdit.htm" method="post" style="display: inline" enctype="multipart/form-data">
									<label for="FileAttach" id="filelabel<%=imges.getTechImagesId()%>" style="margin-left: 20px; display: none;">
										<input type="file" name="FileAttach" id="FileAttach" required="required"  accept="image/jpeg"/> 
										<button type="submit" class="btn btn-sm back"  onclick="return confirm('Are you sure, you want to edit this?')">Upload</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<input type="hidden" name="committeeid" value="<%=committeeid%>">
										<input type="hidden" name="ProjectId"  value="<%=projectidlist.get(z)%>"> 
										<input type="hidden" name="TechImageId"  value="<%=imges.getTechImagesId()%>"> 
								    </label>
								    </form>										
									</td>
								<%-- 	<td style="border:0;"> 
									<%if(i==0){  %>
									<button class="btn btn-sm">
									<i class="fa fa-arrow-down"  style="color:green" aria-hidden="true"></i>
									</button> 
									<%}else if(i==TechImagesList.size()-1){ %>
									<button class="btn btn-sm">
									<i class="fa fa-arrow-up"  style="color:green" aria-hidden="true"></i>
									</button> 
									<%}else{ %>
									<button class="btn btn-sm">
									<i class="fa fa-arrow-up"  style="color:green" aria-hidden="true"></i>
									</button> 
									<button class="btn btn-sm">
									<i class="fa fa-arrow-down"  style="color:green" aria-hidden="true"></i>
									</button> 
									<%} %>
									</td> --%>
									</tr>
								</table>
							</div>
							<br>
							<%i++;}}} %>
						
								
								</div>
								
						  <%} %>
						  </div>
					
					
					</details>
<!--   --------------------------------------------------------------------------------------------------------------------------------------------- --> 
					<details>
   						<summary role="button" tabindex="0"><b>Note</b></summary>
						  <div class="content">
							
								1) Agenda mentioned in Chapter 5 on Project Monitoring and Review be
									referred while making briefing papers.
								<br>	
								2) Action plan as mentioned at SN. 9 should mandatorily form part of EB
									minutes which should be released within two weeks of meeting. If the minutes
									of meeting to be vetted by outside offices cut off dates should be given beyond
									which minutes would be assumed to be approved.
								<br>
								3) Apex Board format may be similar to EB format modified to cover Agenda of
									Apex Board (refer Chapter 5 on Project Monitoring and Review).
								<br>
								4) Detailed technical discussions on each sub systems to be deliberated and
									recorded during PMRC. Ratification points from the higher monitoring body to
									be clearly mentioned in the minutes.
								<br>
								5) For PDC extension cases, the defendable reason why PDC could not be
									adhered & remedial steps to be taken to avoid further PDC extension may also
									be presented as per the table given below & recorded in minutes.
						  </div>	
					</details>
				
		</div>
	</div>
			</div>
		</div>
	</div>


<!--------------------------------------------------- Milestone Model -----------------------------------------------  -->

<div class="modal fade " id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
					      
				<div class="modal-body">
					
					
					
   <div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow-nohover" style="margin-top: -0px;">
				<div class="row card-header">
			     <div class="col-md-10">
					<h5 ><%if(ProjectId!=null){
						Object[] ProjectDetail123=(Object[])request.getAttribute("ProjectDetailsMil");
						%>
						<%=ProjectDetail123[2] %> ( <%=ProjectDetail123[1] %> ) 
					<%} %>
					</h5>
					</div>
					
					 </div>
					<div class="card-body">
					
                                              <div class="table-responsive"> 
												<table class="table  table-hover table-bordered">
													<thead>

														<tr>
															<th>Expand</th>
															<th style="text-align: left;max-width: 15px;">Mil-No</th>
														<!-- 	<th style="text-align: left;">Project Name</th> -->
															<th style="text-align: left;max-width: 200px;">Milestone Activity</th>
															<th >Start Date</th>
															<th >End Date</th>	
															<th  style="text-align: left;max-width: 200px;">First OIC </th>
															<th  style="text-align: center;max-width: 50px;">Weightage</th>	
															<th  style="text-align: center;max-width: 80px;">Progress</th>												

														</tr>
													</thead>
													<tbody>
													
														<%int  count=1;
														
														 	if(MilestoneList!=null&&MilestoneList.size()>0){
											
															for(Object[] obj: MilestoneList){ %>
														<tr class="milestonemodalwhole" id="milestonemodal<%=obj[5] %>"  >
															<td style="width:2% !important; " class="center">
																<span class="clickable" data-toggle="collapse" id="row<%=count %>" data-target=".row<%=count %>">
																	<button class="btn btn-sm btn-success" id="btn<%=count %>"  onclick="ChangeButton('<%=count %>')">
																		<i class="fa fa-plus"  id="fa<%=count%>"></i>
																	 </button>
																</span>
															</td>
															<td style="text-align: left;width: 7%;"> Mil-<%=obj[5]%></td>
															<%-- <td class="width-30px"><%=obj[1]%></td> --%>
															<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;max-width:20% !important;min-width:20% !important;"><%=obj[4] %></td>
															
															<td  style="width:8% !important; "><%=sdf.format(obj[2])%></td>
															<td style="width:8% !important; "><%=sdf.format(obj[3])%></td>
															<td  style="width:15% !important; "><%=obj[6]%></td>
															<td  style="width:9% !important; " align="center"><%=obj[13]%></td>	
															<td>
															<%if(!obj[12].toString().equalsIgnoreCase("0")){ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar progress-bar-striped
															<%if(obj[14].toString().equalsIgnoreCase("2")){ %>
															 bg-success
															<%} else if(obj[14].toString().equalsIgnoreCase("3")){ %>
															  bg-info
															<%} else if(obj[14].toString().equalsIgnoreCase("4")){ %>
															  bg-danger
															<%} else if(obj[14].toString().equalsIgnoreCase("5")){ %>
															  bg-warning
															<%}  %>
															" role="progressbar" style=" width: <%=obj[12] %>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=obj[12] %>
															</div> 
															</div> <%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Started
															</div>
															</div> <%} %>
															</td>
																
		
														</tr>
														 <tr class="collapse row<%=count %>" style="font-weight: bold;">
                                                         <td></td>
                                                         <td>Sub</td>
                                                         <td>Activity</td>
                                                         <td>Start Date</td>
                                                         <td>End Date</td>
                                                         <td>Date Of Completion</td>
                                                         <td>Sub Weightage</td>
                                                         <td>Sub Progress</td>
                                                         <td></td>
                                                         </tr>
                                                         <% int countA=1;
                                                            List<Object[]> MilestoneA=(List<Object[]>)request.getAttribute(count+"MilestoneActivityA");
														 	if(MilestoneA!=null&&MilestoneA.size()>0){
															for(Object[] objA: MilestoneA){
	                                                            List<Object[]> MilestoneB=(List<Object[]>)request.getAttribute(count+"MilestoneActivityB"+countA);
	
																%>
														<tr class="collapse row<%=count %>">
															<td style="width:2% !important; " class="center"> </td>
															<td style="text-align: left;width: 5%;"> A-<%=countA%></td>
															<%-- <td class="width-30px"><%=obj[1]%></td> --%>
															<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;max-width:20% !important;min-width:20% !important;"><%=objA[4] %></td>
															
															<td class="width-30px"><%=sdf.format(objA[2])%></td>
															<td style="width:8% !important; "><%=sdf.format(objA[3])%></td>
															
															
															<td class="width-30px"><%if(objA[9].toString().equalsIgnoreCase("3")||objA[9].toString().equalsIgnoreCase("5")){ %>
														     <%if(objA[7]!=null){ %>   <%=sdf.format(objA[7]) %> <%}else{ %><%=objA[8] %> <%} %>
														         <%}else{ %>
														         <%=objA[8] %>
															 <%} %></td>
															 <td align="center"><%=objA[6] %></td>
															<td>
															<%if(!objA[5].toString().equalsIgnoreCase("0")){ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar progress-bar-striped
															<%if(objA[9].toString().equalsIgnoreCase("2")){ %>
															 bg-success
															<%} else if(objA[9].toString().equalsIgnoreCase("3")){ %>
															  bg-info
															<%} else if(objA[9].toString().equalsIgnoreCase("4")){ %>
															  bg-danger
															<%} else if(objA[9].toString().equalsIgnoreCase("5")){ %>
															  bg-warning
															<%}  %>
															" role="progressbar" style=" width: <%=objA[5] %>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=objA[5] %>
															</div> 
															</div> <%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Started
															</div>
															</div> <%} %>
															</td>						
													
                                                         <td></td>
                                                         </tr>
                                                         <% int countB=1;
														 	if(MilestoneB!=null&&MilestoneB.size()>0){
															for(Object[] objB: MilestoneB){
	                                                            List<Object[]> MilestoneC=(List<Object[]>)request.getAttribute(count+"MilestoneActivityC"+countA+countB);
	
																%>
														<tr class="collapse row<%=count %>">
															<td style="width:2% !important; " class="center"> </td>
															<td style="text-align: left;width: 5%;"> &nbsp;&nbsp;&nbsp;B-<%=countB%></td>
															<%-- <td class="width-30px"><%=obj[1]%></td> --%>
															<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;max-width:20% !important;min-width:20% !important;"><%=objB[4] %></td>
															
															<td class="width-30px"><%=sdf.format(objB[2])%></td>
															<td style="width:8% !important; "><%=sdf.format(objB[3])%></td>
															
															<td class="width-30px"><%if(objB[9].toString().equalsIgnoreCase("3")||objB[9].toString().equalsIgnoreCase("5")){ %>
														      <%if(objB[7]!=null){ %>   <%=sdf.format(objB[7]) %> <%}else{ %><%=objB[8] %> <%} %>
														         <%}else{ %>
														         <%=objB[8] %>
															 <%} %></td>
															  <td align="center"><%=objB[6] %></td>
															<td>
															<%if(!objB[5].toString().equalsIgnoreCase("0")){ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar progress-bar-striped
															<%if(objB[9].toString().equalsIgnoreCase("2")){ %>
															 bg-success
															<%} else if(objB[9].toString().equalsIgnoreCase("3")){ %>
															  bg-info
															<%} else if(objB[9].toString().equalsIgnoreCase("4")){ %>
															  bg-danger
															<%} else if(objB[9].toString().equalsIgnoreCase("5")){ %>
															  bg-warning
															<%}  %>
															" role="progressbar" style=" width: <%=objB[5] %>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=objB[5] %>
															</div> 
															</div> <%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Started
															</div>
															</div> <%} %>
															</td>
															
														 													
                                                         <td></td>
                                                         </tr>
                                                         <% int countC=1;
														 	if(MilestoneC!=null&&MilestoneC.size()>0){
															for(Object[] objC: MilestoneC){
													         List<Object[]> MilestoneD=(List<Object[]>)request.getAttribute(count+"MilestoneActivityD"+countA+countB+countC);
																%>
														<tr class="collapse row<%=count %>">
															<td style="width:2% !important; " class="center"> </td>
															<td style="text-align: left;width: 5%;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C-<%=countC%></td>
															<%-- <td class="width-30px"><%=obj[1]%></td> --%>
															<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;max-width:20% !important;min-width:20% !important;"><%=objC[4] %></td>
															
															<td class="width-30px"><%=sdf.format(objC[2])%></td>
															<td style="width:8% !important; "><%=sdf.format(objC[3])%></td>
															
															<td class="width-30px"><%if(objC[9].toString().equalsIgnoreCase("3")||objC[9].toString().equalsIgnoreCase("5")){ %>
														     <%if(objC[7]!=null){ %>   <%=sdf.format(objC[7]) %> <%}else{ %><%=objC[8] %> <%} %>
														         <%}else{ %>
														         <%=objC[8] %>
															 <%} %></td>	
															  <td align="center"><%=objC[6] %></td>
															<td>
															<%if(!objC[5].toString().equalsIgnoreCase("0")){ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar progress-bar-striped
															<%if(objC[9].toString().equalsIgnoreCase("2")){ %>
															 bg-success
															<%} else if(objC[9].toString().equalsIgnoreCase("3")){ %>
															  bg-info
															<%} else if(objC[9].toString().equalsIgnoreCase("4")){ %>
															  bg-danger
															<%} else if(objC[9].toString().equalsIgnoreCase("5")){ %>
															  bg-warning
															<%}  %>
															" role="progressbar" style=" width: <%=objC[5] %>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=objC[5] %>
															</div> 
															</div> <%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Started
															</div>
															</div> <%} %>
															</td>
															
														
                                                         <td></td>
                                                         </tr>
                                                         <% int countD=1;
														 	if(MilestoneD!=null&&MilestoneD.size()>0){
															for(Object[] objD: MilestoneD){
	                                                            List<Object[]> MilestoneE=(List<Object[]>)request.getAttribute(count+"MilestoneActivityE"+countA+countB+countC+countD);
	
																%>
														<tr class="collapse row<%=count %>">
															<td style="width:2% !important; " class="center"> </td>
															<td style="text-align: left;width: 5%;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D-<%=countD%></td>
															<%-- <td class="width-30px"><%=obj[1]%></td> --%>
															<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;max-width:20% !important;min-width:20% !important;"><%=objD[4] %></td>
															
															<td class="width-30px"><%=sdf.format(objB[2])%></td>
															<td style="width:8% !important; "><%=sdf.format(objB[3])%></td>
															
															<td class="width-30px"><%if(objD[9].toString().equalsIgnoreCase("3")||objD[9].toString().equalsIgnoreCase("5")){ %>
														      <%if(objD[7]!=null){ %>   <%=sdf.format(objD[7]) %> <%}else{ %><%=objD[8] %> <%} %>
														         <%}else{ %>
														         <%=objD[8] %>
															 <%} %></td>
															  <td align="center"><%=objD[6] %></td>
															<td>
															<%if(!objD[5].toString().equalsIgnoreCase("0")){ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar progress-bar-striped
															<%if(objD[9].toString().equalsIgnoreCase("2")){ %>
															 bg-success
															<%} else if(objD[9].toString().equalsIgnoreCase("3")){ %>
															  bg-info
															<%} else if(objD[9].toString().equalsIgnoreCase("4")){ %>
															  bg-danger
															<%} else if(objD[9].toString().equalsIgnoreCase("5")){ %>
															  bg-warning
															<%}  %>
															" role="progressbar" style=" width: <%=objD[5] %>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=objD[5] %>
															</div> 
															</div> <%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Started
															</div>
															</div> <%} %>
															</td>
															
														 													
                                                         <td></td>
                                                         </tr>
                                                         <% int countE=1;
														 	if(MilestoneE!=null&&MilestoneE.size()>0){
															for(Object[] objE: MilestoneE){ %>
														<tr class="collapse row<%=count %>">
															<td style="width:2% !important; " class="center"> </td>
															<td style="text-align: left;width: 5%;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-<%=countE%></td>
															<%-- <td class="width-30px"><%=obj[1]%></td> --%>
															<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;max-width:20% !important;min-width:20% !important;"><%=objE[4] %></td>
															
															<td class="width-30px"><%=sdf.format(objE[2])%></td>
															<td style="width:8% !important; "><%=sdf.format(objE[3])%></td>
															
															<td class="width-30px"><%if(objE[9].toString().equalsIgnoreCase("3")||objE[9].toString().equalsIgnoreCase("5")){ %>
														     <%if(objE[7]!=null){ %>   <%=sdf.format(objE[7]) %> <%}else{ %><%=objE[8] %> <%} %>
														         <%}else{ %>
														         <%=objE[8] %>
															 <%} %></td>	
															  <td align="center"><%=objE[6] %></td>
															<td>
															<%if(!objE[5].toString().equalsIgnoreCase("0")){ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar progress-bar-striped
															<%if(objC[9].toString().equalsIgnoreCase("2")){ %>
															 bg-success
															<%} else if(objE[9].toString().equalsIgnoreCase("3")){ %>
															  bg-info
															<%} else if(objE[9].toString().equalsIgnoreCase("4")){ %>
															  bg-danger
															<%} else if(objE[9].toString().equalsIgnoreCase("5")){ %>
															  bg-warning
															<%}  %>
															" role="progressbar" style=" width: <%=objE[5] %>%;  " aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" >
															<%=objE[5] %>
															</div> 
															</div> <%}else{ %>
															<div class="progress" style="background-color:#cdd0cb !important;height: 1.4rem !important;">
															<div class="progress-bar" role="progressbar" style=" width: 100%; background-color:#cdd0cb !important;color:black;font-weight: bold;  "  >
															Not Started
															</div>
															</div> <%} %>
															</td>
															
														
                                                         <td></td>
                                                         </tr>
												<% countE++;} }%>
												<% countD++;} }%>
												<% countC++;} }%>
												<% countB++;} }%>
												<% countA++;} }else{%>
												<tr class="collapse row<%=count %>">
													<td colspan="9" style="text-align: center" class="center">No Sub List Found</td>
												</tr>
												<%} %>
												<% count++; } }else{%>
												<tr >
													<td colspan="9" style="text-align: center" class="center">No List Found</td>
												</tr>
												<%} %>
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

	<div class="modal fade" id="LevelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color: #C4DDFF">
	        <h5 class="modal-title" id="exampleModalLabel" style="color:#145374;font-weight: bold;">Set Milestone Level</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
	      		<div class="col-md-4">
	      			<h6><b>Project : </b>
	      			<%for(int z=0;z<projectidlist.size();z++){ %>
	      				<%if(z==0){ %><%=ProjectDetail.get(z)[1] %> <%} %> 
	      			<%} %>
	      			</h6>
	      		</div>
	      		<div class="col-md-3">
	      			<h6>
	      				<b>Committee :</b> 
	      				<%=committee.getCommitteeShortName().trim().toUpperCase() %>
	      			</h6>
	      		</div>
	      		<div class="col-md-1"><b>Level</b></div>
	      		<div class="col-md-4">
	      			<select class="form-control" name="LevelValue"  required="required" data-live-search="true" data-container="body" id="levelvalue">
						<option <%if(levelid.equalsIgnoreCase("1")) {%> selected <%} %>   value="1">Level A</option>
						<option <%if(levelid.equalsIgnoreCase("2")) {%> selected <%} %> value="2">Level B</option>
						<option <%if(levelid.equalsIgnoreCase("3")) {%> selected <%} %> value="3">Level C</option>
						<option <%if(levelid.equalsIgnoreCase("4")) {%> selected <%} %> value="4">Level D</option>
						<option <%if(levelid.equalsIgnoreCase("5")) {%> selected <%} %> value="5">Level E</option>
					</select>	
	      		</div>
	      		
	      	</div>
	      </div>
	      <div class="modal-footer" style="color: red">
	        Note : Upto Selected Milestone Levels Are Showing in Breifing Paper 5, 6 and 9 points.
	      </div>
	    </div>
	  </div>
	</div>
	

	<div class="modal fade" id="recdecmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 53% !important;height: 45%;">
				<div class="modal-content" style="min-height: 45%;" >
				    <div class="modal-header" style="background-color: rgba(0,0,0,.03);">
				    	<h4 class="modal-title" id="model-card-header" style="color: #145374"> <span id="val1"></span> </h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
				          <span aria-hidden="true">&times;</span>
				        </button>
				    </div>
				     <div class="modal-body">
		  	      		<div class="row">
							<div class="col-md-12" > 
									<span id="recdecdata"></span>
		  	      		    </div>
		  	      		</div>
  	      				</div>
				</div>
			</div>
		</div>


<form method="POST" action="FileUnpack.htm"  id="downloadform" target="_blank"> 
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
	<input type="hidden" name="FileUploadId" id="FileUploadId" value="" />
</form>
<form method="get" action="AgendaDocLinkDownload.htm"  id="downloadform1" target="_blank"> 
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
	<input type="hidden" name="filerepid" id="filerepid" value="" />
</form>
<form method="POST" action="MilestoneLevelUpdate.htm"  id="milestonelevelform" > 
	<input type="hidden" name="projectid" id="projectid">
	<input type="hidden" name="committeeid" id="committeeid" >
	<input type="hidden" name="milestonelevelid" id="milestonelevelid" />
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
</form>	

<!--  -----------------------------------------------Tech data attachment js ---------------------------------------------- -->

<!-- -------------------------------------------- Risk Types Modal  -------------------------------------------------------- -->

		<div class="modal fade" id="RiskTypesModal" tabindex="-1" role="dialog" aria-labelledby="RiskTypesModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered "  style="max-width: 60% !important;">
		
				<div class="modal-content" >
					   
				    <div class="modal-header" style="background-color: rgba(0,0,0,.03);">
				      
				    	<h4 class="modal-title"  style="color: #145374">Risk Types</h4>
	
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
				          <span aria-hidden="true">&times;</span>
				        </button>
				        				        
				    </div>
					<div class="modal-body"  style="padding: 0.5rem !important;">
							
							<div class="card-body" style="min-height:30% ;max-height: 93% !important;overflow-y: auto;">
			
								<div class="row" align="center">
									<div class="table-responsive"> 
										<table class="table table-bordered table-hover table-striped table-condensed " style="width:70%">
											<thead>
												<tr>
													<th style="width:10%">SN</th>
													<th style="width:20%">Risk Type</th>
													<th style="width:70%">Description</th>
												</tr>
											</thead>
											<tbody>
												<% int riskcount=0;
												for(Object[] risktype : RiskTypes ){ %>
												<tr>
													<td style="text-align: center;"><%=++riskcount %></td>
													<td style="text-align: center;"><b>I<%=risktype[2] %></b></td>
													<td>Internal <%=risktype[1] %></td>
												</tr>
												<%} %>
												<%for(Object[] risktype : RiskTypes ){ %>
												<tr>
													<td style="text-align: center;"><%=++riskcount %></td>
													<td style="text-align: center;"><b>E<%=risktype[2] %></b></td>
													<td>External <%=risktype[1] %></td>
												</tr>
												<%} %>
											</tbody>
										</table>
									</div>	
											
				             	</div>					
							</div>
					</div>
				</div>
			</div> 
		</div>
<!-- --------------------------------------------  Risk Types Modal End  -------------------------------------------------------- -->

<!-- File Repo Modal -->
<div class="modal fade" id="pdfModal" tabindex="-1" role="dialog" aria-labelledby="pdfModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content shadow-lg border-0">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="modalTitleId"><i class="fa fa-folder-open"></i></h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Folder Tree List -->
         <ul class="list-group folder-tree" id="folderTree"></ul>
      </div>
	  <div class="modal-footer">
		 <div style="color: red;font-weight: 500;">Note - Please upload PDF files only and PDF size should be smaller than 10mb.</div>
	  </div>
    </div>
  </div>
</div>





<script>
var projectId='<%=projectid%>';
var techDataId="";
var attachmentId="";
var projectName="";
$( document ).ready(function() {
	$.ajax({
	    url: 'getAttachmentId.htm',
	    type: 'GET',
	    data: {projectid: projectId},
	    success: function(response) {
	    	var result= JSON.parse(response);
	    	attachmentId=result[1];
	    	techDataId=result[0];
	    },
	  })
});
function openMainModal(projectid) {
    $.ajax({
        type: "GET",
        url: "FileRepMasterListAllAjax.htm",
        data: { projectid: projectid },
        success: function(result) {
            var data = JSON.parse(result);
            var folderMap = {};
            var html = '';
            if (data.length > 0) {
                projectName = data[0][4];
           }

            // First pass: build main folders
            for (var i = 0; i < data.length; i++) {
                var mainId = data[i][0];
                var parentId = data[i][1];
                var name = data[i][3];

                if (parentId === 0) { // Main Folder
                    folderMap[mainId] = { name: name, subfolders: [] };
                }
            }

            // Second pass: attach subfolders
            for (var j = 0; j < data.length; j++) {
                var subId = data[j][0];
                var subParentId = data[j][1];
                var subName = data[j][3];

                if (subParentId !== 0 && folderMap[subParentId]) { // Subfolder
                    folderMap[subParentId].subfolders.push({ id: subId, name: subName });
                }
            }

            // Generate HTML
            if (folderMap && Object.keys(folderMap).length > 0) {
                for (var mainId in folderMap) {
                    if (folderMap.hasOwnProperty(mainId)) {
                        html += '<li class="list-group-item folder-item" data-id="' + mainId + '" onclick="toggleFolder(this, ' + mainId + ', '+ projectid +', \'mainLevel\')">';
                        html += '<i class="fa fa-folder folder-icon text-warning"></i> ' + folderMap[mainId].name;
                        html += '<ul class="list-group subfolder" style="display:none;">';

                        var subfolders = folderMap[mainId].subfolders;
                        for (var k = 0; k < subfolders.length; k++) {
                            var sub = subfolders[k];
                            html += '<li class="list-group-item folder-item" data-id="' + sub.id + '" onclick="toggleFolder(this, ' + sub.id + ', '+ projectid +', \'subLevel\')">';
                            html += '<i class="fa fa-folder folder-icon text-warning"></i> ' + sub.name;
                            html += '<ul class="list-group subfolder" id="subfolder-files-' + sub.id + '" style="display:none;"></ul>';
                            html += '</li>';
                        }

                        html += '<div class="" id="mainfolder-files-' + mainId + '" style="display:none;"></div>';
                        html += '</ul></li>';
                    }
                }
            }else {
                html += '<div>No Data Available.</div></br>';
                html += '<div>Please go to <span style="font-weight: 500; color: blue;">Document Repository Module &rarr; Document Rep Master</span>, create a folder, and upload pdfs.</div></br>';
            }

            $('.folder-tree').html(html);
            $('#pdfModal').modal('show');
            if (projectName !== undefined && projectName.trim() !== '') {
                $('#modalTitleId').text('PDF Files Explorer for ' + projectName);
            }else{
            	$('#modalTitleId').text('PDF Files Explorer');
            }
        }
    });
}

function toggleFolder(element, folderId, projecId,  type) {
	
    if ($(event.target).closest('.file-item').length > 0 || $(event.target).hasClass('pdf-check')) {
        return;
    }
    event.stopPropagation(); // Prevent parent toggling

    var $elem = $(element);
    var $icon = $elem.children('.folder-icon');
    var $subfolder = $elem.children('ul.subfolder');

    if ($subfolder.is(':visible')) {
        $subfolder.slideUp(200);
        $elem.removeClass('open');
        $icon.removeClass('fa-folder-open').addClass('fa-folder');
    } else {
        $subfolder.slideDown(200);
        $elem.addClass('open');
        $icon.removeClass('fa-folder').addClass('fa-folder-open');

        // Load files if not loaded yet
        var fileContainerId = '';
        if (type === 'mainLevel') {
            fileContainerId = '#mainfolder-files-' + folderId;
        } else {
            fileContainerId = '#subfolder-files-' + folderId;
        }

        if ($(fileContainerId).is(':empty')) {
            loadFolderFiles(folderId, projecId,  type);
        }
    }
}

function loadFolderFiles(folderId, projecId, type) {
    $.ajax({
        type: "GET",
        url: "getOldFileDocNames.htm",
        data : {
   			projectId : projecId,
   			fileId : folderId,
   			fileType : type,
	    },
        success: function(result) {
            var data = JSON.parse(result);
            var html = '';

            for (var i = 0; i < data.length; i++) {
                var fileName = data[i][6];
                html += '<li class="list-group-item file-item">';
                html += '<input type="checkbox" class="pdf-check mr-2" id="checkId'+data[i][0]+'" value="' + data[i][7] + '" onclick="singleSelect(this)"';
                if(data[i][7] != 0 && attachmentId === data[i][7]) {
                    html += ' checked disabled';
                }
                html += '/>';
                html += '<i class="fa fa-file-pdf-o text-danger"></i> ' + fileName;
                html += '<span class="text-muted" style="font-size:13px"> Ver '+data[i][4]+'.'+data[i][5]+'</span>';
                html += '<i class="fa fa-download" style="cursor: pointer; margin-left:8px;" onclick="fileDownload(' + data[i][7] + ', \'' + type + '\')"></i>';
                html += '<i class="fa fa-upload" aria-hidden="true" style="color: #0a5dff; cursor: pointer; margin-left:12px;" onclick="fileUpload(\''+data[i][0]+'\')"></i></button><br/>';
                html += '<label for="fileInput" id="uploadlabel'+data[i][0]+'" style="margin-left: 20px; margin-top: 10px; display: none;">'
                html += '<input type="file" name="docFileInput" id="fileInput'+data[i][0]+'" required="required"  accept="application/pdf"/> '
                html += '<button type="button" class="btn btn-sm back" onclick="fileSubmit(\''+type+'\',\''+data[i][0]+'\',\''+data[i][2]+'\',\''+data[i][3]+'\',\''+data[i][4]+'\',\''+data[i][5]+'\',\''+data[i][6]+'\')">Upload</button>'
                html += '</label>'
                html += '</li>';
            }

            if (type === 'mainLevel') {
                $('#mainfolder-files-' + folderId).html(html).show();
            } else {
                $('#subfolder-files-' + folderId).html(html).show();
            }
        }
    });
}

// Allow only one checkbox to be selected at a time
function singleSelect(checkbox) {
	console.log(checkbox.id);
    $('.pdf-check').not(checkbox).not(':disabled').prop('checked', false);
}

function fileDownload(fileId, fileType) {
    $.ajax({
        url: 'fileDownload.htm/' + fileId + '?fileType=' + encodeURIComponent(fileType),
        type: 'GET',
        xhrFields: {
            responseType: 'blob'
        },
        success: function (data, status, xhr) {
        	  const blob = new Blob([data], { type: 'application/pdf' });
              const blobUrl = URL.createObjectURL(blob);
              const viewerUrl = '<%=request.getContextPath()%>/view/filerepo/pdfViewer.jsp?url=' + encodeURIComponent(blobUrl);
              window.open(viewerUrl, '_blank');
              setTimeout(() => URL.revokeObjectURL(blobUrl), 5000);
        },
        error: function (xhr, status, error) {
		     Swal.fire({
			        icon: 'error',
			        title: 'Error',
			        text: 'Failed to download/open file.',
			 });
        }
    });
}

// Event delegation for dynamically added checkboxes
$(document).on('change', '.pdf-check', function() {
  // Logic to allow only one checkbox to be checked at a time within the list
  $('.pdf-check').not(this).not(':disabled').prop('checked', false);
  // Send AJAX request with the selected checkbox value
  var selectedValue = $(this).val();
  var projectid = <%=projectid%>;
	  if(selectedValue){
	     Swal.fire({
	            title: 'Are you sure to linking?',
	            icon: 'question',
	            showCancelButton: true,
	            confirmButtonColor: 'green',
	            cancelButtonColor: '#d33',
	            confirmButtonText: 'Yes'
	        }).then((result) => {
	            if (result.isConfirmed) {
				  $.ajax({
					    url: 'submitCheckboxFile.htm', 
					    type: 'GET',
					    data: { attachid: selectedValue,techDataId: techDataId,projectid: projectid},
					    success: function(response) {
					      Swal.fire({
					        icon: 'success',
					        title: 'Success',
					        text: 'Document linked successfully!',
					        allowOutsideClick :false
					      });
					      $('#pdfModal').hide();
					      $('.swal2-confirm').click(function (){
					           location.reload();
					       	})
					    },
					    error: function() {
					      Swal.fire({
					        icon: 'error',
					        title: 'Error',
					        text: 'An error occurred while submitting the checkbox selection.',
					      });
					    }
				});
	          }else{
	        	  $('.pdf-check').not(':disabled').prop('checked', false);
	          }
	       });
	  }else{
		  Swal.fire({
		        icon: 'error',
		        title: 'Error',
		        text: 'An error occurred while submitting the checkbox selection.',
		  }); 
	  }
});

$('#levelvalue').on('change', function(){
	$('#milestonelevelid').val($(this).find(":selected").val());
	$('#projectid').val(<%=projectid%>);
	$('#committeeid').val(<%=committeeid%>);
	$('#milestonelevelform').submit();
})

$( document).on("click", ".milestonemodal", function () {
	var milId = $(this).data('id');
    $('.milestonemodalwhole').hide();
    $('.collapse').removeClass('show'); 
    $('#row'+milId.charAt(milId.length-1)).click();
 	$('#'+milId).show();
});

function milactivitychange(val){
	if(val.value=='A'){
		$('#milestonechangetableajax').hide();
		$('#milestoneactivitychangetable').show();
	}else{
	var Proid = <%=projectid%>;	
	$('#milestoneactivitychangetable').hide();
	
	 $.ajax({
		type : "GET",
		url : "MilestoneActivityChange.htm",
		data : {
			projectid : Proid,
			milactivitystatusid : val.value,			
		},
		datatype: 'json',
		success : function(result)
			{
				var result= JSON.parse(result);
				var values= Object.keys(result).map(function(e){
					return result[e];
				})	
							
				var s = "<table id='milestonechangetableajax' style='align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px; width: 980px;  border-collapse:collapse;'><tr><th  style='width: 30px !important;'>SN</th><th  style='max-width: 40px; '>MS No.</th><th  style='max-width: 230px; '>Milestones </th><th  style='max-width: 80px;'> Original PDC </th><th  style='max-width: 80px;'> Revised PDC</th>"
							+ "<th  style='max-width: 50px; '>Progress</th><th  style='max-width: 70px;'> Status</th><th  style='max-width: 70px;'> Remarks</th></tr>";
				
							if(values[0].length==0){
								s+= "<tr><td colspan=8' style='text-align: center;' > Nil</td></tr>";
							}else{
								for(var i=0;i<values[0].length;i++){
									 if(parseInt(values[0][i][12])>0){ 
										s+= "<tr><td  style='max-width: 30px;'>" +parseInt(i+1)+ "</td><td  style='max-width: 40px;'>M"+values[0][i][2]+"</td><td  style='max-width: 230px;'>"+values[0][i][3]+"</td><td  style='max-width: 80px;' >"+formatDate(values[0][i][5])+" </td><td  style='max-width: 80px;'>"+formatDate(values[0][i][7])+"</td>"
										+"<td  style='max-width: 50px;'>"+values[0][i][12]+"</td><td  style='max-width: 70px;'>"+values[0][i][11]+"	</td><td  style='max-width: 70px;'>"+values[0][i][13]+"</td></tr>";
									 } 
								}
							}
						s+="</table>"	
				$('#milestoneactivitychange').html(s);

			}
	}) 		
	
	}
}
function milactivitychange6(val){
	if(val.value=='A'){
		$('#milestonechangetableajax6').hide();
		$('#milestoneactivitychangetable6').show();
	}else{
	var Proid = <%=projectid%>;	
	$('#milestoneactivitychangetable6').hide();
	
	 $.ajax({
		type : "GET",
		url : "MilestoneActivityChange.htm",
		data : {
			projectid : Proid,
			milactivitystatusid : val.value,			
		},
		datatype: 'json',
		success : function(result)
			{
				var result= JSON.parse(result);
				var values= Object.keys(result).map(function(e){
					return result[e];
				})	
				var s = "<table id='milestonechangetableajax6' style='align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 25px; width: 980px;  border-collapse:collapse;'><tr><th  style='width: 30px !important;'>SN</th><th  style='max-width: 40px; '>MS No.</th><th  style='max-width: 230px; '>Milestones </th><th  style='max-width: 80px;'> Original PDC </th><th  style='max-width: 80px;'> Revised PDC</th>"
							+ "<th  style='max-width: 50px; '>Progress</th><th  style='max-width: 70px;'> Status</th><th  style='max-width: 70px;'> Remarks</th></tr>";
							if(values[0].length==0){
								s+= "<tr><td colspan=8' style='text-align: center;' > Nil</td></tr>";
							}else{
								for(var i=0;i<values[0].length;i++){
									 if(parseInt(values[0][i][12])>0){ 
										
										s+= "<tr><td  style='max-width: 30px;'>" +parseInt(i+1)+ "</td><td  style='max-width: 40px;'>M"+values[0][i][2]+"</td><td  style='max-width: 230px;'>"+values[0][i][3]+"</td><td  style='max-width: 80px;' >"+formatDate(values[0][i][5])+" </td><td  style='max-width: 80px;'>"+formatDate(values[0][i][7])+"</td>"
										+"<td  style='max-width: 50px;'>"+values[0][i][12]+"</td><td  style='max-width: 70px;'>"+values[0][i][11]+"	</td><td  style='max-width: 70px;'>"+values[0][i][13]+"</td></tr>";

									 } 
								}
							}
						s+="</table>"	
				$('#milestoneactivitychange').html(s);

			}
		
	}) 		
	
	}
	
}

	 function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) 
		        month = '0' + month;
		    if (day.length < 2) 
		        day = '0' + day;

		    return [day, month, year].join('-');
		}

</script>

<script type="text/javascript">
function FileDownload(fileid1)
{
	$('#FileUploadId').val(fileid1);
	$('#downloadform').submit();
}
function FileDownload1(fileid1)
{
	$('#filerepid').val(fileid1);
	$('#downloadform1').submit();
}
</script>

<!--  -----------------------------------------------agenda attachment js ---------------------------------------------- -->
			
	<% for(int z=0;z<projectidlist.size();z++){ %>
		<script>
								    	  
									function chartprint_<%=projectidlist.get(z)%>(type,interval){ 
								    	  var data = [
 											<%for(Object[] obj : ganttchartlist.get(z)){%>
								    		  {
								    		    id: "<%=obj[3]%>",
								    		    name: "<%=obj[2]%>",
								    		    <%if(!obj[9].toString().equalsIgnoreCase("0") && !obj[9].toString().equalsIgnoreCase("1")){ %>
								    		    baselineStart: "<%=obj[6]%>",
								    		    baselineEnd: "<%=obj[7]%>",
								    		    baseline: {fill: "#f25287 0.5", stroke: "0.5 #dd2c00"},
								    		    actualStart: "<%=obj[4]%>",
								    		    actualEnd: "<%=obj[5]%>",
								    		    actual: {fill: "#29465B", stroke: "0.8 #29465B"},
								    		    baselineProgressValue: "<%= Math.round((int)obj[8])%>%",
								    		    progress: {fill: "#81b214 0.0", stroke: "0.0 #150e56"},
								    		    progressValue: "<%= Math.round((int)obj[8])%>%",
								    		    rowHeight: "55",
								    		    <%}else{%>
								    		    baselineStart: "<%=obj[4]%>",
								    		    baselineEnd: "<%=obj[5]%>",
								    		    baseline: {fill: "#29465B", stroke: "0.8 #29465B"},
								    		    baselineProgressValue: "<%= Math.round((int)obj[8])%>%",
								    		    progress: {fill: "#81b214 0.0", stroke: "0.0 #150e56"},
								    		    progressValue: "<%= Math.round((int)obj[8])%>%",
								    		    rowHeight: "55",
								    		    <%}%>
								    		  },
								    		  
								    		  <%}%>
								    	
								    		  ];
								    		 
								    		// create a data tree
								    		var treeData = anychart.data.tree(data, "as-tree");
								    		// create a chart
								    		var chart = anychart.ganttProject();
								    		// set the data
								    		chart.data(treeData);   
								        	// set the container id
								        	chart.container("containers_<%=projectidlist.get(z)%>");  
								        	// initiate drawing the chart
								        	chart.draw();    
								        	// fit elements to the width of the timeline
								        	chart.fitAll();
								        
								        	 chart.getTimeline().tooltip().useHtml(true);   
								        	 
								        	  var timeline = chart.getTimeline();
											   // configure labels of elements
											   timeline.elements().labels().fontWeight(600);
											   timeline.elements().labels().fontSize("14px");
											   timeline.elements().labels().fontColor("#FF6F00");
								        	 
										        chart.getTimeline().tooltip().format(
									        		 function() {
									        		        var actualStart = this.getData("actualStart") ? this.getData("actualStart") : this.getData("baselineStart");
									        		        var actualEnd = this.getData("actualEnd") ? this.getData("actualEnd") : this.getData("baselineEnd");
									        		        var reDate=this.getData("actualStart") ;
									        		   
									        		        var html="";
									        		        if(reDate===undefined){
									        		        	html="";
									        		        	html= "<span style='font-weight:600;font-size:10pt'> Actual : " +
									        		               anychart.format.dateTime(actualStart, 'dd MMM yyyy') + " - " +
									        		               anychart.format.dateTime(actualEnd, 'dd MMM yyyy') + "</span><br>" +
									        		               "Progress: " + this.getData("baselineProgressValue") + "<br>"
									        		        }else{
									        		        	html="";
									        		        html="<span style='font-weight:600;font-size:10pt'> Actual : " +
									        		               anychart.format.dateTime(actualStart, 'dd MMM yyyy') + " - " +
									        		               anychart.format.dateTime(actualEnd, 'dd MMM yyyy') + "</span><br>" +
									        		               "<span style='font-weight:600;font-size:10pt'> Revised : " +
									        		               anychart.format.dateTime(this.getData("baselineStart"), 'dd MMM yyyy') + " - " +
									        		               anychart.format.dateTime(this.getData("baselineEnd"), 'dd MMM yyyy') + "</span><br>" +
									        		               "Progress: " + this.getData("baselineProgressValue") + "<br>"
									        		        }
									        		        
									        		        return html;
									        		    }
										        		
										        ); 
								       
								        /* Title */
								        
								        var title = chart.title();
										title.enabled(true);
										title.text("<%=ProjectDetail.get(z)[2] %> ( <%=ProjectDetail.get(z)[1] %> ) Gantt Chart");
										title.fontColor("#64b5f6");
										title.fontSize(18);
										title.fontWeight(600);
										title.padding(5);
										<%-- <%} %> --%>
								        chart.rowHoverFill("#8fd6e1 0.3");
								        chart.rowSelectedFill("#8fd6e1 0.3");
								        chart.rowStroke("0.5 #64b5f6");
								        chart.columnStroke("0.5 #64b5f6");
								        chart.defaultRowHeight(35);
								     	chart.headerHeight(90);
								     	
								     	/* Hiding the middle column */
								     	chart.splitterPosition("17.4%");
								     	
								     	var dataGrid = chart.dataGrid();
								     	dataGrid.rowEvenFill("gray 0.3");
								     	dataGrid.rowOddFill("gray 0.1");
								     	dataGrid.rowHoverFill("#ffd54f 0.3");
								     	dataGrid.rowSelectedFill("#ffd54f 0.3");
								     	dataGrid.columnStroke("2 #64b5f6");
								     	dataGrid.headerFill("#64b5f6 0.2");
								     
								     	/* Title */
								     	var column_1 = chart.dataGrid().column(0);
								    	column_1.labels().fontWeight(600);
								     	column_1.labels().useHtml(true);
								     	column_1.labels().fontColor("#055C9D");
								     	
								     	var column_2 = chart.dataGrid().column(1);
								     	column_2.title().text("Milestone");
								     	column_2.title().fontColor("#145374");
								     	column_2.title().fontWeight(600);
								     	
										chart.dataGrid().column(0).width(25);
								     	
								     	chart.dataGrid().tooltip().useHtml(true);    
								        
								     	if(interval==="year"){
								     		/* Yearly */
									     	chart.getTimeline().scale().zoomLevels([["year"]]);
									     	var header = chart.getTimeline().header();
									     	header.level(2).format("{%value}-{%endValue}");
									     	header.level(1).format("{%value}-{%endValue}"); 
								     	}
								     	if(interval==="half"){
								     		/* Half-yearly */
									     	chart.getTimeline().scale().zoomLevels([["semester", "year"]]);
									     	var header = chart.getTimeline().header();
									     	header.level(2).format("{%value}-{%endValue}");
									     	var header = chart.getTimeline().header();
									     	header.level(0).format(function() {
								     			var duration = '';
								     			if(this.value=='Q1')
								     				duration='H1';
								     			if(this.value=='Q3')
								     				duration='H2'
								     		  return duration;
								     		});
								     	}
								     	if(interval==="quarter"){
								     		/* Quarterly */
									     	chart.getTimeline().scale().zoomLevels([["quarter", "semester","year"]]);
									     	var header = chart.getTimeline().header();
									     	header.level(1).format(function() {
								     			var duration = '';
								     			if(this.value=='Q1')
								     				duration='H1';
								     			if(this.value=='Q3')
								     				duration='H2'
								     		  return duration;
								     		});
								     	}
								     	if(interval==="month"){
								     		/* Monthly */
									     	chart.getTimeline().scale().zoomLevels([["month", "quarter","year"]]);
								     	}
								     	else if(interval===""){
								     		/* Quarterly */
									     	chart.getTimeline().scale().zoomLevels([["quarter", "semester","year"]]);
									     	var header = chart.getTimeline().header();
									     	header.level(1).format(function() {
								     			var duration = '';
								     			if(this.value=='Q1')
								     				duration='H1';
								     			if(this.value=='Q3')
								     				duration='H2'
								     		  return duration;
								     		});
								     	}
								     	/* chart.getTimeline().scale().fiscalYearStartMonth(4); */
								     	/* Header */
								     	var header = chart.getTimeline().header();
								     	header.level(0).fill("#64b5f6 0.2");
								     	header.level(0).stroke("#64b5f6");
								     	header.level(0).fontColor("#145374");
								     	header.level(0).fontWeight(600);
								     	/* Marker */
								     	var marker_1 = chart.getTimeline().lineMarker(0);
								     	marker_1.value("current");
								     	marker_1.stroke("2 #dd2c00");
								     	/* Progress */
								     	var timeline = chart.getTimeline();
								     	timeline.tasks().labels().useHtml(true);
								     	timeline.tasks().labels().format(function() {
								     	  if (this.progress == 1) {
								     	    return "<span style='color:orange;font-weight:bold;font-family:'Lato';'></span>";
								     	  } else {
								     	    return "<span style='color:black;font-weight:bold'></span>";
								     	  }
								     	});
								     	
								    // calculate height
								     	var traverser = treeData.getTraverser();
								        var itemSum = 0;
								        var rowHeight = chart.defaultRowHeight();
								        while (traverser.advance()){
								           if (traverser.get('rowHeight')) {
								          itemSum += traverser.get('rowHeight');
								        } else {
								        	itemSum += rowHeight;
								        }
								        if (chart.rowStroke().thickness != null) {
								        	itemSum += chart.rowStroke().thickness;
								        } else {
								          itemSum += 1;
								        }
								        }
								        itemSum += chart.headerHeight();
								        var menu = chart.contextMenu();
								          
									} 
		 $( document ).ready(function(){
	    	  chartprint_<%=projectidlist.get(z)%>('type','');
	      })
	      function ChartPrint_<%=projectidlist.get(z)%>(){
		   		console.log("#interval_<%=projectidlist.get(z) %>");
	    	  var interval_<%=projectidlist.get(z) %> = $("#interval_<%=projectidlist.get(z) %>").val();
	    	  $('#containers_<%=projectidlist.get(z) %>').empty();
	    	  chartprint_<%=projectidlist.get(z)%>('print',interval_<%=projectidlist.get(z) %>);
	     }
				$('#interval_<%=projectidlist.get(z) %>').on('change',function(){
					$('#containers_<%=projectidlist.get(z) %>').empty();
					var interval_<%=projectidlist.get(z) %> = $("#interval_<%=projectidlist.get(z) %>").val()
					chartprint_<%=projectidlist.get(z)%>('type',interval_<%=projectidlist.get(z) %>);
					
				})
		</script>
	<% } %>
<script type="text/javascript">
function submitForm(frmid)
{ 
	        $('body').css("filter", "blur(0.8px)");
	        $('#main').hide();
	        $('#spinner').show();
	document.getElementById(frmid).submit(); 
} 
</script>
<script type="text/javascript">
$('.edititemsdd').select2();
$('.items').select2();
$("table").on('click','.tr_clone_addbtn' ,function() {
   $('.items').select2("destroy");        
   var $tr = $('.tr_clone').last('.tr_clone');
   var $clone = $tr.clone();
   $tr.after($clone);
   $('.items').select2();
   $clone.find('.items' ).select2('val', '');    
   $clone.find("input").val("").end();
   /* $clone.find("input:number").val("").end();
   	  $clone.find("input:file").val("").end() 
   */  
});
</script>
<script type="text/javascript">
var editor_config = {
	maxlength: '4000',
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
		height: 300,
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
			{ name: 'Square Bulleted List', element: 'ul', styles: { 'list-style-type': 'square' } },

]
		
	} ;
	
CKEDITOR.replace('ckeditor', editor_config );
CKEDITOR.replace('ckeditor1', editor_config );

$(document).ready(function() {
	var locked=0;
	   var editAbstract=CKEDITOR.instances.ckeditor;
	   editAbstract.on("key",function(e) {      
	      var maxLength=e.editor.config.maxlength;
	      e.editor.document.on("keyup",function() {KeyUp(e.editor,maxLength,"letterCount",e);});
	      e.editor.document.on("paste",function() {KeyUp(e.editor,maxLength,"letterCount",e);});
	      e.editor.document.on("blur",function() {KeyUp(e.editor,maxLength,"letterCount",e);});
	   },editAbstract.element.$);
	   //function to handle the count check
	   function KeyUp(editorID,maxLimit,infoID,editor) 
	   {
		   var text=editor.editor.getData().replace(/<("[^"]*"|'[^']*'|[^'">])*>/gi, '').replace(/^\s+|\s+$/g, '');
		   $("#"+infoID).text(text.length);
		   if( text.length  >= maxLimit )
		   {
		      if ( !locked )
		      {
		    	 // Record the last legal content.
		         editAbstract.fire('saveSnapshot'), 
		         locked = 1;			                      
		         editor.cancel();			         
		      }
		      else if( text.length > maxLimit ){ // Rollback the illegal one.
		    	 alert('Cannot Insert content longer than '+maxLimit+' Characters');
		         editAbstract.execCommand( 'undo' );			         
		      }
		      else{
		    	  locked = 0;
		      }
		   }
	   }   
	});

function RecDecEdit(recdescid ){
	
	 if(recdescid=='0'){
		     CKEDITOR.instances['ckeditor1'].setData("");
			 $("#recdecid").val("");
			 $('#decision').prop('checked',false);
			 $('#recommendation').prop('checked',false);
	 }else{
			$.ajax({
				type : "GET",
				url : "Getrecdecdata.htm",
				data : {
					recdesid : recdescid,
				},
				datatype : 'json',
				success : function(result){
					var result = JSON.parse(result);
					var type = result[2];
					
					if(type=='D'){
						 $('#decision').prop('checked',true);
					}else if(type=='R'){
						 $('#recommendation').prop('checked',true);
					}else{
						 $('#decision').prop('checked',false);
						 $('#recommendation').prop('checked',false);
					}
					$("#recdecid").val(result[0]);
					CKEDITOR.instances['ckeditor1'].setData(result[3]);
				}
			});
	 }
}

function RecDecmodal(recdescid)
{
	$.ajax({
			type : "GET",
			url : "Getrecdecdata.htm",
			data : {
				recdesid : recdescid,
			},
			datatype : 'json',
			success : function(result) {
				var result = JSON.parse(result);
				var type = result[2];
				if(type=='D'){
					$("#val1").html("Decision");
				}else if(type=='R'){
					$("#val1").html("Recommendation");
				}
				$("#recdecdata").html(result[3]);
				$('#recdecmodel').modal('toggle');
			}
	});
	
}
function checkData(formid)
{
	var recdec = CKEDITOR.instances['ckeditor1'].getData(); 
	var fields = $("input[name='darc']").serializeArray();
	if(recdec!='' && fields!=0){
		if( recdec.length>999){
			alert("Data is Too long !");
			return false;
		}else{
			if(confirm("Are you sure to submit!")){
				document.getElementById(formid).submit();
				return true;
			}
		}
	}else{
		alert("Fill all the details!");
		return false;
	}
	
}

function RecDecremove(a){
	$('#recdecId').val(a);
	if(confirm("Are you sure,you want to remove?")){
	$('#remvfrm').submit();
	}else{
		event.preventDefault();
		return false;
	}
}

$('.btn[data-toggle="tooltip"]').tooltip({
    animated: 'fade',
    placement: 'top',
    html : true,
    boundary: 'window'
});

function openEditDiv(a){
    var label = document.getElementById("filelabel"+a);
    if (label.style.display === "none") {
        label.style.display = "inline-block";
    } else {
        label.style.display = "none";
    }
}

function fileUpload(Id){
	 var label = document.getElementById("uploadlabel"+Id);
    if (label.style.display === "none") {
        label.style.display = "inline-block";
    } else {
        label.style.display = "none";
    }
}
</script>
<script>
function fileSubmit(type,repid,mainId,subId,version,release,docName) {
    event.preventDefault();
    var fileInput =  $("#fileInput"+repid)[0].files[0];
    
	 if (fileInput === undefined) {
	       Swal.fire({
	            icon: 'error',
	            title: 'Oops...',
	            text: 'Please select a file to upload!',
	            allowOutsideClick :false
	       });
	       return;
	  }
	// Check if the file is a PDF
	   var fileType = fileInput.type;
	   if (fileType !== 'application/pdf') {
	       Swal.fire({
	           icon: 'error',
	           title: 'Invalid File Type',
	           text: 'Please select a PDF file!',
	           allowOutsideClick: false
	       });
	       return;
	   }
	   // Check if the file size is less than 10MB (10 * 1024 * 1024 bytes)
	   var fileSize = fileInput.size;
	   if (fileSize > 10 * 1024 * 1024) {
	       Swal.fire({
	           icon: 'error',
	           title: 'File Too Large',
	           text: 'Please select a file smaller than 10MB!',
	           allowOutsideClick: false
	       });
	       return;
	   }
	   
       Swal.fire({
            title: 'Are you sure to upload?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: 'green',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {
		        var projectid = <%= projectid %>;
		        var formData = new FormData();
		        formData.append("file", $("#fileInput"+repid)[0].files[0]);
		        formData.append("fileType", type);
		        formData.append("fileRepId", repid);
		        formData.append("projectid", projectid);
		        formData.append("mainId", mainId);
		        formData.append("subId", subId);
		        formData.append("docName", docName);
		        formData.append("version", version);
		        formData.append("release", release);
		        formData.append("${_csrf.parameterName}", "${_csrf.token}");
		        // Use AJAX to submit the form data
		        $.ajax({
		            url: 'DocFileUpload.htm',
		            type: 'POST',
		            data: formData,
		            contentType: false,
		            processData: false,
		            success: function(response) {
		            	attachid=response;
		            	  Swal.fire({
				    	       	title: "Success",
				                text: "File Uploaded Successfully",
				                icon: "success",
				                allowOutsideClick :false
				         		});
		            	  $('#pdfModal').hide();
		            	  $('.swal2-confirm').click(function (){
		      	                location.reload();
		      	        	})
		            },
		            error: function(xhr, status, error) {
		            	  Swal.fire({
		                      icon: 'error',
		                      title: 'Error',
		                      text: 'An error occurred while uploading the file'
		                  });
		                  console.log(xhr.responseText);
		             }
		        });
        }
    });
}

function removeFileAttch(projectId,techDataId,techAttachId) {
    Swal.fire({
        title: 'Are you sure to remove attachment?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: 'green',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes'
    }).then((result) => {
        if (result.isConfirmed) {
        	 $.ajax({
		            url: 'removeFileAttachment.htm',
		            type: 'POST',
		            datatype: 'json',
		            data: {
		            	 techDataId : techDataId,
		            	 techAttachId : techAttachId,
		            	 projectId : projectId,
		            	 ${_csrf.parameterName} : "${_csrf.token}",
		            },
		            success: function(response) {
		            	  Swal.fire({
				    	       	title: "Success",
				                text: "Attachment Removed Successfully",
				                icon: "success",
				                allowOutsideClick :false
				         		});
		            	  $('.swal2-confirm').click(function (){
		      	                location.reload();
		      	        	})
		            },
		            error: function(xhr, status, error) {
		            	  Swal.fire({
		                      icon: 'error',
		                      title: 'Error',
		                      text: 'An error occurred while removing the file'
		                  });
		                  console.log(xhr.responseText);
		             }
		        });
        }
    });
}
</script>
</body>