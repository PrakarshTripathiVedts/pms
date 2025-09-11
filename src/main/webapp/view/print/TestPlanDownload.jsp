<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@ page language="java" import="java.util.*,com.vts.*,java.text.SimpleDateFormat,java.util.stream.Collectors"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<!DOCTYPE html>
<html>
<head>
<script src="./webjars/jquery/3.4.0/jquery.min.js"></script>
<script src="./webjars/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="./webjars/bootstrap/4.0.0/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="./webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
<script>
 /* 	 $( document ).ready(function() {
		 download();
		});  */
		 function download(){
			$("#source-html").wordExport("System-Test Plan");
	 }
</script>
<spring:url value="/resources/js/FileSaver.min.js" var="FileSaver" />
<script src="${FileSaver}"></script>
<spring:url value="/resources/js/jquery.wordexport.js" var="wordexport" />
<script src="${wordexport}"></script>
<meta charset="ISO-8859-1">
<title>Test Plan Document</title>
<%
//List<Object[]>OtherRequirements=(List<Object[]>)request.getAttribute("OtherRequirements");
String lablogo=(String)request.getAttribute("lablogo");
//Object[]PfmsInitiationList=(Object[])request.getAttribute("PfmsInitiationList");
Object[]LabList=(Object[])request.getAttribute("LabList");
Object[]reqStatus=(Object[])request.getAttribute("reqStatus");
//List<Object[]>RequirementList=(List<Object[]>)request.getAttribute("RequirementList");
FormatConverter fc=new FormatConverter(); 
SimpleDateFormat sdf3=fc.getRegularDateFormat();
SimpleDateFormat sdf=fc.getRegularDateFormatshort();
SimpleDateFormat sdf1=fc.getSqlDateFormat();
List<Object[]>RequirementFiles=(List<Object[]>)request.getAttribute("RequirementFiles");
Object[]TestScopeIntro=(Object[])request.getAttribute("TestScopeIntro");
String uploadpath=(String)request.getAttribute("uploadpath");
String labImg=(String)request.getAttribute("LabImage");
List<Object[]>AbbreviationDetails=(List<Object[]>)request.getAttribute("AbbreviationDetails");
List<Object[]>MemberList=(List<Object[]>)request.getAttribute("MemberList");
List<Object[]> DocumentSummary=(List<Object[]>)request.getAttribute("TestDocumentSummary");
Object[] DocTempAtrr=(Object[])request.getAttribute("DocTempAttributes");
List<Object[]>TestContentList=(List<Object[]>)request.getAttribute("TestContent");
List<Object[]>AcceptanceTesting= (List<Object[]>)request.getAttribute("AcceptanceTesting");
List<Object[]>StagesApplicable= (List<Object[]>)request.getAttribute("StagesApplicable");
List<Object[]>TestSuiteList= (List<Object[]>)request.getAttribute("TestSuite");
List<Object[]>TestDetailsList= (List<Object[]>)request.getAttribute("TestDetailsList");
ObjectMapper objectMapper = new ObjectMapper();
String jsonTestSuitArray = objectMapper.writeValueAsString(TestSuiteList);
int maincount=0;
int port=new URL( request.getRequestURL().toString()).getPort();
String path=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/";
String conPath=(String)request.getContextPath();
LocalDate d = LocalDate.now();
int contentCount=0;
Month month= d.getMonth();
int year=d.getYear();
String fontSize = "16";
String SubHeaderFontsize ="14";
String SuperHeaderFontsize="13";
String ParaFontSize ="12" ;
String ParaFontWeight="normal";
String HeaderFontWeight="Bold";
String SubHeaderFontweight="Bold";
String SuperHeaderFontWeight="Bold";
String FontFamily="Times New Roman";
String Schedule = null;
String Approach = null;
String Conclusion = null;
String Approachid=null;
String Scheduleid=null;
String Conclusionid=null;
if (TestContentList != null) {
    for (Object[] testClist : TestContentList) { 
        String Testtype = testClist[0].toString(); 
        if ("Approach".equalsIgnoreCase(Testtype)) {
            Approach = testClist[1].toString();
           // Approachid =testClist[2].toString();
        } else if ("Schedule".equalsIgnoreCase(Testtype)) {
            Schedule = testClist[1].toString();
            Scheduleid =testClist[2].toString();
        } else if ("Conclusion".equalsIgnoreCase(Testtype)) {
            Conclusion =testClist[1].toString();
            //Conclusionid =testClist[2].toString();
        }
    }
}
%>




