<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="container">
	<div class="row" style="color: black;">
		<div class="col-xs-12">
			<h1>Selected Courses Preview</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<c:if test="${fn:length(studentcourse) gt 0}">
				<table class="table table-striped table-bordered"
					style="width: 100%" id="selectedCoursePreview">
					<thead>
						<tr>
							<th><s:message code="label.course.courseIndex" /></th>
							<th><s:message code="label.course.courseID" /></th>
							<th><s:message code="label.course.courseName" /></th>
							<th><s:message code="label.course.faculty" /></th>
							<th align="center"><s:message code="label.course.credits" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="studentcourse" items="${studentcourse}"
							varStatus="status">
							<tr class="${status.index%2==0?'even':'odd'}">
								<td class="nowrap">${studentcourse.course.courseIndex}</td>
								<td class="nowrap">${studentcourse.course.courseID}</td>
								<td class="nowrap">${studentcourse.course.courseName}</td>
								<td class="nowrap">${studentcourse.course.faculty}</td>
								<td class="nowrap">${studentcourse.course.credits}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="table table-striped table-bordered"
					style="width: 100%" id="Timetable">
					<thead>
						<tr>
							<th align="center" valign="middle" width="120"></th>
							<th align="center" valign="middle" width="120">Monday</th>
							<th align="center" valign="middle" width="120">Tuesday</th>
							<th align="center" valign="middle" width="120">Wednesday</th>
							<th align="center" valign="middle" width="120">Thursday</th>
							<th align="center" valign="middle" width="120">Friday</th>
							<th align="center" valign="middle" width="120">Saturday</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="9" end="18" step="1" var="time">
							<tr>
								<td align="center" valign="middle" width="120">
											<c:out value="${time}:00 - ${time+1}:00" />
								</td> 
								<c:forEach begin="1" end="6" step="1" var="day">
									<td align="center" valign="middle" width="100">
										<c:forEach items="${studentcourse}" var="studentcourse">
											<c:set var="lectureschedule" value="${studentcourse.course.lectureSchedule}"/>
											<c:set var="splitlectureschedule" value="${fn:split(lectureschedule, ',')}"/>
											<c:forEach var="i" items="${splitlectureschedule}">
											<%-- <c:out value="${i}" />
											<c:out value="${String.valueOf(day)}${String.valueOf(time-9)}" /> --%>
											<c:set var = "k" value="${i}"/>
											<c:set var = "j" value="${String.valueOf(day)}${String.valueOf(time-9)}"/>
												<c:if test="${k.equals(j)}">
													<c:out value="${studentcourse.course.courseID} ${studentcourse.course.courseName}" />
												</c:if>
											</c:forEach>
										</c:forEach></td>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</div>

<script
	src="<c:url value='/js/DataTables/jQuery-3.3.1/jquery-3.3.1.min.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='/js/DataTables/datatables.min.js'/>"
	type="text/javascript"></script>

<script>
	$(document).ready(function() {
		$('#selectedCoursePreview').DataTable();
	});

	
</script>