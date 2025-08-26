<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.vts.pfms.model.LabMaster"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="com.vts.pfms.cars.model.CARSInitiation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contPath" value="${pageContext.request.contextPath}"/>    --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inv for SoO</title>
<%
CARSInitiation carsIni =(CARSInitiation)request.getAttribute("CARSInitiationData");
%>
<style>

.break{
	page-break-after: always;
} 

.border_black {
	border : 1px solid black;
	padding : 10px 5px;
}

    
.left{
	text-align: left
}

.right{
	text-align: right
}

.center{
	text-align: center
}


#pageborder {
      position:fixed;
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      border: 2px solid black;
    }     
 

 @page  {             
          size: 790px 1120px;
          margin-top: 20px;
          margin-left: 60px;
          margin-right: 60px;
          margin-buttom: 50px; 	
 }
       
#tabledata{
 margin-left : 10px;
 border-collapse : collapse;
 border : 1px solid black;
 width : 98.5%;
}
#tabledata th{
 text-align : center;
 font-size: 14px;
}
#tabledata td{
 text-align : left;
}
#tabledata td,th{
 border : 1px solid black;
 padding : 5px;
}

p{
  text-align: justify !important;
  text-justify: inter-word;
}
p,td,th
{
  word-wrap: break-word;
  word-break: normal ;
}
</style>
</head>
<body>
<%
Object[] emp = (Object[])request.getAttribute("EmpData");
Object[] dPandC = (Object[])request.getAttribute("DPandC");

String lablogo=(String)request.getAttribute("lablogo");

LabMaster labMaster = (LabMaster)request.getAttribute("LabMasterData");

FormatConverter fc = new FormatConverter();
SimpleDateFormat rdf = fc.getRegularDateFormat();

String labcode=(String)session.getAttribute("labcode");
%>
<jsp:include page="../static/LetterHead.jsp"></jsp:include>
<%-- <table style="width: 100%;margin-right: -25px !important;">
	<tr>
		<td style="width: 39%;font-size: 14px;line-height: 17px;">
			<span style="color: blue;">इलेक्ट्रॉनिक्स तथा रेडार विकास स्थापना</span> <br>
			<span>भारत सरकार - रक्षा मंत्रालय </span> <br>
			<span>रक्षा अनुसंधान तथा विकास संगठन</span> <br>
			<span>सी. वी. रामन नगर</span> <br>
			<span>बेंगलूर - <span style="font-size: 13px;">560093</span>, भारत</span> <br>
		</td>
		<td style="width: 20%;text-align: center">
			<div style="font-size: 40px;font-style: italic;">
				<img style="width: 100px; height: 100px;margin-left: -50px;" <%if(lablogo!=null ){ %> src="data:image/*;base64,<%=lablogo%>" alt="Configuraton"<%}else{ %> alt="File Not Found" <%} %>>
			</div>
			<span style="font-size: 11px;color: red;margin-left: -50px;margin-top: -10px;display: block;">आई एस ओ 9001-2015 प्रमाणित</span> <br>
			<span style="font-size: 15px;color: red;margin-left: -50px;margin-top: -20px;display: block;">ISO 9001:2015 Certified</span>
		</td>
		<td style="width: 41%;margin-left: 10px;line-height: 15px;">
		<br> <br> <br> 
			<span style="font-weight: bold;color: blue;">Electronics & Radar Development Establishment</span> <br>
			<span style="font-size: 13px;font-weight: 500 !important;">Govt of India, Ministry of Defence</span> <br>
			<span style="font-size: 13px;">Defence Research & Development Organisation</span> <br>
			<span style="font-size: 13px;">CV Raman Nagar</span> <br>
			<span style="font-size: 13px;">Bengaluru - 560 093. India</span> <br>
			<span style="font-size: 13px;">Fax <span style="margin-left: 25px;">:</span> 080-2524 2916</span> <br>
			<span style="font-size: 13px;">Phone <span style="margin-left: 12px;">:</span> 080-2524 3873</span> <br>
			<span style="font-size: 13px;">E-Mail <span style="margin-left: 8px;">:</span> director.lrde@gov.in</span>
		</td>
	</tr>