</head>
<body >
	<div class="content-footer" align="center"> 
		<button id="btn-export" class="btn btn-lg bg-transparent" onclick="download()"
			style="padding: 10px;">
			<i class="fa fa-lg fa-download" aria-hidden="true"
				style="color: green;"></i>
		</button>
	</div>
	<div class="source-html-outer">
		<div id="source-html">
    <!-- Your existing HTML content goes here -->
    <!-- ... -->
     <%
     /*  Doc Temp Starts */
   // Default font size
        if (DocTempAtrr != null && DocTempAtrr[0] != null) {
        	fontSize=DocTempAtrr[0].toString();
       }
  //  SubHeader font size
        if (DocTempAtrr != null && DocTempAtrr[2] != null) {
              SubHeaderFontsize = DocTempAtrr[2].toString(); 
        }
     //  Super Header font size
      	if(DocTempAtrr!=null && DocTempAtrr[9]!=null){
        		SuperHeaderFontsize=DocTempAtrr[9].toString();
    	    	}
    	 if(DocTempAtrr!=null && DocTempAtrr[4]!=null){
        		ParaFontSize= DocTempAtrr[4].toString();
    	    	}
    	 if(DocTempAtrr!=null && DocTempAtrr[5]!=null){
    	    	ParaFontWeight=DocTempAtrr[5].toString();
    	    	}
    	  if(DocTempAtrr!=null && DocTempAtrr[1]!=null){
    	    		HeaderFontWeight= DocTempAtrr[1].toString();
    	    	}
        if(DocTempAtrr!=null && DocTempAtrr[3]!=null){
        		SubHeaderFontweight= DocTempAtrr[3].toString();
    	    	}
                if(DocTempAtrr!=null && DocTempAtrr[10]!=null){
        	SuperHeaderFontWeight= DocTempAtrr[10].toString();
        }
                if(DocTempAtrr!=null && DocTempAtrr[11]!=null){
                	FontFamily= DocTempAtrr[11].toString();
                }
              
                /*  Doc Temp end */
      
            	if (TestContentList != null) {
            	    for (Object[] testClist : TestContentList) { 
            	        String Testtype = testClist[0].toString(); 
            	        if ("Approach".equalsIgnoreCase(Testtype)) {
            	            Approach = testClist[1].toString();
            	            Approachid =testClist[2].toString();
            	        } else if ("Schedule".equalsIgnoreCase(Testtype)) {
            	            Schedule = testClist[1].toString();
            	            Scheduleid =testClist[2].toString();
            	        } else if ("Conclusion".equalsIgnoreCase(Testtype)) {
            	            Conclusion =testClist[1].toString();
            	            Conclusionid =testClist[2].toString();
            	        }
            	    }
            	}
            	String TestSetUp=(String)request.getAttribute("TestSetUp");
            	String TestSetUpDiagram=(String)request.getAttribute("TestSetUpDiagram");
            	String TestingTools=(String)request.getAttribute("Testingtools");
            	String TestVerification=(String)request.getAttribute("TestVerification");
            	String RoleResponsibility=(String)request.getAttribute("RoleResponsibility");
                %>
    <div class="heading-container" style="text-align: center; position: relative;">
  <h6 class="heading-color top-center" style="font-family: <%= FontFamily %>;font-size: 14px !important; text-decoration: underline; display: inline-block; padding-bottom: 5px; position: absolute; top: 0; left: 50%; transform: translateX(-50%); font-weight: normal;">RESTRICTED</h6>
</div>
  <table style="width: 98%;border-collapse: collapse;margin-left: 5px;">
	<tr>
		<td style="text-align: left;">
			<table style="width: 85%; border: 1px solid black; border-collapse: collapse;">
	            <tr>
	                <td style="text-align: center; padding: 5px;">
	                    <span style="text-decoration: underline;font-family: <%= FontFamily %>;">RESTRICTED</span>
	                </td>
	            </tr>
	            <tr>
	                <td style="padding: 5px;text-align: justify;font-family: <%= FontFamily %>;">
	                    <p>The information given in this document is not to be published or communicated, either directly or indirectly, to the press or to any personnel not authorized to receive it.</p>
	                </td>
	            </tr>
        	</table>
		</td>
		<td style="text-align: right;">
			<table style="width: 23%; border: none; border-collapse: collapse;">
            	<tr>
          			<td style="padding: 10px;">
    					<h4 style="margin: 0; padding: 0;font-family: <%= FontFamily %>;">
    				    				<%
				if(LabList[0] != null) {
				%>
				<%=LabList[0].toString()%>:SSTP:....................</h4>
  						<h6 style="margin: 0; padding: 0;font-family: <%= FontFamily %>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copy No.01</h6>
						<%
				}else {
				%>-<%
				}
				%>
					</td>
            	</tr>
        	</table>
        	<br> <br> <br> <br> <br><br>
		</td>
	</tr>
</table>
			<div align="center"></div>
			<div style="text-align: center; margin-top: 75px;">
				<h4 style="font-size: 18pt;;font-family:<%= FontFamily %>; !important;" class="heading-color ">SYSTEM SUB SYSTEM TEST PLAN</h4>
				<h4 style="font-size: 15pt;font-family: <%= FontFamily %>;">For</h4>
				<h4 style="font-size: 18pt;font-family: <%= FontFamily %>;">
					Project:
					<br> <br>
				</h4>
			<%-- 	<h4 style="font-size: 18pt;font-family: <%= FontFamily %>;">
					Project:
					<%=PfmsInitiationList[7].toString()%><br> <br>
					<%="(" + PfmsInitiationList[6].toString() + ")"%>
				</h4> --%>
				
				<h4 style="font-size: 18px; text-decoration: underline;font-family: <%= FontFamily %>;">Test Plan 
					No.</h4>
				<h4 style="font-family: <%= FontFamily %>;">
					<%if (reqStatus!=null && reqStatus[3] != null) {%><%=reqStatus[3].toString()%>
					<%} else {%>-<%}%>
				</h4>
					<div align="center" >
						<img class="logo" style="width: 80px; height: 80px; margin-bottom: 5px"
							<%if (lablogo != null) {%> src="data:image/png;base64,<%=lablogo%>" alt="Configuration"
							<%} else {%> alt="File Not Found" <%}%>>
				</div>
				<br> <br>
				<div align="center">
					<h4 style="font-size: 20px;font-family: <%= FontFamily %>;">
				<%
				if(LabList[1] != null) {
				%>
				<%=LabList[1].toString()+"("+(LabList[0]!=null?LabList[0].toString(): " - ")+")"%>
				<%
				}else {
				%>-<%
				}
				%>
					</h4>
					<h4 style="font-family: <%= FontFamily %>;">
						Government of India, Ministry of Defence<br>Defence Research
						& Development Organization
					</h4>
				</div>
				<h4 style="font-family: <%= FontFamily %>;">
					<%if(LabList[2]!=null && LabList[3]!=null && LabList[5]!=null){ %>
					<%=LabList[2].toString()+" , "+LabList[3].toString()+", PIN-"+LabList[5].toString() %>
					<%}else{ %>
					-
					<%} %>
				</h4>
