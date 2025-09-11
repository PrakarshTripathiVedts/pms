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
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.Base64"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="com.vts.pfms.model.LabMaster"%>
<%@page import="com.vts.pfms.AESCryptor"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"%>
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
			$("#source-html").wordExport("System Specifications");
	 }
</script>
<spring:url value="/resources/js/FileSaver.min.js" var="FileSaver" />
<script src="${FileSaver}"></script>
<spring:url value="/resources/js/jquery.wordexport.js" var="wordexport" />
<script src="${wordexport}"></script>
<meta charset="ISO-8859-1">
<title>Specification Document</title>
<%
Object[]LabList=(Object[])request.getAttribute("LabList");
String lablogo=(String)request.getAttribute("lablogo");
FormatConverter fc=new FormatConverter(); 
SimpleDateFormat sdf3=fc.getRegularDateFormat();
SimpleDateFormat sdf=fc.getRegularDateFormatshort();
SimpleDateFormat sdf1=fc.getSqlDateFormat();
String labImg=(String)request.getAttribute("LabImage");
Object[] DocTempAtrr=(Object[])request.getAttribute("DocTempAttributes");
LocalDate d = LocalDate.now();
int contentCount=0;
int maincount=0;
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
          	List<Object[]>MemberList=(List<Object[]>)request.getAttribute("MemberList");
          	List<Object[]> DocumentSummary=(List<Object[]>)request.getAttribute("DocumentSummary");
    		List<Object[]>AbbreviationDetails=(List<Object[]>)request.getAttribute("AbbreviationDetails");
    		List<Object[]>SpecsIntro=(List<Object[]>)request.getAttribute("SpecsIntro");
			String filePath=(String)request.getAttribute("filePath");
			String LabCode =(String ) session.getAttribute("labcode");
			List<Object[]>SpecProducTree=(List<Object[]>)request.getAttribute("SpecProducTree") ;
			List<Object[]>RequirementList = (List<Object[]>)request.getAttribute("RequirementList");
			List<Object[]>specsList = (List<Object[]>)request.getAttribute("specsList");
			List<Object[]>RequirementLists = new ArrayList<>();
			if(RequirementList!=null && RequirementList.size()>0){
				RequirementLists=RequirementList.stream().filter(e->e[15]!=null && !e[15].toString().equalsIgnoreCase("0")).collect(Collectors.toList());
			}
			
			String Conclusion = null;
			String ConclusionContenId= null;
			List<Object[]>SpecContentsDetails =(List<Object[]>)request.getAttribute("SpecContentsDetails");

			for(Object[]obj:SpecContentsDetails){
				if(obj[1].toString().equalsIgnoreCase("Conclusion")){
					Conclusion=obj[2].toString();
					ConclusionContenId=obj[0].toString();
				}
			}
             /*  Doc Temp end */
%>
</head>
<body>
	<div class="content-footer" align="center"> 
		<button id="btn-export" class="btn btn-lg bg-transparent" onclick="download()"
			style="padding: 10px;">
			<i class="fa fa-lg fa-download" aria-hidden="true"
				style="color: green;"></i>
		</button>
	</div>
	<div class="source-html-outer">
		<div id="source-html">
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
				<h4 style="font-size: 18pt;;font-family:<%= FontFamily %>; !important;" class="heading-color ">SYSTEM SEGMENT SPECIFICATIONS</h4>
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
				
			
				<h4 style="font-family: <%= FontFamily %>;">
				</h4>
				
					<div align="center"  >
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
             
                             </tr>
 <% 
   }} 
%>
					</table>
					
									<p style="font-family: <%= FontFamily %>;text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
				<div class="heading-container" style="text-align: center; position: relative;">
  <h6 class="heading-color top-center" style="font-family: <%= FontFamily %>;font-size: 14px !important; text-decoration: underline; display: inline-block; padding-bottom: 0px; position: absolute; top: 0; left: 50%; transform: translateX(-50%); font-weight: normal;">RESTRICTED</h6>
