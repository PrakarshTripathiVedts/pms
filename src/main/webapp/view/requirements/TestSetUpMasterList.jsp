<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.vts.pfms.requirements.model.TestInstrument"%>
<%@page import="com.vts.pfms.requirements.model.TestSetupMaster"%>
<%@page import="com.vts.pfms.NFormatConvertion"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.*,com.vts.*,java.text.SimpleDateFormat"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../static/header.jsp"></jsp:include>
<spring:url value="/resources/ckeditor/ckeditor.js" var="ckeditor" />
<spring:url value="/resources/ckeditor/contents.css" var="contentCss" />
<script src="${ckeditor}"></script>
<link href="${contentCss}" rel="stylesheet" />


<spring:url value="/resources/summernote-lite.js" var="SummernoteJs" />

<spring:url value="/resources/summernote-lite.css" var="SummernoteCss" />
<spring:url value="/resources/css/sweetalert2.min.css" var="sweetalertCss" />
<spring:url value="/resources/js/sweetalert2.min.js" var="sweetalertJs" />
	<link href="${sweetalertCss}" rel="stylesheet" />
	<script src="${sweetalertJs}"></script>
<script src="${SummernoteJs}"></script>

<link href="${SummernoteCss}" rel="stylesheet" />



<spring:url value="/resources/pdfmake/pdfmake.min.js" var="pdfmake" />
<script src="${pdfmake}"></script>
<spring:url value="/resources/pdfmake/vfs_fonts.js" var="pdfmakefont" />
<script src="${pdfmakefont}"></script>
<spring:url value="/resources/pdfmake/htmltopdf.js" var="htmltopdf" />
<script src="${htmltopdf}"></script>
<title>PMS</title>
<style type="text/css">
label {
	font-weight: bold;
	font-size: 13px;
}

.table .font {
	font-family: 'Muli', sans-serif !important;
	font-style: normal;
	font-size: 13px;
	font-weight: 400 !important;
}

.table button {
	background-color: Transparent !important;
	background-repeat: no-repeat;
	border: none;
	cursor: pointer;
	overflow: hidden;
	outline: none;
	text-align: left !important;
}

.table td {
	padding: 5px !important;
}

.resubmitted {
	color: green;
}

.fa {
	font-size: 1.20rem;
}

.datatable-dashv1-list table tbody tr td {
	padding: 8px 10px !important;
}

.table-project-n {
	color: #005086;
}

#table thead tr th {
	padding: 0px 0px !important;
}

#table tbody tr td {
	padding: 2px 3px !important;
}

/* icon styles */
.cc-rockmenu {
	color: fff;
	padding: 0px 5px;
	font-family: 'Lato', sans-serif;
}

.cc-rockmenu .rolling {
	display: inline-block;
	cursor: pointer;
	width: 34px;
	height: 30px;
	text-align: left;
	overflow: hidden;
	transition: all 0.3s ease-out;
	white-space: nowrap;
}

.cc-rockmenu .rolling:hover {
	width: 108px;
}

.cc-rockmenu .rolling .rolling_icon {
	float: left;
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
	font-family: 'Muli', sans-serif;
}

.cc-rockmenu .rolling p {
	margin: 0;
}

.width {
	width: 270px !important;
}
      @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>
</head>
<body>
<%
List<TestSetupMaster>master = (List<TestSetupMaster>)request.getAttribute("testSetupMasterMaster");
List<TestInstrument>instrumentList = (List<TestInstrument>)request.getAttribute("instrumentList");

Object[] DocTempAtrr = (Object[])request.getAttribute("DocTempAttributes");
Object[]LabList=(Object[])request.getAttribute("LabList");
String lablogo = (String)request.getAttribute("lablogo");
String drdologo = (String)request.getAttribute("drdologo");
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


<div id="loadingOverlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 9999; justify-content: center; align-items: center; flex-direction: column; color: white; font-size: 20px; font-weight: bold;">
    <div class="spinner" style="border: 4px solid rgba(255, 255, 255, 0.3); border-top: 4px solid #021B79; border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite; margin-bottom: 10px;"></div>
    Please wait while we are generating the PDF...