<div style="text-align: right;">
    <span style="font-weight: bold;font-family: <%= FontFamily %>;"><%= month.toString().substring(0,3) %> <%= year %></span>
   </div>
			</div>
			<br>
			
			
	<p style="text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>	
	<div class="heading-container" style="text-align: center; position: relative;">
  <h6 class="heading-color top-center" style="font-family: <%= FontFamily %>;font-size: 14px !important; text-decoration: underline; display: inline-block; padding-bottom: 5px; position: absolute; top: 0; left: 50%; transform: translateX(-50%); font-weight: normal;">RESTRICTED</h6>
</div>
					<div style="text-align: center;font-family: <%= FontFamily %>;">
				<h5  class="heading-color">AMENDMENT / REVISION HISTORY PAGE
				</h5>
			</div>
			<table style="width: 650px; margin-top: 10px; margin-bottom: 5px;border:1px solid black;border-collapse: collapse;">
					<tr >
					<td class="text-dark"  rowspan="2" style="font-family: <%= FontFamily %>;border:1px solid black; text-align: center;"><span class="text-dark">Amendment No.</span></td>
					<td class="text-dark"  rowspan="2" style="font-family: <%= FontFamily %>;border:1px solid black; text-align: center;"><span class="text-dark">Particulars of Amendment.</span></td>
					<td class="text-dark" rowspan="2" style="font-family: <%= FontFamily %>;border:1px solid black; text-align: center;"><span class="text-dark">Page No.</span></td>
					<td class="text-dark"  rowspan="2" style="font-family: <%= FontFamily %>;border:1px solid black; text-align: center;"><span class="text-dark">Para No.</span></td>
					<td class="text-dark"  rowspan="2"style="font-family: <%= FontFamily %>;border:1px solid black;width: 100px; text-align: center;"><span class="text-dark">Issue Date</span></td>
					<td class="text-dark"  colspan="2" style="font-family: <%= FontFamily %>;border:1px solid black; text-align: center;"><span class="text-dark">Incorporated by</span></td>
					</tr>
					<tr >
					<td class="text-dark" style="border:1px solid black; width: 100px; text-align: center;font-family: <%= FontFamily %>;">Name</td>
					<td class="text-dark" style="border:1px solid black; width: 80px; text-align: center;font-family: <%= FontFamily %>;">Date</td>
					</tr>
						<tbody id="blankRowsBody">
		    <tr>
          <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;"><span class="text-dark">&nbsp;</span></td>
          <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;"><span class="text-dark"></span></td>
          <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;"><span class="text-dark"></span></td>
          <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;"><span class="text-dark"></span></td>
          <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;"><span class="text-dark"></span></td>
          <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>; width: 100px;"><span class="text-dark"></span></td>
          <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>; width: 100px;"><span class="text-dark"></span></td>
        </tr>
				</tbody>

					</table>
						<p style="text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<div class="heading-container" style="text-align: center; position: relative;">
  <h6 class="heading-color top-center" style="font-family: <%= FontFamily %>;font-size: 14px !important; text-decoration: underline; display: inline-block; padding-bottom: 5px; position: absolute; top: 0; left: 50%; transform: translateX(-50%); font-weight: normal;">RESTRICTED</h6>
</div>
				<div align="center">
					<div style="text-align: center;">
				<h5  class="heading-color; "style="font-family: <%= FontFamily %>;">DISTRIBUTION LIST
				</h5>
						</div>
						<table style="width: 650px; margin-top: 10px; margin-bottom: 5px;border:1px solid black;border-collapse: collapse;">
					<tr >
					<td class="text-dark"  style="font-family: <%= FontFamily %>;border:1px solid black; width: 20px;text-align: center;"><span class="text-dark">S.No</span></td>
					<td class="text-dark"   style="font-family: <%= FontFamily %>;border:1px solid black; width: 150px;text-align: center;"><span class="text-dark">NAME</span></td>
					<td class="text-dark"  style="font-family: <%= FontFamily %>;border:1px solid black; text-align: center;width: 100px;"><span class="text-dark">Designation</span></td>
					<td class="text-dark"   style="font-family: <%= FontFamily %>;border:1px solid black;width: 100px; text-align: center;"><span class="text-dark">Division/Lab</span></td>
					<td class="text-dark"  style="font-family: <%= FontFamily %>;border:1px solid black; text-align: center;width: 80px;"><span class="text-dark">Remarks</span></td>
					</tr>
				<tbody id="blankRowsBody1"></tbody>
            <% 
    if (MemberList != null) {
        int i = 1;
        for (Object[] mlist : MemberList) {
%>
 <tr>
                <td style="font-family: <%= FontFamily %>;border: 1px solid black;padding-left: 10px;"><%=  i+++"."%></td>
                <td style="font-family: <%= FontFamily %>;border: 1px solid black;padding-left: 10px;"><%= mlist[1]!=null?mlist[1].toString(): " - " %></td>
                <td style="font-family: <%= FontFamily %>;border: 1px solid black; padding-left: 10px;"><%= mlist[2]!=null?mlist[2].toString(): " - " %></td>
                 <td style="font-family: <%= FontFamily %>;border: 1px solid black; padding-left: 10px;"><%= mlist[3]!=null?mlist[3].toString(): " - " %></td>
                 <td style="font-family: <%= FontFamily %>;border: 1px solid black; padding-left: 10px;">copy for Record</td>
                             </tr>
 <% 
   }} 