</table> --%>
<br>
<table style="width: 100%;font-size: 14px !important;">
	<tr>
		<td style="text-align: left;width: 50%;">No&nbsp;:&nbsp;<span style="font-size: 13px"><%if(carsIni!=null) {%><%=carsIni.getCARSNo()!=null?carsIni.getCARSNo(): " - " %> <%} %></span></td>
		<td style="text-align: right;width: 50%;">Date&nbsp;:&nbsp;<span style="font-size: 13px"><%if(carsIni!=null && carsIni.getInvForSoODate()!=null) {%><%=fc.SqlToRegularDate(carsIni.getInvForSoODate()) %> <%} %></span></td>
	</tr>
</table>

<br><br>
<table style="font-size: 14px !important;">
	<tr>
		<td>To</td>
	</tr>
	<tr><td></td></tr>
	<tr>
		<td>
			<%=carsIni.getRSPInstitute()!=null?carsIni.getRSPInstitute(): " - " %> <br>
			<%=carsIni.getRSPAddress()!=null?carsIni.getRSPAddress(): " - "%> <%=", " %> <br>
			<%=carsIni.getRSPCity()!=null?carsIni.getRSPCity(): " - "%> <%=", " %> <br>
			<%=carsIni.getRSPState()!=null?carsIni.getRSPState(): " - " %> <br>
			<%=carsIni.getRSPPinCode()!=null?carsIni.getRSPPinCode(): " - " %>.
		</td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td>Kind Attn : <%if(carsIni!=null) {%><%=carsIni.getPITitle()!=null?carsIni.getPITitle(): " - "%> <%=". "%> <%=carsIni.getPIName()!=null?carsIni.getPIName(): " - "%> <%=", "%> <%=carsIni.getPIDesig()!=null?carsIni.getPIDesig(): " - " %><%} %></td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td>Sub : <b>Request for Feasibility Report and Summary of Offer for DRDO CARS proposal</b></td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td>Sir,</td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td>
			Research Service Qualitative Requirement for "<%if(carsIni!=null) {%><%=carsIni.getInitiationTitle()!=null?carsIni.getInitiationTitle(): " - " %> <%} %>" is enclosed herewith. 
			It is requested to furnish a feasibility study report along with budgetary proposal in the enclosed format at the earliest. 
		</td>
	</tr>
	<tr><td></td></tr>
	<tr>
		<td>Should you have further queries, please feel free to contact the undersigned.</td>
	</tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-align: center;">Thank you</td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-align: right;">Sincerely,</td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-align: right;"><%if(dPandC!=null) {%><%if(dPandC[4]!=null) {%><%=dPandC[4].toString() %><%} else{%><%=dPandC[5]!=null?dPandC[5].toString(): " - " %><%} %><%=dPandC[1]!=null?dPandC[1].toString(): " - " %> <%} %></td>
	</tr>
	<tr>
		<td style="text-align: right;">GD-P&C</td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-align: right;">For Director, <%=labcode!=null?labcode: " - " %></td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-align: left;">Encl : </td>
	</tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-indent: 30px;">1. RSQR</td>
	</tr>
	<tr>
		<td style="text-indent: 30px;">2. Pro forma for Summary of Offer</td>
	</tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr>
		<td style="text-align: left;">Copy : </td>
	</tr>
	<tr><td></td></tr>
	<tr>
		<td><%if(emp!=null) {%><%if(emp[4]!=null) {%><%=emp[4].toString() %><%} else{%><%=emp[5]!=null?emp[5].toString(): " - " %><%} %> <%=emp[1]!=null?emp[1].toString(): " - " %> <%} %> - for kind information and follow up</td>
	</tr>
</table>
</body>
</html>