</div>	

	<div class="container-fluid">
		<div class="col-md-12">

			<div class="card shadow-nohover">
				<div class="card-header">
					<div class="row">
						<div class="col-md-5">
							<h4>
								<b>Test SetUp Master List</b>
							</h4>
						</div>
						<div class="col-md-1" style="margin-top:-10px">
						<button class="btn btn-primary" onclick="DownloadDocPDF()" style="margin-top:-1%"><img alt="" src="view/images/pdf.png"  style="width:25px"></button> 
						</div>
					</div>
				</div>

				<form action="TestSetMasterAdd.htm" method="post" name="frm1">
					<div class="card-body">
						<div class="table-responsive">
							<table
								class="table table-bordered table-hover table-striped table-condensed"
								id="myTable">
								<thead style="text-align: center;">
									<tr>
									<th>Select</th>
									<th>Test SetUp Id</th>
									<th>Objective</th>
									<th>Specific Facility Required</th> 
								<!-- 	<th>Instruments Required</th> -->
									</tr>
								</thead>
								<tbody>
								<%if(master!=null && !master.isEmpty()) {
								for(TestSetupMaster t:master){
								%>
								<tr>
								<td align="center">
								<input type="radio" name="Did" value=<%=t.getSetupId()!=null?StringEscapeUtils.escapeHtml4(t.getTestSetUp()) : ""%>  > 
								</td>
								
								<td style="text-align: center;"> <%=t.getTestSetUpId()!=null?StringEscapeUtils.escapeHtml4(t.getTestSetUpId()) : " - " %> </td>
								<td style="text-align: left;"> <%=t.getObjective()!=null?StringEscapeUtils.escapeHtml4(t.getObjective()) : " - " %> </td>
								<td style="text-align: left;"> <%=t.getFacilityRequired()!=null?StringEscapeUtils.escapeHtml4(t.getFacilityRequired()) : " - " %> </td>
						<%-- 		<td>
								
								<%
								StringBuilder sb = new StringBuilder("");
								if(t.getTestInstrument()!=null && t.getTestInstrument().length()>0) {
								List<String>list = Arrays.asList(t.getTestInstrument().split(", "));
									
									if(instrumentList!=null){
										int count=0;
									for(TestInstrument i:instrumentList){
										if(list.contains(i.getInstrumentId().toString())){
											count++;
											sb.append(count+". "+i.getInstrumentName().toString()+" ");
											sb.append("<br>");
										}
									}
									}
								%>
								
								
								<%} %>
								
								<%=sb %>
								</td> --%>
								</tr>
								<%}} %>
								</tbody>
							</table>
						</div>

						<div align="center">

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="button-group">
								<button type="submit" class="btn btn-primary btn-sm add"
									name="sub" value="add">ADD</button>
								<button type="submit" class="btn btn-primary btn-sm edit"
									name="sub" value="edit" onclick="Edit(frm1)">EDIT</button>
									
							<button type="submit" class="btn btn-danger btn-sm delete"
									name="sub" value="delete" onclick="return deleteTestSetUp(frm1)">DELETE</button>
								<a class="btn btn-info btn-sm back" href="MainDashBoard.htm">Back</a>
							</div>
						</div>
					</div>
				</form>






			</div>
		</div>

	</div>






	<div class="modal" id="loader">
		<!-- Place at bottom of page -->
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#myTable").DataTable({
				'aoColumnDefs' : [ {
					'bSortable' : false,

					'aTargets' : [ -1 ]
				/* 1st one, start by the right */
				} ]
			});
		});
		
		function Edit(myfrm){

			 var fields = $("input[name='Did']").serializeArray();

			  if (fields.length === 0){
			alert("Please Select A Record");
			 event.preventDefault();
			return false;
			}
				  return true;	
			}
		
		
		function deleteTestSetUp(frm1){
			 var fields = $("input[name='Did']").serializeArray();

			  if (fields.length === 0){
				Swal.fire({
		    	icon: "error",
		        text: "Please select  one for removing !",
		    	});
			 	event.preventDefault();
				return false;
			}
			  
			  return confirm("Are you sure to delete?");
			}
		
		
		
		
		

		function DownloadDocPDF(){

			 document.getElementById('loadingOverlay').style.display = 'flex';;
			var chapterCount = 0;
		    var mainContentCount = 0;
			var leftSideNote = '<%if(DocTempAtrr!=null && DocTempAtrr[12]!=null) {%><%=StringEscapeUtils.escapeHtml4(DocTempAtrr[12].toString()).replaceAll("'", "\\\\'").replaceAll("\"", "\\\\\"").replaceAll("\n", "<br>").replaceAll("\r", "") %> <%} else{%>-<%}%>';
			
			var docDefinition = {
		            content: [
		                // Cover Page with Project Name and Logo
		                {
		                    text: htmlToPdfmake('<h4 class="heading-color ">Test SetUp Document </h4>'),
		                    style: 'DocumentName',
		                    alignment: 'center',
		                    fontSize: 18,
		                    margin: [0, 200, 0, 20]
		                },
		                <% if (lablogo != null) { %>
		                {
		                    image: 'data:image/png;base64,<%= lablogo %>',
		                    width: 95,
		                    height: 95,
		                    alignment: 'center',
		                    margin: [0, 20, 0, 30]
		                },
		                <% } %>
		                
		                {
		                    text: htmlToPdfmake('<h5><% if (LabList != null && LabList[1] != null) { %> <%= StringEscapeUtils.escapeHtml4(LabList[1].toString()).replaceAll("'", "\\\\'").replaceAll("\"", "\\\\\"").replaceAll("\n", "<br>").replaceAll("\r", "") + "(" + (LabList[0]!=null?StringEscapeUtils.escapeHtml4(LabList[0].toString()).replaceAll("'", "\\\\'").replaceAll("\"", "\\\\\"").replaceAll("\n", "<br>").replaceAll("\r", ""):" - ") + ")" %> <% } else { %> '-' <% } %></h5>'),
		                    alignment: 'center',
		                    fontSize: 16,
		                    bold: true,
		                    margin: [0, 20, 0, 20]
		                },
		                {
		                    text: htmlToPdfmake('<h6>Government of India, Ministry of Defence<br>Defence Research & Development Organization </h6>'),
		                    alignment: 'center',
		                    fontSize: 14,
		                    bold: true,
		                    margin: [0, 10, 0, 10]
		                },
		                {
		                    text: htmlToPdfmake('<h6><%if(LabList!=null && LabList[2]!=null && LabList[3]!=null && LabList[5]!=null){ %><%=StringEscapeUtils.escapeHtml4(LabList[2].toString())+" , "+StringEscapeUtils.escapeHtml4(LabList[3].toString())+", PIN-"+StringEscapeUtils.escapeHtml4(LabList[5].toString()) %><%}else{ %>-<%} %></h6>'),
		                    alignment: 'center',
		                    fontSize: 14,
		                    bold: true,
		                    margin: [0, 10, 0, 10]
		                },
		                // Table of Contents
		                {
		                    toc: {
		                        title: { text: 'INDEX', style: 'header', pageBreak: 'before' }
		                    }
		                
		                },
		                {
		                    text: '',
		                    pageBreak: 'before'
		                },
		                <% if(master!=null && !master.isEmpty()){
			                
			                int speccount=0;
			                
			                for(TestSetupMaster t:master){
			                	int snCount=0;
			                %>
			                
			            	{
		            		    text: [
		            		        {
		            		            text: '<%=++speccount %>. <%=t.getTestSetUpId()!=null?StringEscapeUtils.escapeHtml4(t.getTestSetUpId()) : ""  %> ',
		            		            tocItem: true ,// Only this text goes to TOC
		            		        },
		            		       
		            		    ],
		            		    style: 'chapterSubHeader',
		            		    id: 'chapter-<%=speccount %>',
		            		    tocMargin: [10, 0, 0, 0],
		            		  
		            		},
		            		
		            		
		   					{
	            				table : {
	            					headerRows : 1,
	            					widths: ['10%', '25%', '65%'],
	    	                        body: [
	    	                            // Table header
	    	                            [
	    	                                { text: 'SN', style: 'tableHeader' },
	    	                                { text: 'Attribute', style: 'tableHeader' },
	    	                                { text: 'Content', style: 'tableHeader' },
	    	                            ],
	    	                         	// Populate table rows
	    	                            [
	    	                                { text: '<%=++snCount %>.', style: 'tableData', alignment: 'center' },
	    	                                { text: 'Id', style: 'tableData' },
	    	                                { text: '<%=t.getTestSetUpId()!=null?StringEscapeUtils.escapeHtml4(t.getTestSetUpId()) :"-" %>', style: 'tableData' },
	    	                            ],
	    	                            [
	    	                                { text: '<%=++snCount %>.', style: 'tableData', alignment: 'center' },
	    	                                { stack: [htmlToPdfmake(setImagesWidth('<p style="font-weight:bold;text-align:left;">Objective</p>'+ '<%if(t.getObjective() !=null){ %> <%=StringEscapeUtils.escapeHtml4(t.getObjective()).trim().replaceAll("'", "\\\\'").replaceAll("\"", "\\\\\"").replaceAll("\n", "<br>").replaceAll("\r", "") %> <%}else{ %>-<%} %>', 500))], colSpan: 2 }
	    	                            ],
	    	                            [
	    	                                { text: '<%=++snCount %>.', style: 'tableData', alignment: 'center' },
	    	                                { text: 'Specific Facility Required ', style: 'tableData' },
	    	                                { text: '<%=t.getFacilityRequired()!=null?StringEscapeUtils.escapeHtml4(t.getFacilityRequired()):"-" %>', style: 'tableData' },
	    	                            ],
	    	                            
	    	                            [
	    	                                { text: '<%=++snCount %>.', style: 'tableData', alignment: 'center' },
	    	                                { text: 'Test Instrument', style: 'tableData' },
	    	                                { text: '<%=t.getTestInstrument()!=null?instrumentList.stream().filter(e->Arrays.asList(t.getTestInstrument().split(", ")).contains(e.getInstrumentId()+"")).map(e->e.getInstrumentName()).collect(Collectors.toList()).toString().replace("[", "").replace("]", ""):"-" %>', style: 'tableData' },
	    	                            ],
	    	                            
	    	                            [
	    	                                { text: '<%=++snCount %>.', style: 'tableData', alignment: 'center' },
	    	                                { stack: [htmlToPdfmake(setImagesWidth('<p style="font-weight:bold;text-align:center;">Test Set UP</p>'+ '<%if(t.getTestSetUp()!=null){ %> <%=StringEscapeUtils.escapeHtml4(t.getTestSetUp()).trim().replaceAll("'", "\\\\'").replaceAll("\"", "\\\\\"").replaceAll("\n", "<br>").replaceAll("\r", "") %> <%}else{ %>-<%} %>', 500))], colSpan: 2 }
	    	                            ],
	    	                            
	    	                            [
	    	                                { text: '<%=++snCount %>.', style: 'tableData', alignment: 'center' },
	    	                                { stack: [htmlToPdfmake(setImagesWidth('<p style="font-weight:bold;text-align:center;">Test Procedure</p>'+ '<%if(t.getTestProcedure()!=null){ %> <%=StringEscapeUtils.escapeHtml4(t.getTestProcedure()).trim().replaceAll("'", "\\\\'").replaceAll("\"", "\\\\\"").replaceAll("\n", "<br>").replaceAll("\r", "") %> <%}else{ %>-<%} %>', 500))], colSpan: 2 }
	    	                            ],
	    	                            
	    	                        <%--     [
	    	                                { text: '<%=++snCount %>.', style: 'tableData', alignment: 'center' },
	    	                                { stack: [htmlToPdfmake(setImagesWidth('<p style="font-weight:bold;text-align:center;">Technical Data Record Sheet (TDRS)</p>'+ '<%if(t.getTdrsData()!=null){ %> <%=t.getTdrsData().trim().replaceAll("'", "\\\\'").replaceAll("\"", "\\\\\"").replaceAll("\n", "<br>").replaceAll("\r", "") %> <%}else{ %>-<%} %>', 500))], colSpan: 2 }
	    	                            ], --%>
	    	                        ],
	    	                    },
	    	                    layout: {

	    	                        hLineWidth: function(i, node) {
	    	                            return (i === 0 || i === node.table.body.length) ? 1 : 0.5;
	    	                        },
	    	                        vLineWidth: function(i) {
	    	                            return 0.5;
	    	                        },
	    	                        hLineColor: function(i) {
	    	                            return '#aaaaaa';
	    	                        },
	    	                        vLineColor: function(i) {
	    	                            return '#aaaaaa';
	    	                        }
	    	                    }
        					},
        					{ text: '\n',},
			                
			                <%}}%>
		      
		                ],
					
					/* last */
		            styles: {
		                DocumentName: { fontSize: 18, bold: true, margin: [0, 0, 0, 10] },
		                chapterHeader: { fontSize: 16, bold: true, margin: [0, 0, 0, 10] },
		                chapterNote: { fontSize: 13, bold: true, margin: [0, 10, 0, 10]},
		                chapterSubHeader: { fontSize: 13, bold: true, margin: [10, 10, 0, 10]},
		                tableHeader: { fontSize: 12, bold: true, fillColor: '#f0f0f0', alignment: 'center', margin: [10, 5, 10, 5], fontWeight: 'bold' },
		                tableData: { fontSize: 11.5, margin: [0, 5, 0, 5] },
		                chapterSubSubHeader: { fontSize: 12, bold: true, margin: [15, 10, 10, 10] },
		                subChapterNote: { margin: [15, 15, 0, 10] },
		                header: { alignment: 'center', bold: true},
		                chapterContent: {fontSize: 11.5, margin: [0, 5, 0, 5] },
		            },
		            info: {
		                title: 'Test SetUp Document', // Set document title here
		                author: 'LRDE', // Optional metadata
		                subject: 'Subject of the PDF',       // Optional metadata
		                keywords: 'keyword1, keyword2',     // Optional metadata
		            },
		            footer: function(currentPage, pageCount) {
		                if (currentPage > 2) {
		                    return {
		                        stack: [
		                        	{
		                                canvas: [{ type: 'line', x1: 30, y1: 0, x2: 565, y2: 0, lineWidth: 1 }]
		                            },
		                            {
		                                columns: [
		                                    { text: currentPage.toString() + ' of ' + pageCount, alignment: 'right', margin: [0, 0, 30, 0], fontSize: 8 }
		                                ]
		                            },
		                            { text: 'Restricted', alignment: 'center', fontSize: 8, margin: [0, 5, 0, 0], bold: true }
		                        ]
		                    };
		                }
		                return '';
		            },
		            header: function (currentPage) {
		                return {
		                    stack: [
		                        
		                        {
		                            columns: [
		                                {
		                                    // Left: Lab logo
		                                    image: '<%= lablogo != null ? "data:image/png;base64," + lablogo : "" %>',
		                                    width: 30,
		                                    height: 30,
		                                    alignment: 'left',
		                                    margin: [35, 10, 0, 10]
		                                },
		                                {
		                                    // Center: Text
		                                    text: 'Restricted',
		                                    alignment: 'center',
		                                    fontSize: 10,
		                                    bold: true,
		                                    margin: [0, 10, 0, 0]
		                                },
		                                {
		                                    // Right: DRDO logo
		                                    image: '<%= drdologo != null ? "data:image/png;base64," + drdologo : "" %>',
		                                    width: 30,
		                                    height: 30,
		                                    alignment: 'right',
		                                    margin: [0, 10, 20, 10]
		                                }
		                            ]
		                        },
		                        
		                    ]
		                };
		            },
					pageMargins: [50, 50, 30, 40],
		            
		            background: function(currentPage) {
		                return [
		                    {
		                        image: generateRotatedTextImage(leftSideNote),
		                        width: 100, // Adjust as necessary for your content
		                        absolutePosition: { x: -10, y: 50 }, // Position as needed
		                    }
		                ];
		            },
		            watermark: { text: 'DRAFT', opacity: 0.1, bold: true, italics: false, fontSize: 80,  },
		           
		            defaultStyle: { fontSize: 12, color: 'black', }
		        };
				
			 pdfMake.createPdf(docDefinition).getBlob((blob) => {
		         // Create a URL for the blob
		         const url = URL.createObjectURL(blob);

		         // Open the PDF in a new tab
		         window.open(url, '_blank');

		         // Hide the loading spinner
		           document.getElementById('loadingOverlay').style.display='none';
		           window.close();
		     });
		}

		const setImagesWidth = (htmlString, width) => {
		    const container = document.createElement('div');
		    container.innerHTML = htmlString;
		  
		    const images = container.querySelectorAll('img');
		    images.forEach(img => {
		      img.style.width = width + 'px';
		      img.style.textAlign = 'center';
		    });
		  
		    const textElements = container.querySelectorAll('p, h1, h2, h3, h4, h5, h6, span, div, td, th, table, figure, hr, ul, li, a');
		    textElements.forEach(element => {
		      if (element.style) {
		        element.style.fontFamily = '';
		        element.style.margin = '';
		        element.style.marginTop = '';
		        element.style.marginRight = '';
		        element.style.marginBottom = '';
		        element.style.marginLeft = '';
		        element.style.lineHeight = '';
		        element.style.height = '';
		        element.style.width = '';
		        element.style.padding = '';
		        element.style.paddingTop = '';
		        element.style.paddingRight = '';
		        element.style.paddingBottom = '';
		        element.style.paddingLeft = '';
		        element.style.fontSize = '';
		        element.id = '';
		        
		        const elementColor = element.style.color;
		        if (elementColor && elementColor.startsWith("var")) {
		            // Replace `var(...)` with a fallback or remove it
		            element.style.color = 'black'; // Default color
		        }
		        
		        const elementbackgroundColor = element.style.backgroundColor;
		        if (elementbackgroundColor && elementbackgroundColor.startsWith("var")) {
		            // Replace `var(...)` with a fallback or remove it
		            element.style.backgroundColor = 'transparent'; // Set a default or fallback background color
		        }
		        
		      }
		    });
		  
		    const tables = container.querySelectorAll('table');
		    tables.forEach(table => {
		      if (table.style) {
		        table.style.borderCollapse = 'collapse';
		        table.style.width = '100%';
		      }
		  
		      const cells = table.querySelectorAll('th, td');
		      cells.forEach(cell => {
		        if (cell.style) {
		          cell.style.border = '1px solid black';
		  
		          if (cell.tagName.toLowerCase() === 'th') {
		            cell.style.textAlign = 'center';
		          }
		        }
		      });
		    });
		  
		    return container.innerHTML;
		}; 
			
		function splitTextIntoLines(text, maxLength) {
			const lines = [];
		  	let currentLine = '';

			for (const word of text.split(' ')) {
				if ((currentLine + word).length > maxLength) {
			    	lines.push(currentLine.trim());
			    	currentLine = word + ' ';
				} else {
				  currentLine += word + ' ';
				}
			}
		  	lines.push(currentLine.trim());
		  	return lines;
		}

		// Generate rotated text image with line-wrapped text
		function generateRotatedTextImage(text) {
			const maxLength = 260;
			const lines = splitTextIntoLines(text, maxLength);
			
			const canvas = document.createElement('canvas');
			const ctx = canvas.getContext('2d');
			
			// Set canvas dimensions based on anticipated text size and rotation
			canvas.width = 200;
			canvas.height = 1560;
			
			// Set text styling
			ctx.font = '14px Roboto';
			ctx.fillStyle = 'rgba(128, 128, 128, 1)'; // Gray color for watermark
			
			// Position and rotate canvas
			ctx.translate(80, 1480); // Adjust position as needed
			ctx.rotate(-Math.PI / 2); // Rotate 270 degrees
			
			// Draw each line with a fixed vertical gap
			const lineHeight = 20; // Adjust line height if needed
			lines.forEach((line, index) => {
			  ctx.fillText(line, 0, index * lineHeight); // Position each line below the previous
			});
			
			return canvas.toDataURL();
		}
	</script>

</body>
</html>