%>
					</table>
				<p style="font-family: <%= FontFamily %>;text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
				<div class="heading-container" style="text-align: center; position: relative;">
  <h6 class="heading-color top-center" style="font-family: <%= FontFamily %>;font-size: 14px !important; text-decoration: underline; display: inline-block; padding-bottom: 0px; position: absolute; top: 0; left: 50%; transform: translateX(-50%); font-weight: normal;">RESTRICTED</h6>
</div>
				<div style="text-align: center;">
				<h4 style="font-size: 20px !important;font-family: <%= FontFamily %>;" class="heading-color">DOCUMENT SUMMARY
				</h4>
							</div>
	<!-- 	<table class="border-black"
					style="width: 650px; margin-top: 10px; margin-bottom: 5px;">
			<tr>
			<td>1.Title: System Requirement Document Template</td>
			</tr>
			</table> -->
				<table style="width: 650px; margin-top: 10px; margin-bottom: 5px;border:1px solid black;font-family: <%= FontFamily %>;border-collapse: collapse;">
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">1.&nbsp; Title: <span class="text-dark">System Sub System Test Plan Document Template</span></td>
					</tr>
					<tr >
					<td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">2.&nbsp; Type of Document:<span class="text-dark">System Sub System Test Plan Document</span></td>
					<%-- <td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">3.&nbsp; Classification: <span class="text-dark"><%=classification %></span></td> --%>
					<td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">3.&nbsp; Classification: <span class="text-dark"></span></td>
					</tr>
				    <tr >
					<td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">4.&nbsp; Document Number:</td>
					<td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">5.&nbsp; Month Year:&nbsp;<span style="font-weight: 600"><%=month.toString().substring(0,3) %></span> <%= year %></td>
					</tr>
					<tr>
					<td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">6.&nbsp; Number of Pages:</td>
					<td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">7.&nbsp; Related Document:</td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">8.&nbsp; Additional Information:<span class="text-dark"><% if(DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[0]!=null?DocumentSummary.get(0)[0].toString(): " - " %><%} %></span>
				</td>
					</tr>
				     <tr>
				     <td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">9.&nbsp; Project Number and Project Name: <span class="text-dark">) </span></td>
					<%-- <td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">9.&nbsp; Project Number and Project Name: <span class="text-dark"><%=projectName %> (<%= projectshortName %>) </span></td> --%>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">10.&nbsp; Abstract:<span class="text-dark"><% if(DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[1]!=null?DocumentSummary.get(0)[1].toString(): " - " %><%} %></span>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">11.&nbsp; Keywords:<span class="text-dark"><% if(DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[2]!=null?DocumentSummary.get(0)[2].toString(): " - " %><%} %></span> </td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">12.&nbsp; Organization and address:
						<span class="text-dark" style="font-family: <%= FontFamily %>;">		<%
										if (LabList[1] != null) {
										%><%=LabList[1].toString() + "(" + LabList[0]!=null?LabList[0].toString(): " - " + ")"%>
										<%
										} else {
										%>-<%
										}
										%>
																	Government of India, Ministry of Defence,Defence
										Research & Development Organization
										<%
									if (LabList[2] != null && LabList[3] != null && LabList[5] != null) {
									%>
									<%=LabList[2].toString()+" , "+LabList[3].toString()+", PIN-"+LabList[5].toString()+"."%>
									<%}else{ %>
									-
									<%} %>
								</span>
							</td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">13.&nbsp; Distribution:<span class="text-dark"><% if(DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[3]!=null?DocumentSummary.get(0)[3].toString(): " - " %><%} %></span>
					</td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">14.&nbsp; Revision:</td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">15.&nbsp; Prepared by:<span class="text-dark"><% if(DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[10]!=null?DocumentSummary.get(0)[10].toString(): " - " %><%} %></span> </td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">16.&nbsp; Reviewed by: <span class="text-dark"><% if(DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[7]!=null?DocumentSummary.get(0)[7].toString(): " - " %><%} %></span> </td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">17.&nbsp; Approved by: <span class="text-dark"><% if(DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[6]!=null?DocumentSummary.get(0)[6].toString(): " - " %><%} %></span> </td>
					</tr>
										</table>
							<p style="text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>	
			<h4 style="margin-left: 20px;font-family: <%= FontFamily %>;"> Abbreviations used in the Manual to be listed and arranged in alphabetical order</h4>
		<%  if (AbbreviationDetails != null && !AbbreviationDetails.isEmpty()) { %>	
    <table style="width: 550px; margin-top: 10px; margin-bottom: 5px; border: 1px solid black; border-collapse: collapse; margin-left: auto; margin-right: auto;">
        <thead>
            <tr>
                 <th style="width: 10%; border: 1px solid black; text-align: justify;font-family: <%= FontFamily %>;"><span class="text-dark">S.No</span></th>
        <th style="width: 20%; border: 1px solid black; text-align: justify;font-family: <%= FontFamily %>;"><span class="text-dark">Abbreviations</span></th>
        <th style="width: 50%; border: 1px solid black; text-align: justify;font-family: <%= FontFamily %>;"><span class="text-dark">Full Forms</span></th>
           </tr>
        </thead>
        <tbody>
                <% 
          int i = 1;
        for (Object[] alist : AbbreviationDetails) {
%>
              <tr>
                <td style="text-align: justify;border: 1px solid black;font-family: <%= FontFamily %>;"><%=  i+++"."%></td>
                <td style="text-align: justify;border: 1px solid black;font-family: <%= FontFamily %>;"><%= alist[1]!=null?alist[1].toString(): " - " %></td>
                <td style="text-align: justify;border: 1px solid black; padding-left: 10px;font-family: <%= FontFamily %>;"><%= alist[2]!=null?alist[2].toString(): " - " %></td>
            </tr>
            <% 
   }} 
