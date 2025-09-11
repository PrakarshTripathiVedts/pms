<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@page import="com.vts.pfms.NFormatConvertion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
<%-- <jsp:include page="../static/sidebar.jsp"></jsp:include> --%>
<title>PROJECT STATUS LIST</title>
<style type="text/css">
/* #wrapper{
	background-color: white !important;
} */


  html, body {
    margin: 0;
    padding: 0;
    font-family: Helvetica, sans-serif;
  }
  body {
    background: #25303B;
  }
  section#timeline {
    width: 80%;
    margin: 20px auto;
    position: relative;
  }
  section#timeline:before {
    content: '';
    display: block;
    position: absolute;
    left: 50%;
    top: 0;
    margin: 0 0 0 -1px;
    width: 2px;
    height: 100%;
    background:black;
  }
  section#timeline article {
    width: 100%;
    margin: 0 0 20px 0;
    position: relative;
  }
  section#timeline article:after {
    content: '';
    display: block;
    clear: both;
  }
  section#timeline article div.inner {
    width: 40%;
    float: left;
    margin: 5px 0 0 0;
    border-radius: 6px;
  }
  section#timeline article div.inner span.date {
    display: block;
    width: 70px;
    height: 65px;
    padding: 5px 0;
    position: absolute;
    top: 0;
    left: 50%;
    margin: 0 0 0 -32px;
    border-radius: 100%;
    font-size: 12px;
    font-weight: 900;
    text-transform: uppercase;
    background: #25303B;
    color: rgba(255,255,255,0.5);
    border: 2px solid rgba(255,255,255,0.2);
    box-shadow: 0 0 0 7px #25303B;
  }
  section#timeline article div.inner span.date span {
    display: block;
    text-align: center;
  }
  section#timeline article div.inner span.date span.day {
    font-size: 12px;
  }
  section#timeline article div.inner span.date span.month {
    font-size: 13px;
  }
  section#timeline article div.inner span.date span.year {
    font-size: 9px;
  }
  section#timeline article div.inner h2 {
    padding: 10px;
    margin: 0;
    color: #fff;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0px;
    border-radius: 6px 6px 0 0;
    position: relative;
    font-family: 'Muli',sans-serif;
  }
  section#timeline article div.inner h2:after {
    content: '';
    position: absolute;
    top: 20px;
    right: -5px;
      width: 10px; 
      height: 10px;
    -webkit-transform: rotate(-45deg);
  }
  section#timeline article div.inner p {
    padding: 15px;
    margin: 0;
    font-size: 14px;
    background: #fff;
    color: #656565;
    border-radius: 0 0 6px 6px;
    font-family: 'Lato',sans-serif;
  }
  section#timeline article:nth-child(2n+2) div.inner {
    float: right;
  }
  section#timeline article:nth-child(2n+2) div.inner h2:after {
    left: -5px;
  }
  section#timeline article:nth-child(1) div.inner h2 {
    background: #e74c3c;
  }
  section#timeline article:nth-child(1) div.inner h2:after {
    background: #e74c3c;
  }
  section#timeline article:nth-child(2) div.inner h2 {
    background: #2ecc71;
  }
  section#timeline article:nth-child(2) div.inner h2:after {
    background: #2ecc71;
  }
  section#timeline article:nth-child(3) div.inner h2 {
    background: #e67e22;
  }
  section#timeline article:nth-child(3) div.inner h2:after {
    background: #e67e22;
  }
  section#timeline article:nth-child(4) div.inner h2 {
    background: #1abc9c;
  }
  section#timeline article:nth-child(4) div.inner h2:after {
    background: #1abc9c;
  }
  section#timeline article:nth-child(5) div.inner h2 {
    background: #9b59b6;
  }
  section#timeline article:nth-child(5) div.inner h2:after {
    background: #9b59b6;
  }

/* timeline customization */

