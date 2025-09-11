<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Meeting Intimation Letter</title>
<style type="text/css">

.break
{
	page-break-after: always;
}
p{
  text-align: justify;
  text-justify: inter-word;
}
 
@page {    
          
          size: 790px 1120px;
              margin-top: .4in;
              margin-left: .5in;
              margin-right: .5in;
              margin-buttom: .4in;
              border: 1px solid black;
                       
         
 }

</style>
<body>
 <%
SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
 
Object[] scheduledata = (Object[]) request.getAttribute("scheduledata");
Object[] projectdata = (Object[]) request.getAttribute("projectdata");
Object[] labdetails = (Object[]) request.getAttribute("labdetails");
Object[] tomember = (Object[]) request.getAttribute("tomember");
String projectid =(String)request.getAttribute("projectid");  

// Prudhvi - 05/03/2024
String rodflag = (String)request.getAttribute("rodflag");
%>


<!-- <div class="cent"  align="center" > -->

<div id="container" align="center"  class="cent">
<div class="cent">
<div style="text-align: left;">
	<div style="text-align: center;" ><h3 style="margin-bottom: 2px;"><%=labdetails[2] !=null?labdetails[2].toString(): " - "%></h3></div>	
	<div style="text-align: center;" ><h3 style="margin-bottom: 2px;"> ( <%=labdetails[1]!=null?labdetails[1].toString(): " - " %> 	) </h3></div>		
			
		<br>
		
		<table style=" text-align: left; 10px; margin-bottom: 10px; margin-left: 15px; max-width: 650px; font-size: 16px; border-collapse:collapse;" >
			<tr><td><span style="font-weight: bold; font-size: 17px">To,</span></td></tr>
			<tr><td><span style=" font-size: 17px"><%=tomember[6]!=null?tomember[6].toString(): " - " %>, <%=tomember[7]!=null?tomember[7].toString(): " - "  %>,</span></td></tr>
			<%if(tomember[3].toString().equalsIgnoreCase("E") || tomember[3].toString().equalsIgnoreCase("W") ){ %>
			<tr><td><span style=" font-size: 17px">External : <%=tomember[11]!=null?tomember[11].toString(): " - "  %></span></td></tr>
			<%} %>
			<tr><td><span style=" font-size: 17px">Email : <%=tomember[8]!=null?tomember[8].toString(): " - "  %></span></td></tr>
			<tr><td><br></td></tr>
		</table> 
		
		<!-- <table style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 15px; max-width: 650px; font-size: 16px; border-collapse:collapse;" >
			<tr><td><span style=" font-size: 17px"><b>Subject :</b> &nbsp;</span></td><td><span style=" font-size: 17px">Meeting Intimation letter.</span></td></tr>			
		</table> -->
		<br>
		<br>
		<table style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 15px; max-width: 650px; font-size: 16px; border-collapse:collapse;" >
			<tr><td><span style="font-weight: bold; font-size: 17px">Dear Sir/Madam,</span></td></tr>
			<tr><td><p style=" font-size: 17px ;text-align: justify;  text-justify: inter-word; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- Prudhvi - 05/03/2024 -->
			This is to inform you that Meeting is Scheduled <%-- on <b><u>"<%=sdf.format(sdf1.parse(scheduledata[2].toString())) %>"</u></b>  at  &nbsp;<b><u><%=scheduledata[3] %></u></b> held at <b><u><%=scheduledata[12] %></u></b> --%> for the <b><%=scheduledata[7]!=null?scheduledata[7].toString(): " - "  %> <%if(rodflag!=null && rodflag.equalsIgnoreCase("Y")) {%><%} else{%> (<%=scheduledata[8]!=null?scheduledata[8].toString(): " - "  %>)</b>&nbsp; committee <%} %> <%if(projectid!=null && Long.parseLong(projectid)>0){ %> of <b><%=projectdata[1]!=null?projectdata[1].toString(): " - "  %> (<%=projectdata[4]!=null?projectdata[4].toString(): " - "  %>)</b><%} %> and further details about the meeting is mentioned below. </p></td></tr>
		</table>
		
		<table style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 15px; min-width: 100px; font-size: 16px; border-collapse:collapse;" >	
		 <tr>
			<td style="text-align: left; font-weight: 700; min-width: 100px; padding: 5px; padding-left: 15px">Date :</td>
			
			<td style="text-align: left; font-weight: 700; min-width: 200px; padding: 5px; padding-left: 5px"><%=scheduledata[2]!=null?sdf.format(sdf1.parse(scheduledata[2].toString())): " - "  %></td>			
		 </tr>
		 <tr>
			<td style="text-align: left; font-weight: 700; min-width :100px; padding: 5px; padding-left: 15px">Time :</td>
			
			<td style="text-align: left; font-weight: 700; min-width: 200px; padding: 5px; padding-left: 5px"><%=scheduledata[3]!=null?scheduledata[3].toString(): " - " %></td>			
		 </tr>
		 <tr>
			<td style="text-align: left; font-weight: 700; min-width: 100px; padding: 5px; padding-left: 15px">Venue :</td>
			
			<td style="text-align: left; font-weight: 700; min-width: 200px; padding: 5px; padding-left: 5px"><%=scheduledata[12]!=null?scheduledata[12].toString(): " - " %></td>			
		 </tr>
		</table>
		
		
		<%-- <table style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 15px; max-width: 650px; font-size: 16px; border-collapse:collapse;" >	
		 <tr>
			
			 <th colspan="3" style="text-align: left; font-weight: 700; width: 650px;border: 1px solid black; padding: 5px; padding-left: 15px">Committee Members</th>
			
		 </tr>
		 <%int j=0;
		 for(int i=0;i<invitedlist.size();i++)
		 {
			 j++;%>	 	
		 	 <tr>
		 	 <td style="border: 1px solid black; padding: 5px;text-align: left"> <%=j%> </td>
		 	  	<td style="border: 1px solid black; padding: 5px;text-align: left">  
		 	  	
		 			<%= invitedlist.get(i)[6]%> (<%=invitedlist.get(i)[7] %>)  
			 	</td>	
			 	<td style="border: 1px solid black;padding: 5px ;text-align: left">		 	
			 		<%if(invitedlist.get(i)[3].toString().equals("CC")){ %>Chairperson<%}
			 		else if(invitedlist.get(i)[3].toString().equals("CS")){ %>Member Secretary<%} 
			 		else if(invitedlist.get(i)[3].toString().equals("C")){ %>Committee Member<%} 
			 		else if(invitedlist.get(i)[3].toString().equals("E")){ %>External Member<%} 
			 		else if(invitedlist.get(i)[3].toString().equals("I")){ %>Internal Member<%}
			 		else if(invitedlist.get(i)[3].toString().equals("P")){ %>Presenter<%} %> 	 		
		 		</td>	
		 		</tr>
		 <%
		 } %>
	 </table> --%>
	 <br><br><br>
	 <table style="align: left; margin-top: 10px; margin-bottom: 10px; margin-left: 15px; max-width: 650px; font-size: 16px; border-collapse:collapse;" >	
	 	<tr><td><span style=" font-size: 17px">Thank You,</span></td></tr>	
	 </table>
	 <br><br><br><br><br>	
	 
	<!--  <span style=" font-size: 17px"><b>Note : </b>This is computer generated document no signature required.</span>
		 -->
</div>			
</div>		</div>

</body>
</html>