%>
        </tbody>
    </table>
				<p style="text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>	
							<h4 style="font-size: 16pt;font-family: <%= FontFamily %>; !important; class="heading-color">CONTENTS</h4>
						</div>
						<p style="font-family: <%= FontFamily %>;">1.Click on the "References" Menu located at the top of the MS document.<br>
2.From the dropdown menu, choose "Table of Contents."<br>
3.Select "Automatic Table 1" from the options provided.<br>
4.After adding Contents remove this lines
</p>
			<p style="text-align: center; page-break-before: always;font-family: <%= FontFamily %>;">&nbsp;</p>
						<%if(TestScopeIntro!=null) {%>
						  <div class="landscape-content">
			<div style="page-break-before: always"></div>
						<h1 style="font-family: <%= FontFamily %>; font-size: <%= fontSize %>pt; font-weight: <%= HeaderFontWeight %>;" class="heading-color">
    <%= ++maincount %>.&nbsp;SCOPE
</h1>
				<hr style="width: 100%;">
					<%if(TestScopeIntro!=null){ %>
			<div>
				<h2 style="font-family: <%= FontFamily %>;margin-left: 10px;font-weight:<%=SubHeaderFontweight%>; font-size: <%= SubHeaderFontsize%>pt;"><%=maincount+"." %>1
					&nbsp;Introduction
				</h2>
				<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify;font-weight:<%=ParaFontWeight%>" >
				 
					<%if(TestScopeIntro[1]!=null) {%><%=TestScopeIntro[1]!=null?TestScopeIntro[1].toString(): " - "%>
					<%}else {%><div style="text-align: center;font-family: <%= FontFamily %>;">No Details Added!</div>
					<%} %>
					
				</div>
			</div>
			<div>
				<h2 style="font-family: <%= FontFamily %>;margin-left: 10px;font-weight:<%=SubHeaderFontweight%>;font-size: <%= SubHeaderFontsize%>pt;"><%=maincount+"." %>2
					&nbsp;System Identification
				</h2>
				<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size: <%=ParaFontSize%>pt;text-align: justify; font-weight:<%=ParaFontWeight%>">
					<%if(TestScopeIntro[2]!=null) {%><%=TestScopeIntro[2]!=null?TestScopeIntro[2].toString(): " - "%>
					<%}else {%><div style="font-family: <%= FontFamily %>;text-align: center;">No Details Added!</div>
					<%} %>
				</div>
			</div>
			<div>
				<h2 style="font-family: <%= FontFamily %>;margin-left: 10px;font-weight:<%=SubHeaderFontweight%>;font-size: <%= SubHeaderFontsize%>pt;"><%=maincount+"." %>3
					&nbsp;System Overview
				</h2>
				<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size: <%=ParaFontSize%>pt;text-align: justify; font-weight:<%=ParaFontWeight%>">
					<%if(TestScopeIntro[3]!=null) {%><%=TestScopeIntro[3]!=null?TestScopeIntro[3].toString(): " - "%>
					<%}else {%><div style="text-align: center;font-family: <%= FontFamily %>;">No Details Added!</div>
					<%} %>
				</div>
			</div>
			<div>
			</div>
			<%}else{ %>
			<div align="center" style="margin-top: 350px">
				<h4 style="font-family: <%= FontFamily %>;">No Data Available !</h4>
			</div>
			</div>
			<%}} %>
			
			
