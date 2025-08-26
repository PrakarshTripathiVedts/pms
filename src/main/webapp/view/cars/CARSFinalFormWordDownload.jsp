<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.vts.pfms.IndianRupeeFormat"%>
<%@page import="com.vts.pfms.cars.model.CARSSoCMilestones"%>
<%@page import="com.vts.pfms.cars.model.CARSSoC"%>
<%@page import="com.vts.pfms.cars.model.CARSContractEquipment"%>
<%@page import="com.vts.pfms.cars.model.CARSContractConsultants"%>
<%@page import="java.util.List"%>
<%@page import="com.vts.pfms.cars.model.CARSContract"%>
<%@page import="com.vts.pfms.model.LabMaster"%>
<%@page import="com.vts.pfms.FormatConverter"%>
<%@page import="com.vts.pfms.cars.model.CARSInitiation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CARS-03</title>
<%
String pdfFlag=(String)request.getAttribute("pdfFlag");
%>
<%if(pdfFlag==null) {%>
<script src="./webjars/jquery/3.4.0/jquery.min.js"></script>
<spring:url value="/resources/js/FileSaver.min.js" var="FileSaver" />
<script src="${FileSaver}"></script>

<spring:url value="/resources/js/jquery.wordexport.js" var="wordexport" />
<script src="${wordexport}"></script>
	<!--BootStrap Bundle JS  -->
<script src="./webjars/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

<!--BootStrap JS  -->
<!-- <script src="./webjars/bootstrap/4.0.0/js/*.js"></script> -->

<!--BootStrap CSS  -->
<link rel="stylesheet" href="./webjars/bootstrap/4.0.0/css/bootstrap.min.css" />

<link rel="stylesheet" href="./webjars/font-awesome/4.7.0/css/font-awesome.min.css" />

<%} %>
<style type="text/css">

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
          margin-left: 20px;
          margin-right: 20px;
          margin-buttom: 20px; 	
 }
       

</style>
</head>
<body>
<%
CARSInitiation carsIni =(CARSInitiation)request.getAttribute("CARSInitiationData"); 
CARSSoC carsSoC = (CARSSoC)request.getAttribute("CARSSoCData");
CARSContract carsContract =(CARSContract)request.getAttribute("CARSContractData"); 
List<CARSSoCMilestones> milestones = (List<CARSSoCMilestones>)request.getAttribute("CARSSoCMilestones");
List<CARSContractConsultants> consultants = (List<CARSContractConsultants>)request.getAttribute("CARSContractConsultants");
List<CARSContractEquipment> equipment = (List<CARSContractEquipment>)request.getAttribute("CARSContractEquipment");

String lablogo=(String)request.getAttribute("lablogo");
LabMaster labMaster = (LabMaster)request.getAttribute("LabMasterData");

FormatConverter fc = new FormatConverter();

