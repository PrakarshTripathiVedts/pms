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
<title>PROJECT INT  LIST</title>
<style type="text/css">

label{
font-weight: bold;
  font-size: 13px;
}

.table .font{
	  font-family:'Muli', sans-serif !important;
	  font-style: normal;
	  font-size: 13px;
	  font-weight: 400 !important;
	 
}

.table button {
    background-color: Transparent !important;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
    text-align: left !important;
}
.table td{
	padding:5px !important;
}
 .resubmitted{
	color:green;
}

	.fa{
		font-size: 1.20rem;
	}
	
.datatable-dashv1-list table tbody tr td{
	padding: 8px 10px !important;
}

.table-project-n{
	color: #005086;
}

#table thead tr th{
	padding: 0px 0px !important;
}

#table tbody tr td{
	padding:2px 3px !important;
}


/* icon styles */

.cc-rockmenu {
	color:fff;
	padding:0px 5px;
	font-family: 'Lato',sans-serif;
}

.cc-rockmenu .rolling {
  display: inline-block;
  cursor:pointer;
  width: 34px;
  height: 30px;
  text-align:left;
  overflow: hidden;
  transition: all 0.3s ease-out;
  white-space: nowrap;
  
}
.cc-rockmenu .rolling:hover {
  width: 108px;
}
.cc-rockmenu .rolling .rolling_icon {
  float:left;
  z-index: 9;
  display: inline-block;
  width: 28px;
  height: 52px;
  box-sizing: border-box;
  margin: 0 5px 0 0;
}
.cc-rockmenu .rolling .rolling_icon:hover .rolling {
  width: 312px;
}

.cc-rockmenu .rolling i.fa {
    font-size: 20px;
    padding: 6px;
}
.cc-rockmenu .rolling span {
    display: block;
    font-weight: bold;
    padding: 2px 0;
    font-size: 14px;
    font-family: 'Muli',sans-serif;
}

.cc-rockmenu .rolling p {
	margin:0;
}

.width{
	width:270px !important;
}





</style>
</head>
<body>
<%
SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
List<Object[]> notiecList =(List<Object[]>)request.getAttribute("NotiecList");
Integer noticeElib= Integer.parseInt(request.getAttribute("noticeEligibility").toString());

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
		
			<div class="card shadow-nohover" >
			<div class="card-header">
			<div class=row>
				<h3 >
					Notice List
					
				</h3>
				
				 <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9"></div>
			 	 <%if(noticeElib>0){%> 	
				<form method="GET" style="margin-left: 4.2rem; " action="IndividualNoticeList.htm" >
									<button type="submit"  class="btn btn-sm add" >ADD NOTICE</button>						
								</form>	
								<%} %>
								</div>
								</div>
				<div class="card-body"> 
		
					 <div class="data-table-area mg-b-15">
			            <div class="container-fluid">
			                
			                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			                        <div class="sparkline13-list">
			                           <!--  <div class="sparkline13-hd">
			                                <div class="main-sparkline13-hd">
			                                    <h3> <span class="table-project-n">Initiation List</span> </h3>
			                                </div>
			                            </div> -->
			                            <div class="sparkline13-graph">
			                                <div class="datatable-dashv1-list custom-datatable-overright">
			                                
			                                    <div id="toolbar">
			                                        <select class="form-control dt-tb">
														<option value="">Export Basic</option>
														<option value="all">Export All</option>
														<option value="selected">Export Selected</option>
													</select>
			                                    </div>
			                                    
			                                    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
			                                        data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
			                                        <thead>
			                                         
			                                            <tr>
			                                              <th >Sr No.</th>
			                                                <th >From Date</th>
			                                                <th >To Date</th>
			                                                <th >Notice</th>
			                                                <th >Notice By </th>
			                                                <th>Revoke</th>       
			                                            </tr>
			                                        </thead>
			                                        <tbody>
			                                        <%if(notiecList!=null){
			                                        int srno=1;
			                                        %>
			                                            <%for(Object[] notiec:notiecList){ %>
			                                            <tr>
			                                                <td><%=srno++%></td>
			                                               <td><%=notiec[2]!=null?sdf.format(notiec[2]):" - "%></td>
			                                               <td><%=notiec[3]!=null?sdf.format(notiec[3]):" - "%></td>
			                                               <td><%=notiec[1]!=null?StringEscapeUtils.escapeHtml4(notiec[1].toString()): " - "%></td>
			                                               <td><%=notiec[8]!=null?StringEscapeUtils.escapeHtml4(notiec[8].toString()): " - "%></td>
			                                              			<td  class="left width">
												
													 <form action="ExpertEditRevoke.htm" method="POST" name="myfrm"  style="display: inline" onsubmit="return confirm('Do you really want to Edit or Revoke');">
											        		<button  class="editable-click" name="sub" value="revoke" >
																<div class="cc-rockmenu">
																 <div class="rolling">	
											                        <figure class="rolling_icon"><img src="view/images/remove.png" ></figure>
											                        <span>Revoke</span>
											                      </div>
											                     </div>
											                  </button>   
															<input type="hidden" name="expertId" value="<%=notiec[0] %>"/>
															<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
														
													</form>
			                                               </td>
			                                               
			                                             </tr>
			                                             <%}%>
													 <%} %>
											</tbody>
				    						<tfoot>
				    						<tr>
				    					
				    						<td colspan="8" align="right">
				    				
				    						</td>
				    						</tr>
				    						
				    						</tfoot>
				    
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


$(document).ready(function(){
	
	$("#table").DataTable({
		"pageLength": 5
	})
})



</script>
</body>
</html>