<!-- Applicable Documents -->
				
				<h1 style="font-family: <%= FontFamily %>;font-size: <%= fontSize%>pt; font-weight:<%=HeaderFontWeight%>;color: black !important;" class="heading-color">
    <br><%=++maincount %>. APPLICABLE DOCUMENTS
			</h1>
			<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<p>Click here to enter text </p><br>
			Guidance:<br>
			This section lists the number, title, revision, and date of all documents referenced herein.This section also identifies the sources for documents not available through normal Government stocking activities
			</div>
				<h2 style="font-family: <%= FontFamily %>;font-size:<%= SubHeaderFontsize%>pt;font-weight:<%=SubHeaderFontweight%>;margin-left: 20px;"><%=maincount %>.1	GENERAL</h2>
				<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<p>Click here to enter text </p><br>
			Guidance:<br>
			Provide an overview of documentation section. The following statement should be placed in all SSS documents and resulting specifications:"Documents listed in this section are specified in sections 3,4, or 5 of SSS document".This section does not include documents cited in other sections of this specification or recommended for additional information or as examples.
			</div>
				<%
				int Applicabledocuments=1;
				int j=0;
				%>
				<h2 style="font-family: <%= FontFamily %>;font-size:<%= SubHeaderFontsize%>pt;font-weight:<%=SubHeaderFontweight%>;margin-left: 20px;"><%=maincount %>.2 Government Documents </h2>
			
			<h3 style="font-family: <%= FontFamily %>;margin-left: 20px; font-weight:<%=SuperHeaderFontWeight%>;margin-top: 20px; font-size: <%= SuperHeaderFontsize%>pt;">
		   <span><%=maincount+"."+(Applicabledocuments)%>.<%=++j %> Specifications, Standards, and Handbooks
			</span>
				</h3>
				<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
	<p>Click on the Enter text	</p><br>
	Guidance:<br><br>
	List Government, Specifications, Standards, and handbooks(RAD,SyRD, FAD)
			</div>
		<h3 style="font-family: <%= FontFamily %>;margin-left: 20px; font-weight:<%=SuperHeaderFontWeight%>;margin-top: 20px; font-size: <%= SuperHeaderFontsize%>pt;">
		   <span><%=maincount+"."+(Applicabledocuments)%>.<%=++j %> Other Government Document, Drawings and Publications
			</span>
				</h3>
				<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
	<p>Click on the Enter text	</p><br>
	Guidance:<br><br>
	List other Government documents, drawings,and publications
			</div>
			
			<h3 style="font-family: <%= FontFamily %>;margin-left: 20px; font-weight:<%=SuperHeaderFontWeight%>;margin-top: 20px; font-size: <%= SuperHeaderFontsize%>pt;">
		   <span><%=maincount+"."+(Applicabledocuments)%>.<%=++j %> Non-Government Publications
			</span>
				</h3>
		<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
	<p>Click on the Enter text	</p><br>
	Guidance:<br><br>
Non-Government Publications
			</div>	
			
				<!--General Ends  -->
				<!-- Test Approach  Starts-->
					<h1 style="font-family: <%= FontFamily %>; margin-left: 10px; font-size: <%= fontSize %>pt; font-weight: <%= HeaderFontWeight %>;">
  <br><%= ++maincount %>.&nbsp;
TEST APPROACH
</h1>
<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
<%if(Approach!=null) {%><%=Approach%><%} %> 
</div>
				<!-- Test Approach  end-->
				
				<!--  Role & Responsibility Starts-->
				<h1 style="font-family: <%= FontFamily %>; margin-left: 10px; font-size: <%= fontSize %>pt; font-weight: <%= HeaderFontWeight %>;">
  <br><%= ++maincount %>.&nbsp;
Role & RESPONSIBILITY FOR CARRYING OUT EACH LEVEL OF SYSTEM/ SUB-SYSTEM TESTING
</h1>
<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<%if(RoleResponsibility!=null) {%><%=RoleResponsibility%><%} %> 
			</div>
			<div style="font-family: <%= FontFamily %>;">
			${htmlContentRoleResponsibility}
			</div>
				<!-- Role & Responsibility Ends -->
				
				
				
				
				
			<!-- Acceptance Testing   Starts-->
		<h1 style="font-family: <%= FontFamily %>;font-size: <%= fontSize%>pt; font-weight:<%=HeaderFontWeight%>;color: black !important;" class="heading-color">
    <br><%=++maincount %>. ACCEPATNCE TESTING
			</h1>
			<h2 style="font-family: <%= FontFamily %>;font-size:<%= SubHeaderFontsize%>pt;font-weight:<%=SubHeaderFontweight%>;margin-left: 20px;"><%=maincount %>.1 Test Set Up</h2>
			<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<!--Test Set Up  Starts -->
			<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<%  if (TestSuiteList != null && !TestSuiteList.isEmpty()) { %>	
    <table style="width: 550px; margin-top: 10px; margin-bottom: 5px; border: 1px solid black; border-collapse: collapse; margin-left: auto; margin-right: auto;">
        <thead>
            <tr>
                 <th style="width: 10%; border: 1px solid black; text-align: center;font-family: <%= FontFamily %>;text-align:justify;"><span class="text-dark">S.No</span></th>
        <th style="width: 20%; border: 1px solid black; text-align: center;font-family: <%= FontFamily %>;text-align:justify;"><span class="text-dark">Test Type</span></th>
        <th style="width: 50%; border: 1px solid black; text-align: center;font-family: <%= FontFamily %>;text-align:justify;"><span class="text-dark">Test Setup Name</span></th>
           </tr>
        </thead>
        <tbody>
                <% 
          int i = 1;
        for (Object[] tslist : TestSuiteList) {
%>
              <tr>
                <td style="text-align: center;border: 1px solid black;font-family: <%= FontFamily %>;text-align:justify"><%=  i+++"."%></td>
                <td style="text-align: center;border: 1px solid black;font-family: <%= FontFamily %>;text-align:justify"><% if(tslist[1]!=null){%>  <%= tslist[1].toString() %> <% }else{%> <%} %></td>
                <td style="border: 1px solid black; padding-left: 10px;font-family: <%= FontFamily %>;text-align:justify"><%if(tslist[3]!=null){%> <%= tslist[3].toString() %> <% }else{%><%} %>
                </td>
            </tr>
            <% 
   }} 
