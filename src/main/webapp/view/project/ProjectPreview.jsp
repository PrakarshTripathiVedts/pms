<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="com.vts.pfms.NFormatConvertion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.vts.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/dependancy.jsp"></jsp:include>



<title>PROJECT PREVIEW</title>
<style type="text/css">

.container-fluid  {
overflow-x: hidden;
}

.nav-pills-custom .nav-link {
    color: #aaa;
    background: #fff;
    position: relative;
}

.nav-pills-custom .nav-link.active {
    color: #45b649;
    background: #fff;
    border:2px solid #45b649;
}


/* Add indicator arrow for the active tab */
@media (min-width: 992px) {
    .nav-pills-custom .nav-link::before {
        content: '';
        display: block;
        border-top: 8px solid transparent;
        border-left: 10px solid #fff;
        border-bottom: 8px solid transparent;
        position: absolute;
        top: 50%;
        right: -10px;
        transform: translateY(-50%);
        opacity: 0;
        border-color: transparent transparent transparent green;
        
    }
}
hr{
	margin-top: 0px;
	margin-bottom: 0px;
}
.nav-pills-custom .nav-link.active::before {
    opacity: 1;
}

.nav-link{
	font-family: 'Muli',sans-serif;
}

.p-3{
	padding: 2rem !important;
}

/* inside tabs */

p {
    margin: 0px 0px 0px 0px
}

p:last-child {
    margin: 0px
}

a {
    color: #71748d
}

a:hover {
    color: #ff407b;
    text-decoration: none
}

a:active,
a:hover {
    outline: 0;
    text-decoration: none
}

.btn-secondary {
    color: #fff;
    background-color: #ff407b;
    border-color: #ff407b
}

.btn {
    font-size: 14px;
    padding: 9px 16px;
    border-radius: 2px
}

.tab-vertical .nav.nav-tabs {
    float: left;
    display: block;
    margin-right: 0px;
    border-bottom: 0
}

.tab-vertical .nav.nav-tabs .nav-item {
    margin-bottom: 3px
}

.tab-vertical .nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    background: #fff;
    padding: 6px 13px;
    color: #71748d;
    background-color: #dddde8;
    -webkit-border-radius: 4px 0px 0px 4px;
    -moz-border-radius: 4px 0px 0px 4px;
    border-radius: 4px 0px 0px 4px
}

.tab-vertical .nav-tabs .nav-link.active {
    color: white;
    background-color: #055C9D !important;
    border-color: transparent !important
}

.tab-vertical .nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: 4px !important;
    border-top-right-radius: 0px !important
}

.tab-vertical .tab-content {
    overflow: auto;
    -webkit-border-radius: 0px 4px 4px 4px;
    -moz-border-radius: 0px 4px 4px 4px;
    border-radius: 0px 4px 4px 4px;
    background: aliceblue;
    padding: 30px;
    font-size: 17px;
}


/* initiation */

.column{
	padding: 10px;
}

.tab-pane p{
	text-align: justify;
}

.tab-pane {
	min-height: 27rem !important;
}



.custom_width{
	padding: 1rem 1rem !important;
	width: 83%;
}

.b{
	background-color: #ebecf1;	
}
.a{
	background-color: #d6e0f0;
}
body{
	margin-top: 1rem;
	background-color: #e2ebf0;
}
#reqbtn2{

 height:20px;

 margin-top:4px;
 font-size:13px;
 width:30px;

}
#reqmodal{
 width: 140%;
 margin-left: -121px;
 margin-top: 56px;
 }
#v-pills-prints{
min-height: 8rem !important;
 display: flex;
  align-items: center;
  justify-content: center;
}
#v-pills-authority{
min-height: 13rem !important;

}
#v-pills-authority .row{
margin-top:1%;
}
#v-pills-profile{
min-height: 32rem !important;
}

.prints{
border-radius:8px;
}

#v-pills-home{
min-height: 18rem !important;
}
#v-pills-requirement{
min-height: 13rem !important;
}
#v-pills-settings{
min-height: 13rem !important;
}
</style>
</head>
<body>

<%