.remarks_title{
	font-size: 12px;
	font-weight: 800;
	color:black;
}


</style>
</head>
<body>
<%SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");


List<Object[]> historydata=(List<Object[]>)request.getAttribute("historydata");


Object[] projectdata=(Object[])request.getAttribute("projectdata"); 
Object[] divisiondata=(Object[])request.getAttribute("divisiondata"); 
Object[] initiationdata=(Object[])request.getAttribute("initiationdata");

Object[] committeedata=(Object[])request.getAttribute("committeedata");
String initiationid=committeedata[4].toString();
String divisionid=committeedata[3].toString();
String projectid=committeedata[2].toString();
String committeeid=committeedata[1].toString();
String committeemainid=committeedata[0].toString();





DecimalFormat df=new DecimalFormat("0.00");
NFormatConvertion nfc=new NFormatConvertion();
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

<br>	
<div class="container-fluid">		
	<div class="row">
		<div class="col-md-12">		
			<div class="row">
				<div class="col-md-9 card-header" style="margin-bottom: 10px;margin-top: -30px; background-color: white;">
					<h3 style="color:  #055C9D" >
						<%if(Long.parseLong(projectid)>0){ %> Project : <%=projectdata[4]!=null?StringEscapeUtils.escapeHtml4(projectdata[4].toString()): " - " %><%}else if (Long.parseLong(divisionid)>0){ %>  Division : <%=divisiondata[1]!=null?StringEscapeUtils.escapeHtml4(divisiondata[1].toString()): " - " %> <%}else if(Long.parseLong(initiationid)>0){ %>Initiated Project : <%=initiationdata[1]!=null?StringEscapeUtils.escapeHtml4(initiationdata[1].toString()): " - "%> <%} %>
					</h3>			
				</div>
				<div class="col-md-6">
					
				</div>
				
				
			</div>
				
        	
	      <section id="timeline">
	      
	       <% int count=1;
			 for(Object[] object:historydata){
			 SimpleDateFormat month=new SimpleDateFormat("MMM");
			 SimpleDateFormat day=new SimpleDateFormat("dd");
			 SimpleDateFormat year=new SimpleDateFormat("yyyy");
			 SimpleDateFormat time=new SimpleDateFormat("HH:mm");
			 %>
	      
			  <article>
			    <div class="inner">
			      <span class="date">
			        <span class="day"><%=object[6]!=null?day.format(object[6]):" - " %></span>
			        <span class="month"><%=object[6]!=null?month.format(object[6]):" - " %></span>
			        <span class="year"><%=object[6]!=null?year.format(object[6]):" - " %></span>
			      </span>
			      <h2><%=object[7]!=null?StringEscapeUtils.escapeHtml4(object[7].toString()): " - " %> at <%=object[6]!=null?time.format(object[6]):" - " %></h2> 
				  <p>
				  <span class="remarks_title">Action By : </span>
				  				<%=object[8]!=null?StringEscapeUtils.escapeHtml4(object[8].toString()): " - " %>, <%=object[9]!=null?StringEscapeUtils.escapeHtml4(object[9].toString()): " - " %><br>
				  	<%if(object[3]!= null && object[3].toString().trim().length()>0){%>
				  		<span class="remarks_title">Remarks : </span>
				  				<%=StringEscapeUtils.escapeHtml4(object[3].toString()) %>
					<%}else{ %> 
						<span class="remarks_title">No Remarks </span> 
					<%} %>
				  </p>
			    </div>
			  </article>
			  
			<%count++;}
 					%> 
			  
		
		</section>
      
        </div>         
	</div> 
</div>	
	
	
	
	
<script type="text/javascript">

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})


function Prints(myfrm){
	
	 var fields = $("input[name='btSelectItem']").serializeArray();

	 
	  if (fields.length === 0){
		  myalert();
	 event.preventDefault();
	return false;
	}
	 
		  return true;
	 
	}






</script>
</body>
</html>