%>
        </tbody>
    </table>
	</div>
				
		<!--Test Set Up  Ends -->		
			
			</div>
		<h2 style="font-family: <%= FontFamily %>;font-size:<%= SubHeaderFontsize%>pt;font-weight:<%=SubHeaderFontweight%>;margin-left: 20px;text-align:justify"><%=maincount %>.2 Test Set Up Diagram</h2>
		<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>;text-align:justify">
		<%if(TestSetUpDiagram!=null) {%><%=TestSetUpDiagram%><%} %> 
		</div>
		<div style="font-family: <%= FontFamily %>;">
			${htmlContentTestSetUpDiagram}
			</div>
		<!--Test Suits  Starts -->
				<h2 style="font-family: <%= FontFamily %>;font-size:<%= SubHeaderFontsize%>pt;font-weight:<%=SubHeaderFontweight%>;margin-left: 20px;text-align:justify"><%=maincount %>.3 Test Suite</h2>
			<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>;text-align:justify">
			<%  if (TestSuiteList != null && !TestSuiteList.isEmpty()) { %>	
    <table style="width: 550px; margin-top: 10px; margin-bottom: 5px; border: 1px solid black; border-collapse: collapse; margin-left: auto; margin-right: auto;">
        <thead>
            <tr>
                 <th style="width: 10%; border: 1px solid black; text-align: center;font-family: <%= FontFamily %>;"><span class="text-dark">S.No</span></th>
        <th style="width: 20%; border: 1px solid black; text-align: center;font-family: <%= FontFamily %>;text-align:justify"><span class="text-dark">Test Type</span></th>
        <th style="width: 50%; border: 1px solid black; text-align: center;font-family: <%= FontFamily %>;text-align:justify"><span class="text-dark">Test IDS</span></th>
        <th style="width: 50%; border: 1px solid black; text-align: center;font-family: <%= FontFamily %>;text-align:justify"><span class="text-dark">Test Tools</span></th>
           </tr>
        </thead>
        <tbody>
                <% 
          int i = 1;
        for (Object[] tlist : TestSuiteList) {
%>
              <tr>
                <td style="text-align: center;border: 1px solid black;font-family: <%= FontFamily %>;text-align:justify"><%=  i+++"."%></td>
                <td style="text-align: center;border: 1px solid black;font-family: <%= FontFamily %>;text-align:justify">
                <% if(tlist[1]!=null){%> <%= tlist[1].toString() %> <% }else{%> <% }%>
                </td>
                <td style="border: 1px solid black; padding-left: 10px;font-family: <%= FontFamily %>;text-align:justify"> 
               <%
             List<String>list=new ArrayList<>();
               List<String>list1=new ArrayList<>();
               list=TestDetailsList.stream().filter(ix->ix[10].toString().equalsIgnoreCase(tlist[0].toString())).map(ix->ix[1].toString()).collect(Collectors.toList());
               %>
               <%if(list.size()!=0) {%>
               <%=list.toString().replace("[", "").replace("]", "") %>
               <%}else{ %>
               
               -
               <%} %>
                </td>
                 <td style="border: 1px solid black; padding-left: 10px;font-family: <%= FontFamily %>;text-align:justify">
                 	<% if(tlist[3]!=null){%>  <%= tlist[3].toString() %> 	 <%}else{ %>   <%} %>
                 </td>
            </tr>
            <% 
   }} 
%>
        </tbody>
    </table>
				</div>
				
		<!--Test Suits  Ends -->		
		
			<!--Test Details  Ends -->	
					<h2 style="font-family: <%= FontFamily %>;font-size:<%= SubHeaderFontsize%>pt;font-weight:<%=SubHeaderFontweight%>;margin-left: 20px;"><%=maincount %>.4 Test Verification Table</h2>
			<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<%if(TestVerification!=null) {%><%=TestVerification %><%} %> 
				</div>
				<div style="font-family: <%= FontFamily %>;">
			${htmlContentTestVerification}
			</div>
			</div>
				<!-- Acceptance Testing   Ends-->	
				<!-- Test  Schedule Starts  -->
		<h1
			style="font-family: <%=FontFamily%>; margin-left: 10px; font-size: <%=fontSize%>pt; font-weight: <%=HeaderFontWeight%>;">
			<br><%=++maincount%>.&nbsp; TEST SCHEDULE
		</h1>
		<div
			style="margin-left: 20px;font-family: <%=FontFamily%>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<%
			if (Schedule != null) {
			%><%=Schedule%>
			<%
			}
			%>
		</div>
		<!-- Test  Schedule  end-->
			<div style="page-break-before: always;"></div>
						<!-- Test Details   Starts-->
	<h1 style="font-family: <%= FontFamily %>;font-size: <%= fontSize%>pt; font-weight:<%=HeaderFontWeight%>;color: black !important;" class="heading-color">
    <br><%=++maincount %>. Test Details
			</h1>
			<!--Test Set Up  Starts -->
				
			<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
			<%  if (TestDetailsList != null && !TestDetailsList.isEmpty()) { 
				int testcount=0;
				 for (Object[] tDlist : TestDetailsList) {
			%>	
			<div style="margin-left: 20px; margin-top: 15px; font-weight: 600;font-family: <%= FontFamily %>;">
			<h2 style="font-weight:<%=SubHeaderFontweight%>;font-size: <%= SubHeaderFontsize%>pt"><%=maincount+"."+(++testcount)%>&nbsp;&nbsp;Test ID : &nbsp;&nbsp;<%= tDlist[1]!=null?tDlist[1].toString(): " - " %></h2>
</div>

<table class="border-black"
					style="margin-left: 20px;;width: 650px; margin-top: 10px; margin-bottom: 5px;font-family: <%= FontFamily %>;font-size: <%= ParaFontSize%>pt">
    <thead>
    <tr>
							<th class="border-black" style="width: 20px; padding: 5px; border: 1px solid black; border-collapse: collapse;">SN</th>
							<th class="border-black"
								style="width: 130px; padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;">Item</th>
							<th class="border-black"
								style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Description</th>
						</tr>
    </thead>
    <tbody>
     <tr>
        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">1.</td>
            <th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Spec ID</span></th>
			 <td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><% if(tDlist[19]!=null){%>  <%= tDlist[19].toString() %> <% } %></td>
        </tr>
        <tr>
        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">2.</td>
            <th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">ID</span></th>
			 <td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><% if(tDlist[1]!=null){%>  <%= tDlist[1].toString() %> <% } %></td>
        </tr>
        <tr>
        	        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">3.</td>
            <th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Name</span></th>
          	 <td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[2]!=null){%> <%= tDlist[2].toString() %> <% } %></td>
        </tr>
        <tr>
          	        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">4.</td>
          	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Objective</span></th>
                  	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[3]!=null){%> <%= tDlist[3].toString() %> <% } %></td>
        </tr>
        <tr>
          	        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">5.</td>
           	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Description</span></th>
                    	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[4]!=null){%> <%= tDlist[4].toString() %> <% } %></td>
        </tr>
        <tr>
          	        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">6.</td>
         	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Pre-Conditions</span></th>
                    	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[5]!=null){%> <%= tDlist[5].toString() %> <% } %></td>
        </tr>
        <tr>
                 	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">7.</td>
    	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Post-Conditions</span></th>
         	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[6]!=null){%> <%= tDlist[6].toString() %> <% } %></td>
        </tr>
        <tr>
                 	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">8.</td>
           	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Constraints</span></th>
           <td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[7]!=null){%> <%= tDlist[7].toString() %> <% } %></td>
        </tr>
        <tr>
               	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">9.</td>
          	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Safety Requirements</span></th>
            <td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[8]!=null){%> <%= tDlist[8].toString()%> <% } %></td>
        </tr>
        <tr>
                 	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">10.</td>
        	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Methodology</span></th>
 		<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[9]!=null){%> <%=tDlist[9].toString()%> <% } %></td>
        </tr>
        <tr>
                  	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">11.</td>
         	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Test Set Up</span></th>
                  	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">
                     <%
		String[]TempArray= tDlist[10].toString().split(","); 
         List<String>tempList=Arrays.asList(TempArray);
         List<String>temp= new ArrayList<>();
		for(Object[] obj:TestSuiteList){
			if(tempList.contains(obj[0].toString())){
				temp.add(obj[3].toString());
			}}