Object[] ProjectDetailes=(Object[])request.getAttribute("ProjectDetailsPreview");  
/* Object[] ProjectDetailes=ProjectDetaileslist.get(0); */
List<Object[]> DetailsList=(List<Object[]>)request.getAttribute("DetailsList");  
List<Object[]> ScheduleList=(List<Object[]>)request.getAttribute("ScheduleList"); 
List<Object[]> CostList=(List<Object[]>)request.getAttribute("CostList"); 
List<Object[]> IntiationAttachment=(List<Object[]>)request.getAttribute("IntiationAttachment"); 
SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
List<Object[]> AuthorityAttachments=(List<Object[]>)request.getAttribute("AuthorityAttachment");  
List<Object[]>RequirementList=(List<Object[]>)request.getAttribute("RequirementList");

%>



<section class="header">
    <div class="container-fluid">
     
     	 <header class=" pb-1">
     	 
     	 <%if(ProjectDetailes[16]!=null){%><%if(ProjectDetailes[16].toString().equalsIgnoreCase("N")) {%>
     	 
     	 	            <h4>Project Title : <%if(ProjectDetailes[7]!=null){%><%=StringEscapeUtils.escapeHtml4(ProjectDetailes[6].toString()) %><%}else{ %>-<%} %><span style="float: right"><%if(ProjectDetailes[16]!=null){%><%if(StringEscapeUtils.escapeHtml4(ProjectDetailes[16].toString()).equalsIgnoreCase("N")) {%>Main Project : <%=ProjectDetailes[17]!=null?StringEscapeUtils.escapeHtml4(ProjectDetailes[17].toString()): " - "%><%}}else{ %>-<%} %></span> </h4>
     	 	
     	 <%} else{%>
     	 
     	 		<h4>Project Title : <%if(ProjectDetailes[7]!=null){%><%=StringEscapeUtils.escapeHtml4(ProjectDetailes[7].toString()) %> (<%=ProjectDetailes[6]!=null?StringEscapeUtils.escapeHtml4(ProjectDetailes[6].toString()): " - " %>)<%}else{ %>-<%} %><span style="float: right"><%if(ProjectDetailes[16]!=null){%><%if(StringEscapeUtils.escapeHtml4(ProjectDetailes[16].toString()).equalsIgnoreCase("N")) {%>Main Project : <%=ProjectDetailes[17]!=null?StringEscapeUtils.escapeHtml4(ProjectDetailes[17].toString()): " - "%><%}}else{ %>-<%} %></span> </h4>
     	 				
     	 <%} }%>
     	 
        </header> 
     	
        <div class="row">
            <div class="col-md-2">
                <!-- Tabs nav -->
                <div class="nav flex-column nav-pills nav-pills-custom" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link mb-3 shadow active custom_width" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                        <i class="fa fa-user-circle-o mr-2"></i>
                        <span class="font-weight-bold large text-uppercase">Initiation</span></a>

					 <a class="nav-link mb-3 shadow custom_width" id="v-pills-authority-tab" data-toggle="pill" href="#v-pills-authority" role="tab" aria-controls="v-pills-authority" aria-selected="false">
                        <i class="fa fa-id-badge mr-2" ></i>
                        <span class="font-weight-bold large text-uppercase">Authority</span></a>

                    <a class="nav-link mb-3 shadow custom_width" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                        <i class="fa fa-check mr-2"></i>
                        <span class="font-weight-bold large text-uppercase">Details</span></a>
					
