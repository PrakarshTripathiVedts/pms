<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.vts.pfms.cars.model.CARSSoC"%>
<%@page import="com.vts.pfms.IndianRupeeFormat"%>
<%@page import="com.vts.pfms.cars.model.CARSSoCMilestones"%>
<%@page import="java.util.List"%>
<%@page import="com.vts.pfms.cars.model.CARSInitiation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CARS-SoC-Milestones</title>

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
 
.bold{
	font-weight: 800 !important;
}

 @page  {             
          size: 790px 1120px;
          margin-top: 49px;
          margin-left: 39px;
          margin-right: 39px;
          margin-buttom: 49px; 	
          border: 1px solid black; 
          
          @bottom-left {          		
             content: "";
             margin-bottom: 30px;
             margin-right: 10px;
             font-size: 13px;
          }
             
                    
           @bottom-right  {
            content: "Page " counter(page) " of " counter(pages);
            margin-bottom: 30px;
          }
           @top-right {
             content: "Annexure-II";
             margin-top: 30px;
             font-size: 13px;
          }
          
          @top-center {
             content: "";
             margin-top: 30px;
             font-size: 13px;
          }
          
          
          @top-left {
          	margin-top: 30px;
            content: "<%=carsIni.getCARSNo()!=null?carsIni.getCARSNo(): " - "%>";
            font-size: 13px;
          }               
          
 }
 
.editor-text span,p,h1,h2,h3,h4,h5,h6{
	font-size: 17px !important;
	font-family: 'Times New Roman', Times, serif !important;
}
          
.heading-color{
	color: #145374;
}

.editor-text table{
	width:  595px !important;
}

.editor-text span,p{
	font-weight: 500 !important;
}

.editor-text {
	font-size: 17px !important;
	font-family: 'Times New Roman', Times, serif !important;

}



.main-text{
	padding-right: 15px !important
}

.editor-text-font td{
	font-size : 17px !important;
	padding: 2px 4px !important;
}

.editor-data{
	margin-left: 10px;
	margin-right : 10px;
	text-indent: 20px;
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
 vertical-align: top;
}
#tabledata td,th{
 border : 1px solid black;
 padding : 5px;
}

p
{
	text-align: justify !important;
  	text-justify: inter-word;
}
p,td,th
{
  word-wrap: break-word;
  word-break: normal ;
}
#timestamptable{
 margin-left : 10px;
 border-collapse : collapse;
 width : 98.5%;
}

</style>

</head>
<body>
<%
Object[] emp = (Object[])request.getAttribute("EmpData");
List<CARSSoCMilestones> milestones = (List<CARSSoCMilestones>)request.getAttribute("CARSSoCMilestones");
CARSSoC carsSoC =(CARSSoC)request.getAttribute("CARSSoCData"); 
%>

<div align="center">
	<h5 style="font-weight: bold;margin-top: 1.5rem;text-decoration: underline;">Milestone and Deliverables</h5>
</div>
<div style="width : 680px !important; margin-left: 10px">
	<p style="text-indent: 21px;">The following milestones will be part of the project execution.
	 For each milestone, a review will be held and deliverables accepted.
	 The payment will be released as per the milestone.</p>
</div>

<div>
   	<div>
   		<%if(milestones!=null && milestones.size()>0) {%>
   			<table id="tabledata">
   				<thead>
   					<tr>
   						<th style="width: 5%;">Milestone No.</th>
   						<th style="width: 20%;">Task Description</th>
   						<th style="width: 10%;">Months</th>
   						<th >Deliverables</th>
   						<%if(carsSoC!=null) {%>
   						<th style="width: 5%;">Payment <br> ( In %)</th>
   						<th style="width: 10%;">Amount (&#8377;)</th>
   						<th style="width: 10%;">Remarks</th>
   						<%} %>
   					</tr>
   				</thead>
   				<tbody>
   					<%int i=0; for(CARSSoCMilestones mil : milestones) { %>
   						<tr>
   							<td style="text-align: center;width: 5%;"><%if(mil.getMilestoneNo()!=null) {%><%=mil.getMilestoneNo() %><%} else{%>-<%} %></td>
   							<td style="width: 20%;"><%if(mil.getTaskDesc()!=null) {%><%=mil.getTaskDesc() %><%} else{%>-<%} %></td>
   							<td style="text-align: center;width: 10%;"><%if(mil.getMonths()!=null) {%><%="T0 + "%> <%=mil.getMonths() %><%} else{%>-<%} %></td>
   							<td style=""><%if(mil.getDeliverables()!=null) {%><%=mil.getDeliverables() %><%} else{%>-<%} %></td>
   							<%if(carsSoC!=null) {%>
   							<td style="text-align: center;width: 5%;"><%if(mil.getPaymentPercentage()!=null) {%><%=mil.getPaymentPercentage() %><%} else{%>-<%} %></td>
   							<td style="width: 10%;text-align: right;"><%if(mil.getActualAmount()!=null) {%><%=IndianRupeeFormat.getRupeeFormat(Double.parseDouble(mil.getActualAmount())) %><%} else{%>-<%} %></td>
   							<td style="width: 10%;"><%if(mil.getPaymentTerms()!=null) {%><%=mil.getPaymentTerms() %><%} else{%>-<%} %></td>
   							<%} %>
   						</tr>
   					<%} %>
   				</tbody>
   			</table>
   		<%}else {%><div style="text-align: center;">No Details Added!</div><%} %>
   	</div>
</div>
<br>
      
<table id="timestamptable">
	<tr>
		<td style="text-align: right;">
			<div style="line-height: 17px;">
    			<div style="font-size: 15px;margin-bottom: 10px;">Signature of the initiating officer</div>
				<label style="text-transform: capitalize;">
					<%if(emp!=null && emp[1]!=null){%> <%=emp[1].toString()%><%} %>,
				</label><!-- <br> -->
				<label style="text-transform: capitalize;">
					<%if(emp!=null && emp[2]!=null){%> <%=emp[2].toString()%><%} %>
				</label><br>
			</div>
		</td>
	</tr>
</table>
</body>
</html>