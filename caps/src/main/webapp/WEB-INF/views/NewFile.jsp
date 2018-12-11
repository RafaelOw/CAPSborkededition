<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value='/js/DataTables/Bootstrap-3.3.7/css/bootstrap.min.css'/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/js/DataTables/datatables.min.css'/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
<div class="container">
	<div class="row" style="color:black;">
		<div class="col-xs-12">
			<h1>Selected Courses</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<c:if test="${fn:length(courses) gt 0}">
				<table class="borderAll" id="selectedCourse">
					<thead>
					<tr>
						<th><s:message code="label.course.courseIndex" /></th>
						<th><s:message code="label.course.courseID" /></th>
						<th><s:message code="label.course.courseName" /></th>
						<th><s:message code="label.course.faculty" /></th>
						<th><s:message code="label.course.credits" /></th>
						<th><s:message code="label.course.select" /></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="course" items="${courses}" varStatus="status">
						<tr class="${status.index%2==0?'even':'odd'}">
							<td class="nowrap">${course.courseIndex}</td>
							<td class="nowrap">${course.courseID}</td>
							<td class="nowrap">${course.courseName}</td>
							<td class="nowrap">${course.faculty}</td>
							<td class="nowrap">${course.credits}</td>
							<td align="center"><a
								href="${pageContext.request.contextPath}/selectedcourse/edit/${student.studentID}.html">
									<s:message code="label.course.select" />
							</a></td>
							
			
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
			</c:if>
		</div>
	</div>
</div>

<script src="<c:url value='/js/DataTables/jQuery-3.3.1/jquery-3.3.1.min.js'/>" 
	type="text/javascript" ></script>
<script src="<c:url value='/js/DataTables/datatables.min.js'/>" 
	type="text/javascript" ></script>
	
	<script>
	$(document).ready( function () {
	    $('#selectedCourse').DataTable();
	} );
	</script>
</body>
</html>