<!-- 					 <a class="nav-link mb-3 shadow custom_width" id="v-pills-requirement-tab" data-toggle="pill" href="#v-pills-requirement" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                   <i class="fa fa-list-alt" aria-hidden="true"></i>
                     <span class="font-weight-bold large text-uppercase">Requirement</span></a> -->
                        
                    <a class="nav-link mb-3 shadow custom_width" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                        <i class="fa fa-star mr-2"></i>
                        <span class="font-weight-bold large text-uppercase">Cost</span></a>

                    <a class="nav-link mb-3 shadow custom_width" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                        <i class="fa fa-calendar-minus-o mr-2"></i>
                        <span class="font-weight-bold large text-uppercase">Schedule</span></a>
                     
                    <a class="nav-link mb-3 shadow custom_width" id="v-pills-attachment-tab" data-toggle="pill" href="#v-pills-attachment" role="tab" aria-controls="v-pills-attachment" aria-selected="false">
                        <i class="fa fa-paperclip mr-2"></i>
                        <span class="font-weight-bold large text-uppercase">Attachment</span></a>    
                        
                     <a class="nav-link mb-3 shadow custom_width" id="v-pills-prints-tab" data-toggle="pill" href="#v-pills-prints" role="tab" aria-controls="v-pills-prints" aria-selected="false">
                        <i class="fa fa-print mr-2" aria-hidden="true"></i>
                        <span class="font-weight-bold large text-uppercase">Prints</span></a>   

                    </div>
            </div>


            <div class="col-md-10">
                <!-- Tabs content -->
                <div class="tab-content" id="v-pills-tabContent" style="margin-left: -4%">
                
                
 <!--  **** INITIATION *********************     -->               
                
                
                    <div class="tab-pane fade shadow rounded bg-white show active p-3" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <!-- <h4 class="font-italic mb-4">Initiation</h4> -->
                        
                        <div class="row" >
	 		
			 			
			 			
			 			<div class="col-md-12" style="margin-left: 43px">
			 			
							<div class="row details">
							  <div class="column a" style="width:23%;border-bottom: 2px solid #394989;border-top-left-radius: 5px">
							    <h6>Project/Programme</h6>
							    <p><%if(ProjectDetailes[3]!=null){ if(ProjectDetailes[3].toString().equalsIgnoreCase("PRJ")){%> Project <%}if(ProjectDetailes[3].toString().equalsIgnoreCase("PGM")){ %>Program <% } }else{ %>-<%} %></p>
							  </div>
							   <div class="column b" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Category</h6>
							    <p><%if(ProjectDetailes[4]!=null){%><%=StringEscapeUtils.escapeHtml4(ProjectDetailes[4].toString())%><%}else{ %>-<%} %></p>
							  </div>
							  <div class="column a" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Security Classification</h6>
							    <p><%if(ProjectDetailes[5]!=null){%><%=StringEscapeUtils.escapeHtml4(ProjectDetailes[5].toString()) %><%}else{ %>-<%} %></p>
							  </div>
							  <div class="column b" style="width:23%;border-bottom: 2px solid #394989;border-top-right-radius: 5px">
							    <h6>Planned</h6>
							    <p><%if(ProjectDetailes[10]!=null){ if(ProjectDetailes[10].toString().equalsIgnoreCase("P")){%>Plan<%}if(ProjectDetailes[10].toString().equalsIgnoreCase("N")){%>Non-Plan<%}}else{ %>-<%} %></p>
							  </div>
							</div>
							
							<div class="row details">
								<div class="column b" style="width:23%;border-bottom: 2px solid #394989;">
								    <h6>Short Name</h6>
								    <p><%if(ProjectDetailes[6]!=null){%><%=StringEscapeUtils.escapeHtml4(ProjectDetailes[6].toString()) %><%}else{ %>-<%} %></p>
							  	</div>
								
								<div class="column a" style="width:69%;border-bottom: 2px solid #394989;">
								    <h6>Title</h6>
								    <p><%if(ProjectDetailes[7]!=null){%><%=StringEscapeUtils.escapeHtml4(ProjectDetailes[7].toString()) %><%}else{ %>-<%} %></p>
							  	</div>		
							</div>
							
							<div class="row details">
							  <div class="column a" style="width:23%;border-bottom: 4px solid #394989;border-bottom-left-radius: 5px">
							    <h6>Deliverable</h6>
							    <p><%if(ProjectDetailes[12]!=null){%>	<%=StringEscapeUtils.escapeHtml4(ProjectDetailes[12].toString()) %><%}else{ %>-<%} %></p>
							  </div>
							   <div class="column b" style="width:23%;border-bottom: 4px solid #394989;">
							    <div class="row">
							   		<div class="col">
							   			<h6>Fe Cost</h6>
							    	<p><%if(ProjectDetailes[14]!=null){%> &#8377; <%=StringEscapeUtils.escapeHtml4(ProjectDetailes[14].toString()) %><%}else{ %>-<%} %></p>
							   	</div>
							   	<div class="col">
							   			<h6>Re Cost</h6>
							    	<p><%if(ProjectDetailes[15]!=null){%> &#8377; <%=StringEscapeUtils.escapeHtml4(ProjectDetailes[15].toString()) %><%}else{ %>-<%} %></p>
							   	</div>
							   </div>
							  </div>
							  <div class="column a" style="width:23%;border-bottom: 4px solid #394989;">
							    <h6>Duration (Months)</h6>
							    <p><%if(ProjectDetailes[9]!=null){%><%=StringEscapeUtils.escapeHtml4(ProjectDetailes[9].toString()) %><%}else{ %>-<%} %></p>
							  </div>
							  <div class="column b" style="width:23%;border-bottom: 4px solid #394989;border-bottom-right-radius: 5px">
							    <h6>Multi Lab</h6>
							    <p><%if(ProjectDetailes[11]!=null){ if(ProjectDetailes[11].toString().equalsIgnoreCase("Y")){%>
							    	Yes 
							    	<%}if(ProjectDetailes[11].toString().equalsIgnoreCase("N")){%>No<%}}else{ %>-<%} %></p>
							  </div>
							</div>
			 		
			 			</div>
			 			
			 		
			 			
	 			</div>
                        
      		</div>
                    
                    
<!-- ********************AUTHORITY*********************************************** -->               
                    
                 
                <div class="tab-pane fade shadow rounded bg-white p-3" id="v-pills-authority" role="tabpanel" aria-labelledby="v-pills-authority-tab">

                        <div class="row" >
	 					<%if(!AuthorityAttachments.isEmpty()) {%>
			 			<%for(Object[] AuthorityAttachment : AuthorityAttachments ){ %>
			 			
			 			<div class="col-md-12" style="margin-left: 43px">
			 			
							<div class="row details">
							  <div class="column a" style="width:23%;border-bottom: 2px solid #394989;border-top-left-radius: 5px">
							    <h6>Authority Name</h6>
							    <p><%if(AuthorityAttachment[2]!=null){%> 
							    
							    			<% if(AuthorityAttachment[2].toString().equals("1")) {%>DRDO-HQ <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("2")) {%>Secy DRDO <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("3")) {%>Director General <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("4")) {%>Director <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("5")) {%>Centre Head <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("6")) {%>User Army <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("7")) {%>User Airforce <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("8")) {%>User Navy <%} %> 
					   						<% if(AuthorityAttachment[2].toString().equals("9")) {%>ADA  <%} %>
							    
							    <%}else{ %> - <%}%>
							    </p>
							  </div>
							   <div class="column b" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Letter Date</h6>
							    <p><%if(AuthorityAttachment[3]!=null){%><%=sdf.format(AuthorityAttachment[3]) %><%}else{ %>-<%} %></p>
							  </div>
							  <div class="column a" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Letter Number</h6>
							    <p><%if(AuthorityAttachment[4]!=null){%> <%=StringEscapeUtils.escapeHtml4(AuthorityAttachment[4].toString()) %> <%}else{ %> - <%}%></p>
							  </div>
							   <div class="column b" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Letter</h6>
 										<a  href="ProjectAuthorityDownload.htm?AuthorityFileId=<%=AuthorityAttachment[7] %>" target="_blank"><i class="fa fa-download fa-2x" style="padding: 0px 25px; margin-top: 5px"></i>
				                    </a>							 
				                </div>
				                </div>
			 			</div>
			 			<%}}else{ %>
			 			<div class="col-md-12" style="margin-left: 43px">
			 			
							<div class="row details">
							  <div class="column a" style="width:23%;border-bottom: 2px solid #394989;border-top-left-radius: 5px">
							    <h6>Authority Name</h6>
							    <p>- </p>
							  </div>
							   <div class="column b" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Letter Date</h6>
							    <p>-</p>
							  </div>
							  <div class="column a" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Letter Number</h6>
							    <p>-</p>
							  </div>
							   <div class="column b" style="width:23%;border-bottom: 2px solid #394989;">
							    <h6>Letter</h6>
							    <P>-</P>				 	
				                </div>
				                </div>
			 					</div> 
			 					<% }%>
			 			
			 		

	 			</div>
      		</div>   
                    
<!--  **** DETAILS *********************     -->
                    
                    <div class="tab-pane fade shadow rounded bg-white p-2" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                        <!-- <h4 class="font-italic mb-4">Details</h4> -->
                        
                        
                        
                        <div class="container " style="margin: 0px !important;padding: 0px !important">
						    <div class="col">
						    
						     <div class="tab-vertical">
						            <ul class="nav nav-tabs" id="myTab3" role="tablist">
						            	<li class="nav-item"> <a class="nav-link active" id="needofprj-vertical-tab" data-toggle="tab" href="#needofprj-vertical" role="tab" aria-controls="contact" aria-selected="false">Need Of Project</a> </li>
						                <li class="nav-item"> <a class="nav-link " id="req-vertical-tab" data-toggle="tab" href="#req-vertical" role="tab" aria-controls="home" aria-selected="true">Requirement</a> </li>
						                <li class="nav-item"> <a class="nav-link " id="worldscenario-vertical-tab" data-toggle="tab" href="#worldscenario-vertical" role="tab" aria-controls="home" aria-selected="true">World Scenario</a> </li>
						                <li class="nav-item"> <a class="nav-link" id="obj-vertical-tab" data-toggle="tab" href="#obj-vertical" role="tab" aria-controls="profile" aria-selected="false">Objective</a> </li>
						                <li class="nav-item"> <a class="nav-link" id="scope-vertical-tab" data-toggle="tab" href="#scope-vertical" role="tab" aria-controls="contact" aria-selected="false">Scope</a> </li>
						            	<li class="nav-item"> <a class="nav-link" id="multilab-vertical-tab" data-toggle="tab" href="#multilab-vertical" role="tab" aria-controls="contact" aria-selected="false">Multi Lab Work Share</a> </li>
						            	<li class="nav-item"> <a class="nav-link" id="earlierwork-vertical-tab" data-toggle="tab" href="#earlierwork-vertical" role="tab" aria-controls="contact" aria-selected="false">Earlier Work</a> </li>
						            	<li class="nav-item"> <a class="nav-link" id="competency-vertical-tab" data-toggle="tab" href="#competency-vertical" role="tab" aria-controls="contact" aria-selected="false">Competency Established</a> </li>
						            	<li class="nav-item"> <a class="nav-link" id="technology-vertical-tab" data-toggle="tab" href="#technology-vertical" role="tab" aria-controls="contact" aria-selected="false">Technology Challenges</a> </li>
						            	<li class="nav-item"> <a class="nav-link" id="risk-vertical-tab" data-toggle="tab" href="#risk-vertical" role="tab" aria-controls="contact" aria-selected="false">Risk Mitigation</a> </li>
						            	<li class="nav-item"> <a class="nav-link" id="proposal-vertical-tab" data-toggle="tab" href="#proposal-vertical" role="tab" aria-controls="contact" aria-selected="false">Proposal</a> </li>
						            	<li class="nav-item"> <a class="nav-link" id="realization-vertical-tab" data-toggle="tab" href="#realization-vertical" role="tab" aria-controls="contact" aria-selected="false">Realization Plan</a> </li> 
						            </ul>
						            
						            <%for(Object[] 	obj:DetailsList){ %>
						            
						            <div class="tab-content" id="myTabContent3" style="padding-top:0px">
						            	<div class="tab-pane fade " id="worldscenario-vertical" role="tabpanel" aria-labelledby="worldscenario-vertical-tab">
						                    <h3>World Scenario</h3>
						                    <hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; color:#07689f; font-family: Lato;">Brief</label>
											<p><%if(obj[24]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[24].toString()) %><%}else{ %>-<%} %></p>
											<hr>					                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[12]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[12].toString()) %><%}else{ %>-<%} %></p></div>
						                </div>
						                <div class="tab-pane fade " id="req-vertical" role="tabpanel" aria-labelledby="req-vertical-tab">
						                    <h3>Requirement</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[13]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[13].toString()) %><%}else{ %>-<%} %></p><hr>				                
										
						                </div>
						                <div class="tab-pane fade" id="obj-vertical" role="tabpanel" aria-labelledby="obj-vertical-tab">
						                    <h3>Objective</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px;font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[14]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[14].toString()) %><%}else{ %>-<%} %></p><hr>					                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[1]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[1].toString()) %><%}else{ %>-<%} %></p></div>					                
										</div>
						                <div class="tab-pane fade" id="scope-vertical" role="tabpanel" aria-labelledby="scope-vertical-tab">
						                    <h3>Scope</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[15]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[15].toString()) %><%}else{ %>-<%} %></p><hr>					                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px;; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[2]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[2].toString()) %><%}else{ %>-<%} %></p></div>					                
										</div>
						                <div class="tab-pane fade" id="multilab-vertical" role="tabpanel" aria-labelledby="multilab-vertical-tab">
						                    <h3>Multi Lab Work Share</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[16]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[16].toString()) %><%}else{ %>-<%} %></p><hr>				                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-family: Lato; 	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[3]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[3].toString()) %><%}else{ %>-<%} %></p></div>					                
										</div>
						                <div class="tab-pane fade" id="earlierwork-vertical" role="tabpanel" aria-labelledby="earlierwork-vertical-tab">
						                    <h3>Earlier Work</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px;; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[17]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[17].toString()) %><%}else{ %>-<%} %></p><hr>					                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px;; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[4]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[4].toString()) %><%}else{ %>-<%} %></p></div>					                
										</div>
						                <div class="tab-pane fade" id="competency-vertical" role="tabpanel" aria-labelledby="competency-vertical-tab">
						                    <h3>Competency Established</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px;; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[18]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[18].toString()) %><%}else{ %>-<%} %></p><hr>				                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[5]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[5].toString()) %><%}else{ %>-<%} %></p></div>						                
										</div>
						                <div class="tab-pane fade show active" id="needofprj-vertical" role="tabpanel" aria-labelledby="needofprj-vertical-tab">
						                    <h3>Need Of Project</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[19]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[19].toString()) %><%}else{ %>-<%} %></p><hr>					                
											<div>
											<label style="margin-top:0px; margin-bottom:0px;; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[6]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[6].toString()) %><%}else{ %>-<%} %></p></div>					                
											</div>
						                <div class="tab-pane fade" id="technology-vertical" role="tabpanel" aria-labelledby="technology-vertical-tab">
						                    <h3>Technology Challenges</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[20]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[20].toString()) %><%}else{ %>-<%} %></p><hr>					                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[7]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[7].toString())%><%}else{ %>-<%} %></p></div>					                
										</div>
						                <div class="tab-pane fade" id="risk-vertical" role="tabpanel" aria-labelledby="risk-vertical-tab">
						                    <h3>Risk Mitigation</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[21]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[21].toString()) %><%}else{ %>-<%} %></p><hr>				                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[8]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[8].toString()) %><%}else{ %>-<%} %></p></div>					                
										</div>
						                <div class="tab-pane fade" id="proposal-vertical" role="tabpanel" aria-labelledby="proposal-vertical-tab">
						                    <h3>Proposal</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[22]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[22].toString()) %><%}else{ %>-<%} %></p><hr>					                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[9]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[9].toString()) %><%}else{ %>-<%} %></p></div>					                
										</div>
						                <div class="tab-pane fade" id="realization-vertical" role="tabpanel" aria-labelledby="realization-vertical-tab">
						                    <h3>Realization Plan</h3><hr>
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800;font-size: 20px; font-family: Lato; color:#07689f;">Brief</label>
											<p><%if(obj[23]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[23].toString()) %><%}else{ %>-<%} %></p><hr>					                
											<div style="">
											<label style="margin-top:0px; margin-bottom:0px; margin-left:0px;font-weight: 800; font-family: Lato;	font-size: 20px; color:#07689f;">Detailed</label>
											<p><%if(obj[10]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[10].toString()) %><%}else{ %>-<%} %></p></div>						                
										</div>
						            </div>
						            
						            <%} %>
						            
						        </div>
						        
						    </div>
						</div>    
                    </div>
                    <!--****Requirements****-->
                    
                                 <div class="tab-pane fade shadow rounded bg-white p-3" id="v-pills-requirement" role="tabpanel" aria-labelledby="v-pills-requirement-tab">

                    
	 				       
				               
				                <div class="table-responsive" <%if(RequirementList !=null){%> style="height:300px;overflow:auto;"<%}else{ %>style="height:63px;"<%} %>>
				                    <table class="table">
				                        <thead class="thead" style="color:white!important;background-color: #055C9D;top:-2px; position: sticky; ">
				                            <tr>