Object[] rsqr =(Object[])request.getAttribute("RSQRDetails");
%>
	<%if(pdfFlag==null) {%>
	<div  align="center" ><button class="btn btn-lg bg-transparent" id="btn-export" onclick=exportHTML() ><i class="fa fa-lg fa-download" aria-hidden="true"style="color:green"></i></button></div>
	<%} %>
	<div id="source-html">
		<div id="container pageborder" align="center"  class="firstpage" id="firstpage">
			<div class="firstpage" id="firstpage"> 	
				<div style="text-align: right;">
					<h5 style="font-weight: bold;margin-right: 2rem;"><%=labMaster.getLabCode()!=null?labMaster.getLabCode(): " - " %>: CARS-03</h5>
				</div>
				
		    	<table style="margin-left : 10px;border-collapse : collapse;width : 98.5%; <%if(pdfFlag!=null) {%>margin-top: -20px;<%}%>">
			    	<tbody>
			    		<tr>
			    			<td rowspan="2" style="text-align: center;padding : 3px;word-wrap: break-word;word-break: normal;font-size: 40px;font-style: italic;vertical-align: bottom;">
			    				<img style="width: 60px; height: 60px;" <%if(lablogo!=null ){ %> src="data:image/*;base64,<%=lablogo%>" alt="Configuraton"<%}else{ %> alt="File Not Found" <%} %>>
			    			</td>
			    			<td>
			    				<h4 style="font-weight: bold;text-align: center;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">CONTRACT FOR ACQISITION OF RESEARCH SERVICES (CARS)</h4>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="1" style="text-align: left;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				By signature of authority identified at (12) below, DRDO hereby Contracts on the Research Service Provider identified at (3), the provision of the Research Services described at (7),
			    				 within the Time stated, Payments and subject to other conditions overleaf, as follows:
			    			</td>
			    		</tr>
			    	</tbody>
			    </table>
			    
			    <table style="margin-left : 10px;border-collapse : collapse;width : 98.5%;">
			    	<tbody>
			    		<tr>
			    			<td colspan="2" style="width:47.25%;text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				1) Short title of Research Service to be provided: <br>
			    				&nbsp;<%if(carsIni!=null) {%><%=carsIni.getInitiationTitle() %> <%} %>
			    				<br>
			    			</td>
			    			<td colspan="2" style="width:47.25%;text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				Contract No.: &nbsp;<%if(carsContract!=null && carsContract.getContractNo()!=null) {%><%=carsContract.getContractNo() %><%} else{%>-<%} %>
			    				<br> <br>
			    				Date: &nbsp;<%if(carsContract!=null && carsContract.getContractDate()!=null) {%><%=fc.SqlToRegularDate(carsContract.getContractDate()) %><%} else{%>-<%} %>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				2) RSQR Ref: No & Date: <br>
			    				 <%if(rsqr!=null && rsqr[11]!=null) {%><%=rsqr[11].toString() %><%} else{%>-<%} %> & <%if(carsIni!=null && carsIni.getInitiationApprDate()!=null) {%><%=fc.SqlToRegularDate(carsIni.getInitiationApprDate()) %> <%} %> 
			    			</td>
			    			<td  style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
								Issuing DRDO Establishment: <br>
								<%if(labMaster!=null) {%>
									<%if(labMaster.getLabCode()!=null) {%><%=labMaster.getLabCode() %><%} else{%>-<%} %>
									<%if(labMaster.getLabAddress()!=null) {%><%=", "+labMaster.getLabAddress() %><%} else{%>-<%} %>
									<%if(labMaster.getLabCity()!=null) {%><%=", "+labMaster.getLabCity() %><%} else{%>-<%} %>
									<%if(labMaster.getLabPin()!=null) {%><%=" - "+labMaster.getLabPin() %><%} else{%>-<%} %>
									
								<%} %>
								 <!-- <br><br><br><br> --> 
							</td>
			    			<td colspan="1" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				Dates of CARS: <br> --
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2"  style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				3) Name and address of Research Service Provider (RSP): <br>
			    					&nbsp;&nbsp;&nbsp;&nbsp;<%if(carsIni!=null) {%><%=carsIni.getPITitle()+". "+carsIni.getPIName()+", "+carsIni.getPIDesig() %> <%} else{%>-<%} %>
			    				  <br>	
			    				  	&nbsp;&nbsp;&nbsp;&nbsp;<%if(carsIni!=null) {%><%=carsIni.getRSPInstitute()+", "+carsIni.getRSPCity() %> <%} else{%>-<%} %>	<br>
			    				  	&nbsp;&nbsp;&nbsp;&nbsp;<%if(carsIni!=null) {%><%=carsIni.getRSPAddress()+", "+carsIni.getRSPCity()+", "+carsIni.getRSPState()+" - "+carsIni.getRSPPinCode() %> <%} else{%>-<%} %> <br>
			    				&nbsp;&nbsp;&nbsp;&nbsp;Phone :&nbsp;<%if(carsIni!=null) {%><%=carsIni.getPIMobileNo() %> <%} else{%>-<%} %> <br>
			    				&nbsp;&nbsp;&nbsp;&nbsp;Fax :&nbsp;<%if(carsIni!=null && carsIni.getPIFaxNo()!=null) {%><%=carsIni.getPIFaxNo() %> <%} else{%>-<%} %> <br>
			    				&nbsp;&nbsp;&nbsp;&nbsp;Email :&nbsp;<%if(carsIni!=null) {%><%=carsIni.getPIEmail() %> <%} else{%>-<%} %> <br>
			    				
			    			</td>
			    			<td colspan="2" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				4) RSP's Offer Ref: <br>
			    				<%if(carsContract!=null && carsContract.getRSPOfferRef()!=null) {%><%=carsContract.getRSPOfferRef() %><%} else{%>-<%} %>	
			    				<br><br>
			    				Date:&nbsp;
			    				<%if(carsContract!=null && carsContract.getRSPOfferDate()!=null) {%><%=fc.SqlToRegularDate(carsContract.getRSPOfferDate()) %><%} else{%>-<%} %>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				5) This contract will require a formal amendment if the following key professionals are not available to RSP:  <br>
			    				&nbsp;&nbsp;<%if(carsContract!=null && carsContract.getKP1Details()!=null) {%><%=carsContract.getKP1Details() %> <%} else{%><%} %>
			    				<br>
			    				&nbsp;&nbsp;<%if(carsContract!=null && carsContract.getKP2Details()!=null) {%><%=carsContract.getKP2Details() %> <%} else{%><%} %>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				6) RSP is authorized to engage these professionals as research consultants:
			    				<%if(consultants!=null && consultants.size()>0) {%>
			    					<table style="margin-left: 20px;border-collapse : collapse;width : 60%;">
			    						<thead>
			    							<tr>
			    								<th style="width: 20%;text-align : center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">Name</th>
			    								<th style="width: 40%;text-align : center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">Company / Institute</th>
			    							</tr>
			    						</thead>
			    						<tbody>
			    							<%for(CARSContractConsultants con : consultants) {%>
			    							<tr>
			    								<td style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    									<%if(con.getConsultantName()!=null) {%><%=con.getConsultantName() %> <%} else{%>-<%} %>
			    								</td>
			    								<td style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    									<%if(con.getConsultantCompany()!=null) {%><%=con.getConsultantCompany() %> <%} else{%>-<%} %>
			    								</td>
			    							</tr>
			    							<%} %>
			    						</tbody>
			    					</table> 
			    					<!-- <a class="btn btn-sm" href="C:\Users\Admin\Downloads\FR-202401061224584054236.pdf" target="_blank"><i class="fa fa-download" aria-hidden="true"style="color:green">DDD</i></a> -->
			    				<%} else{%><b>NIL</b><%} %> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				7) Principal technical features of Research Service to be provided: As per Appendix-A
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="4" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				8) DRDO will make available the following DRDO-owned equipment to RSP:
			    				<%if(equipment!=null && equipment.size()>0) {%>
			    					<table style="margin-left: 20px;border-collapse : collapse;width : 60%;">
			    						<thead>
			    							<tr>
			    								<th style="text-align : center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">Equipment Description</th>
			    							</tr>
			    						</thead>
			    						<tbody>
			    							<%for(CARSContractEquipment eqp : equipment) {%>
			    							<tr>
			    								<td style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    									<%if(eqp.getDescription()!=null) {%><%=eqp.getDescription() %> <%} else{%>-<%} %>
			    								</td>
			    							</tr>
			    							<%} %>
			    						</tbody>
			    					</table> 
			    					<!-- <a class="btn btn-sm" href="C:\Users\Admin\Downloads\FR-202401061224584054236.pdf" target="_blank"><i class="fa fa-download" aria-hidden="true"style="color:green">DDD</i></a> -->
			    				<%} else{%><b>NIL</b><%} %> 
			    			</td>
			    		</tr>
			    	</tbody>
			    </table>
			    <table style="margin-left : 10px;border-collapse : collapse;width : 98.5%;border-bottom: 0;">
			    	<tbody>
			    		<tr>
			    			<td colspan="3" style="border-top: 0 !important;text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">9) The technical performance of this contract shall be complete when RSP submits the Final Report before (date) </td>
			    			<td colspan="2" style="border-top: 0 !important;text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;"> Months:&nbsp;<%if(carsSoC!=null) {%><%=carsSoC.getSoCDuration() %><%} else{%>-<%} %></td>
			    		</tr>
			    		<tr>
			    			<td colspan="3" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">10.1 Expenditure on items below shall not exceed sums shown against each: </td>
			    			<td colspan="2" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;"></td>
			    		</tr>
			    		<tr>
			    			<td colspan="3" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">&nbsp;&nbsp;&nbsp;&nbsp;(a) Personnel</td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(carsContract!=null && carsContract.getExpndPersonnelCost()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(carsContract.getExpndPersonnelCost())) %>
			    				<%} else{%>
			    					-
			    				<%} %> 
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">&nbsp;&nbsp;&nbsp;&nbsp;(b) Equipment</td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(carsContract!=null && carsContract.getExpndEquipmentCost()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(carsContract.getExpndEquipmentCost())) %>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">&nbsp;&nbsp;&nbsp;&nbsp;(c) Others (Travel, Contingency, Consultancy, Institution head)</td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(carsContract!=null && carsContract.getExpndOthersCost()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(carsContract.getExpndOthersCost()))%>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">Sub-Total&nbsp;&nbsp;</td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(carsContract!=null && carsContract.getExpndTotalCost()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(carsContract.getExpndTotalCost())- Double.parseDouble(carsContract.getExpndGST())) %>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">Goods Services Tax inclusive (claimed along with Milestones payment proportionately)</td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(carsContract!=null && carsContract.getExpndGST()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(carsContract.getExpndGST())) %>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="3" style="text-align: right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">Total&nbsp;&nbsp;</td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(carsContract!=null && carsContract.getExpndTotalCost()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(carsContract.getExpndTotalCost())) %>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2" style="border-top: 0;text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal ;"> 10.2. Schedule of payments</td>
			    			<td colspan="1" style="text-align: center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;"> Date / Duration  </td>
			    			<td colspan="2" style="text-align: center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;"> Payment (&#8377;) </td>
			    		</tr>
			    		<%if(milestones!=null && milestones.size()>0) { char a='a';%>
			    		<tr>
			    			<td colspan="2" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">&nbsp;&nbsp;&nbsp;&nbsp;(a) Initial Advance &nbsp;&nbsp;(<%=milestones.get(0).getPaymentPercentage() %>%) </td>
			    			<td colspan="1" style="text-align : center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">T0*</td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(milestones.get(0).getActualAmount()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(milestones.get(0).getActualAmount())) %>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<% for(int i=1;i<milestones.size()-1;i++) { %>
			    		<tr>
			    			<td colspan="2" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">&nbsp;&nbsp;&nbsp;&nbsp;(<%=++a %>) at Performance Milestone-<%=i %> of RSQR &nbsp;&nbsp;(<%=milestones.get(i).getPaymentPercentage() %>%) </td>
			    			<td colspan="1" style="text-align : center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">T0+<%=milestones.get((i)).getMonths() %> </td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(milestones.get(i).getActualAmount()!=null) {%>
			    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(milestones.get(i).getActualAmount())) %>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<%}%>
			    		<tr>
			    			<td colspan="2" style="text-align : left;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">&nbsp;&nbsp;&nbsp;&nbsp;(<%=++a %>) on submission of final report &nbsp;&nbsp;(<%=milestones.get(milestones.size()-1).getPaymentPercentage() %>%) </td>
			    			<td colspan="1" style="text-align : center;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">T0+<%=milestones.get(milestones.size()-1).getMonths() %> </td>
			    			<td colspan="2" style="text-align : right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%if(milestones.get(milestones.size()-1).getActualAmount()!=null) {%>
				    					<%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(milestones.get(milestones.size()-1).getActualAmount())) %>
			    				<%} else{%>
			    					-
			    				<%} %>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		<%} %>
			    		<tr>
			    			<td colspan="2" style="text-align: left;border-right: 0;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				Payments will be made within 45 days of receipt by L/E/P of contingent Bill <br>
			    				&nbsp;&nbsp;* <b>To will be one month from the date of signing the contract.</b>
			    			</td>
			    			<td colspan="1" style="text-align: right;border-left: 0;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;"> Total&nbsp;&nbsp;</td>
			    			<td colspan="2" style="text-align: right;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<%
			    				if(milestones!=null && milestones.size()>0) {
			    				double milestonetotal = 0.0;
			    					for(CARSSoCMilestones mil :milestones) {
			    						milestonetotal+=Double.parseDouble(mil.getActualAmount());
			    					}
			    				%>
			    				<%=IndianRupeeFormat.getRupeeFormat(milestonetotal) %>
			    				<%}%>
			    				&nbsp;&nbsp;
			    			</td>
			    		</tr>
			    		
			    	</tbody>
			    </table>
			    <table style="margin-left : 10px;border-collapse : collapse;width : 98.5%;border-top: 0;">
			    	<tbody>
			    		<tr>
			    			<td style="width: 54%;text-align: left;border-right: 0;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;border-top: 0 !important;border-bottom: 0 !important;vertical-align: top;">
			    				11) DRDO will deem this contract, including amendments thereto, to have been consummated when signed below by the authority of the academic institution (e.g. Registrar) competent to enter into this contract:
			    			</td>
			    			<td style="width: 40.5%;text-align: left;border-right: 0;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;border-top: 0 !important;border-bottom: 0 !important;vertical-align: top;">
			    				12) Signature of L/E/P  Contract administrator:
			    				<br><br>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="text-align: left;border-left: 0;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;border-top: 0 !important;vertical-align: top;">
			    				<br><br><br><br>
			    				[Sign over seal] <br>
			    				Name: <br>
			    				Designation:
			    			</td>
			    			<td style="text-align: left;border-left: 0;border : 1px solid black;padding : 3px;word-wrap: break-word;word-break: normal;border-top: 0 !important;vertical-align: top;">
			    				<br><br>
			    				Name: <br>
			    				Designation: <br>
			    				Address:&nbsp;
			    				    <%if(labMaster!=null) {%>
										<%if(labMaster.getLabCode()!=null) {%><%=labMaster.getLabCode() %><%} else{%>-<%} %>
										<%if(labMaster.getLabAddress()!=null) {%><%=", "+labMaster.getLabAddress() %><%} else{%>-<%} %>
										<%if(labMaster.getLabCity()!=null) {%><%=", "+labMaster.getLabCity() %><%} else{%>-<%} %>
										<%if(labMaster.getLabPin()!=null) {%><%=" - "+labMaster.getLabPin() %><%} else{%>-<%} %> <br>
										<%if(labMaster.getLabTelNo()!=null) {%>Ph: <%=labMaster.getLabTelNo()%><%} else{%>-<%} %>
										<%if(labMaster.getLabFaxNo()!=null) {%><%=", Fax: "+labMaster.getLabFaxNo() %><%} else{%>-<%} %>
								<%} %>
			    			</td>
			    		</tr>
			    	</tbody>
			    </table>
		    </div>
		</div>
		<p style="text-align: center; page-break-before: always;">&nbsp;&nbsp;&nbsp;&nbsp;</p>
		<div id="container pageborder" align="center"  class="secondpage" id="secondpage" style="">
			<div class="secondpage" id="secondpage"> 	
				<div class="center">
			       <h5 style="text-decoration: underline;">GENERAL CONDITIONS OF CARS</h5>
			    </div>
			    <table style="margin-left : 10px;border-collapse : collapse;width : 98.5%;">
			    	<tbody>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">(I)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="text-decoration: underline;font-weight: 600;font-size: 10.5px;">Specific Conditions of this contract:</span> 
			    			 	<span style="font-weight: 400;font-size: 10.5px;">The following conditions apply [Lab / Estt / Programmes {L/E/P} to stipulate] in addition to General Conditions listed.</span> <br>
			    			 
			    			 <table style="margin-left : 10px;border-collapse : collapse;width : 98.5%;">
			    			 	<tr>
			    			 		<td style="width: 1%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    			 			<span style="font-weight: 400;font-size: 10.5px;">1.</span> 
			    			 		</td>
			    			 		<td style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    			 			<span style="font-weight: 600;font-size: 10.5px;">Technical performance:</span>
			    			 			<span style="font-weight: 400;font-size: 10.5px;">The satisfactory execution of the technical features of this contract shall be established against performance milestones.</span>
			    			 		</td>
			    			 	</tr>
			    			 	<tr>
			    			 		<td style="width: 1%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    			 			<span style="font-weight: 400;font-size: 10.5px;">2.</span> 
			    			 		</td>
			    			 		<td style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    			 			<span style="font-weight: 600;font-size: 10.5px;">Delivery Schedules:</span>
			    			 			<span style="font-weight: 400;font-size: 10.5px;">The interim reports and /or other outcome(s) of this contract shall be delivered as per enclosed list.</span>
			    			 		</td>
			    			 	</tr>
			    			 	<tr>
			    			 		<td style="width: 1%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    			 			<span style="font-weight: 400;font-size: 10.5px;">3.</span> 
			    			 		</td>
			    			 		<td style="text-align: left;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    			 			<span style="font-weight: 600;font-size: 10.5px;">Other specific conditions:</span>
			    			 		</td>
			    			 	</tr>
			    			 </table>	
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">(II)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="text-decoration: underline;font-weight: 600;font-size: 10.5px;">General Conditions of this CARS</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">1.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Equipment:</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">1.1</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					All equipment of a capital nature purchased, by the Research Service Provider (RSP), to execute this contract are the property of DRDO (L/E/P). These shall be returned to L/E/P within 03 months of expiry of this contract, unless L/E/P specifies otherwise separately.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="5" style="text-align: left;font-style: italic;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					<span style="text-decoration: underline;font-size: 10.5px;">NOTE:</span> Should there be a difference of opinion between the RSP and L/E/P on whether or not a piece of equipment is of 'Capital nature', the decision of L/E/P shall be final and binding on the RSP.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">1.2</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Equipment included in the Summary Offer of Research Services [at Entry 9. 1 (b)] shall be procured by the RSP.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">1.3</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The RSP shall be responsible for the proper maintenance of the equipment and shall not alienate them, or use them without the prior permission of L/E/P for purposes other than those specified in this contract.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">2.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Financial provisions:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					By entering into this contract, the RSP agrees to make available to the L/E/Ps, or to any person or bodies designated by it, if requested by the L/E/Ps, all financial documentation and records on supplies and services purchased or acquired by the RSP for executing the contract.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">2.1</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Advances, work in progress and schedule of payments:</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(a)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Advances or milestone payments are interim payments, which shall be deducted from the total sums due to the RSP.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(b)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The L/E/P shall make payments for executing this contract on demands made through 'Contingent Bills' after certification by the pertinent financial authority of the RSP that the monies already released have been utilised for the purposes for which they were provided.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(c)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Statements on expenditures incurred an items at 9.1 overleaf as certified by the internal auditors of the RSP shall be submitted within 30 days of crossing of each Performance milestone identified in the schedule of payments at 9.2 overleaf.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(d)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Except with the specific written pre agreement of the L/E/P, the RSP shall not use for any purposes other than those specified in this contract, any material or services for which advances or milestone payments have been made.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">2.2</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Financial documentation and records:</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(a)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					For work whose estimated time for completion is six months or less, the RSP shall submit only those reports as relate to the purchase of equipment by the RSP, within thirty (30) days of such purchase.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(b)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					For contracts whose estimated time for completion is more than six months, the RSP shall provide the L/E/P, not later than thirty (30) days after the end of each half year, with a half yearly financial report showing the actual expenditure incurred, against each of the entries at 'item 9.1' overleaf for the execution of the contract up to the end of the previous half year.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(c)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The L/E/P, or other authority specified by DRDO, may inspect all books, bills, vouchers and other financial records at any time until the final settlement of accounts. The RSP shall supply the L/E/P with such documents as are necessary for final settlement of claims, without explicit request by the L/E/P, within three (3) months after the date of submission of the Final Report.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">(d)</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The documents supporting claims shall be preserved by the RSP until one year after the contract accounts are finally settled.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">3.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Disclosure and use of information by the RSP:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The RSP will ensure that the documents supplied by the L/E/P are not disclosed to any person other than a person authorised by the L/E/P. Any pattern, sample or information in documentary or other physical form remains the property of the L/E/P throughout the� period of the contract and shall be returned to the L/E/P after execution of the contract, unless their disposal is otherwise provided for in the contract.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">4.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Delivery schedule:</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">4.1</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The interim outcomes of the contract shall be delivered at the time or times and in the manner specified in (I) above.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">4.2</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The RSP shall inform the L/E/P promptly of any occurrence that is likely to cause delay in delivery of above contracted outcomes. The L/E/P shall determine in the light of circumstances reported, the extent of change(s) required in the delivery schedule of the contract.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td colspan="5" style="text-align: left;font-style: italic;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					<span style="text-decoration: underline;font-size: 10.5px;">NOTE:</span>
			    					The above covers only unexpected technical difficulties, gross delays in deliveries by suppliers of purchased equipment or consumables, illness or other justifiable cause of unavailability of research personnel and similar unforeseen circumstances. 
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">4.3</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					An extension of the time limit for execution of the contract, or a postponement of delivery of outcomes shall require the explicit approval of the L/E/P, which approval shall be contractually valid only when this contract is formally amended by the L/E/P, as recorded on top right hand corner overleaf.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">5.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Short closure of contract:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The contract may be short closed at any time during the currency of its execution if the L/E/P feels that no useful purpose will be served by continuing its implementation. The short closure will be deemed to be effective from the day the short closure order is received by the RSP. Subsequent to this short closure the RSP will submit a technical report on the work done till short closure. The monies left unspent on the date of receipt of short �closure order by the RSP shall be returned to L/E/P. All equipment/stores acquired out of contract monies shall also be returned to L/E/P.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">6.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Reports:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Reports giving details of the progress of the work shall be sent to the L/E/P at intervals as specified in I above. On completion of the contract, the RSP will submit a final report (Contractor Report). All reports shall be in a format conforming to Indian Standard IS: 1064 1980, bound with Bibliographic Description sheet conforming to IS: 9400 1980.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">7.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Ownership of Intellectual Property (IP):</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">7.1</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The ownership of intellectual property, whether or not legally protected, generated by contract research performed under this contract shall vest in DRDO. However, the RSP shall receive, upon demand by it, a royalty free license from DRDO to use these intellectual properties for its own purposes, which purposes specifically exclude sale or licensing to third parties.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">7.2</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Notwithstanding the above, all documents and information detailing the technical performance of this contract (including pertinent laboratory notebooks, sketches, photographs, video tapes of experiments, electronic data acquisition records and other similar) shall be the property of DRDO, whether or not in the physical possession of DRDO.
			    				</span> 
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">8.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Publications:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Interim technical results and the outcome of the contract, intellectual or physical, are the property of DRDO. If the investigator intends publishing the technical outcome, he shall send a written request to L/E/P for permission to publish along with a copy of the manuscript Within 60 (sixty) days of the receipt of such request, the L/E/P will inform the investigator(s) about its decision. If no communication is received from the L/E/P by the investigator/RSP within this period of 60 (sixty) days, the investigator/RSP shall be free to publish the material as proposed by him.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">9.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Publicity relating to this contract:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					The existence of the contracts or the status of their execution shall not be publicised by the RSP in the media or in its Periodic/Annual Report except with the written consent of L/E/P. The latter shall specify the text relating to this contract that may be made public�.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">10.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Communications:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    			    	All communications affecting the performance of the contract, or its terms and conditions, shall be contractually valid only when confirmed by formal amendments to this contract made by the original signatories to the contract, and recorded in the box at the top right hand corner overleaf.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">11.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Compliance with law:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					Notwithstanding anything contained in this contract, the RSP shall be wholly responsible for complying with all laws in force in India.
			    				</span>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 3%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">12.</span>
			    			</td>
			    			<td colspan="4" style="text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 600;font-size: 10.5px;">Settlement of disputes:</span> 
			    				<span style="font-weight: 500;font-size: 10.5px;">
			    					All disputes relating to this contract shall be settled mutually between the Vice Chancellor/Director of the academic institution and Director of L/E/P placing this contract. Any remaining unresolved disputes shall be referred to final binding settlement by authorities mutually decided by the Secretary, Defence Research & Development, Ministry of Defence; and Secretary, HRD, Government of India, unless otherwise provided for in specific conditions of the contract.
			    				</span>
			    			</td>
			    		</tr>
			    	</tbody>
			    </table>
			    <br><br>
			    <table style="margin-left : 10px;border-collapse : collapse;width : 98.5%;">
			    	<tbody>
			    		<tr>
			    			<td style="width: 47.25%;text-align: left;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">RSP Signature</span>
			    			</td>
			    			<td style="width: 47.25%;text-align: right;font-family: Arial;padding: 1px;word-wrap: break-word;word-break: normal;vertical-align: top;">
			    				<span style="font-weight: 500;font-size: 10.5px;">Signature of Estt.</span>
			    			</td>
			    		</tr>
			    	</tbody>
			    </table>
			</div>
		</div>
	</div>
<%if(pdfFlag==null) {%>	
<script>
  jQuery(document).ready(function($) {
   	  $("#btn-export").click(function(event) {
   	    $("#source-html").wordExport("CARS-03");
   	  });
   	});
   
</script>	
<%} %>	
</body>
</html>