%>
 <%if(temp.size()>0) {%>
   <%= String.join(", ", temp) + "" %>
<%-- <%=temp.toString()+"," %> --%>
<%}else{ %>
-
<%} %>  
 </td>
        </tr>
        <tr>
                	<td class="border-black"style="text-align: justify;padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">12.</td>
          	<th class="border-black"style="text-align: justify;padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Personnel Resources</span></th>
 	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[11]!=null){%> <%= tDlist[11].toString()%> <% } %></td>
        </tr>
        <tr>
                	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">13.</td>
          	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Estimated Time / Iteration</span></th>
        <td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[12]!=null){%> <%= tDlist[12].toString() %> <% } %></td>
        </tr>
        <tr>
               	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">14.</td>
          	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Iterations</span></th>
             <td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[13]!=null){%> <%= tDlist[13].toString() %> <% } %></td>
        </tr>
        <tr>
                  	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">15.</td>
          	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Schedule</span></th>
			        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[14]!=null){%> <%= tDlist[14].toString() %> <% } %></td>
        </tr>
        <tr>
                  	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">16.&nbsp;</td>
     	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Pass-Fail Criteria</span></th>
                   	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[15]!=null){%> <%= tDlist[15].toString()%> <% } %></td>
        </tr>
        
        
        <tr>
                 	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">17.&nbsp;</td>
         	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark"> Stage Applicable</span></th>
                	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">
            <%
            String[]TempArray1=tDlist[22].toString().split(",");
            List<String>tempList1=Arrays.asList(TempArray1);
            List<String>tempsa=new ArrayList<>();
            for(Object[] obj1:StagesApplicable){
            	if(tempList1.contains(obj1[0].toString())){
            		tempsa.add(obj1[3].toString());
            	}
            }
            %>
            <% if(tempsa.size() > 0) { %>
    <%= String.join(", ", temp) + "" %>
			<% } else { %>
   				 -
			<% } %>

           </td>
        </tr>
        <tr>
          	        	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;">17.&nbsp;&nbsp;&nbsp;</td>
	<th class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><span class="text-dark">Remarks</span></th>
               	<td class="border-black"style="padding: 5px; text-align: center; border: 1px solid black; border-collapse: collapse;font-family: <%= FontFamily %>;text-align: justify;"><%if(tDlist[15]!=null){%> <%= tDlist[15].toString() %> <% } %></td>
        </tr>
       
    </tbody>
</table>
 <% 
  }} else {
   %>
<div align="center" style="margin-top: 350px">
					<h4 style="font-family: <%= FontFamily %>;">No Data Available !</h4>
				</div>
				<%} %> 
				</div>
		<!--Test Details Ends -->		
			<!-- Test  Conclusion Starts  -->
		<h1 style="font-family: <%= FontFamily %>; margin-left: 10px; font-size: <%= fontSize %>pt; font-weight: <%= HeaderFontWeight %>;">
  <br><%= ++maincount %>.&nbsp;
CONCLUSION
</h1>
<div style="margin-left: 20px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify; font-weight:<%=ParaFontWeight%>">
				<%if(Conclusion!=null) {%> 
				<%=Conclusion%><%} %> 
				</div>
				<!-- Test  Conclusion  end-->	
</body>
</html>