<!-- 				                                <th> <label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span> </label> </th>
 -->				                            <th style="width:15%; text-align:center;">ID</th>
				                                <th style="width:55%; text-align:center; ">Brief</th>
				                                <th style="width:20%; text-align:center;">Description</th>
				                            </tr>
				                        </thead>
				                      <tbody class="customtable" >
				                        <%if(RequirementList !=null){
				                          for(Object []obj :RequirementList){%>
				                          <tr>
				                 						<td><%=obj[1]!=null?StringEscapeUtils.escapeHtml4(obj[1].toString()): " - " %></td>
				                 		          		<td><%=obj[3]!=null?StringEscapeUtils.escapeHtml4(obj[3].toString()): " - " %></td>
				                 		          		<td style="text-align: center;">
				                 		          		<input type="hidden" id="Req<%=obj[0]%>" value ="<%=obj[4] %>" />
					<button type="button" class=""    id="reqbtn2" onclick="showdata('<%=obj[0]%>','<%=obj[1]%>')"   >
<!-- 				<i class="fa fa-eye" aria-hidden="true" style="color:orange; font-size: 10px; float:right;"></i>  -->
					<div class="cc-rockmenu">
					 <div class="rolling">
					<figure class="rolling_icon"><img src="view/images/preview3.png" style="width:18px;" ></figure>
					</div> 
					</button>
				    </td>
				                           </tr>
				                           <%} }%>
				                        </tbody> 
				                    </table>
				                </div>
				                
				                
				                
				         
					<div class="modal fade  bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true" style="">
 						 <div class="modal-dialog modal-lg" role="document">
    						<div class="modal-content" id="reqmodal">
      						<div class="modal-header" style="background: antiquewhite;">
     			  			 <h5 class="modal-title" id="exampleModalLongTitle" style="font-family: 'Lato',sans-serif;color: #005086; font-size:28px; ">
     					  	<b>Requirement Description</b> </h5><span style="font-family: 'Lato',sans-serif;color: #005086; margin-left:5px;margin-top:20px; font-size:12px; float:right;">(<b id="reqid"></b>)</span>
       					 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        				  <span aria-hidden="true">&times;</span>
       						 </button>
    					  </div>
     						 <div class="modal-body" style="padding:0px;background: aliceblue;" >
     						        <div id="reqmodalbody" style="text-align:justify;!important; padding:20px ;font-family: 'Lato'"> </div>
    								  </div>
  								  </div>
  									</div>
										</div>
					
	 		
                        
      		</div>  
                    
 <!--  **** COST *********************     -->                   
                    
                    <div class="tab-pane fade shadow rounded bg-white p-3" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                       <!--  <h4 class="font-italic mb-4">Cost</h4> -->
                        
                        <div class="row">
				        <div class="col-12">
				            <div class="card">
				               
				                <div class="table-responsive">
				                    <table class="table">
				                        <thead class="thead" style="color:white!important;background-color: #055C9D">
				                            <tr>
