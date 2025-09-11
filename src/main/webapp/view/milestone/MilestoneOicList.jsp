<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.ibm.icu.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat,java.io.ByteArrayOutputStream,java.io.ObjectOutputStream"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>

 

<title>Milestone OIC List</title>
<style type="text/css">
label{
font-weight: bold;
  font-size: 13px;
}
body{
background-color: #f2edfa;
overflow-x:hidden !important; 
}
h6{
	text-decoration: none !important;
}
.multiselect-container>li>a>label {
  padding: 4px 20px 3px 20px;
}
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
  width: 120px;
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
	width:210px !important;
}
.bootstrap-select {
  width: 400px !important;
}
</style>
</head>
 
<body>
  <%
  

  
  List<Object[]> MilestoneList=(List<Object[]>)request.getAttribute("MilestoneActivityList");
  SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
  SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
  
  
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

    <br />
  

   
   
   
   <div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow-nohover">
				<div class="row card-header">
			     <div class="col-md-10">
					<h3 >Milestone List</h3>
					</div>
					<div class="col-md-2 justify-content-end" style="float: right;">
				
					 </div>
					 </div>
					<div class="card-body">

						<div class="data-table-area mg-b-15">
							<div class="container-fluid">


								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="sparkline13-list">

										<div class="sparkline13-graph">
											<div class="datatable-dashv1-list custom-datatable-overright">
												<div id="toolbar">
													<select class="form-control dt-tb">
														<option value="">Export Basic</option>
														<option value="all">Export All</option>
														<option value="selected">Export Selected</option>
													</select>
												</div>
												<table id="table" data-toggle="table" data-pagination="true"
													data-search="true" data-show-columns="true"
													data-show-pagination-switch="true" data-show-refresh="true"
													data-key-events="true" data-show-toggle="true"
													data-resizable="true" data-cookie="true"
													data-cookie-id-table="saveId" data-show-export="true"
													data-click-to-select="true" data-toolbar="#toolbar">
													<thead>

														<tr>
															<th>SN</th>
															<th style="text-align: left;">Milestone No</th>
															<th style="text-align: left;">Project Name</th>
															<th style="text-align: left;">Milestone Activity</th>
															<th class="width-110px">Start Date</th>
															<th class="width-110px">End Date</th>	
															<th style="text-align: left;">First OIC </th>
															<th style="text-align: left;">Second OIC </th>													
														 	<th >Action</th>
														 		
														 	
														</tr>
													</thead>
													<tbody>
														<%int  count=1;
															
														 	if(MilestoneList!=null&&MilestoneList.size()>0){
															for(Object[] obj: MilestoneList){ %>
														<tr>
															<td style="width:1% !important; " class="center"><%=count %></td>
															<td class="width-30px">Mil-<%=obj[5]!=null?StringEscapeUtils.escapeHtml4(obj[5].toString()):" - "%></td>
															<td class="width-30px"><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()):" - "%></td>
															<td style="overflow-wrap: break-word !important; word-break: break-all !important; white-space: normal !important;max-width:20% !important;min-width:20% !important;"><%=obj[4]!=null?StringEscapeUtils.escapeHtml4(obj[4].toString()):" - " %></td>
															
															<td class="width-30px"><%=obj[2]!=null?sdf.format(obj[2]):" - "%></td>
															<td style="width:8% !important; "><%=obj[3]!=null?sdf.format(obj[3]):" - "%></td>
															<td class="width-30px"><%=obj[6]!=null?StringEscapeUtils.escapeHtml4(obj[6].toString()):" - "%></td>
															<td class="width-30px"><%=obj[7]!=null?StringEscapeUtils.escapeHtml4(obj[7].toString()):" - "%></td>	
																<td  class="left width">		
																
														 
																
																	
														 <form action="MilestoneActivityUpdate.htm" method="POST" name="myfrm"  style="display: inline">
															<button  class="editable-click">
																<div class="cc-rockmenu">
																 <div class="rolling">	
											                        <figure class="rolling_icon"><img src="view/images/clipboard.png" ></figure>
											                        <span>Update</span>
											                      </div>
											                     </div>
											                  </button>   
															<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
														    <input type="hidden" name="MilestoneActivityId" value="<%=obj[0]%>"/>
															
															
													 </form> 
																
																		
															</td>
		
														</tr>
												<% count++; } }else{%>
												<tr>
													<td colspan="9" style="text-align: center" class="center">No List Found</td>
												</tr>
												<%} %>
												</tbody>
												</table>
												
							<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />


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
   

  
<script>





</script>







</body>
</html>