</div>
			<% %>
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
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">1.&nbsp; Title: <span class="text-dark">System Segment Specification Document Template</span></td>
					</tr>
					<tr >
					<td class="text-dark" style="border:1px solid black;font-family: <%= FontFamily %>;">2.&nbsp; Type of Document:<span class="text-dark">System Segment Specification Document</span></td>
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
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">8.&nbsp; Additional Information:<span class="text-dark"><% if(DocumentSummary!=null && DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[0]!=null?DocumentSummary.get(0)[0].toString(): " - " %><%} %></span>
				</td>
					</tr>
				     <tr>
				     <td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">9.&nbsp; Project Number and Project Name: <span class="text-dark">) </span></td>
					<%-- <td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">9.&nbsp; Project Number and Project Name: <span class="text-dark"><%=projectName %> (<%= projectshortName %>) </span></td> --%>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">10.&nbsp; Abstract:<span class="text-dark"><% if(DocumentSummary!=null && DocumentSummary.size()>0  ){%><%=DocumentSummary.get(0)[1]!=null?DocumentSummary.get(0)[1].toString(): " - " %><%} %></span>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">11.&nbsp; Keywords:<span class="text-dark"><% if(DocumentSummary!=null && DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[2]!=null?DocumentSummary.get(0)[2].toString(): " - " %><%} %></span> </td>
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
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">13.&nbsp; Distribution:<span class="text-dark"><% if(DocumentSummary!=null && DocumentSummary.size()>0 ){%><%=DocumentSummary.get(0)[3]!=null?DocumentSummary.get(0)[3].toString(): " - " %><%} %></span>
					</td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">14.&nbsp; Revision:</td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">15.&nbsp; Prepared by:<span class="text-dark"><% if(DocumentSummary!=null && DocumentSummary.size()>0  ){%><%=DocumentSummary.get(0)[10]!=null?DocumentSummary.get(0)[10].toString(): " - " %><%} %></span> </td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">16.&nbsp; Reviewed by: <span class="text-dark"><% if(DocumentSummary!=null && DocumentSummary.size()>0  ){%><%=DocumentSummary.get(0)[7]!=null?DocumentSummary.get(0)[7].toString(): " - " %><%} %></span> </td>
					</tr>
					<tr>
					<td  class="text-dark" colspan="2" style="border:1px solid black;font-family: <%= FontFamily %>;">17.&nbsp; Approved by: <span class="text-dark"><% if(DocumentSummary!=null && DocumentSummary.size()>0  ){%><%=DocumentSummary.get(0)[6]!=null?DocumentSummary.get(0)[6].toString(): " - " %><%} %></span> </td>
					</tr>
					</table>
												<p style="text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>	
			<h4 style="margin-left: 20px;font-family: <%= FontFamily %>;"> Abbreviations used in the Manual to be listed and arranged in alphabetical order</h4>
		<% 
		

		if (AbbreviationDetails != null && !AbbreviationDetails.isEmpty()) { %>	
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
                <td style="text-align: justify;border: 1px solid black; padding-left: 10px;font-family: <%= FontFamily %>;"><%= alist[2]!=null?alist[1].toString(): " - " %></td>
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
												<h1 style="font-family: <%= FontFamily %>; font-size: <%= fontSize %>pt; font-weight: <%= HeaderFontWeight %>;" class="heading-color">
    <%= ++maincount %>.&nbsp;SCOPE
</h1>
						<%
						
						if(SpecsIntro!=null) {%>
						  <div class="landscape-content">
			<div style="page-break-before: always"></div>

<%int introCount=0;
for(Object[]obj:SpecsIntro) {%>
<h2 style="font-family: <%= FontFamily %>;margin-left: 10px;font-weight:<%=SubHeaderFontweight%>; font-size: <%= SubHeaderFontsize%>pt;"><%=maincount+"." %><%=++introCount %>
					&nbsp;<%=obj[1].toString()!=null?obj[1].toString(): " - " %>
				</h2>
	<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify;font-weight:<%=ParaFontWeight%>" >
	<%if(obj[2]!=null) {%><%=obj[2].toString()%>
					<%}else {%><div style="text-align: center;font-family: <%= FontFamily %>;">No Details Added!</div>
					<%} %>
	</div>			
<%} %>
<%}else{ %>
<h2 style="font-family: <%= FontFamily %>;margin-left: 10px;font-weight:<%=SubHeaderFontweight%>; font-size: <%= SubHeaderFontsize%>pt;"><%=maincount+"." %>1  System Identification</h2>

<% }%>
<p style="text-align: center; page-break-before: always;font-family: <%= FontFamily %>;">&nbsp;</p>
				<h1
					style="font-family: <%=FontFamily%>; font-size: <%=fontSize%>pt; font-weight: <%=HeaderFontWeight%>;"
					class="heading-color">
					<%=++maincount%>.&nbsp;Applicable Documents
				</h1>
				
				
		<p style="text-align: center; page-break-before: always;font-family: <%= FontFamily %>;">&nbsp;</p>
				<h1
					style="font-family: <%=FontFamily%>; font-size: <%=fontSize%>pt; font-weight: <%=HeaderFontWeight%>;"
					class="heading-color">
					<%=++maincount%>.&nbsp;Product Tree
				</h1>	
			<%

			%>
	<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify;font-weight:<%=ParaFontWeight%>" >
	<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify;font-weight:<%=ParaFontWeight%>" >
	<%if(SpecProducTree!=null && SpecProducTree.size()>0){ %> <%=SpecProducTree.get(0)[2]!=null?SpecProducTree.get(0)[2].toString(): " - "%> <%} else{%> Guidance: 
The product Tree shall comprises the complete physical products / subsystems of the radar in the order of flow as a figure with unique ID 
<%} %>
	</div>
	<%if(SpecProducTree!=null && SpecProducTree.size()>0) {%>
	<%if(new File(filePath+SpecProducTree.get(0)[1].toString()+SpecProducTree.get(0)[3].toString()).exists()){ %>
	
					<div align="center" style="width:600px;height:2.6";border:1px solid black;">
																<img class="logo" style="width:100%;margin-bottom: 5px" src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(FileUtils.readFileToByteArray(new File(filePath+SpecProducTree.get(0)[1].toString()+SpecProducTree.get(0)[3].toString())))%>" > 											
											</div>
											
											<%} %>
											
	<%} %>
				
			<p style="text-align: center; page-break-before: always;font-family: <%= FontFamily %>;">&nbsp;</p>
				<h1
					style="font-family: <%=FontFamily%>; font-size: <%=fontSize%>pt; font-weight: <%=HeaderFontWeight%>;"
					class="heading-color">
					<%=++maincount%>.&nbsp;Specifications
				</h1>		
					
		<%
	
		%>			
		<%if(specsList!=null && specsList.size()>0){ 
		int specCount=0;
		for(Object[]obj:specsList){
		int snCount=0;
		%>
		<h2 style="font-family: <%= FontFamily %>;margin-left: 10px;font-weight:<%=SubHeaderFontweight%>; font-size: <%= SubHeaderFontsize%>pt;"><%=maincount+"." %><%=++specCount %> <%=obj[1]!=null?obj[1].toString(): " - " %></h2>
		<br>
					<table class=""
					style="margin-left: 20px;;width: 650px; margin-bottom: 5px;font-family: <%= FontFamily %>;font-size: <%= ParaFontSize%>pt">
					<thead>
						<tr>
							<th class="border-black"
								style="width: 20px;  border: 1px solid black; border-collapse: collapse;">SN</th>
							<th class="border-black"
								style="width: 130px;  text-align: left; border: 1px solid black; border-collapse: collapse;">Attribute</th>
							<th class="border-black"
								style=" border: 1px solid black; border-collapse: collapse;">Content</th>
						</tr>
						
						</thead>
							<tbody>
							<tr>
							<td class="border-black"
								style=" text-align: center; border: 1px solid black; border-collapse: collapse;"><%=++snCount %></td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse; font-weight: 600;">Specification Id</td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse;"><%=obj[1]!=null?obj[1].toString(): " - "%></td>
						</tr>
						
							<tr>
							<td class="border-black"
								style=" text-align: center; border: 1px solid black; border-collapse: collapse;"><%=++snCount %></td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse; font-weight: 600;"> Linked Requirements</td>
							<td class="border-black"style=" text-align: left; border: 1px solid black; border-collapse: collapse;">
							<%
							List<String>linkedReq= new ArrayList<>();
							List<String>tempReq = new ArrayList<>();
							if(obj[4]!=null){
								tempReq= Arrays.asList(obj[4].toString().split(","));
							}
							if(RequirementLists!=null && RequirementLists.size()>0){
							for(Object[]obj1:RequirementLists){
								if(tempReq.contains(obj1[0].toString())){
									linkedReq.add(obj1[1].toString());
								}
							%>
							<%}} %>	
							<%if(linkedReq.size()>0) {%>
							<%=linkedReq.toString().replace("[", "").replace("]", "") %>
							<%}else{ %>
								-
							<%} %>
							</td>
						</tr>
						
							<tr>
							<td class="border-black"
								style=" text-align: center; border: 1px solid black; border-collapse: collapse;"><%=++snCount %></td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse; font-weight: 600;"> Description</td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse;"><%=obj[2]!=null?obj[2].toString(): " - " %></td>
							</tr>
							
							<tr>
							<td class="border-black"
								style=" text-align: center; border: 1px solid black; border-collapse: collapse;"><%=++snCount %></td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse; font-weight: 600;"> Specification Parameter</td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse;"><%if(obj[5]!=null){ %><%=obj[5].toString() %> <%}else{ %> <%} %></td>
							</tr>
							
							<tr>
							<td class="border-black"
								style=" text-align: center; border: 1px solid black; border-collapse: collapse;"><%=++snCount %></td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse; font-weight: 600;"> Specification Unit</td>
							<td class="border-black"
								style=" text-align: left; border: 1px solid black; border-collapse: collapse;"><%if(obj[6]!=null){ %><%=obj[6].toString()%> <%}else{ %> <%} %></td>
							</tr>
						</tbody>
						</table>
					
			<br>
		<%}} %>		
		
			<p style="text-align: center; page-break-before: always;font-family: <%= FontFamily %>;">&nbsp;</p>
				<h1 style="font-family: <%=FontFamily%>; font-size: <%=fontSize%>pt; font-weight: <%=HeaderFontWeight%>;"
					class="heading-color"><%=++maincount%>.&nbsp;Specifications Traceability
				</h1>
				<table class=""style="margin-left: 20px;;width: 650px; margin-bottom: 5px;font-family: <%= FontFamily %>;font-size: <%= ParaFontSize%>pt;border-collapse:collapse">
				<thead>
						<tr>
							<th class="border-black"style="width:50px; border: 1px solid black; border-collapse: collapse;">SN</th>
							<th class="border-black" style="width:text-align: left; border: 1px solid black; border-collapse: collapse;">System SpecificationId</th>
							<th class="border-black" style=" border:1px solid black; border-collapse: collapse;">System RequirementId</th>
						</tr>
						</thead>
						<tbody>
						<%
						if(specsList!=null && specsList.size()>0){
							int rowCOunt=0;
						for(Object[]obj:specsList) {%>
						<tr>
						<td style=" border: 1px solid black; border-collapse: collapse;text-align: center;"> <%=++rowCOunt %>. </td>
						<td style=" border: 1px solid black; border-collapse: collapse;text-align: center;"> <%=obj[1]!=null?obj[1].toString(): " - " %> </td>
						<td style=" border: 1px solid black; border-collapse: collapse;text-align: center;"> 
							<%
							List<String>linkedReq= new ArrayList<>();
							List<String>tempReq = new ArrayList<>();
							if(obj[4]!=null){
								tempReq= Arrays.asList(obj[4].toString().split(","));
							}
							if(RequirementLists!=null && RequirementLists.size()>0){
							for(Object[]obj1:RequirementLists){
								if(tempReq.contains(obj1[0].toString())){
									linkedReq.add(obj1[1].toString());
								}
							%>
							<%}} %>	
							<%if(linkedReq.size()>0) {
							for(int i=0;i<linkedReq.size();i++){
							%>
							<%=(i+1)%>.<%=linkedReq.get(0)!=null?linkedReq.get(0): " - " %><br>
							<%}}else{ %>
								-
							<%} %>
						
						 </td>
						</tr>
						<%}} %>
						</tbody>
						</table>
				
				
				
				<p style="text-align: center; page-break-before: always;font-family: <%= FontFamily %>;">&nbsp;</p>
				<h1 style="font-family: <%=FontFamily%>; font-size: <%=fontSize%>pt; font-weight: <%=HeaderFontWeight%>;"
					class="heading-color"><%=++maincount%>.&nbsp;Conclusion
				</h1>	
					
	<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify;font-weight:<%=ParaFontWeight%>" >
	<div style="margin-left: 10px;font-family: <%= FontFamily %>;font-size:<%=ParaFontSize%>pt; text-align: justify;font-weight:<%=ParaFontWeight%>" >
	<%if(Conclusion!=null){ %> <%=Conclusion%> <%} else{%> No Data Available<%} %>
	</div>
	</div>
			</div>
			</div>
</body>
</html>