<!-- 				                                <th> <label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span> </label> </th>
 -->				                            <th scope="col" >Budget Head</th>
				                                <th scope="col">Head of Accounts</th>
				                                <th scope="col">Item Detail</th>
				                                <th scope="col">Item Cost (In Lakhs)</th>
				                                
				                            </tr>
				                        </thead>
				                        <tbody class="customtable">
				                        
				                        	<%for(Object[] 	obj:CostList){ %>
				                            <tr>
<!-- 				                                <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> <span class="checkmark"></span> </label> </th>
 -->				                                     
				                                <td><%if(obj[0]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[0].toString()) %><%}else{ %>-<%} %></td>
				                                <td><%if(obj[1]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[1].toString())%> (<%=obj[4]!=null?StringEscapeUtils.escapeHtml4(obj[4].toString()): " - "%>)<%}else{ %>-<%} %></td>
				                                <td><%if(obj[2]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[2].toString()) %><%}else{ %>-<%} %></td>
				                                <td class="right">&#8377; <%if(obj[3]!=null && Double.parseDouble(StringEscapeUtils.escapeHtml4(obj[3].toString()))>0){%><%=Double.parseDouble(StringEscapeUtils.escapeHtml4(obj[3].toString()))/100000 %> Lakhs<%}else{ %>0.00<%} %></td>
				                    
				                            </tr>
				                            
				                             	<%} %> 	
				                           
				                        </tbody>
				                    </table>
				                </div>
				            </div>
				        </div>
				    </div>

                    </div>
                    
                    
     <!--  **** SCHEDULE *********************     -->           
                    
                    <div class="tab-pane fade shadow rounded bg-white p-3" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                       <!--  <h4 class="font-italic mb-4">Schedule</h4> -->
                        
                     
				               
				              
				                    <table class="table" id="scheduleTable">
				                        <thead class="thead" style="color:white!important;background-color: #055C9D">
				                            <tr>
<!-- 				                                <th> <label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span> </label> </th>
 -->				                            <th scope="col" class="center" style="width: 12%;">Milestone No</th>
				                                <th scope="col " style="width: 74%;">Milestone Activity</th>
				                                <th scope="col" class="center">Milestone Month</th>
				                                
				                            </tr>
				                        </thead>
				                        <tbody class="customtable">
				                        
				                        	<%for(Object[] 	obj:ScheduleList){ %>
				                            <tr>
<!-- 				                                <th> <label class="customcheckbox"> <input type="checkbox" class="listCheckbox"> <span class="checkmark"></span> </label> </th>
 -->				                                     
				                                <td class="center"><%if(obj[0]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[0].toString()) %><%}else{ %>-<%} %></td>
				                                <td><%if(obj[1]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[1].toString()) %><%}else{ %>-<%} %></td>
				                                <td class="center"><%if(obj[2]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[2].toString()) %><%}else{ %>-<%} %></td>
				                    
				                            </tr>
				                            
				                             	<%} %> 	
				                           
				                        </tbody>
				                    </table>
				                    


						</div>
                    
         
         <!-- ********* ATTACHMENT *****************  -->           
                    
                    <div class="tab-pane fade shadow rounded bg-white p-3" id="v-pills-attachment" role="tabpanel" aria-labelledby="v-pills-attachment-tab">
                       <!--  <h4 class="font-italic mb-4">Schedule</h4> -->
                        
                        <div class="row">
				        <div class="col-12">
				            <div class="card">
				               
				                <div class="table-responsive">
				                    <table class="table">
				                        <thead class="thead" style="color:white!important;background-color: #055C9D">
				                            <tr>
				                            <th scope="col" >File Name</th>
				                            <th scope="col" >Created By</th>
				                            <th scope="col" >Created Date</th>
				                            <th class="center" scope="col">Download</th>
				                            
				                                
				                            </tr>
				                        </thead>
				                        <tbody class="customtable">
				                        
				                        	<%for(Object[] 	obj:IntiationAttachment){ %>
				                            <tr>
				                                     
				                                <td class="left"><%if(obj[2]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[2].toString()) %><%}else{ %>-<%} %></td>
				                                <td><%if(obj[4]!=null){%><%=StringEscapeUtils.escapeHtml4(obj[4].toString()) %><%}else{ %>-<%} %></td>
				                                <td class="left"><%if(obj[5]!=null){%><%=sdf1.format(StringEscapeUtils.escapeHtml4(obj[5].toString())) %><%}else{ %>-<%} %></td>
				                    			 <td class="center"><div ><a  href="ProjectAttachDownload.htm?InitiationAttachmentId=<%=obj[6]%>" target="_blank"><i class="fa fa-download"></i></a></div> </td>	
				                    			
				                            </tr>
				                            
				                             	<%} %> 	
				                           
				                        </tbody>
				                    </table>
				                </div>
				               
				            </div>
		
				        </div>
				    </div>
                        
                        
                    </div>
                    
                   
                     <!-- ********* PRINTS *****************  -->  
                    
                    
                    <div class="tab-pane fade shadow rounded bg-white p-3" id="v-pills-prints" role="tabpanel" aria-labelledby="v-pills-print-tab">

                        <div class="row">
				        <div class="col-12">
				         
				                <form action="" method="POST" name="myfrm" id="myfrm">
			
				                	<button type="submit" class="btn btn-warning btn-sm prints" formmethod="GET" formaction="ExecutiveSummaryDownload.htm" formtarget="_blank"   >Print Executive Summary</button>&nbsp;&nbsp;
							 
							 		<button type="submit" class="btn btn-warning btn-sm prints" formmethod="GET" formaction="ProjectProposalDownload.htm" formtarget="_blank"  >Print Project Proposal</button>&nbsp;&nbsp;
				                
				                	<button type="submit" class="btn" formaction="ProjectProposal.htm" formtarget="_blank" formmethod="POST" style="border:none"  data-toggle="tooltip" data-placement="top" title="Project Presentation"><img alt="" src="view/images/presentation.png" style="width:19px !important"></button>&nbsp;&nbsp;
				                		
									 <button type="submit" class="btn" formmethod="GET" style="background: transparent" formtarget="_blank" formaction="ProposalPresentationDownload.htm" data-toggle="tooltip" data-placement="right" title="Project Presentation Download"><i class="fa fa-download fa-lg" aria-hidden="true"></i></button>
					  
				                	<input type="hidden" name="IntiationId"	value="<%=ProjectDetailes[0] %>" /> 
				                	
				                	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /> 
				                	
				                </form>
		
				        </div>
				    </div>
                        
                        
                    </div>
                    
                    
                    
                    
                    
                    
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
function showdata(reqid,reqid1){
	console.log($('#Req'+reqid).val());
    $('#exampleModalLong').modal('show');
    document.getElementById('reqmodalbody').innerHTML =$('#Req'+reqid).val();
    document.getElementById('reqid').innerHTML =reqid1;
}
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})


</script>

</body>
</html>